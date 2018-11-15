<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="/bucheon/resources/img/g.png">
	
    <title>Gogreat Bigdata Platform</title>

    <!-- Bootstrap core CSS -->
    <link href="/bucheon/resources/css/boot_test.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="/bucheon/resources/css/dash.css">

    
    
     <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="/bucheon/resources/jquery/jquery-1.11.2-dash.js"></script>
    <script src="/bucheon/resources/bootstrap/js/bootstrap.min.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
<style type="text/css">
li  {
cursor: pointer
}
</style>   
    
    
  </head>
  
  

  <body>

	<nav class="navbar navbar-default">
        
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <img src="/bucheon/resources/img/bucheon_logo.png" style="padding: 5px 30px;width: 190px;">                         
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="navbar-collapse">
                <ul class="nav navbar-nav">
            <!--       	<li class="active"><a class="tab">버즈량</a></li>
                    <li><a class="tab">긍부정</a></li>
                    <li><a class="tab">연관관계</a></li>
                    <li><a class="tab">키워드</a></li>
                    <li><a class="tab" href="/bucheon/admin/report">레포트</a></li>
                    <li><a class="tab" href="/bucheon/admin/realtime">실시간데이터</a></li> -->
                    <li class="active"><a href="/bucheon/admin/dashboard">버즈량</a></li>
                    <li><a href="/bucheon/admin/sentiment">긍부정</a></li>
                    <li><a href="/bucheon/admin/demorelation">연관관계</a></li>
                    <li><a href="/bucheon/admin/issue">키워드</a></li>
                    <li><a href="/bucheon/admin/wordcloud">워드클라우드</a></li>
                    <li><a href="/bucheon/admin/report">레포트</a></li>
                    <li><a href="/bucheon/admin/realtime">실시간데이터</a></li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        <!-- /.container-fluid -->
    </nav>
    
    <div class="col-sm-1 col-sm-offset-11">
    	<button type="button" class="btn btn-info btn-xs button_download">다운로드</button>
    </div>
    
    <div class="clearfix"></div>
  
  	<div class="col-sm-12 content">
		
		<iframe src='https://121.141.38.85/single/?appid=aeff3982-0312-4b62-ba94-2fc8d5235fad&sheet=VpgjcPs&lang=ko-KR&opt=currsel' style='border:none;'></iframe>
  	</div>
  	
  	
  	<!-- 	<div class="col-sm-12 content">
  		<iframe src='https://121.141.38.85/single/?appid=aeff3982-0312-4b62-ba94-2fc8d5235fad&sheet=nNCpw&lang=ko-KR&opt=currsel' style='border:none;'></iframe>
  		<iframe src='https://121.141.38.85/single/?appid=aeff3982-0312-4b62-ba94-2fc8d5235fad&sheet=hPbdhUL&lang=ko-KR' style='border:none;'></iframe>
  	</div>
  	
  		<div class="col-sm-12 content">
  		<iframe src='https://121.141.38.85/single/?appid=aeff3982-0312-4b62-ba94-2fc8d5235fad&sheet=dMpnrU&lang=ko-KR&opt=currsel' style='border:none;'></iframe>
  	</div>
  	
  	  	<div class="col-sm-12 content">
  		<iframe src='https://121.141.38.85/single/?appid=aeff3982-0312-4b62-ba94-2fc8d5235fad&sheet=RfpKGzZ&lang=ko-KR&opt=currsel' style='border:none;'></iframe>
  	</div>
	 -->
	<script>
		$( ".button_download" ).click(function() {
		  window.open("https://121.141.38.85/sense/app/aeff3982-0312-4b62-ba94-2fc8d5235fad", "_blank");
		});
		
		/* $(".tab").click(function(){
			
		var index = $(this).index(".tab");
		$(".content").hide();
		$(".content:eq("+index+")").show();
		$("li").removeClass();
		$(this).parent().addClass("active");
		
		
		
		});
		
		$(".content").hide();
		$(".content:first").show(); */
		
		
	</script>
	
  </body>
</html>