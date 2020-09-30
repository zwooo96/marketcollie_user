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
#containerSubTitle{ border-bottom: 1px solid #17462B; margin-top: 40px; padding-bottom: 0px; color: #666666 }

#oneGoods{ border-bottom: 1px solid #DCDBDE }
#goodsImg{ width: 100px; padding-left: 30px }
#goodsThm{ width:80px; height: 100px }
#goodsInfo{ vertical-align: middle; font-weight: bold }
#goodsTitle{ font-size: 17px; color:#333 }
#goodsTitle:hover{ font-size: 17px; text-decoration: none; }
#goodsPrice{ font-size: 16px }
#goodsCnt{ color:#666666; font-size: 15px; margin-left: 5px }

.btn-outline-success{ border-color: #17462B !important; color: #17462B !important }
.btn-outline-success:hover, #btn-outline-success:active, #btn-outline-success:focus { border-color: #17462B !important; background-color: #FFFFFF !important; color:#17462B !important }
#orderBtn{ text-align: center; margin-top:30px }
#cancelBtn{ margin-left:20px }

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
			<div id="containerSubTitle">
				<h5><strong>주문번호 315874351</strong></h5>
			</div>
			<div id="containerContent">
				<div id="orderGoods">
				    <table class="table table-borderless">
					    <tr id="oneGoods">
					      	<td id="goodsImg">
					      		<a href="#void"><img src="http://localhost/collie_user/common/images/item/bread.png" id="goodsThm" /></a>
					      	</td>
					      	<td id="goodsInfo">
					      		<div><a href="#void" id="goodsTitle">[KF365] DOLE 실속 바나나 1.1kg</a></div>
					      		<span id="goodsPrice">2,850원</span>
					      		<span id="goodsCnt">1개 구매</span>
					      	</td>
					      </tr>
					</table>
				</div>
				<div id="orderBtn">
					<button id="searchBtn" type="button" class="btn btn-outline-success">배송 현황 조회</button>
					<button id="cancelBtn" type="button" class="btn btn-outline-success">전체 상품 주문 취소</button>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="../common/footer.jsp" />
	
</div>

</body>
</html>	