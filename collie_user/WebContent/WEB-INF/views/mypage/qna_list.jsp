<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MARKET COLLIE</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="http://211.238.142.25/common/css/common.css">

<style type="text/css">
#wrap{ min-height: 940px; margin: 0px auto; }
#container{ width: 70%; margin: 0px auto; min-height: 700px; margin-top:50px; }
#containerMenu{ width: 200px; float: left; }
#menuTitle{ text-align: center; }

.table-bordered{ width: 200px; text-align: left; margin-top: 30px; color: #666666; font-size: 15px; }
.table-bordered td:hover{ background-color: #F7F7F7; color: #17462B }
.table-bordered td{ cursor: pointer; }
#contentWrap{ margin-left: 240px }
#containerSubTitle{ border-bottom: 1px solid #333; margin-top: 30px; padding-bottom: 0px; color: #666666 }
#containerContent{ margin-top: 90px; display:flex; align-items: center; justify-content: center;}
#passForm{ width: 620px; margin: 0px auto }
.col-form-label{ padding-right: 0px; padding-left: 50px }
hr{ margin-top: 90px }

.qnaTab{ width: 90% }
.tableContent{ text-align: center; }
.titleTab{height: 50px; text-align: center;}

.qnaTabTh{
    border-top: 2px solid #17462B !important;
    border-bottom: 2px solid #bebebe !important;
}
.qnaSubTd{
    border-top: 2px solid #17462B !important;
    border-bottom: 2px solid #bebebe !important;
    padding: 30px 0px 30px 0px;
    cursor: pointer;
}

.qnaTabTd{
    border-top: 2px solid #17462B !important;
    border-bottom: 2px solid #bebebe !important;
    padding: 30px 0px 30px 0px;
    cursor: pointer; 
}

a, a:hover{ color: #000000; text-decoration: none }
.pagination{ margin-left: 180px; margin-top: 30px; }

</style>
<!-- Google CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function(){
	
});//ready

function qnaMovePage(cur_page){
    $.ajax({
     url:"qna_list_move_page.do",
     type:"POST",
     data:"current_page="+cur_page,
     dataType:"JSON",
     error:function(xhr){
        alert("에러");
        console.log(xhr.status+" / "+xhr.statusText);
     },
     success:function(jsonObj){
        if(jsonObj.flag=="success"){
           
           var table='<table class="qnaTab">';
           table+='<thead>';
           table+='<tr class="titleTab">';
           table+='<th class="qnaTabTh" style="width: 50px">번호</th>';
           table+='<th class="qnaTabTh">제목</th>';
           table+='<th class="qnaTabTh" style="width: 100px">답변유무</th>';
           table+='<th class="qnaTabTh" style="width: 150px">작성일</th>';
           table+='</tr>';
           table+='</thead>';
           table+='<tbody>';
           
           $.each(jsonObj.qna_list,function(i, json){
              table+='<tr id="qnaTr'+json.qna_num+'" class="tableContent" onclick="toggleReply('+json.qna_num+')">';
              table+='<td class="qnaTabTd">'+json.idx+'</td>';
              table+='<td class="qnaTabTd">'+json.qna_subject+'</td>';
              table+='<td class="qnaTabTd">'+json.qna_flag+'</td>';
              table+='<td class="qnaTabTd">'+json.input_date+'</td>';
              table+='</tr>';
           })//each
           table+='</tbody>';
           table+='</table>';
           $("#containerContent").html(table);
           
           var page='<nav aria-label="Page navigation example">';
           page+='<ul class="pagination justify-content-center">';
           var pre="active";
           var preOnclick='onclick="qnaMovePage('+jsonObj.pre_page+')" ';
           if(jsonObj.pre_page<=0){
              pre="disabled"
              preOnclick="";
           }//end if
           page+='<li class="page-item '+pre+'">';
           page+='<a class="page-link"'+preOnclick+' aria-label="Previous">';
           page+='<span aria-hidden="true">&laquo;</span>';
           page+='</a>';
           page+='</li>';
           
           var curOnclick="";
           for(var i=jsonObj.start_page; i<jsonObj.end_page+1; i++){
              curOnclick='onclick="qnaMovePage('+i+')" ';
              if(jsonObj.current_page==i){
                 cur="disabled"
                 curOnclick="";
              }//end if
              page+='<li class="page-item">';
              page+='<a class="page-link"'+curOnclick+'>';
              page+=i;
              page+='</a>';
              page+='</li>';
           }//end for
           var next="active";
           var nextOnclick='onclick="qnaMovePage('+jsonObj.next_page+')" ';
           if(cur_page>=jsonObj.total_page){
              next="disabled"
              nextOnclick="";
           }//end if
           page+='<li class="page-item '+next+'">';
           page+='<a class="page-link" '+nextOnclick+'aria-label="Next">';
           page+='<span aria-hidden="true">&raquo;</span>';
           page+='</a>';
           page+='</li>';
           page+='</ul>';
           page+='</nav>';
           $("#pagination").html(page);
           
        }else{
           var table='<table class="tab">';
           table+='<thead>';
           table+='<tr class="contentTr">';
           table+='<td class="qnaTabTd"" style="width: 50px">번호</th>';
           table+='<td class="qnaTabTd">제목</th>';
           table+='<td class="qnaTabTd" style="width: 100px">답변유무</th>';
           table+='<td class="qnaTabTd" style="width: 150px">작성일</th>';
           table+='</tr>';
           table+='</thead>';
           table+='<tbody>';
           table+='<tr>';
           table+='<td colspan="4">문의 내역이 없습니다.</td>';
           table+='</tr>';
           table+='</tbody>';
           table+='</table>';
           
           $("#containerContent").html(table);
        }
     }//success
  });//ajax
  
}//qnaMovePage





function toggleReply(qna_num){
	
	if($("#contentTr"+qna_num).length==1){
		delReply(qna_num);
	}else{
		addReply(qna_num);
	}//else
	
}//toggleReply

function addReply(qna_num){
	
  	$.ajax({
		url:"qna_detail.do",
		type:"GET",
		data:"qna_num="+qna_num,
		dataType:"JSON",
		error:function(xhr){
			alert("에러");
			console.log(xhr.status+" / "+xhr.statusText);
		},
		success:function(jsonObj){
			if(jsonObj.flag=="success"){
				
				var contentTr='<tr id="contentTr'+qna_num+'" class="tableContent">';
				contentTr+='<td class="qnaTabTd"></td>';
				contentTr+='<td colspan="2" class="qnaTabTd" style="text-align: left">';
				contentTr+='<strong>'
				contentTr+=jsonObj.qna_content;
				contentTr+='</strong>'
				contentTr+='</td>';
				contentTr+='<td class="qnaTabTd"></td>';
				contentTr+='</tr>';
				$("#qnaTr"+qna_num).after(contentTr);
				
				if(jsonObj.qna_reply!=null){
					var replyTr='<tr id="replyTr'+qna_num+'" class="tableContent">';
					replyTr+='<td class="qnaTabTd"></td>';
					replyTr+='<td colspan="2" class="qnaTabTd" style="text-align: left">';
					replyTr+=' RE : ';
					replyTr+=jsonObj.qna_reply;
					replyTr+='</td>';
					replyTr+='<td class="qnaTabTd">';
					replyTr+=jsonObj.reply_date;
					replyTr+='</td>';
					replyTr+='</tr>';
					$("#contentTr"+qna_num).after(replyTr);
					
				}
				
			}//end if
		}//success
	});//ajax
	
}//addReply

function delReply(qna_num){
	$("#contentTr"+qna_num).remove();
	
	if( $("#replyTr"+qna_num).length==1 ){
		$("#replyTr"+qna_num).remove();
	}//end if
}


</script>
</head>
<body style="font-family: nanumbarungothic">

<div id="wrap">
 <c:import url="/header.do" />
	
 <div id="container">
	<jsp:include page="../common/mypage_menu.jsp"/>
	<div id="contentWrap">
	<div id="containerTitle">
		<h4><strong>1:1 문의내역</strong></h4>
	</div>
		<div id="containerSubTitle">
		</div>
	
	<div id="containerContent">
	 <table class="qnaTab">
	  <thead>
		<tr class="titleTab">
			<th class="qnaTabTh" style="width: 50px">번호</th>
			<th class="qnaTabTh">제목</th>
			<th class="qnaTabTh" style="width: 100px">답변유무</th>
			<th class="qnaTabTh" style="width: 150px">작성일</th>
		</tr>
	 </thead>
	<tbody>
		<c:if test="${ empty qna_list }">
			<tr class="tableContent">
				<td colspan="3" class="qnaTabTh">등록된 문의가 없습니다.</td>
			</tr>
		</c:if>

		<c:forEach var="qna" items="${ qna_list }">
			<tr id="qnaTr${ qna.qna_num }" class="tableContent" onclick="toggleReply(${ qna.qna_num })">
				<td class="qnaSubTd"><c:out value="${ qna.idx }"/>
				<td class="qnaSubTd" ><c:out value="${ qna.qna_subject }"/></td>
				<td class="qnaSubTd"><c:out value="${ qna.qna_flag }"/></td>
				<td class="qnaTabTd"><c:out value="${ qna.input_date }"/></td>
			</tr>
		</c:forEach>
	 </tbody>
	</table>
	</div>
	<div id="pagination" class="pagination">
	   <nav aria-label="Page navigation example">
	     <ul class="pagination justify-content-center">
	       <li class="page-item ${paging.pre_page <= 0 ? 'disabled':'active'}">
	          <a class="page-link"<c:if test="${ paging.pre_page ne '0'}">onclick="qnaMovePage(${paging.pre_page})"</c:if> aria-label="Previous">
	              <span aria-hidden="true">&laquo;</span>
	            </a>
	       </li>
	       <c:forEach begin="${paging.start_page}" end="${paging.end_page}" step="1" var="cur_page" >
	          <li class="page-item">
	             <a class="page-link"<c:if test="${paging.current_page ne cur_page}"> onclick="qnaMovePage(${cur_page})"</c:if>>
	                <c:out value="${cur_page}" />
	             </a>
	          </li>
	       </c:forEach>
	       <li class="page-item ${paging.current_page >= paging.total_page ? 'disabled':'active'}">
	         <a class="page-link"<c:if test="${paging.current_page < paging.total_page}"> onclick="qnaMovePage(${paging.next_page})"</c:if> aria-label="Next">
	           <span aria-hidden="true">&raquo;</span>
	         </a>
	       </li>
	     </ul>
	   </nav>
	</div>
	</div>
	</div>
	</div>
	<jsp:include page="../common/footer.jsp" />
	

</body>
</html>