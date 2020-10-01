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
#containerContent{ width: 70%; display: flex; flex-direction:column; margin:0 auto;}
.itemwrap{display: flex; flex-direction:row; align-items: center; }
.imgdiv{width:30vw; height:400vh;}
.infodiv{width:60vw; height:200vh  }
.item_description {
	
}
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
	
		<div id="containerContent">
			<div id="itemwrap" class="itemwrap">
				<c:set var="item" value="${item_detail}"/>	
				<img src="http://localhost/collie_user/common/images/item/${item.item_img }">
				<!-- 우측의 설명 -->
				<div id="infodiv"> <!-- 이 div에 padding 잘 주면 옆에 띄우는거 할수잇을거얌!! 고마어1!서윗 전 그럼 이만...감자하빈다  -->
					<c:out value="${item.item_name}"/><br/>
					<c:out value="${item.item_price}"/><br/>
					
					판매단위 <c:out value="${item.item_unit}"/><br/>
					중량/용량 <c:out value="${item.item_weight}"/><br/>
					안내사항 <c:out value="${item.item_guide}"/><br/>
					재고 <c:out value="${item.item_stock}"/><br/>
				</div>
			</div>
			
			<!-- 하단의 설명 -->
			<div class="item_description">
				<c:out value="${item.item_title}"/><br/>
				<c:out value="${item.item_subtitle}"/><br/>
				<c:out value="${item.item_detail}"/><br/>
			</div>
		</div>
		
	</div> <!-- container end -->

	
	<jsp:include page="../common/footer.jsp" />
	
</div>

</body>
</html>