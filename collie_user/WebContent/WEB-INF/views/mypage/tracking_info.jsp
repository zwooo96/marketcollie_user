<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MARKET COLLIE</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="http://211.238.142.25/common/css/common.css">

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
#containerSubTitle{ border-bottom: 1px solid #17462B; margin-top: 40px; padding-bottom: 0px; color: #666666 }
#inputDiv{ width:300px; margin: 0px auto; margin-top: 50px }
#outputDiv{ width:500px; margin: 0px auto }
#oneGoods{ border-bottom: 1px solid #DCDBDE }
#goodsImg{ width: 100px; padding-left: 30px }
#goodsThm{ width:80px; height: 100px }
#goodsInfo{ vertical-align: middle; font-weight: bold }
#goodsTitle{ font-size: 17px; color:#333 }
#goodsTitle:hover{ font-size: 17px; text-decoration: none; }
#goodsPrice{ font-size: 16px; padding-left: 2px }
#goodsCnt{ color:#666666; font-size: 15px; margin-left: 5px }
.btn-outline-success{ border-color: #17462B !important; color: #17462B !important }
.btn-outline-success:hover, #btn-outline-success:active, #btn-outline-success:focus { border-color: #17462B !important; background-color: #FFFFFF !important; color:#17462B !important }
#orderBtn{ text-align: center; margin-top:50px }
#searchBtn{ width: 250px; padding: 15px }
#cancelBtn{ margin-left:20px; width: 250px; padding: 15px }
#Info{ margin-top: 100px }
#payInfo, #orderInfo, #receiveInfo{ color:#666666; border-bottom: 2px solid #17462B; padding-left: 0px; padding-bottom: 5px; width: 1100px  }
.infoColumn{ font-size: 15px; font-weight: bold; width: 250px }
.infoValue{ color:#4C4C4C; font-size: 14px }
.lastColumn{ border-bottom: 1px solid #DCDBDE }
#receiveWrap{ margin-bottom: 200px }
</style>
<!-- Google CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script type="text/javascript">
$(document).ready(function(){
    var myKey = "yakQTHkbmqOmWeXDeEhQtw";
    
        $.ajax({
            type:"GET",
            dataType : "json",
            url:"http://info.sweettracker.co.kr/api/v1/companylist?t_key="+myKey,
            success:function(data){
                    
                    var parseData = JSON.parse(JSON.stringify(data));
                    var CompanyArray = data.Company;
                    var myData="";
                    $.each(CompanyArray,function(key,value) {
                            myData += ('<option value='+value.Code+'>' + value.Name + '</option>');                        
                    });//each
                    $("#tekbeCompnayList").html(myData);
            }//success
        });//ajax

        var t_code = '${ param.company }';
        var t_invoice = '${ param.invoice_no }';
        
        $.ajax({
            type:"GET",
            dataType : "json",
            url:"http://info.sweettracker.co.kr/api/v1/trackingInfo?t_key="+myKey+"&t_code="+t_code+"&t_invoice="+t_invoice,
            success:function(data){
                var myInvoiceData = "";
                if(data.status == false){
                    myInvoiceData += ('<p>'+data.msg+'<p>');
                }else{
                    myInvoiceData += ('<tr>');                
                    myInvoiceData += ('<th>'+"송장번호"+'</td>');                     
                    myInvoiceData += ('<th>'+data.invoiceNo+'</td>');                     
                    myInvoiceData += ('</tr>');     
                }//end if
                
                $("#myPtag").html(myInvoiceData)
                
                if(data.status != false){
                    var trackingDetails = data.trackingDetails;
                    
                    var myTracking="";
                    var header ="";
                    header += ('<tr>');                
                    header += ('<th>'+"시간"+'</th>');
                    header += ('<th>'+"장소"+'</th>');
                    header += ('<th>'+"유형"+'</th>');
                    header += ('<th>'+"전화번호"+'</th>');                     
                    header += ('</tr>');     
                    
                    $.each(trackingDetails,function(key,value) {
                        myTracking += ('<tr>');                
                        myTracking += ('<td>'+value.timeString+'</td>');
                        myTracking += ('<td>'+value.where+'</td>');
                        myTracking += ('<td>'+value.kind+'</td>');
                        myTracking += ('<td>'+value.telno+'</td>');                     
                        myTracking += ('</tr>');                                    
                    });//each
                }//end if
                
                $("#myPtag2").html(header+myTracking);
                
            }//success
        });//ajax
        
});//ready

</script>
</head>
<body style="font-family: nanumbarungothic">

<div id="wrap">
	
	<c:import url="/header.do" />
	
	<div id="container">
		<jsp:include page="../common/mypage_menu.jsp"/>
		<div id="contentWrap">
		<div id="containerTitle">
			<h4><strong>배송현황 조회</strong></h4>
		</div>
			<div id="containerSubTitle"></div>
			<div id="containerContent">
				<div id="outputDiv">
				<div>
					<table id="myPtag"></table>
				</div>
				<br/>
				<div>
					<table id="myPtag2"></table>
				</div>
				<button onclick="javascript:history.back();">뒤로 </button>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="../common/footer.jsp" />
	
</div>

</body>
</html>	