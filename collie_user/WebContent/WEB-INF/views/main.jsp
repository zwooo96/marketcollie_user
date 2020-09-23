<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<img alt="" src="http://localhost/collie_user/common/images/logo_green.png" style="width: 200px"/>
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
						<img alt="" src="http://localhost/collie_user/common/images/dairy.png" style="width: 20px; margin-right: 5px"/>유제품
					</a>
				</div>
				</li>
			</ul>
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
				<img alt="" src="http://localhost/collie_user/common/images/search.png" style="width: 30px; margin-right: 50px">
				<!-- <button class="btn btn-outline-success my-2 my-sm-0" type="submit" style="color: #003333; border-color: #003333">
				</button> -->
			</form>
			<a href="cart/view.do">
			<img alt="" src="http://localhost/collie_user/common/images/cart.png" style="width: 30px">
			</a>
		</div>
	</nav>
	
	
	</div>
	</div>
	
	<div id="container">
	
	<div id="mainImg" class="carousel slide" data-ride="carousel">
	  <div class="carousel-inner">
	    <div class="carousel-item active" data-interval="3000">
	      <img src="http://localhost/collie_user/common/images/main_img1.jpg" class="d-block w-100" alt="...">
	    </div>
	    <div class="carousel-item" data-interval="3000">
	      <img src="http://localhost/collie_user/common/images/main_img2.jpg" class="d-block w-100" alt="...">
	    </div>
	    <div class="carousel-item" data-interval="3000">
	      <img src="http://localhost/collie_user/common/images/main_img3.jpg" class="d-block w-100" alt="...">
	    </div>
	  </div>
	  <a class="carousel-control-prev" href="#mainImg" role="button" data-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="sr-only">Previous</span>
	  </a>
	  <a class="carousel-control-next" href="#mainImg" role="button" data-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="sr-only">Next</span>
	  </a>
	</div>
	
	
	<div id="containerContentWrap">
	<div id="containerContent">
		<div class="card" style="width: 18rem; margin: 20px 10px 20px 10px; ">
			<img src="http://localhost/collie_user/common/images/item_img1.png" class="card-img-top" alt="...">
			<div class="card-body">
			<h6 class="card-title">저탄소 GAP 자몽</h6>
			<p class="card-text">17,945원</p>
			</div>
		</div>
		<div class="card" style="width: 18rem; margin: 20px 10px 20px 10px;; ">
			<img src="http://localhost/collie_user/common/images/item_img2.png" class="card-img-top" alt="...">
			<div class="card-body">
			<h6 class="card-title">[말랑카우] 유기농 요거트</h6>
			<p class="card-text">6,900원</p>
			</div>
		</div>
		<div class="card" style="width: 18rem; margin: 20px 10px 20px 10px; ">
			<img src="http://localhost/collie_user/common/images/item_img3.png" class="card-img-top" alt="...">
			<div class="card-body">
			<h6 class="card-title">[365] 수제 살라미 소세지</h6>
			<p class="card-text">7,110원</p>
			</div>
		</div>
		<div class="card" style="width: 18rem; margin: 20px 10px 20px 10px; ">
			<img src="http://localhost/collie_user/common/images/item_img4.png" class="card-img-top" alt="...">
			<div class="card-body">
			<h6 class="card-title">[BAAM] 오븐에 구운 베이글</h6>
			<p class="card-text">4,880원</p>
			</div>
		</div>
	</div>
	</div>
	</div>
	
	<div id="containerFooterWrap">
	<div id="containerFooter">
	<img alt="" src="http://localhost/collie_user/common/images/main_img4.jpg" style="width: 100%">
	</div>
	</div>
	
	
	<div id="footer">
	<div id="footerContent">
	<img alt="" src="http://localhost/collie_user/common/images/footer.jpg"  style="width: 100%">
	</div>
	</div>
</div>

</body>
</html>