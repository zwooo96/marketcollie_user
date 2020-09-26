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
#containerTitleWrap{ margin-top: 50px; margin-bottom: 50px; display: flex; justify-content: center; }
#containerTitle {width: 70%;}
#containerContentWrap{ margin-top: 50px; margin-bottom: 50px; display: flex; justify-content: center; }
#containerContent{ width: 70%; display: flex; justify-content: space-between; }
</style>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/collie_user/common/css/common.css">
<style type="text/css">
.page-link span {color:color: #17462B;}
</style>

<!-- Google CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function(){
	<c:if test="${not empty param.keyword}">
		$("#keyword").val("<c:out value='${param.keyword}'/>");
	</c:if>
});//ready
</script>
</head>
<body style="font-family: nanumbarungothic">

<div id="wrap">
	
	<jsp:include page="../common/header.jsp" />
	<div id="container">
		<div id="containerTitleWrap">
			<div id="containerTitle">
				총 <c:out value="${search_result.size()}" />건이 검색되었습니다.<br/>
			</div>
		</div>
		<div id="containerContentWrap">
			<div id="containerContent">
				<div class="row row-cols-1 row-cols-md-3">
<%-- 					<c:out value="${paging.startNum}" /> / <c:out value="${paging.endNum}" />  --%>
				
					<c:forEach begin="${paging.startNum}" end="${paging.endNum}" step="1" var="index">
						<c:set value="${search_result[index - 1]}" var="i" /> 
						<div class="col mb-4">
							<div class="card" style="width: 18rem; margin: 20px 10px 20px 10px; ">
								<img src="/collie_user/common/images/item/${i.item_img}" class="card-img-top">
								<div class="card-body">
									<h6 class="card-title">${i.item_name}</h6>
									<p class="card-text">${i.item_price}원</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<div>
			<nav aria-label="Page navigation example">
			  <ul class="pagination justify-content-center">
			    <li class="page-item ${paging.prePage eq '0' ? 'disabled':'active'}">
			      <a class="page-link" href="/collie_user/item/searchByCate.do?currentPage=${paging.prePage}&cate_num=${param.cate_num}" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			    <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="cnt">
				    <li class="page-item">
				    	<a class="page-link" href="/collie_user/item/searchByCate.do?currentPage=${cnt}&cate_num=${param.cate_num}">
				    		<c:out value="${cnt}" />
				    	</a>
				    </li>
			    </c:forEach>
			    <li class="page-item ${paging.currentPage eq paging.totalPage ? 'disabled':'active'}">
			      <a class="page-link" href="#" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
			  </ul>
			</nav>
		
		</div>
	</div>
	
	<jsp:include page="../common/footer.jsp" />
	
</div>

</body>
</html>