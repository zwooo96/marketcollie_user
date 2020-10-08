<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MARKET COLLIE</title>
<style type="text/css">
#wrap{ min-height: 940px; margin: 0px auto; }
#container{ min-height: 700px; width: 70%; margin: 0px auto; margin-top:60px }
#containerTitle{ text-align: center; }
#containerSubTitle{ border-bottom: 2px solid #17462B;  margin: 0px auto; margin-top: 40px; padding-bottom: 0px; color: #666666; width: 70%; }
#containerContentWrap{ margin-top: 50px; margin-bottom: 50px; display: flex; justify-content: center; }
#containerContent{ width: 70%; display: flex; align-items: center; justify-content: space-between; }
.reviewColumn{ background-color: #F7F7F7; color: #747674; text-align: center; width: 100px; font-size: 14px; }
#addItemQnaForm{ width: 1000px }
td{ vertical-align: middle !important; }
.form-control{ font-size: 14px !important; resize: none }
.form-control::placeholder{ font-size: 14px }
.btn-primary{ background-color: #17462B !important; border-color: #17462B !important; margin:0px auto; margin-top: 20px; width: 200px; padding: 15px !important  }
.btn-primary:hover, .btn-primary:active, .btn-primary:focus{ background-color: #17462B !important; }
#btnDiv{ width: 200px; margin: 0px auto }
.table{ width: 70% }
</style>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

<link rel="stylesheet" type="text/css" href="http://211.238.142.25/common/css/common.css">

<!-- Google CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script type="text/javascript">
if(${ empty sessionScope.user_info }){
	location.href="index.do";
}//end else

$(function(){
	$("#btn").click(function(){
		if( $("#item_qna_subject").val() == "" ){
			alert("제목을 입력해주세요.");
			return;
		}//end if
		if( $("#item_qna_content").val() == "" ){
			alert("내용을 입력해주세요.");
			return;
		}//end if
		$("#addItemQnaForm").submit();
	});//click
});//ready
</script>
</head>
<body style="font-family: nanumbarungothic">

<div id="wrap">
	
	<c:import url="/header.do" />
	<div id="container">
		<div id="containerTitle">
			<h2><strong>문의 작성</strong></h2>
		</div>
		<div id="containerSubTitle"></div>	
		<div id="containerContentWrap">
			<div id="containerContent">
			<form id="addItemQnaForm" action="qna_add_process.do" method="POST">
			<input type="hidden" name="item_num" value="${ param.item_num }"/>
			<table class="table">
				<tr>
					<td class="reviewColumn">제목</td>
					<td class="reviewValue"><input class="form-control" type="text" placeholder="제목을 입력해주세요." id="item_qna_subject" name="item_qna_subject"></td>
			    </tr>
				<tr>
					<td class="reviewColumn">문의 내용</td>
					<td class="reviewValue">
						<textarea class="form-control" id="item_qna_content" name="item_qna_content" rows="10"></textarea>
					</td>
			    </tr>
			</table>
			</form>
			</div>
		</div>
		<div id="btnDiv">
			<button type="button" class="btn btn-primary" id="btn">등록</button>
		</div>			
	</div>

	
	<jsp:include page="../common/footer.jsp" />
	
</div>

</body>
</html>