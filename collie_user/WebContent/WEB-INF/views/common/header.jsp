<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	function clickSearchBtn() {
		if($("#keyword").val().trim().length > 0) {
			$("#keyword_value").val($("#keyword").val());
			$("#searchFrm").submit();
		}
	}
	
	function getCategoryItems(cate_num) {
		$("#categoryfrm"+cate_num).submit();
	}
</script>
<div id="header">
	<div id="headerContent">
	<ul class="nav justify-content-end">
		<c:if test="${empty sessionScope.login_info}">
		  <li class="nav-item">
		    <a class="nav-link active" href="/collie_user/login_form.do" style="color: #000000">로그인</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="/collie_user/join_clause.do" style="color: #000000">회원가입</a>
		  </li>
		</c:if>
		<c:if test="${not empty sessionScope.login_info}">
			<li class="nav-item">
			    <a class="nav-link active" href="/collie_user/logout.do" style="color: #000000">로그아웃</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="/collie_user/mypage/check_member_form.do" style="color: #000000">마이페이지</a>
		 </li>
		</c:if>
	  <li class="nav-item">
	    <a class="nav-link" href="/collie_user/qna/qna_form.do" style="color: #000000">고객센터</a>
	  </li>
		
	
	</ul>
	
	<div id="logoWrap">
	<div id="logo">
		<a href="/collie_user/index.do"><img alt="" src="/collie_user/common/images/logo_green.png" style="width: 200px"/></a>
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
						<form action="/collie_user/item/getItems.do" id="categoryfrm${cate.cate_num}" method="post">
						<a class="dropdown-item" href="javascript:getCategoryItems(${cate.cate_num})">
							<label><c:out value="${cate.cate_name}"/></label>
							<input type="hidden" name="field_name"  value="cate_num" />
							<input type="hidden" name="field_value" value="${cate.cate_num}" />
						</a>
						</form>
					</c:forEach>
				</div>
				</li>
			</ul>
			<form class="form-inline my-2 my-lg-0" id="searchFrm" action="/collie_user/item/getItems.do" method="post">
				<span class="d-inline-block" tabindex="0" data-place="bottom" data-toggle="tooltip" title="검색어를 입력하세요." id="search_tooltip">
					<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="keyword" id="keyword" />
					<input type="hidden" name="field_name"  value="item_name" />
					<input type="hidden" name="field_value" id="keyword_value" />
				</span>
				<a href="javascript:clickSearchBtn()" id="searchBtn"><img src="/collie_user/common/images/search.png" style="width: 30px; margin-right: 50px"></a>
			</form>
			<a href="/collie_user/cart/view.do">
			<img src="/collie_user/common/images/cart.png" style="width: 30px">
			</a>
		</div>
	</nav>
	
	
	</div>
	</div>