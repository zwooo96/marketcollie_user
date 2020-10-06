<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마켓콜리</title>
<style type="text/css">
#wrap{ min-height: 940px; margin: 0px auto; }
#container{ min-height: 600px;}
#containerContentWrap{ margin-top: 50px; margin-bottom: 30px; display: flex; justify-content: center; }
#containerContent{ width: 70%; display: flex; align-items: center; justify-content: space-between; }
#findDiv{width: 100%; min-height: 500px; margin-top: 30px}
#btnDiv{margin-top: 50px}
#title{text-align: center;}

.frmWarp{display: flex; justify-content: center;}
.form{font-size: 15px; height: 50px; margin-bottom: 40px}
.collieBtnMain{ width: 340px; border: 1px solid #17462B; padding: 10px 0px 10px 0px; margin-top: 5px; margin-bottom: 5px; color: #fff; font-size: 15px; background-color: #17462B }
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
</script>
</head>
<body style="font-family: nanumbarungothic">

<div id="wrap">
	
	<jsp:include page="../common/header.jsp" />
	<div id="container">
		
		<div id="findDiv">
	
	   	<h3 id="title">아이디 찾기</h3>
		 <div class="frmWarp">
		  <form action="find_id_process.do" method="post">
		  
		   <div class="form">
			<label>이름</label><br/>
				<input type="text" class="form-control" name="name" style="height: 50px;" ><br/>
		   </div>
			<div class="form">
			<label>이메일</label><br/>
				<input type="text" class="form-control" name="email" style="height: 50px;" ><br/>
			</div>
				<div id="btnDiv">
				<button type="submit" style="widows: 100px" id="findBtn" class="collieBtnMain">찾기</button>
				</div>
			</form>
		 </div>
		</div>
	</div>
	
	<jsp:include page="../common/footer.jsp" />
	
</div>

</body>
</html>