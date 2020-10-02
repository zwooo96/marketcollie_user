<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마켓콜리</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/collie_user/common/css/common.css">

<style type="text/css">
#wrap{ min-height: 940px; margin: 0px auto; }
#container{ width: 70%; margin: 0px auto; min-height: 700px; margin-top:50px; }
#containerMenu{ width: 200px; float: left; }
#menuTitle{ text-align: center; }

.table-bordered{ width: 200px; text-align: left; margin-top: 30px; color: #666666; font-size: 15px; }
.table-bordered td:hover{ background-color: #F7F7F7; color: #17462B }
.table-bordered td{ cursor: pointer; }
#qnaBox{ background-color: #F7F7F7; color: #666666; padding: 10px; font-size: 13px; padding-left: 20px }
#qnaBox:hover{ cursor: pointer; }
#cscBox{ color: #666666; font-size: 14px; margin-top: 70px }
#contentWrap{ margin-left: 240px }
#containerSubTitle{ border-bottom: 1px solid #333; margin-top: 30px; padding-bottom: 0px; color: #666666 }
#containerContent{ margin-top: 90px; display:flex; align-items: center; justify-content: center;}
#passForm{ width: 620px; margin: 0px auto }
.col-form-label{ padding-right: 0px; padding-left: 50px }
#pass{ width:300px;  padding: 0px; margin-left: 60px }
hr{ margin-top: 90px }
.btn-primary{ background-color: #17462B; border-color: #17462B; margin:0px auto; margin-top: 30px; width: 250px; padding: 15px  }
.btn-primary:hover, .btn-primary:active, .btn-primary:focus{ background-color: #17462B !important; }
#btnDiv{ width: 250px; margin: 0px auto }

.qnaTab{ width: 90% }
.tableContent{ text-align: center; }
.titleTab{height: 50px; text-align: center;}

.qnaTabTh{
    border-top: 2px solid #17462B !important;
    border-bottom: 2px solid #bebebe !important;
}
.qnaTabTd{
    border-top: 2px solid #17462B !important;
    border-bottom: 2px solid #bebebe !important;
    padding: 30px 0px 30px 0px;
}
a, a:hover{ color: #000000; text-decoration: none }


</style>
<!-- Google CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function(){
	
});//ready

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
			<th class="qnaTabTh">번호</th>
			<th class="qnaTabTh">제목</th>
			<th class="qnaTabTh">답변유무</th>
			<th class="qnaTabTh">작성일</th>
		</tr>
	 </thead>
	<tbody>
		<c:if test="${ empty qna_list }">
			<tr class="tableContent">
				<td colspan="3" class="qnaTabTh">등록된 문의가 없습니다.</td>
			</tr>
		</c:if>

		<c:forEach begin="1" end="${qna_list.size()}" var="idx">
			<tr id="qnaTr${qna_list[idx-1].qna_num}" class="tableContent" onclick="toggleReply(${qna_list[idx-1].qna_num})">
				<td class="qnaTabTd"><c:out value="${idx }"/>
				<td class="qnaTabTd"><c:out value="${qna_list[idx-1].qna_subject }"/></td>
				<td class="qnaTabTd"><c:out value="${qna_list[idx-1].qna_flag}"/></td>
				<td class="qnaTabTd"><c:out value="${qna_list[idx-1].input_date }"/></td>
			</tr>
		</c:forEach>
	 </tbody>
	</table>
		
	</div>
	</div>
	</div>
	</div>
	
	<jsp:include page="../common/footer.jsp" />
	

</body>
</html>