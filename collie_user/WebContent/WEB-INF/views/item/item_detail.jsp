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
	
	<c:import url="/header.do" />
	<div id="container">
	
	<div id="containerContentWrap">
	<div id="containerContent">
	
	<c:set var="item" value="${item_detail}"/>	
	<img src="${item.item_img }">
	<c:out value="${item.item_name}"/><br/>
	<c:out value="${item.item_price}"/><br/>
	
	판매단위 <c:out value="${item.item_unit}"/><br/>
	중량/용량 <c:out value="${item.item_weight}"/><br/>
	안내사항 <c:out value="${item.item_guide}"/><br/>
	재고 <c:out value="${item.item_stock}"/><br/>
	
	<c:out value="${item.item_title}"/><br/>
	<c:out value="${item.item_subtitle}"/><br/>
	<c:out value="${item.item_detail}"/><br/>
	
		
	</div>
	</div>
	</div>

	
	<jsp:include page="../common/footer.jsp" />
	
</div>

</body>
</html>