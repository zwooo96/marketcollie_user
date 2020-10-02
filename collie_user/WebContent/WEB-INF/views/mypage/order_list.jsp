<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마켓콜리</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/collie_user/common/css/common.css">

<style type="text/css">
#container{ width: 70%; margin: 0px auto; min-height: 900px; margin-top:50px; }
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
#emptyTable{ text-align: center; margin-top: 30px; border-bottom: 1px solid #dee2e6 }
#emptyOrder{ font-weight: bold; font-size: 17px; height: 75px }
#containerContent{ margin-top: 30px }
#orderTime{ color:#666666; font-weight: bold; }
.table-borderless{ margin:0px }
#orderGoods{ border: 1px solid #dee2e6; margin-top: 10px; padding: 10px; padding-left: 20px; padding-right: 20px }
#goodsTitle{ border-bottom: 1px solid #dee2e6; padding: 0px; padding-top: 10px; padding-bottom: 10px; font-weight: bold }
.btn-outline-success{ border-color: #17462B !important; color: #17462B !important }
.btn-outline-success:hover, #btn-outline-success:active, #btn-outline-success:focus { border-color: #17462B !important; background-color: #17462B !important; color:#FFFFFF !important }
#goodsImg{ padding-left: 10px; width: 10px; padding-top: 20px; padding-right: 0px }
#goodsThm{ width:60px; height: 75px }
#orderNumColumn{ padding-top: 25px; width: 50px; vertical-align: middle; font-size: 14px; padding-bottom: 0px; padding-left: 0px }
#orderNumValue{ padding-top: 25px; width:500px; vertical-align: middle; font-size: 14px; padding-bottom: 0px; padding-left: 0px }
#orderPriceColumn{ font-size: 14px; padding-top: 0px; padding-left: 0px }
#orderPriceValue{ font-size: 14px; padding-top: 0px; padding-left: 0px }
#goodsBtn{ vertical-align: middle; width:85px; padding-right: 0px; padding-left: 30px }
#btn{ font-size: 14px }
#pagination{ margin-left: 240px; margin-top: 100px; margin-bottom: 200px }
</style>
<!-- Google CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function(){
	
});//ready

function getOrderDetail(order_num) {
	   location.href="order_detail.do?order_num="+order_num;
}//getOrderDetail

function movePage(target_page){
	$.ajax({
		url : 'order_list_page.do?current_page='+target_page,
		type : 'GET',
		dataType : 'json',
		error : function(xhr){
			alert("error : " + xhr.status + " / " + xhr.statusText);
		},
		success : function(jo){
			//주문 목록 표시 HTML
			var output = '';
			$.each(jo.order_list, function(idx, list){
				output += '<div id="containerContent">';
				output += '<div id="orderTime">';
				output += '';
				output += '</div>';
				output += '<div id="orderGoods">';
				output += '<table class="table table-borderless">';
				output += '<tr><td colspan="4" id="goodsTitle">'+ list.item_name + '</td></tr>';
				output += '<tr id="orderNum">';
				output += '<td rowspan="2" id="goodsImg">';
				output += '<img src="http://localhost/collie_user/common/images/item/'+list.item_img+'" id="goodsThm"/></td>';
				output += '<td id="orderNumColumn">주문번호</td>';
				output += '<td id="orderNumValue"><strong>' + list.order_num + '</strong></td>';
				output += '<td rowspan="2" id="goodsBtn">';
				output += '<button type="button" class="btn btn-outline-success" id="btn" onclick="getOrderDetail(' + list.order_num + ');">상세보기</button></td></tr>';
				output += '<tr id="orderPrice">';
				output += '<td id="orderPriceColumn">결제금액</td>';
				output += '<td id="orderPriceValue"><strong>';
				output += '';
				output += '원</strong></td>';
				output += '</tr></table></div></div>';
			});//each
			$("#forEachWrap").html(output);
			
			//페이지네이션 표시 HTML
			output = '<nav aria-label="Page navigation example">';
			output += '<ul class="pagination justify-content-center">';
	
			var disableOption = 'disabled';
			if(jo.pre_page > 0) {
				disableOption = 'active';
			}
			output += '<li class="page-item '+disableOption+'">';
			output += '<a class="page-link" onclick="movePage('+jo.pre_page+');" aria-label="Previous">';
			output += '<span aria-hidden="true">&laquo;</span>';
			output += '</a>';
			output += '</li>';
			for(var i = jo.start_page; i <= jo.end_page; i++) {
				output +='<li class="page-item">';
				output += '<a class="page-link" onclick="movePage('+i+');">';
				output += (i+'</a>');
				output += '</li>';
			}
			
			var disableOption = 'active';
			if(target_page == jo.end_page) {
				disableOption = 'disabled';
			}
			output += '<li class="page-item '+disableOption+'">';
			output += '<a class="page-link"  onclick="movePage('+jo.next_page+');"aria-label="Next">';
			output += '<span aria-hidden="true">&raquo;</span>';
			output += '</a>';
			output += '</li>';
			output += '</ul>';
			output += '</nav>';
			$("#pagination").html(output);			
		}//success
	});//ajax
}//movePage

