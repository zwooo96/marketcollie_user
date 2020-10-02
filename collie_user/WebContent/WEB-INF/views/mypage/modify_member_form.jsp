<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="http://211.238.142.36/jsp_prj/common/css/main.css">
<title>Insert title here</title>
<style type="text/css">
	#container{ width: 70%; margin: 0px auto; 900px; margin-top:50px; }
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
	#containerContent{ margin-top: 90px; text-align: center; }
	hr{ margin-top: 90px }
	.btn-primary{ background-color: #17462B; border-color: #17462B; margin:0px auto; margin-top: 30px; width: 250px; padding: 15px  }
	.btn-primary:hover, .btn-primary:active, .btn-primary:focus{ background-color: #17462B !important; }
	#btnDiv{ width: 250px; margin: 0px auto }
</style>  
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

<!-- Google CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
$(function(){
	
	var msg = '${ msg }';
	if( msg != '' ){
		alert(msg);
		location.href = history.back();
	}//end if
		
	$("#removeBtn").click(function(){
			
		location.href="remove_member_form.do"
			
	});//click
	
	$("#modifyBtn").click(function(){
		
		$("#Frm").submit();
		
	});//click
	
});//ready

function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 도로명 조합형 주소 변수

           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           // 건물명이 있고, 공동주택일 경우 추가한다.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }

           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           console.log(data.zonecode);
           console.log(fullRoadAddr);
           
           
           $("[name=addr1]").val(data.zonecode);
           $("[name=addr2]").val(fullRoadAddr);
           
           document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
           document.getElementById('addr').value = fullRoadAddr;
       }
    }).open();
}
</script>
</head>

<body style="font-family: nanumbarungothic">

<body>
<div id="wrap">

		<jsp:include page="../common/header.jsp" />
	
	<div id="container">
		<jsp:include page="../common/mypage_menu.jsp" />
		<div id="contentWrap">
		<div id="containerTitle">
			<h4><strong>개인정보 변경</strong></h4>
		</div>
			<div id="containerSubTitle">
			</div>
			<div id="containerContent">
	<form action="update_member.do" method="post" id="Frm">
		<div class="form-row" style="margin-top: 10px">
		    <div class="form-group col-md-6">
		      <label for="inputEmail4">아이디</label>
		      <input type="email" class="form-control" name="id" id="id" value="${ user_info.id }">
		    </div>
	    </div>
	    <div class="form-row">
		    <div class="form-group col-md-6">
		      <label for="inputPassword4">이름</label>
		      <input type="email" class="form-control" name="name" id="name" value="${ user_info.name }" >
		    </div>
	  	</div>
	    <div class="form-row">
		    <div class="form-group col-md-6">
		      <label for="inputPassword4">이메일</label>
		      <input type="email" class="form-control" name="email" id="email" readonly="readonly" value="${ user_info.email }">
		    </div>
	  	</div>
	  	<div id="email_chk"></div>
		 <label for="inputPassword4">휴대전화</label><br/>
	  	<div class="form-inline">
		  	<div class="form-group">
				<input type="email" class="form-control" style="width: 80px" maxlength="3"  id="phone1" name="phone1">
			</div>
		  	<div class="form-group">
				<label for="email">&nbsp;-&nbsp;</label>
				<input type="email" class="form-control"  style="width: 100px" id="phone2" maxlength="4" name="phone2">
			</div>
		  	<div class="form-group">
				<label for="email">&nbsp;-&nbsp;</label>
				<input type="email" class="form-control" style="width: 100px"  id="phone3" maxlength="4" name="phone3">
			</div>
	  	</div>
	  	<br/>
	  	<div class="form-row">
		    <div class="form-group col-md-6">
		      <label for="inputPassword4">우편번호</label>
		      <input type="email" class="form-control" name="zipcode" id="zipcode" placeholder="우편번호" readonly="readonly">
		    </div>
		    <input type="button" value="주소검색"  onclick="sample4_execDaumPostcode()" style="height:36px; margin-top: 32px; margin-left: 10px; background-color: white; color: black;" id="zipBtn" name="zipBtn"/>
	  	</div>
		<div class="form-row">
		    <div class="form-group col-md-6">
		      <label for="inputPassword4">주소</label>
		      <input type="email" class="form-control" name="addr" id="addr" readonly="readonly">
		    </div>
	  	</div>
	  	<div class="form-row" style="border-bottom: 3px solid #333">
		    <div class="form-group col-md-6">
		      <label for="inputPassword4">상세주소</label>
		      <input type="email" class="form-control" name="addr_detail" id="addr_detail">
		    </div>
	  	</div>
	  	<span><input type="button" value="탈퇴하기" id="removeBtn" style="zoom:1.2; background-color: white; color: black; border-color: black;" /></span>
	  	<span><input type="button" value="회원정보 수정" id="modifyBtn" style="zoom:1.2; background-color: white; color: black; border-color: black;"></span>
	  </form>
  	</div>
	</div>
			</div>
				<jsp:include page="../common/footer.jsp" />
		</div>
	
</body>
</html>