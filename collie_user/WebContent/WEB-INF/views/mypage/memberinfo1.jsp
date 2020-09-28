<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
@font-face {
 font-family: 'NanumBarunGothic';
 font-style: normal;
 font-weight: 400;
 src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.eot');
 src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.eot?#iefix') format('embedded-opentype'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.woff') format('woff'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.ttf') format('truetype');
}

@font-face {
 font-family: 'NanumBarunGothic';
 font-style: normal;
 font-weight: 700;
 src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebBold.eot');
 src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebBold.eot?#iefix') format('embedded-opentype'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebBold.woff') format('woff'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebBold.ttf') format('truetype')
}

@font-face {
 font-family: 'NanumBarunGothic';
 font-style: normal;
 font-weight: 300;
 src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebLight.eot');
 src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebLight.eot?#iefix') format('embedded-opentype'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebLight.woff') format('woff'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebLight.ttf') format('truetype');
}

.nanumbarungothic * {
 font-family: 'NanumBarunGothic', sans-serif;
}

#wrap{ min-height: 940px; margin: 0px auto; }

#header{ min-height: 200px; display: flex; justify-content: center; }
#headerContent{ width: 70%; }
#logoWrap{ height: 120px; display: flex; justify-content: center; }
#logo{ width: 200px; display: flex; align-items: center; }

#container{ min-height: 600px;}
#containerContentWrap{ margin-top: 50px; margin-bottom: 50px; display: flex; justify-content: center; }
#containerContent{ width: 70%; display: flex; align-items: center; justify-content: space-between; }
#containerFooterWrap{ display: flex; justify-content: center }
#containerFooter{ width: 70%; }

#footer{ height: 120px; display: flex; justify-content: center }
#footerContent{ width: 70%; }

</style>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

<!-- Google CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function(){
	
});//ready
</script>
</head>
<body>

<div id="wrap">
	<div id="header">
	<div id="headerContent">
	
	<ul class="nav justify-content-end">
	  <li class="nav-item">
	    <a class="nav-link active" href="#" style="color: #000000">로그인</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href="#" style="color: #000000">회원가입</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href="#" style="color: #000000">고객센터</a>
	  </li>
	</ul>
	
	<div id="logoWrap">
	<div id="logo">
		<img alt="" src="http://localhost/collie_user/images/logo_green.png" style="width: 200px"/>
	</div>
	</div>
	
	<nav class="navbar navbar-expand-lg navbar-light">
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				전체 카테고리
				</a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="#">
						채소
					</a>
					<a class="dropdown-item" href="#">
						과일
					</a>
					<a class="dropdown-item" href="#">
						정육/계란
					</a>
					<a class="dropdown-item" href="#">
						베이커리
					</a>
					<a class="dropdown-item" href="#">
						<img alt="" src="http://localhost/collie_user/images/dairy.png" style="width: 20px; margin-right: 5px"/>유제품
					</a>
				</div>
				</li>
			</ul>
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
				<img alt="" src="http://localhost/collie_user/images/search.png" style="width: 30px; margin-right: 50px">
				<!-- <button class="btn btn-outline-success my-2 my-sm-0" type="submit" style="color: #003333; border-color: #003333">
				</button> -->
			</form>
			<a href="cart/view.do">
			<img alt="" src="http://localhost/collie_user/images/cart.png" style="width: 30px">
			</a>
		</div>
	</nav>
	
	
	</div>
	</div>
	
	<div id="container">
	
	
	
	</div>
	
	<div id="footer">
	<div id="footerContent">
	<img alt="" src="http://localhost/collie_user/images/footer.jpg"  style="width: 100%">
	</div>
	</div>
</div>

</body>
</html>