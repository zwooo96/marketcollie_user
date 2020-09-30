<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="http://211.238.142.36/jsp_prj/common/css/main.css">
<title>Insert title here</title>
<style type="text/css">
	#wrap{ width:900px; height:900px; margin:0px auto; }
	#header{ width:900px; height:180px; }
	#headerTop{ width:900px; height:140px; position:relative; background:#FFFFFF url("http://211.238.142.36/jsp_prj/common/images/header_bg.png") }
	#mainText{ font-family: 고딕,godic,Sans-Serif; font-size:30px; font-weight:bold; width:140px; height:50px; margin:0px auto; padding-top:20px; }
	#naviBar{ width:900px; height:60px; margin-top:10px }
	#container{ width: 900px; height:600px; position:relative; }
	#footer{ width: 900px; height:120px; position:relative; }
	#footerLogo{ width:170px; height:60px; margin-left:10px; margin-top:10px; }
	#footerContent{ width:700px; height:100px; margin-left:600px; margin-top:10px; font-family:고딕,godic; font-size:14px; text-align: right; margin-right:20px;}
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
		<div id="headerTop">
			<div id="mainText" title="클라쓰 A">Class A</div>
		</div>
		</div>
<div>		
	<div id="naviBar">
	
	
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#" href="#">Home</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
    
            <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          선택
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">달력보기</a>
          <a class="dropdown-item" href="#">리스트보기</a>
        </div>
      </li>
    </ul>
  </div>
</nav>


	</div>
	</div>
	
	<div id="container">
	멤버 바꾸기 성공
	${ modifyFlag }
	</div>
	
	
	</div>
	<div id="footer">
		<div id="footerLogo"></div>
		<div id="footerContent">
		 	&copy; Copy Right. All Right Reserved. Class A
		</div>
	</div>
	
</body>
</html>