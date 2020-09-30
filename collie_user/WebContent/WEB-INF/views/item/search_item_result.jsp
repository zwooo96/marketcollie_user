<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<!-- Google CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function(){
	
	var cate_num=${param.cate_num};
	var current_page=${param.current_page};
	$.ajax({
		url:"search.do",
		type:"GET",
		data:"cate_num="+cate_num+"&current_page="+current_page,
		dataType:"JSON",
		error:function(xhr){
			alert("에러"+xhr.status+" / "+xhr.statusText);
		},
		success:function(data) {
			var max_width_cnt = 3;
			var search_tot_cnt = data.search_tot_cnt; 

			if(total_cnt < max_width_cnt) {
				max_width_cnt = data.search_tot_cnt;
			}
			var output = '<div class="row row-cols-1 row-cols-md-'+max_width_cnt+'">';
			
			var endNum = data.end_num > data.search_tot_cnt ? data.search_tot_cnt : data.end_num ;
			for(var i = data.start_num - 1; i < endNum; i++) {
				output += '<div class="col mb-'+max_width_cnt+'">';
				output += '<div class="card">';
				output += '<img src="/collie_user/common/images/item/'+data.search_result[i].item_img+'" class="card-img-top">';
				output += '<div class="card-body">';
				output += '<h6 class="card-title">'+data.search_result[i].item_name+'</h6>';
				output += '<p class="card-text">'+data.search_result[i].item_price+'원</p>';
				output += '</div></div></div>';
			}
			output += '</div>';
			$("#resultDiv").replaceWith(output);
			
		}
	});
});//ready
</script>
</head>
<body style="font-family: nanumbarungothic">

<div id="wrap">
	<jsp:include page="../common/header.jsp" />
	<div id="container">
		<div id="containerTitleWrap">
			<div id="containerTitle">	
				총 건이 검색되었습니다.<br/>
			</div>
		</div>
		<div id="containerContentWrap">
			<div id="containerContent">
				<div id="resultDiv"></div>
			</div>
		</div>
		<div id="pagination">
			testststs<c:out value="${search_tot_cnt}" />
			<nav aria-label="Page navigation example">
			  <ul class="pagination justify-content-center">
			    <li class="page-item">
			      <a class="page-link" href="#" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			        <span class="sr-only">Previous</span>
			      </a>
			    </li>
			    <c:forEach begin="1" end="${empty search_tot_cnt ? 3 : search_tot_cnt}" var="cnt">
				    <li class="page-item"><a class="page-link" href="search.do?cate_num=${param.cate_num}&current_page=${cnt}">1</a></li>
			    </c:forEach>
			    <li class="page-item">
			      <a class="page-link" href="#" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			        <span class="sr-only">Next</span>
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