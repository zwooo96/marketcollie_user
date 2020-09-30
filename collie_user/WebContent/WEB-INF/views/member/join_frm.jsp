<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="http://211.238.142.36/jsp_prj/common/css/main.css">
<title>Insert title here</title>
<style type="text/css">
	#wrap{ width:900px; height:900px; margin:0px auto; }
	#header{ width:900px; height:180px; }
	#headerTop{ width:900px; height:140px; position:relative; background:#FFFFFF url("http://211.238.142.36/jsp_prj/common/images/header_bg.png") }
	#mainText{ font-family: 고딕,godic,Sans-Serif; font-size:30px; font-weight:bold; width:140px; height:50px; margin:0px auto; padding-top:20px; }
	#naviBar{ width:900px; height:60px; margin-top:10px }
	#container{ width: 900px; height:600px; position:relative; }
	#footer{ width: 900px; height:120px; position:relative; }
	#footerLogo{ width:170px; height:60px; margin-left:10px; margin-top:10px; }
	#footerContent{ width:700px; height:100px; margin-left:600px; margin-top:10px; font-family:고딕,godic; font-size:14px; text-align: right; margin-right:20px;}
</style>  
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

<!-- Google CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
$(function(){
	
	$("#chkId").click(function(){
		var id = $("#id").val();
	  if( id.length > 6 ){
			$.ajax({
				url : "id_chk_ajax.do",
				type : 'get',
				data: "id="+id,
				dataType:"json",
				error : function() {
						console.log("실패");
				},
				success : function( json ) {
					
					if ( json.id_dup_result ) {
							// 아이디가 중복되는 문구
							$("#id_check").html("중복된아이디");
						}else{
							// 아이디가 중복되는 문구
							$("#id_check").html("사용 가능한 아이디 입니다. ");
						}//end if
					}//success
				});//ajax
	}//end if
	});//click
	
	$("#chkEmail").click(function(){
			var email = $("#email").val();
		if(email.length > 3){
		$.ajax({
			url : "email_chk_ajax.do",
			type : "get",
			data : "email="+email,
			dataType : "json",
			error : function( ){
				alert("errror가 발생했습니다.");
			},
			success : function( jsonObj ){
					if( jsonObj.email_dup_result ){
						$("#email_chk").html(" 중복된 이메일 입니다. ");
					}else{
						$("#email_chk").html(" 사용 가능한 이메일 입니다. ")
					}//end if
				}//success
			});//ajax
		}//end if
		});//click
		
		$("#joinBtn").click(function(){
			
			$("#joinFrm").submit();
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
<body>
<div id="wrap">
	<div id="header">
	<jsp:include page="../common/header.jsp" />
	</div>
	
	<div id="container">
	
		<form action="join_process.do" method="post" id="joinFrm">
		<table >
		<tr>
			<td style="width: 50px">아이디</td><td><input type="text" style="width: 200px" name="id" id="id" placeholder="6자이상의 영문 혹은 영문 숫자를 조합"/></td>
			<td><input type="button" id="chkId" value="중복확인"/></td>
		</tr>
		<tr >
			<td colspan="2" id="id_check"></td>
		</tr>
		<tr>
			<td style="width: 100px">비밀번호</td><td><input type="password" style="width: 200px" name="pass" placeholder="비밀번호를 입력해주세요"/></td>
		</tr>
		<tr> 
			<td style="width: 100px">비밀번호 확인</td><td><input type="password" style="width: 200px" placeholder="비밀번호를 한번 더 입력해주세요"/></td>
		</tr> 
		<tr> 
			<td style="width: 100px">이름</td><td><input type="text" style="width: 200px" name="name" placeholder="이름을 입력해주세요"/></td>
		</tr> 
		<tr> 
			<td style="width: 100px">이메일</td><td><input type="text" style="width: 200px" name="email" id="email" placeholder="예:collie@collie.com"/></td>
			<td><input type="button" id="chkEmail" value="중복확인"/></td>
		</tr> 
		<tr >
			<td colspan="2" id="email_chk"></td>
		</tr>
		<tr> 
			<td style="width: 100px">휴대폰</td><td><input type="text" style="width: 200px" name="phone" placeholder="숫자만 입력해주세요"/></td>
		</tr> 
		<tr>
			<td style="width: 100px">우편번호</td><td><input type="text" style="width: 200px" name="zipcode" id="zipcode" placeholder="우편번호" readonly="readonly"/></td>
			<td><input type="button" value="주소검색"  onclick="sample4_execDaumPostcode()" style="width: 80px" id="zipBtn" name="zipBtn"/></td>
		</tr> 
		<tr> 
			<td style="width: 100px">주소</td><td><input type="text" style="width: 200px" name="addr" id="addr"/></td>
		</tr> 
		<tr> 
			<td style="width: 100px">상세주소</td><td><input type="text" style="width: 200px" name="addr_detail"/></td>
		</tr> 
		</table>
	<hr>
	<span><input type="button" value="회원가입" id="joinBtn" /></span>
	</form>
	</div>
	
	</div>
	<div id="footer">
		<jsp:include page="../common/footer.jsp" />
	</div>
	
</body>
</html>