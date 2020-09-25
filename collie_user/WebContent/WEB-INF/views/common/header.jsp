<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	function clickSearchBtn() {
		$("#searchFrm").submit();
	}
</script>
<div id="header">
	<div id="headerContent">
<%-- 	<c:if test="${empty cate_list }"> 조회된 카테고리가 없습니다.</c:if> --%>

	<ul class="nav justify-content-end">
	  <li class="nav-item">
	    <a class="nav-link active" href="/collie_user/login_form.do" style="color: #000000">로그인</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href="/collie_user/join_form.do" style="color: #000000">회원가입</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href="/collie_user/qna/form.do" style="color: #000000">고객센터</a>
	  </li>
	</ul>
	
	<div id="logoWrap">
	<div id="logo">
		<a href="index.do"><img alt="" src="/collie_user/common/images/logo_green.png" style="width: 200px"/></a>
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
					<c:forEach var="cate" items="${cate_list}">
						<a class="dropdown-item" href="/collie_user/item/search.do?cate_num=${cate.cate_num}">
							<label><c:out value="${cate.cate_name}"/></label>
						</a>
					</c:forEach>
				</div>
				</li>
			</ul>
			<form class="form-inline my-2 my-lg-0" id="searchFrm" action="/collie_user/item/search.do">
				<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="keyword" id="keyword">
				<a href="javascript:clickSearchBtn()" id="searchBtn"><img src="/collie_user/common/images/search.png" style="width: 30px; margin-right: 50px"></a>
			</form>
			<a href="/collie_user/cart/view.do">
			<img src="/collie_user/common/images/cart.png" style="width: 30px">
			</a>
		</div>
	</nav>
	
	
	</div>
	</div>