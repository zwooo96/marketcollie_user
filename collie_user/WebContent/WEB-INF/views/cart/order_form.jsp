<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
 
.containerTitleWrap{ display: flex; justify-content: center; }
.containerTitle{ width: 70%; height: 50px; font-size: 20pt; margin-top: 30px}
 
#containerContentWrapper{ display: flex; justify-content: center; align-items: center; flex-direction: column; }
.orderForm{ display: flex; justify-content: center; align-items: center; flex-direction: column; }
#table{ width: 70% }
.tableContent{ height: 120px; }

.paymentWrap{ width: 70%; display: flex; justify-content: space-between; }
.payInfoWrap{ width: 25%; margin-bottom: 10px; border: 1px solid #e0e0e0 ; background-color: #f0f0f0; font-weight: bold; font-size: 13pt }
.payInfo{ height: 60px; display: flex; justify-content: center; align-items: flex-end; }

table td ,table th{
    border-top: 2px solid #17462B !important;
    border-bottom: 2px solid #bebebe !important;
}
a, a:hover{ color: #000000; text-decoration: none }


/* 체크박스 */
.checks input[type="checkbox"] { /* 실제 체크박스는 화면에서 숨김 */ 
display: none; } 
.checks input[type="checkbox"] + label { 
display: inline-block; 
position: relative; 
cursor: pointer; } 
.checks input[type="checkbox"] + label:before { /* 가짜 체크박스 */ 
content: ' '; 
display: inline-block; 
width: 20px; /* 체크박스의 너비를 지정 */ 
height: 20px; /* 체크박스의 높이를 지정 */ 
line-height: 20px; /* 세로정렬을 위해 높이값과 일치 */ 
margin: 0px 0px 0 0; 
text-align: center; 
vertical-align: middle; 
background: #ffffff; 
border: 1px solid #17462B; 
border-radius : 1px; } 
.checks input[type="checkbox"]:checked + label:before { /* 체크박스를 체크했을때 */ 
content: '\2714'; /* 체크표시 유니코드 사용 */ 
color: #ffffff; 
background: #17462B;
border-color: #17462B; }


.collieText{ width: 300px; padding: 5px; font-size: 15px; }
.collieBtn{ border: 1px solid #17462B; padding: 5px; color: #17462B; font-size: 15px; background-color: #fff }
.collieBtnMain{ border: 1px solid #17462B; padding: 10px 40px 10px 40px; margin-top: 5px; margin-bottom: 5px; color: #fff; font-size: 15px; background-color: #17462B }

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
	<a id="containerHeaderTitle">주문서</a><br/>
	<a id="containerHeaderContent">주문하실 상품명 및 수량을 정확히 확인 해주세요</a>
	</div>

	<div>
	<form action="" method="post" id="orderForm" class="orderForm">
	
	<div class="containerTitle">
	상품정보
	</div>
	<div id="table">
	<table class="table" id="cartTable">
	  <thead>
	    <tr>
	      <th style="width: 150px;"></th>
	      <th style="text-align: center; vertical-align: middle; color: #5e5e5e">상품정보</th>
	      <th style="width: 120px; text-align: center; vertical-align: middle; color: #5e5e5e">상품금액</th>
	    </tr>
	  </thead>
	  <tbody>
		<c:forEach var="cart" items="${ cart_list }">
	    <tr id="tableContent${ cart.cart_num }" class="tableContent">
	      <td style="vertical-align: middle; text-align: center;">
	      	<c:out value="${ cart.item_img }"/>
	      	<input type="hidden" name="cart_num" value="${ cart.cart_num }"/>
	      	<input type="hidden" name="item_num" value="${ cart.item_num }"/>
	      	<input type="hidden" name="item_cnt" value="${ cart.item_cnt }"/>
	      </td>
	      <td style="vertical-align: middle;">
	      	<c:out value="${ cart.item_name }"/><br/>
	      	<a style="font-size: 10pt">
	      	<fmt:formatNumber pattern="#,###" value="${ cart.item_cnt }"/>개 / 개 당 <fmt:formatNumber pattern="#,###" value="${ cart.item_price }"/>원
	      	</a>
	      </td>
	      <td style="vertical-align: middle; text-align: center; font-weight: bold">
	      	<fmt:formatNumber pattern="#,###" value="${ cart.item_price * cart.item_cnt }"/>원
	      </td>
	    </tr>
		</c:forEach>
	  </tbody>
	</table>
	</div>
	
	
	
	<div class="containerTitle">
	주문자 정보
	</div>
	<div id="table">
	<table class="table" id="cartTable">
		<tr>
	      <td style="width: 150px;vertical-align: middle;">
	      	<div style="margin: 10px 0px 10px 0px">보내는분</div>
	      	<div style="margin: 10px 0px 10px 0px">휴대폰</div>
	      	<div style="margin: 10px 0px 10px 0px">이메일</div>
	      </td>
	      <td style="vertical-align: middle;">
	      	<div style="margin: 10px 0px 10px 0px"><c:out value="${ user_info.name }"/></div>
	      	<div style="margin: 10px 0px 10px 0px"><c:out value="${ user_info.phone }"/></div>
	      	<div style="margin: 10px 0px 10px 0px"><c:out value="${ user_info.email }"/></div>
	      </td>
	    </tr>
	</table>
	</div>
	
	
	<div class="containerTitle">
	배송 정보
	</div>
	<div id="table">
	<table class="table" id="cartTable">
		<tr>
	      <td style="width: 150px;vertical-align: middle;">
	      	<div style="margin: 12px 0px 18px 0px">받는분</div>
	      	<div style="margin: 12px 0px 18px 0px">휴대폰</div>
	      	<div style="margin: 12px 0px 18px 0px">우편번호</div>
	      	<div style="margin: 12px 0px 18px 0px">주소</div>
	      	<div style="margin: 12px 0px 18px 0px">상세주소</div>
	      </td>
	      <td style="vertical-align: middle;">
	      	<div style="margin: 10px 0px 10px 0px"><input type="text" name="receive_name" value="${ user_info.name }" class="collieText"/></div>
	      	<div style="margin: 10px 0px 10px 0px"><input type="text" name="receive_phone" value="${ user_info.phone }" class="collieText"/></div>
	      	<div style="margin: 10px 0px 10px 0px">
	      	<input type="text" name="receive_zipcode" value="${ user_info.zipcode }" class="collieText" readonly="readonly"/>
	      	<input type="button" value="우편번호 검색" class="collieBtn">
	      	</div>
	      	<div style="margin: 10px 0px 10px 0px"><input type="text" name="receive_addr" value="${ user_info.addr }"  class="collieText" readonly="readonly"/></div>
	      	<div style="margin: 10px 0px 10px 0px"><input type="text" name="receive_addr_detail" value="${ user_info.addr_detail }"  class="collieText"/></div>
	      </td>
	    </tr>
	</table>
	</div>
	
	
	
	<div class="containerTitle">
	결제수단 - 일반결제 (신용카드)
	</div>
	<div class="paymentWrap">
	<div id="table">
	<table class="table" id="cartTable">
		<tr>
	      <td style="width: 150px;vertical-align: middle;">
	      	<div style="margin: 12px 0px 18px 0px">카드사</div>
	      	<div style="margin: 12px 0px 18px 0px">카드번호</div>
	      	<div style="margin: 12px 0px 18px 0px">유효기간</div>
	      	<div style="margin: 12px 0px 18px 0px">비밀번호</div>
	      </td>
	      <td style="vertical-align: middle;">
	      	<div style="margin: 10px 0px 10px 0px">
	      		<select name="card_bank" class="collieText">
	      			<option value="국민">KB국민</option>
	      			<option value="우리">우리</option>
	      			<option value="신한">신한</option>
	      		</select>
	      	</div>
	      	<div style="margin: 10px 0px 10px 0px">
	      		<input type="text" name="card_num1" placeholder="4자리" class="collieText" style="width: 50px; margin-right: 10px"/>
	      		<input type="text" name="card_num2" placeholder="4자리" class="collieText" style="width: 50px; margin-right: 10px"/>
	      		<input type="text" name="card_num3" placeholder="4자리" class="collieText" style="width: 50px; margin-right: 10px"/>
	      		<input type="text" name="card_num4" placeholder="4자리" class="collieText" style="width: 50px; margin-right: 10px"/>
	      		<input type="text" placeholder="CVC" class="collieText" style="width: 50px"/>
	      	</div>
	      	<div style="margin: 10px 0px 10px 0px">
	      	<input type="text" name="card_exp_mm" placeholder="MM" class="collieText" style="width: 50px; margin-right: 10px"/>
	      	<input type="text" name="card_exp_yy" placeholder="YY" class="collieText" style="width: 50px; margin-right: 10px"/>
	      	</div>
	      	<div style="margin: 10px 0px 10px 0px">
	      	<input type="text" class="collieText" style="width: 50px; margin-right: 10px"/> **
	      	</div>
	      </td>
	    </tr>
	</table>
	</div>
	<div class="payInfoWrap">
	<div class="payInfo">
	<div style="width: 120px; margin-left: 15px">상품금액</div>
	<div style="width: 120px; text-align: right; margin-right: 15px">190,000원</div>
	</div>
	<div class="payInfo">
	<div style="width: 120px; margin-left: 15px">배송비</div>
	<div style="width: 120px; text-align: right; margin-right: 15px">2,500원</div>
	</div>
	<div class="payInfo">
	<div style="width: 120px; margin-left: 15px">최종 결제 금액</div>
	<div style="width: 120px; text-align: right; margin-right: 15px">192,500원</div>
	</div>
	</div>
	</div>
	
	
	
	<div class="containerTitle">
	개인정보 수집/제공
	</div>
	<div id="table">
	<table class="table" id="cartTable">
		<tr>
		<td style="height: 60px; vertical-align: middle;">
		<div class="checks">
			<input type="checkbox" id="agree">
			<label for="agree"><span> 결제 진행 필수 동의</span></label>
		</div>
		</td>
		</tr>
	</table>
	</div>
	
	<input type="button" value="결제하기" class="collieBtnMain">
	
	
	</form>
	</div>
	
	<div style="height: 200px"></div>
	
	</div>
	
	<jsp:include page="../common/footer.jsp" />
	
</div>

</body>
</html>