</script>
</head>
<body style="font-family: nanumbarungothic">

<div id="wrap">
	
	<c:import url="/header.do" />
	
	<div id="container">
		<jsp:include page="../common/mypage_menu.jsp"/>
		<div id="contentWrap">
		<div id="containerTitle">
			<h4><strong>주문 내역</strong></h4>
		</div>
			<div id="containerSubTitle"></div>
			<c:if test="${ empty order_list }">
				<table class="table table-borderless" id="emptyTable">
					<tr><td id="emptyOrder">주문 내역이 없습니다.</td></tr>
				</table>
			</c:if>
			
			<div id="forEachWrap">
			<c:forEach var="old" items="${ order_list }">
			<div id="containerContent">
				<div id="orderTime">
					<fmt:parseDate var="originalFmt" value="${ old.input_date }" pattern="yyyy-MM-dd HH:mm:ss.SSS"/>
					<fmt:formatDate var="newFmt" value="${ originalFmt }" pattern="yyyy.MM.dd (HH시 mm분)"/>
					${ newFmt }
				</div>
				<div id="orderGoods">
				<table class="table table-borderless">
				    <tr>
				      <td colspan="4" id="goodsTitle">${ old.item_name }</td>
				    </tr>
				    <tr id="orderNum">
				      <td rowspan="2" id="goodsImg">
				      	<img src="http://localhost/collie_user/common/images/item/${ old.item_img }" id="goodsThm"/>
				      </td>
				      <td id="orderNumColumn">주문번호</td>
				      <td id="orderNumValue"><strong>${ old.order_num }</strong></td>
				      <td rowspan="2" id="goodsBtn">
				      	<button type="button" class="btn btn-outline-success" id="btn" onclick="getOrderDetail(${ old.order_num });">상세보기</button>
				      </td>
				    </tr>
				    <tr id="orderPrice">
				      <td id="orderPriceColumn">결제금액</td>
				      <td id="orderPriceValue"><strong><fmt:formatNumber value="${ old.total_price }" pattern="#,###"/>원</strong></td>
				    </tr>
				</table>
				</div>
			</div>
			</c:forEach>
			</div>
		</div>
		<c:if test="${ not empty order_list }">
		<div id="pagination">
			<nav aria-label="Page navigation example">
			  <ul class="pagination justify-content-center">
			    <li class="page-item ${paging.pre_page eq '0' ? 'disabled':'active'}">
				 	<a class="page-link" onclick="movePage(${paging.pre_page});" aria-label="Previous">
			        	<span aria-hidden="true">&laquo;</span>
			      	</a>
			    </li>
			    <c:forEach begin="${paging.start_page}" end="${paging.end_page}" step="1" var="cnt" >
				    <li class="page-item">
				    	<a class="page-link" onclick="movePage(${cnt});">
				    		<c:out value="${cnt}" />
				    	</a>
				    </li>
			    </c:forEach>
			    <li class="page-item ${paging.current_page eq paging.end_page ? 'disabled':'active'}">
			      <a class="page-link"  onclick="movePage(${paging.next_page});"aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
			  </ul>
			</nav>
		</c:if>
		</div>
	</div>
	
	<jsp:include page="../common/footer.jsp" />
	
</div>

</body>
</html>	