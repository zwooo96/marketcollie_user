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
	
	$("#chk").click(function(){
		
	var chk1=document.getElementById("chk1");
	var chk2=document.getElementById("chk2");
	
	
	if(!$(chk1).is(":checked")){
		alert("이용약관에 동의해주세요");
		return;
		}//end if
		
	if(!$(chk2).is(":checked")){
		alert("개인정보 수집 및 이용 동의에 동의 해주세요");
		return;
		}//end if
		
		location.href="join_form.do"
		
	});//click
	
	});//ready
</script>
</head>
<body>
<div id="wrap">
	<div id="header">
	<jsp:include page="../common/header.jsp" />
	</div>
	
	<div id="container">
			<table>
		<tr> 
			<td><input type="checkbox" id="chk1"/><strong>이용약관 동의</strong> (필수)</td>
		</tr> 
		<tr>
			<td colspan="2"><textarea style="width:300px; height:150px">약관내용</textarea></td>
		</tr>
		<tr> 
			<td><input type="checkbox" id="chk2"/><strong>개인정보 수집 및 이용 동의</strong> (필수)</td>
		</tr> 
		<tr>
			<td colspan="2"><textarea style="width:300px; height:150px">약관내용</textarea></td>
		</tr>
		<tr> 
			<td><input type="checkbox"/><strong>위치정보 이용약관 동의</strong> (선택)</td>
		</tr> 
		<tr>
			<td colspan="2"><textarea style="width:300px; height:150px">약관내용</textarea></td>
		</tr>
		<tr>
		<td><a href="javascript:history.back()"><input type="button" style="width:100px" value="취소"/></a></td><td><input type="button" style="width:100px" id="chk" value="확인"/></td>
		</tr>
		</table>
	</div>
	
	</div>
	<div id="footer">
		<jsp:include page="../common/footer.jsp" />
	</div>
	
</body>
</html>