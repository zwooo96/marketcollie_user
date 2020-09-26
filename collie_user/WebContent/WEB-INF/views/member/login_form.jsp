<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#wrap{ min-height: 940px; margin: 0px auto; }
#container{ min-height: 600px;}
#containerContentWrap{ margin-top: 50px; margin-bottom: 50px; display: flex; justify-content: center; }
#containerContent{ width: 70%; display: flex; align-items: center; justify-content: space-between; }
#loginDiv{text-align: center;}
.loginBox{ margin: 0 auto;}
.loginTb{ margin: 0 auto;}
.container{ margin: 0 auto; margin-top:150px; min-height: 741px}
.id{width: 230px;}
.loginBtn{width: 100px; height: 100px; margin-left: 25px; margin-bottom: 25px}
.joinBtn{text-align: center; width: 360px; margin-top: 10px;}
.findIdBtn{width:170px;}
.findPassBtn{width:165px; margin-left: 20px}
.idSave{margin-top: 10px}
 
#btn{text-align: center; font-size: 15px; margin-top:20px}
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
</script>
</head>
<body style="font-family: nanumbarungothic">

<div id="wrap">
	
	<jsp:include page="../common/header.jsp" />
	<div id="container">
	
	<div id =loginDiv>
	<div id="loginBox">
	<form action="login_process.do" method="post">
	<table class="loginTb">
		<tr>
		<td>
			<input type="text" class="form-control id" id="id" name="id"  placeholder="아이디를 입력하세요 " autofocus="autofocus" tabindex="1"> <br/>
		</td>
		<td rowspan="2">
			<button id="loginBtn" type="submit" class="btn_comm"  class="btn btn-dark loginBtn" data-tiara-action-name="로그인_버튼" tabindex="3">로그인</button>
		<td>
		</tr>		
		<tr>
		<td>
			<input type="password" class="form-control id" id="pass" name="pass" placeholder="비밀번호를 입력하세요" tabindex="2" ><br/>
		</td>
		</tr>
		<tr>
		</tr>
		</table>
		<div id="btn">
			
		</div>	
	</form>
		<div class="login_rel">
		<a href="find/idForm.do" id="findID" class="link_rel" target="_blank" data-tiara-action-name="아이디찾기_링크">아이디 찾기</a>
		<span class="txt_bar">|</span>
		<a href="find/passForm.do" id="findPass" class="link_rel" target="_blank"data-tiara-action-name="비밀번호찾기_링크">비밀번호 찾기</a>
		</div>			
	</div>

	</div>
	
	</div>

	
	<jsp:include page="../common/footer.jsp" />
	
</div>

</body>
</html>

