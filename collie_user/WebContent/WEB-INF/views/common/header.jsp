<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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