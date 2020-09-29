<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마켓콜리</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/collie_user/common/css/common.css">

<style type="text/css">
#container{ width: 70%; margin: 0px auto; min-height: 700px; margin-top:50px; }
#containerMenu{ width: 200px; float: left; }
#menuTitle{ text-align: center; }
.table-bordered{ width: 200px; text-align: left; margin-top: 30px; color: #666666; font-size: 15px; }
.table-bordered td:hover{ background-color: #F7F7F7; color: #17462B }
.table-bordered td{ cursor: pointer; }
#qnaBox{ background-color: #F7F7F7; color: #666666; padding: 10px; font-size: 13px; padding-left: 20px }
#qnaBox:hover{ cursor: pointer; }
#cscBox{ color: #666666; font-size: 14px; margin-top: 70px }
#contentWrap{ margin-left: 240px }
#containerSubTitle{ border-bottom: 1px solid #17462B; margin-top: 30px; padding-bottom: 0px; color: #666666 }
#containerContent{ margin-top: 30px }
#orderTime{ color:#666666; font-weight: bold; }
.table-borderless{ margin:0px }
#orderGoods{ border: 1px solid #dee2e6; margin-top: 10px; padding: 10px; padding-left: 20px; padding-right: 20px }
#goodsTitle{ border-bottom: 1px solid #dee2e6; padding: 0px; padding-top: 10px; padding-bottom: 10px; font-weight: bold }
.btn-outline-success{ border-color: #17462B !important; color: #17462B !important }
.btn-outline-success:hover, #btn-outline-success:active, #btn-outline-success:focus { border-color: #17462B !important; background-color: #17462B !important; color:#FFFFFF !important }
#goodsImg{ padding-left: 0px; width: 10px; padding-top: 20px }
#goodsThm{ width:60px; height: 75px }
#orderNumColumn{ padding-top: 25px; width: 80px; vertical-align: middle; font-size: 14px }
#orderNumValue{ padding-top: 25px; width:500px; vertical-align: middle; font-size: 14px }
#orderPriceColumn{ font-size: 14px; padding-top: 0px }
#orderPriceValue{ font-size: 14px; padding-top: 0px }
#goodsBtn{ vertical-align: middle; width:85px; padding-right: 0px }
</style>
<!-- Google CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function(){
	$("#btn").click(function(){
		location.href = "/collie_user/mypage/order_detail.do";
	});//click
});//ready
</script>
</head>
<body style="font-family: nanumbarungothic">

<div id="wrap">
	
	<jsp:include page="../common/header.jsp" />
	
	<div id="container">
		<jsp:include page="../common/mypage_menu.jsp"/>
		<div id="contentWrap">
		<div id="containerTitle">
			<h4><strong>주문 내역</strong></h4>
		</div>
			<div id="containerSubTitle"></div>
			<div id="containerContent">
				<div id="orderTime">2020.05.24 (23시 33분)</div>
				<div id="orderGoods">
				<table class="table table-borderless">
				    <tr>
				      <td colspan="4" id="goodsTitle">[플라하반] 오트밀 6종 외 1건</td>
				    </tr>
				    <tr id="orderNum">
				      <td rowspan="2" id="goodsImg">
				      	<img src="http://localhost/collie_user/common/images/item/bread.png" id="goodsThm"/>
				      </td>
				      <td id="orderNumColumn">주문번호</td>
				      <td id="orderNumValue"><strong>138412351</strong></td>
				      <td rowspan="2" id="goodsBtn">
				      	<button type="button" class="btn btn-outline-success" id="btn">상세보기</button>
				      </td>
				    </tr>
				    <tr id="orderPrice">
				      <td id="orderPriceColumn">결제금액</td>
				      <td id="orderPriceValue"><strong>10,800원</strong></td>
				    </tr>
				</table>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="../common/footer.jsp" />
	
</div>

</body>
</html>	