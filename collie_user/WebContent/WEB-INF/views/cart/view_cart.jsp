<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/collie_user/common/css/common.css">

<style type="text/css">
#wrap{ min-height: 1200px; margin: 0px auto; }

#container{ min-height: 900px; }

#containerHeader{ height: 250px; display: flex; justify-content: center; align-items: center; flex-direction: column; }
#containerHeaderTitle{ font-size: 30pt; }
#containerHeaderContent{ font-size: 12pt; color: #bebebe }

#containerHeader{ display: flex; justify-content: center; align-items: center; flex-direction: column; }
#containerContentWrapper{ display: flex; justify-content: center; align-items: center; flex-direction: column; }
#table{ width: 70% }
#tableContent{ height: 120px; }


table td ,table th{
    border-top: 2px solid #17462B !important;
    border-bottom: 2px solid #bebebe !important;
}
a, a:hover{ color: #000000; text-decoration: none }


/* 체크박스 */
.checkbox-container {
position: relative;
}

.checkbox-container input[type="checkbox"] {
position: absolute;
width: 1px;
height: 1px;
padding: 0;
margin: -1px;
overflow: hidden;
clip:rect(0,0,0,0);
border: 0
}

.checkbox-container input[type="checkbox"] + label {
display: inline-block;
position: relative;
cusor: pointer;
-webkit-user-select: none;
-moz-user-select: none;
-ms-user-select: none;
user-select: none;
}

.checkbox-container input[type="checkbox"] + label:before {
content: ' ';
display: inline-block;
width: 18px;
height: 18px;
line-height: 18px;
margin: -2px 8px 0 0;
text-align: center;
vertical-align: middle;
background: #fafafa;
border: 1px solid #cacece;
border-radius: 3px;
box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05);
}

.checkbox-container input[type="checkbox"] + label:active:before,
.checkbox-container input[type="checkbox"]:checked + label:active:before {
        box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px 1px 3px rgba(0,0,0,0.1);
}

.checkbox-container input[type="checkbox"]:checked + label:before {
content: '\2713';
color: #314ca2;
text-shadow: 1px 1px white;
background: #17462B;
border-color: #adb8c0;
box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05);
}


.quantityWrap{ display: flex; justify-content: center; }
.quantity{ width: 80% ;border: 0.5px solid #ddd; display: flex; justify-content: space-between; align-items: center; }
.icoBtn{ border: 0px; }
.btn_reduce { border-right: 1px solid #ddd;  }
.btn_rise{ border-left: 1px solid #ddd; }

.collieBtn{ border: 1px solid #17462B; padding: 10px; margin-top: 5px; margin-bottom: 5px; color: #17462B; font-size: 15px; background-color: #fff }
.collieBtnMain{ border: 1px solid #17462B; padding: 10px 40px 10px 40px; margin-top: 5px; margin-bottom: 5px; color: #fff; font-size: 15px; background-color: #17462B }

.priceWrapper{ width: 700px; margin: 20px 0px 50px 0px; display: flex; justify-content: space-between; align-items: center; }
.priceDiv{ width: 150px; height:150px;border: 1px solid #17462B; text-align: center; display: flex; justify-content: center; align-items: center; flex-direction: column; }
.priceDivLabel{ color: #404040 }
.priceDivPrice{ margin-top: 10px; font-size: 17pt; font-weight: bold  }
</style>


<!-- Google CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function(){
	
});//ready
</script>
</head>
<body style="font-family: NanumBarunGothic;">

<div id="wrap">
	
	<jsp:include page="../common/header.jsp" />
	
	<div id="container">
	<div id="containerHeader">
	<a id="containerHeaderTitle">장바구니</a><br/>
	<a id="containerHeaderContent">주문하실 상품명 및 수량을 정확히 확인 해주세요</a>
	</div>
	
	<div id="containerContentWrapper">
	
	<div id="table">
	<form action="" method="post">
	<table class="table">
	  <thead>
	    <tr>
	      <th style="width: 50px;text-align: center; color: #5e5e5e">
	      <div class="checkbox-container"><input type="checkbox"><label for="is-subscription"></label></div>
	      </th>
	      <th style="width: 100px; color: #5e5e5e">전체선택</th>
	      <th style="text-align: center; color: #5e5e5e">상품정보</th>
	      <th style="width: 120px; text-align: center; color: #5e5e5e">수량</th>
	      <th style="width: 120px; text-align: center; color: #5e5e5e">상품금액</th>
	      <th style="width: 50px;"></th>
	    </tr>
	  </thead>
	  <tbody>
		<c:forEach var="cart" items="${ cart_list }">
	    <tr id="tableContent">
	      <td style="vertical-align: middle; text-align: center;">
	      	<input type="checkbox" name="cart_num" value="${ cart.cart_num }" style="chbox">
	      </td>
	      <td style="vertical-align: middle; text-align: center;">
	      	<c:out value="${ cart.item_img }"/>
	      </td>
	      <td style="vertical-align: middle;">
	      	<a href="#${ cart.item_num }" style="font-weight: bold;"><c:out value="${ cart.item_name }"/></a>
	      	<br/>
	      	<a style="font-size: 10pt"><c:out value="${ cart.item_price }"/>원</a>
	      </td>
	      <td style="vertical-align: middle; text-align: center;">
	      	<div class="quantityWrap">
	      	<div class="quantity">
	      	<button type="button" class="icoBtn"><img src="http://localhost/collie_user/cart/ico_minus.png" class="btn_reduce" style="width: 10px"></button>
	      	<c:out value="${ cart.item_cnt }"/>
	      	<button type="button" class="icoBtn"><img src="http://localhost/collie_user/cart/ico_plus.png" class="btn_rise" style="width: 10px"></button>
	      	</div>
	      	</div>
	      </td>
	      <td style="vertical-align: middle; text-align: center; font-weight: bold">
	      	<c:out value="${ cart.item_price * cart.item_cnt }"/>원
	      </td>
	      <td style="vertical-align: middle; text-align: center;">
	      	<a href="#del">
	      	<img src="http://localhost/collie_user/cart/cart_x.png" style="width: 10px">
	      	</a>
	      </td>
	    </tr>
		</c:forEach>
	  </tbody>
	</table>
	</form>
	<input type="button" class="collieBtn" value="선택삭제">
	</div>
	
	<div class="priceWrapper">
	
	<div class="priceDiv">
	<div class="priceDivLabel">상품금액</div>
	<div class="priceDivPrice">
	<c:out value="${ item_price }"/>17000원
	</div>
	</div>
	+
	<div class="priceDiv">
	<div class="priceDivLabel">배송비</div>
	<div class="priceDivPrice">
	2500원
	</div>
	</div>
	=
	<div class="priceDiv">
	<div class="priceDivLabel">결제예정금액</div>
	<div class="priceDivPrice">
	<c:out value="${ item_price }"/>17000원
	</div>
	</div>
	</div>
	
	<input type="button" value="주문하기" class="collieBtnMain">
	
	</div>
	
	</div>
	
	<jsp:include page="../common/footer.jsp" />
	
</div>

</body>
</html>