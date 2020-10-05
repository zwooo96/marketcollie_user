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
.item_description {}

/* ==================리뷰=================== */
#reviewTitleWrap{ margin-top: 100px; margin-bottom: 20px; display: flex; justify-content: center; flex-direction: column; align-items: center }
#reviewTitleColumn{ width: 70%; font-weight: bold; font-size: 20pt }
#reviewTitleValue{ width: 70%; margin-top: 20px; color: #bebebe; font-size: 9pt }
#reviewDiv{ display: flex; justify-content: center }
#reviewBtn{ background-color: #17462B !important; border-color: #17462B !important; margin-top: 20px; width: 100px; padding: 5px !important; font-size: 14px }
#reviewBtn:hover, #reviewBtn:active, #reviewBtn:focus{ background-color: #17462B !important; font-size: 14px }
#reviewBtnWrap{ width: 100px; float: right; margin-right: 310px }
#reviewPagination{ margin-top: 80px; clear: both; }
/* ==================리뷰=================== */

/* ==================아이템문의=================== */
.itemQnaDiv{ display: flex; justify-content: center }

.tab{ width: 70% }
.tableContent{ text-align: center; }
.titleTab{height: 50px; text-align: center;}

.tabTh{
    border-top: 2px solid #17462B !important;
    border-bottom: 2px solid #bebebe !important;
    font-size: 14px;
}
.tabTd{
    border-top: 2px solid #17462B !important;
    border-bottom: 2px solid #bebebe !important;
    padding: 20px 0px 20px 0px;
    font-size: 14px
}


.itemQnaBtnDivWrap{ display: flex; justify-content: center; }
.itemQnaBtnDiv{ width: 70%; display: flex; justify-content: flex-end; }
.collieBtnMain{ width: 130px; border: 1px solid #17462B; padding: 10px 0px 10px 0px; margin-top: 20px; margin-bottom: 5px; color: #fff; font-size: 15px; background-color: #17462B }
.paginationDiv{ margin-top: 50px }
/* ==================아이템문의=================== */

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

/* ===============================리뷰================================= */
function reviewToggle(review_num){
	if($("#reviewTr"+review_num).length == 1 && $("#reviewContentTr"+review_num).length == 0 ){
		openReview(review_num);
	}else{
		closeReview(review_num);
	}//end else
}//reviewToggle

function openReview(review_num){
	var item_num = location.search.slice(-1);
  	$.ajax({
		url:"review_detail.do",
		type:"GET",
		data:"item_num="+item_num+"&review_num="+review_num,
		dataType:"JSON",
		error:function(xhr){
			alert("error : " + xhr.status + " / " + xhr.statusText);
		},
		success:function(jsonObj){
				var contentTr ='<tr id="reviewContentTr'+review_num+'" class="tableContent">';
				contentTr += '<td class="tabTd"></td>';
				contentTr += '<td colspan="3" class="tabTd" style="text-align: left">';
				contentTr+='<strong>'
				contentTr += jsonObj.review_content;
				contentTr+='</strong>'
				contentTr += '</td>';
				contentTr += '</tr>';
				$("#reviewTr"+review_num).after(contentTr);
		}//success
	});//ajax
}//openReview

function closeReview(review_num){
	$("#reviewContentTr"+review_num).remove();
}//closeReview

////////////////////////////수정 필요 (후기 쓸 권한 확인)
function writeReview(item_num) {
	location.href="review_form.do?item_num="+item_num;
}//writeReview

function moveReviewPage(field_value, target_page){
	var param = "field_name=item_num&field_value="+field_value+"&current_page="+target_page;
	var item_num = location.search.slice(-1);
	$.ajax({
		url : "review_list_page.do?"+param,
		type : "GET",
		dataType : "JSON",
		error : function(xhr){
			alert("error : " + xhr.status + " / " + xhr.statusText);
		},
		success : function(jo){
			//리뷰 목록 표시 HTML
			var output = '<table class="tab">';
			output += '<thead>';
			output += '<tr class="titleTab">';
			output += '<th class="tabTh" style="width: 50px">번호</th>';
			output += '<th class="tabTh">제목</th>';
			output += '<th class="tabTh" style="width: 150px">아이디</th>';
			output += '<th class="tabTh" style="width: 150px">작성일</th></tr>';
			output += '</thead>';
			output += '<tbody>';
			$.each(jo.review_list, function(idx, list){
				output += '<tr id="reviewTr'+list.review_num+'" class="tableContent" onclick="reviewToggle('+list.review_num+')">';
				output += '<td class="tabTd">' + list.review_num + '</td>';
				output += '<td class="tabTd">' + list.review_subject + '</td>';
				output += '<td class="tabTd">' + list.id + '</td>';
				output += '<td class="tabTd">';
				output += list.input_date.substring(0,10);
				output += '</td></tr>';
			});//each
			output += '</tbody></table>';
			$("#reviewDiv").html(output);

			//페이지네이션 표시 HTML
			output = '<nav aria-label="Page navigation example">';
			output += '<ul class="pagination justify-content-center">';
	
			var disableOption = 'disabled';
			if(jo.pre_page > 0) {
				disableOption = 'active';
			}
			output += '<li class="page-item '+disableOption+'">';
			output += '<a class="page-link" onclick="moveReviewPage('+item_num+','+jo.pre_page+');" aria-label="Previous">';
			output += '<span aria-hidden="true">&laquo;</span>';
			output += '</a>';
			output += '</li>';
			for(var i = jo.start_page; i <= jo.end_page; i++) {
				output +='<li class="page-item">';
				output += '<a class="page-link" onclick="moveReviewPage('+item_num+','+i+');">';
				output += (i+'</a>');
				output += '</li>';
			}
			
			var disableOption = 'active';
			if(target_page == jo.end_page) {
				disableOption = 'disabled';
			}
			output += '<li class="page-item '+disableOption+'">';
			output += '<a class="page-link"  onclick="moveReviewPage('+item_num+','+jo.next_page+');"aria-label="Next">';
			output += '<span aria-hidden="true">&raquo;</span>';
			output += '</a>';
			output += '</li>';
			output += '</ul>';
			output += '</nav>';
			$("#reviewPagination").html(output);			
		}//success
	});//ajax
}//moveReviewPage
/* ===============================리뷰================================= */


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
		
		<div id="reviewWrap">
		<c:import url="/item/review_list.do"/>
		</div>
		
		<div id="itemQnaWrap">
		<c:import url="/item/item_qna_list.do"/>
		</div>
		
		
	</div> <!-- container end -->

	
	<jsp:include page="../common/footer.jsp" />
	
</div>

</body>
</html>