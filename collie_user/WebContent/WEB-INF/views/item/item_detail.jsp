<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#wrap{ min-height: 940px; margin: 0px auto; }
#container{ min-height: 600px;}
#containerContent{ width: 70%; display: flex; flex-direction:column; margin:0 auto;}
.itemwrap{display: flex; flex-direction:row; align-items: center; }
.imgdiv{width:30vw; height:400vh;}
.infodiv{width:60vw; height:200vh  }
.item_description {

/* ==================아이템문의=================== */
.itemQnaDiv{ display: flex; justify-content: center }

.tab{ width: 70% }
.tableContent{ text-align: center; }
.titleTab{height: 50px; text-align: center;}

.tabTh{
    border-top: 2px solid #17462B !important;
    border-bottom: 2px solid #bebebe !important;
}
.tabTd{
    border-top: 2px solid #17462B !important;
    border-bottom: 2px solid #bebebe !important;
    padding: 20px 0px 20px 0px;
}
/* ==================아이템문의=================== */


}
</style>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

<link rel="stylesheet" type="text/css" href="/collie_user/common/css/common.css">

<!-- Google CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function(){
	
});//ready


/* ===============================아이템문의================================= */

function qnaToggle(item_qna_num){
	
	if($("#qnaContentTr"+item_qna_num).length==1){
		delReply(item_qna_num);
	}else{
		addReply(item_qna_num);
	}//else
	
}//toggleReply

function addReply(item_qna_num){
	
  	$.ajax({
		url:"item_qna_detail.do",
		type:"POST",
		data:"item_qna_num="+item_qna_num,
		dataType:"JSON",
		error:function(xhr){
			alert("에러");
			console.log(xhr.status+" / "+xhr.statusText);
		},
		success:function(jsonObj){
			if(jsonObj.flag=="success"){
				
				var contentTr='<tr id="qnaContentTr'+item_qna_num+'" class="tableContent">';
				contentTr+='<td class="tabTd"></td>';
				contentTr+='<td colspan="3" class="tabTd" style="text-align: left">';
				contentTr+='<strong>'
				contentTr+=jsonObj.item_qna_content;
				contentTr+='</strong>'
				contentTr+='</td>';
				contentTr+='<td class="tabTd"></td>';
				contentTr+='</tr>';
				$("#itemQnaTr"+item_qna_num).after(contentTr);
				
				if(jsonObj.item_qna_reply!=null){
					var replyTr='<tr id="qnaReplyTr'+item_qna_num+'" class="tableContent">';
					replyTr+='<td class="tabTd"></td>';
					replyTr+='<td colspan="3" class="tabTd" style="text-align: left">';
					replyTr+=' RE : ';
					replyTr+=jsonObj.item_qna_reply;
					replyTr+='</td>';
					replyTr+='<td class="tabTd">';
					replyTr+=jsonObj.reply_date;
					replyTr+='</td>';
					replyTr+='</tr>';
					$("#qnaContentTr"+item_qna_num).after(replyTr);
				}//end if
				
			}//end if
		}//success
	});//ajax
	
}//addReply

function delReply(item_qna_num){
	$("#qnaContentTr"+item_qna_num).remove();
	
	if( $("#qnaReplyTr"+item_qna_num).length==1 ){
		$("#qnaReplyTr"+item_qna_num).remove();
	}//end if
}

/* ===============================아이템문의================================= */

</script>
</head>
<body style="font-family: nanumbarungothic">

<div id="wrap">
	
	<c:import url="/header.do" />
	<div id="container">
	
		<div id="containerContent">
			<div id="itemwrap" class="itemwrap">
				<c:set var="item" value="${item_detail}"/>	
				<img src="http://localhost/collie_user/common/images/item/${item.item_img }">
				<!-- 우측의 설명 -->
				<div id="infodiv"> <!-- 이 div에 padding 잘 주면 옆에 띄우는거 할수잇을거얌!! 고마어1!서윗 전 그럼 이만...감자하빈다  -->
					<c:out value="${item.item_name}"/><br/>
					<c:out value="${item.item_price}"/><br/>
					
					판매단위 <c:out value="${item.item_unit}"/><br/>
					중량/용량 <c:out value="${item.item_weight}"/><br/>
					안내사항 <c:out value="${item.item_guide}"/><br/>
					재고 <c:out value="${item.item_stock}"/><br/>
				</div>
			</div>
			
			<!-- 하단의 설명 -->
			<div class="item_description">
				<c:out value="${item.item_title}"/><br/>
				<c:out value="${item.item_subtitle}"/><br/>
				<c:out value="${item.item_detail}"/><br/>
			</div>
		</div>
		
		
		<div id="itemQnaWrap">
		<c:import url="/item/item_qna_list.do"/>
		</div>
		
		
	</div> <!-- container end -->

	
	<jsp:include page="../common/footer.jsp" />
	
</div>

</body>
</html>