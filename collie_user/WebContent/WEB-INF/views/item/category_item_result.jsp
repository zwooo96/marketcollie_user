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
#containerTitle {width: 70%;}
#containerTitleWrap{ margin-top: 50px; margin-bottom: 50px; display: flex; justify-content: center; }
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
	
});//ready


function movePage(field_name, field_value, target_page) {
// 	console.log("field_name : " + field_name + " / field_value" + field_value);
	var param = 'field_name='+field_name+'&field_value='+field_value+'&current_page='+target_page;
	
	
	$.ajax({
		url:'/collie_user/item/search.do?'+param,
		type:'POST',
		dataType:'json',
  		error:function(xhr) {
  			alert("에러발생 : " + xhr.status + " / " + xhr.statusText);
    	},
		success:function(jo) {
			
			// 아이템 목록 표시 HTML
			var output = '<div class="row row-cols-1 row-cols-md-3">';
			$.each(jo.item_list, function(idx, item) {
				output += '<div class="col mb-3">';
				output +=	 '<div class="card">';
				output += 		'<img src="/collie_user/common/images/item/'+item.item_img+'" class="card-img-top">';
				output += 		'<div class="card-body">';
				output += 			'<h6 class="card-title">'+item.item_name+'</h6>';
				output += 			'<p class="card-text">'+item.item_price+'원</p>';
				output += 		'</div>';
				output += 	'</div></div>';
			});
			output +='</div>';
			$("#start_foreach").html(output);
			
			//페이지네이션 표시 HTML
			output = '<nav aria-label="Page navigation example">';
			output += '<ul class="pagination justify-content-center">';
	
			var disableOption = 'disabled';
			if(jo.pre_page > 0) {
				disableOption = 'active';
			}
			output += '<li class="page-item '+disableOption+'">';
			output += '<a class="page-link" onclick="movePage(\'${paging.field_name}\',\'${paging.field_value}\','+jo.pre_page+');" aria-label="Previous">';
			output += '<span aria-hidden="true">&laquo;</span>';
			output += '</a>';
			output += '</li>';
			for(var i = jo.start_page; i <= jo.end_page; i++) {
				output +='<li class="page-item">';
				output += '<a class="page-link" onclick="movePage(\'${paging.field_name}\',\'${paging.field_value}\','+i+');">';
				output += (i+'</a>');
				output += '</li>';
			}
			
			var disableOption = 'active';
			if(target_page == jo.end_page) {
				disableOption = 'disabled';
			}
			output += '<li class="page-item '+disableOption+'">';
			output += '<a class="page-link"  onclick="movePage(\'${paging.field_name}\',\'${paging.field_value}\', '+jo.next_page+');"aria-label="Next">';
			output += '<span aria-hidden="true">&raquo;</span>';
			output += '</a>';
			output += '</li>';
			output += '</ul>';
			output += '</nav>';
			$("#pagination").html(output);
		}
		
	});
}
</script>
</head>
<body style="font-family: nanumbarungothic">

<div id="wrap">
	<jsp:include page="../common/header.jsp" />
	<div id="container">
		<div id="containerTitleWrap">
			<div id="containerTitle">	
				총 ${paging.total_cnt}건이 검색되었습니다.<br/>
				<div id="setVariable"></div>
			</div>
		</div>
		<div id="containerContentWrap">
			<div id="containerContent">
				<div id="start_foreach">
					<div class="row row-cols-1 row-cols-md-3">
						<c:forEach begin="${paging.start_num}" end="${paging.end_num}" step="1" var="index">
							<div class="col mb-3">
								<div class="card">
									<img src="/collie_user/common/images/item/${item_list[index - 1].item_img}" class="card-img-top">
									<div class="card-body">
										<h6 class="card-title">${item_list[index - 1].item_name}</h6>
										<p class="card-text">${item_list[index - 1].item_price}원</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		<div id="pagination">
			<nav aria-label="Page navigation example">
			  <ul class="pagination justify-content-center">
			    <li class="page-item ${paging.pre_page eq '0' ? 'disabled':'active'}">
				 	<a class="page-link" onclick="movePage('${paging.field_name}','${paging.field_value}', ${paging.next_page});" aria-label="Previous">
			        	<span aria-hidden="true">&laquo;</span>
			      	</a>
			    </li>
			    <c:forEach begin="${paging.start_page}" end="${paging.end_page}" step="1" var="cnt" >
				    <li class="page-item">
				    	<a class="page-link" onclick="movePage('${paging.field_name}','${paging.field_value}',${cnt});">
				    		<c:out value="${cnt}" />
				    	</a>
				    </li>
			    </c:forEach>
			    <li class="page-item ${paging.current_page eq paging.end_page ? 'disabled':'active'}">
			      <a class="page-link"  onclick="movePage('${paging.field_name}','${paging.field_value}', ${paging.next_page});"aria-label="Next">
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