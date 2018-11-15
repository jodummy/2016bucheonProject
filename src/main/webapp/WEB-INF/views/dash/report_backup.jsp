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
	
	<script src="/bucheon/resources/js/chart.js"></script>
	
	
<!-- Include Required Prerequisites -->
<script type="text/javascript" src="//cdn.jsdelivr.net/jquery/1/jquery.min.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap/3/css/bootstrap.css" />


     <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="/bucheon/resources/js/highcharts/highcharts.js"></script>  
	<script src="/bucheon/resources/js/highcharts/exporting.js"></script>
	<script src="/bucheon/resources/js/highcharts/highcharts-more.js"></script>
	<script src="/bucheon/resources/js/highcharts/heatmap.js"></script>
	<script src="/bucheon/resources/js/highcharts/treemap.js"></script>
	
	
<!-- Include Date Range Picker -->
<script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />
<style>
li {
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
                 <!--  	<li><a class="tab">버즈량</a></li>
                    <li><a class="tab">긍부정</a></li>
                    <li><a class="tab">연관관계</a></li>
                    <li><a class="tab">키워드</a></li>
                    <li><a class="tab">레포트</a></li>
                    <li><a class="tab">실시간데이터</a></li> -->
                       	<li><a href="/bucheon/admin/dashboard">버즈량</a></li>
                    <li><a href="/bucheon/admin/sentiment">긍부정</a></li>
                    <li><a href="/bucheon/admin/relation">연관관계</a></li>
                    <li><a href="/bucheon/admin/issue">키워드</a></li>
                    <li><a href="/bucheon/admin/wordcloud">워드클라우드</a></li>
                    <li class="active"><a href="/bucheon/admin/report">레포트</a></li>
                    <li><a href="/bucheon/admin/realtime">실시간데이터</a></li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        <!-- /.container-fluid -->
    </nav> 
    
 	<script>
 		function printing(){
 			window.print();	
 		}
 		
 	</script>
 	
    <div class="clearfix"></div>
  
  	
  	
  <!-- 	
  	<div class="col-sm-12 content">
		<iframe src='https://121.141.38.85/single/?appid=aeff3982-0312-4b62-ba94-2fc8d5235fad&sheet=VpgjcPs&lang=ko-KR&opt=currsel' style='border:none;'></iframe>
  	</div>
  	
  	
  		<div class="col-sm-12 content">
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
  	<div class="col-sm-12 outline content">
    	<div class="out">
    	
    	
    	<div class="col-sm-12" style="margin: 20px auto;">
    
			    <div class="col-sm-2 btn-group">
			    	<button type="button" class="btn btn-outline-primary" onclick="window.location='/bucheon/admin/report'">일일보고서</button>
			    	<button type="button" class="btn btn-outline-primary" onclick="window.location='/bucheon/admin/monthreport'">월말보고서</button>
			 	</div>
			 	
			 	<div class="col-sm-1 col-sm-offset-9">
					<button type="button" class="btn btn-info" onclick="printing()">다운로드</button>
			 	</div>
		 	
		    </div>
    	
    	<div class="col-sm-8 col-sm-offset-2" style="margin-top: 90px;">
    		<img src="/bucheon/resources/img/HEAD.PNG" style="width:100%; margin-bottom: 90px;"> 	
    	</div>
    	
    	<div class="clearfix"></div>
    	
    	
    	<div class="col-sm-8 col-sm-offset-2">
    		<span style="font-size: 1.7em;">날짜 검색 :</span>
    		<input type="text" id="date_selection" name="daterange" value="" />	
    	</div>
			
		<div class="clearfix"></div>
		
	
    	    	
  		<div class="col-sm-8 col-sm-offset-2">  
  			<small>시간을 알수 없는데이터가 있을시 00:00:00 형식으로 표시 했습니다.</small>	 	
			<div id="chart1" style="width:900px;height: 600px; margin: 0 auto; padding-top:50px;"></div>
  		</div>
  		  		
  		<div class="clearfix"></div>
  		
  		<div class="col-sm-8 col-sm-offset-2 text_sec" style="margin-bottom: 90px;">
				
				<div class="total_text">[총 데이터 양 : <b><span id="total_buzz"></span> </b>건]</div>
								
				<div class="text"><b></b><span id="buzz_time"></span> 에 <b><span id="buzz_cont"></span></b> 건의 최다 데이터 발생</div>
				
  		</div>
  	
  		
  		<div class="clearfix"></div>
  		
  		<div class="col-sm-8 col-sm-offset-2 senti_sec" style="margin-bottom: 90px;border-top: black solid 1px;padding-top: 30px;">
  			<div id="chart2" style="width:900px;height: 600px; margin: 0 auto;"></div>
		</div>		
		
		
		<div class="clearfix"></div>
		
		<div class="col-sm-8 col-sm-offset-2 text_sec" style="margin-bottom: 90px;">
		
			<div id="total_senti_section">[총 긍부정 데이터 양 : <b><span id ="total_senti"></span></b> 건]</div>
			
			<div id="table_section"></div>		
					
		</div>

		<div class="clearfix"></div>
			
		<div class="col-sm-8 col-sm-offset-2" style="margin-bottom: 90px;border-top: black solid 1px;padding-top: 30px;">
			<div id="ch3" style="width:900px;height: 600px; margin: 0 auto;"></div>
		</div>
		
		<div class="clearfix"></div>
		
		<div class="col-sm-8 col-sm-offset-2 text_sec" style="margin-bottom: 90px;">
		
			<p style="font-size:15px;">관련 키워드 - <b id="sentiKeyword"></b> </p>
			
			<div id="ws_section"></div>
			
			<div id="ws_top"></div>
		</div>
		
		<div class="clearfix"></div>	
	
		<div class="col-sm-8 col-sm-offset-2" style="border-top: black solid 1px;padding-bottom: 20px;text-align: center;padding-top: 30px;">
			<p style="font-size:30px;padding-bottom: 20px;">라. 키워드 순위 TOP 20</p>
			<div id="wt_section"  style="min-width: 310px; margin: 0 auto"></div>
		</div>
		
		<div class="clearfix"></div>
		
		<div class="col-sm-8 col-sm-offset-2 text_sec" style='padding: 50px;'>
			<div id="wt_desc"  style="min-width: 310px; margin: 0 auto"></div>
		</div>
		
		<div class="clearfix"></div>	
        
        
        <div class="col-sm-8 col-sm-offset-2 text_sec" style="margin-bottom:50px;border-top: black solid 1px;padding-bottom: 20px;text-align: center;padding-top: 30px;">
			   <p style="font-size:30px;padding-bottom: 20px;">마.매체별 데이터양</p>
			   <div id="media"></div>
			   <div id="media_desc"></div>
		</div>
				
				
		<div class="clearfix"></div>	
		
		
	
		
		<div class="col-sm-8 col-sm-offset-2 text_sec" style="margin-bottom:50px;border-top: black solid 1px;padding-bottom: 20px;text-align: center;padding-top: 30px;">
		     <p style="font-size:1.3em; margin-bottom:10px;padding-bottom: 20px;">바. 키워드 연관 TOP 20</p>
			 <div id="relation" style="overflow:scroll; width:100%; height:300px;margin-bottom:10px;"></div>
			 <div id="relation_desc"></div>
		</div>	
		
				
		<div class="clearfix"></div>
		
		<div class="col-sm-8 col-sm-offset-2 text_sec" style="margin-bottom:50px;border-top: black solid 1px;padding-bottom: 20px;text-align: center;padding-top: 30px;">
			 <p style="font-size:1.3em; margin-bottom:10px;padding-bottom: 20px;">사. 확산성 데이터 TOP10 (트위터)</p>
			 <div id="hc" style="overflow:scroll; width:100%; height:400px;margin-bottom:10px;"></div>
			 <div id="hc_desc"></div>
		</div>
				

		<div class="clearfix"></div>
		
	
			
		
		<div class="container logo_wrapper" align="center"><img src="/bucheon/resources/img/bucheon_logo.png" style="padding: 5px 30px;width: 190px;"></div>
		
		
		
		</div>
		  	
  	</div>
  	
  	<script>

  	$(function () {
  		
  		/* 	$("li:eq(4)").addClass("active");
  		$(".tab").click(function(){
			
  			var index = $(this).index(".tab");
  			$(".content").hide();
  			$(".content:eq("+index+")").show();
  			$("li").removeClass();
  		
  			$(this).parent().addClass("active");
  			
  			
  			
  			});
  			
  			$(".content").hide();
  			$(".content:eq(4)").show(); */
  		
  		var yesterday = new Date();
  		yesterday.setDate(yesterday.getDate() - 1);
  											
  		var y = yesterday.getFullYear();
  		var m = (yesterday.getMonth() +1);
  		var d = yesterday.getDate();
  		
  		
  		if (m <10){
  			m = "0" + m;
  		}
  		
		if (d < 10){
     		d = "0" + d;
       	}
  		
  		var in_serch_date = y + "-" + m + "-" + d;
  		
  		in_serch_date = in_serch_date + " - " + in_serch_date;
  		
  	 	var a = document.getElementById("date_selection");
  		  a.value = in_serch_date; 
  							
  	    $('#date_selection').daterangepicker(
  	    		{
  	    		locale: {
  	        		format: 'YYYY-MM-DD'
  	    		}
  	    		}
  	    );
  	    
  	    
  	    $( ".applyBtn" ).click(function() {
			var date_sel2 = $('.left .daterangepicker_input .form-control').val();
			
			var date_sel3 = $('.right .daterangepicker_input .form-control').val();
  	  		
  	  		var start_time3 = date_sel2 + " 00:00:00";
  	  		var end_time3 = date_sel3 + " 23:59:59";
  	  		
	  	  	var start_time4 = date_sel2;
	  		var end_time4 = date_sel3; 
	  		
	  		no1(start_time3,end_time3);
  	    	no2(start_time3,end_time3);
  	    	no3(start_time4,end_time4);
  	    	no4(start_time3,end_time3,start_time4,end_time4);
  		});
  	    
  	    generate();
  	    
  	    function generate(){
  	    	
  	    	var date_sel = $('#date_selection').val();
  	    	
  	    	var di_date = date_sel.split(" - ");
  	  		
  	  		var start_time = di_date[0] + " 00:00:00";
  	  		var end_time = di_date[1] + " 23:59:59";
  	  		
	  	  	var start_time2 = di_date[0];
	  		var end_time2 = di_date[1];
  		
  	    	no1(start_time,end_time);
  	    	no2(start_time,end_time);
  	    	no3(start_time2,end_time2);
  	    	no4(start_time,end_time,start_time2,end_time2);
  	    }
  	    
  		var date_sel = $('#date_selection').val();

  		
  		function no1(start_time,end_time){
  			$.ajax({
  	  	    	type: 'POST', 
  	  	    	url: "/bucheon/admin/chart1_2?start_time="+start_time + "&end_time=" + end_time,  
  	  	    	dataType: "json", 
  	  	    	cache: false, 
  	  	    	success: function(data) {
  	  	    	
	  	  	    	if(data != null) {
	  	  	    		$('#total_buzz').text(data[0].CON);	
	  	  	    	}
  	  	    	},
  	  	    	error: function( request, status, error) {
  	  	    		//alert("code : "+request.status+"\n"+request.responseText+"\n"+"error : "+error);
  	  	    	}
  	  	    });
  	  		
  	  		
  	  		$.ajax({
  	  	    	type: 'POST', 
  	  	    	url: "/bucheon/admin/chart1_1?start_time="+start_time + "&end_time=" + end_time,  
  	  	    	dataType: "json", 
  	  	    	cache: false, 
  	  	    	success: function(data) {
  	  	    	if(data != null) {
  	  	    		$('#buzz_time').text(data[0].TD_STAMP);
  	  	    		$('#buzz_cont').text(data[0].CON);
  	  	    		}
  	  			 
  	  	    	},
  	  	    	error: function( request, status, error) {
  	  	    		//alert("code : "+request.status+"\n"+request.responseText+"\n"+"error : "+error);
  	  	    	}
  	  	    });
  	  				
  	  		$.ajax({
  	  	    	type: 'POST', 
  	  	    	url: "/bucheon/admin/chart1?start_time="+start_time + "&end_time=" + end_time,  
  	  	    	dataType: "json", 
  	  	    	cache: false, 
  	  	    	success: function(data) {
  	  	    		var time_data = [];
  	  	    		var cnt_data = [];
  	  	    		
  	  	    		
  	  	    		
  	  	    	if(data != null) {
  	  			 for(var i=0; i<data.length; i++) {
  	  				 time_data[i] = data[i].TD_STAMP;
  	  				 
  	  				 var temp = Number(data[i].COUNT);
  	  				 
  	  				 cnt_data[i] = temp;
  	  			 }
  	  	    	}
  	  			 ch1(time_data,cnt_data);
  	  	    	},
  	  	    	error: function( request, status, error) {
  	  	    		//alert("code : "+request.status+"\n"+request.responseText+"\n"+"error : "+error);
  	  	    	}
  	  	    });
  		}
  	  			
  		var buz_total = '${buzz_total}';

  		function ch1(time_data,cnt_data){
  			
  			$('#chart1').highcharts({
  				chart: {
  			        type: 'line'
  			    },
  			    title: {
  			        text: '가. 시간대별 데이터 양'
  			    },
  			    xAxis: {
  			        categories: time_data
  			    },
  			    yAxis: {
  			        title: {
  			            text: '(건수)'
  			        }
  			    },
  			 	credits: {
  	            	enabled: false
  	        	},
  			    plotOptions: {
  			        line: {
  			            dataLabels: {
  			                enabled: false
  			            },
  			            enableMouseTracking: true
  			        }
  			    },
  			    series: [{
  			        name: '버즈량',
  			        data: cnt_data
  			    }]
  			});
  		}
  		
  		
  		var date_sel = $('#date_selection').val();
  		
  		
  		
  		
  		function no2(start_time,end_time){
  			
  			var site = [];
  	  		var positive = [];
  	  		var negative = [];
  	  		
  			$.ajax({
  	  	    	type: 'POST', 
  	  	    	url: "/bucheon/admin/chart2?start_time="+start_time + "&end_time=" + end_time,  
  	  	    	dataType: "json", 
  	  	    	cache: false, 
  	  	    	success: function(data) {

  	  	    		var html_text ="<table id='senti_table' class='table table-responsive table-striped' border=1><thead><tr><td></td>"
  	  	    						+ "<td>긍/부정</td><tbody>";
  	  	    		

  	  		    	if(data != null) {
	  	  	    		for(var i=0; i<data.length; i++) {
  	  	    			
	  	  	    			var te_split = data[i].RESULT.split("|");
	  	  	    			var cont = data[i].CON.split("|");
	  	  	    			
	  	  	    			html_text += "<tr><th>" + data[i].TD_SITE + "</th>"
	  	  	    			
	  	  	    				  	  	    			
	  	  	    			if(te_split.length == 1){
	  	  	    			 	html_text += "<td>" + te_split[0] + " : ";
							 	html_text += "" + cont[0] + " (건)</td>";
	  	  	    			}
	  	  	    			else{
		  	  	    			html_text += "<td>" + te_split[0] + " : ";
							 	html_text += "" + cont[0] + " (건)";
		  	  	    			html_text += " - " + te_split[1] + " : ";
								html_text += "" + cont[1] + " (건)</td>";
	  	  	    			}
	  	  	    			
	  	  	    			
	  	  	    			
	  	  	    			for(var j=0; j<te_split.length; j++) {
		  	  	    				  	  	    				
	  	  	    				var temp = Number(cont[j]);
	  	  	    				
	  	  	    				if (te_split[j] == '부정' && te_split.length == 1){
	  	  	    					negative.push(temp);
	  	  	    					positive.push(0);
	  	  	    				}
	  	  	    				else if(te_split[j] =='긍정'&& te_split.length == 1){
		  	  	    				negative.push(0);
	  	  	    					positive.push(temp);
	  	  	    				}
	  	  	    				else{
		  	  	    				if (te_split[j] == '긍정'){
		  	  	    					positive.push(temp);
		  	  	    				}
		  	  	    				else{
		  	  	    				    negative.push(temp);
		  	  	    				}
	  	  	    				}
	  	  	    			}
	  	  	    				  	  	    			
	  	  	    			site.push(data[i].TD_SITE);
	  	  	    			
	  	  				 }
  	  	    		
  	  		    	}
  	  	    		
  	  	    		html_text += "</tr></tbody></table>";
  	  	    		
  	  	    		
  	  	    		ch2(site,positive,negative);
  	  	        $('#table_section').empty().append(html_text);
  	  	        
  	  	        
  	  	    	},
  	  	    	error: function( request, status, error) {
  	  	    		//alert("code : "+request.status+"\n"+request.responseText+"\n"+"error : "+error);
  	  	    	}
  	  	    });
  	  		
  	  		

  	  		$.ajax({
  	  	    	type: 'POST', 
  	  	    	url: "/bucheon/admin/chart2_1?start_time="+start_time + "&end_time=" + end_time,  
  	  	    	dataType: "json", 
  	  	    	cache: false, 
  	  	    	success: function(data) {
	  	  	    	if(data != null) {		
	  	  	    		$('#total_senti').text(data[0].CNT);
	  	  	    	}
  	  	    	},
  	  	    	error: function( request, status, error) {
  	  	    		//alert("code : "+request.status+"\n"+request.responseText+"\n"+"error : "+error);
  	  	    	}
  	  	    });		

  		}
  		
  		  		
  		function ch2(site,positive,negative){
  			
  			$('#chart2').highcharts({
  				chart: {
  			        type: 'column'
  			    },
  			    title: {
  			        text: '나. 긍부정 데이터양'
  			    },
  			    xAxis: {
  			        categories: site,
  			        crosshair: true
  			    },
  			    yAxis: {
  			        min: 0,
  			        title: {
  			            text: '건수'
  			        }
  			    },
  			  	credits: {
  	            	enabled: false
  	        	},
  			    plotOptions: {
  			        column: {
  			            pointPadding: 0.2,
  			            borderWidth: 0
  			        }
  			    },
  			    series: [{
  			        name: '긍정',
  			        data: positive

  			    }, {
  			        name: '부정',
  			        data: negative
  			    }]
  			});		
  		}  		
  		  	 	 		
  		function no3(start_time2,end_time2){
  			$.ajax({
  	  	    	type: 'POST', 
  	  	    	url: "/bucheon/admin/chart3?start_time="+start_time2 + "&end_time=" + end_time2,  
  	  	    	dataType: "json", 
  	  	    	cache: false, 
  	  	    	success: function(data) {
  	  	   
  	  	    		var Chart3 = [];
  
  	  				if(data != null) {
  	  	    	
  	  	    		
  	  	    		for(var j=0; j<10; j++) {
  	  	    			
  	  	    			 var temp = Number(data[j].COUNT_WS);
  	  	    			
  	  	    			Chart3.push({
  	  	                     name: data[j].WORD_WS, 
  	  	                     y: temp
  	  	                 });
  	  	    		}
  	  	    		
  	  	    		
  	  				}
  	  				
  	  	
 	  	    	
    			$("#sentiKeyword").text(data[0].WORD_WS);
  	  	    	var time = $("#date_selection").val();
            	var start = time.substring(0,10);
            	var end = time.substring(13,time.length);
            	 var text =  "'<b>" + data[0].WORD_WS + "'</b> 키워드가 <b> "+ data[0].COUNT_WS + "</b> 건 으로 가장 많이 언급 되었다.";
            	 
            	 $("#ws_top").html(text);
  	  	    	$.ajax({
        			type: 'POST', 
      	  	    	url: "report_sentiData?sentiWord="+encodeURIComponent(encodeURIComponent(data[0].WORD_WS)) + "&start=" + start+"&end="+ end,  
      	  	    	dataType: "json", 
      	  	    	cache: false, 
      	  	    	success: function(data) {
        			console.log(data);
        			
        			
        			
        
  	  	    		
  	  	    		var html_text ="<table id='senti_table' class='table table-responsive table-striped' border=1><thead><tr>"
  	  					+ "<td>사이트</td><td>아이디</td><td>제목</td><td>결과</td><td>시간</td></tr><tbody>";
  	  				if(data != null) {
  	  					
  	  				
  	  	    		for(var i=0; i<data.length; i++) {
  	  	    			
  	  	    		/* 	if(data[i].site.indexOf("네이버") > -1) {
  	  	    			length = data[i].site.indexOf("네이버");
  	  	    		data[i].site = data[i].site.substring(length+3, data[i].site.length);
  	  	    			
  	  	    			} */
  	  	    			html_text += "<tr><td>" + data[i].site + "</td>";
  	  	    			
  	  	    		if(data[i].id == 'null')  {
  	  	    			html_text += "<td>-</td>";
  	  	    			} else {
  	  	    				
  	  	    			html_text += "<td>" + data[i].id.substring(0,data[i].id.length-2) + "**</td>";
  	  	    			}

  	  	    	if(data[i].title.indexOf("<") != -1) {
              	  	
	  					data[i].title = 	data[i].title.replace("<" , "");
	  					}
  	  					html_text += "<td><a href="+data[i].url+">" + data[i].title.substring(0,65) + "...</a></td>";
  	  			
  	  			/* html_text += "<td><a href="+data[i].url+">링크</a></td>"; */
  	  		html_text += "<td>" + data[i].result + "</td>";
  	  html_text += "<td>" + data[i].time + "</td></tr>"; 
  	  	    		}
  	  	    		
  	  	    
  	  				}
  	  				
  	  	    		html_text += "</tbody></table>";
  	  	    		
  	  	    		
  	  	    		$('#ws_section').empty().append(html_text);
  	  	    		
  	  	    		
        			
        		},
        		error : function(e) {
        			/* alert(e); */
        		}
        		});
  	  	    		
  	  	    		
  	  	    		/* $('#ws_section').empty().append(html_text); */
  	  	    		
  	  	    		ch3(Chart3);
  	  	    	},
  	  	    	error: function( request, status, error) {
  	  	    		//alert("code : "+request.status+"\n"+request.responseText+"\n"+"error : "+error);
  	  	    	}
  	  	    });
  		}
  		  			
  		function ch3(Chart3){
  			$('#ch3').highcharts({
  				chart: {
  			        plotBackgroundColor: null,
  			        plotBorderWidth: null,
  			        plotShadow: false,
  			        type: 'pie'
  			    },
  			    title: {
  			        text: '다. 감성 키워드 Top10'
  			    },
  			   credits: {
  	            	enabled: false
  	        	},
  			    plotOptions: {
  			        pie: {
  			            allowPointSelect: true,
  			            cursor: 'pointer',
  			            dataLabels: {
  			                enabled: true,
  			                format: '<b>{point.name}</b>: {point.y} 건',
  			                style: {
  			                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
  			                }
  			            }
  			        },
  			      series: {
		                cursor: 'pointer',
		                point: {
		                    events: {
		                        click: function() {
		                        	
		                        	var sentiWord = event.point.name;
		                        	var time = $("#date_selection").val();
		                        	var start = time.substring(0,10);
		                        	var end = time.substring(13,time.length);
		                        
		                   
		                    		$.ajax({
		                    			type: 'POST', 
		                  	  	    	url: "report_sentiData?sentiWord="+encodeURIComponent(encodeURIComponent(sentiWord)) + "&start=" + start+"&end="+ end,  
		                  	  	    	dataType: "json", 
		                  	  	    	cache: false, 
		                  	  	    	success: function(data) {
		                    			console.log(data);
		                    			$("#sentiKeyword").text(sentiWord);
		                    			
		                    
		              	  	    		
		              	  	    		var html_text ="<table id='senti_table' class='table table-responsive table-striped' border=1><thead><tr>"
		              	  					+ "<td>사이트</td><td>아이디</td><td>제목</td><td>결과</td><td>시간</td></tr><tbody>";
		              	  				if(data != null) {
		              	  					
		              	  				
		              	  	    		for(var i=0; i<data.length; i++) {
		              	  	    			
		              	  	    		/* 	if(data[i].site.indexOf("네이버") > -1) {
		              	  	    			length = data[i].site.indexOf("네이버");
		              	  	    		data[i].site = data[i].site.substring(length+3, data[i].site.length);
		              	  	    			
		              	  	    			} */
		              	  	    			html_text += "<tr><td>" + data[i].site + "</td>";
		              	  	    			
		              	  	    			if(data[i].id == 'null')  {
		              	  	    			html_text += "<td>-</td>";
		              	  	    			} else {
		              	  	    				
		              	  	    			html_text += "<td>" + data[i].id.substring(0,data[i].id.length-2) + "**</td>";
		              	  	    			}
		              	  	    		if(data[i].title.indexOf("<") != -1) {
		              	  	
		              	  					data[i].title = 	data[i].title.replace("<" , "");
		              	  					}
		              	  					html_text += "<td><a href="+data[i].url+">" +
		              	  					
		              	  					data[i].title.substring(0,65) + "...</a></td>";
		              	  			
		              	  			/* html_text += "<td><a href="+data[i].url+">링크</a></td>"; */
		              	  		html_text += "<td>" + data[i].result + "</td>";
		              	  html_text += "<td>" + data[i].time + "</td></tr>"; 
		              	  	    		}
		              	  	    		
		              	  	    
		              	  				}
		              	  				
		              	  	    		html_text += "</tbody></table>";
		       
		              	  	    		
		              	  	    		$('#ws_section').empty().append(html_text);
		                    			
		                    		},
		                    		error : function(e) {
		                    			/* alert(e); */
		                    		}
		                    		});
		                	    	
		                	 
		                        	
		                        }
		                    }
		                }
		            }
  			    },
  			    series: [{
  			        name: '감성 키워드',
  				        colorByPoint: true,
  				        data: Chart3
  				    }]
  	  			});		
  			}  			
  			
  			
  	var date_sel = $('#date_selection').val();
  		
  		
  		var max;
		
  		function no4(start_time,end_time,start_time2,end_time2){
  			
  			$.ajax({
  	  	    	type: 'POST', 
  	  	    	url: "/bucheon/admin/chart4?start_time="+start_time2 + "&end_time=" + end_time2,  
  	  	    	dataType: "json", 
  	  	    	cache: false, 
  	  	    	success: function(data) {
  	  	    		  	  	    		
  	  	    		var html_text ="<table id='senti_table' class='table table-responsive table-striped' border=1><thead><tr>"
  	  					+ "<td>단어</td><td>건수</td><tbody>";
  	  	    		
  	  					
  	  				if(data != null) {
  	  	    		for(var i=0; i<data.length; i++) {
  	  	    			html_text += "<tr><th>" + data[i].WORD_WT + "</th>";
  	  					html_text += "<td>" + data[i].COUNT_WT + "(건)</td></tr>";
  	  	    		}
  	  	    		
  	  	    		max = Number(data[0].COUNT_WT);
  	  	    		
  	  	    		
  	  	    		var total =0;
  	  	    		
  	  	    		for(var j=0; j<data.length; j++) {
  	  					var temp = Number(data[j].COUNT_WT);
  	  					
  	  					total += temp;
  	  					
  	  	    		}
  	  	    		
  	  				}
  	  	    		
  	  	    		html_text += "</table>";
  	  	    		
  	  	    		
  	  	    		$('#wt_section').empty().append(html_text);
  	  	    		
  	  	    		var text =  "'<b>" + data[0].WORD_WT + "'</b> 는 <b> "+ data[0].COUNT_WT + "</b> 건 으로 가장 많이 언급 되었다."
  	  	    		
  	  	    		
  	  	    		$('#wt_desc').empty().append(text);
  	  	    	},
  	  	    	error: function( request, status, error) {
  	  	    		//alert("code : "+request.status+"\n"+request.responseText+"\n"+"error : "+error);
  	  	  		    	}
  	  	  		    });
  	  	  			
  	  		
  	  		var max;

  	  		$.ajax({
  	  	    	type: 'POST', 
  	  	    	url: "/bucheon/admin/chart5?start_time="+start_time + "&end_time=" + end_time,  
  	  	    	dataType: "json", 
  	  	    	cache: false, 
  	  	    	success: function(data) {
  	  					
  	  	    			var total_con = 0;
  	  	    			
  	  	    			
  	  	    			var html_text ="<table id='senti_table' class='table table-responsive table-striped' border=1><thead><tr>"
  	  						+ "<td>매체</td><td>건수</td><tbody>";
  	  					if(data != null) {
  	  		    		for(var i=0; i<data.length; i++) {
  	  		    			html_text += "<tr><th>" + data[i].TD_SITE + "</th>";
  	  						html_text += "<td>" + data[i].CON + "(건)</td>";
  	  						
  	  						var temp = Number(data[i].CON);
  	  						
  	  						total_con += temp;
  	  						
  	  		    		}
  	  					} 		    		
  	  		    		html_text += "</table>";
  	  		    		
  	  		    		
  	  		    		$('#media').empty().append(html_text);
  	  		    		
  	  		    		var max = Number(data[0].CON);
  	  		    		
  	  		    		var percent = max/total_con*100;
  	  		    	    
  	  		    		percent= percent.toFixed(2);
  	  		    		
  	  					var text =  "'<b>" + data[0].TD_SITE + "'</b> 은 총 <b>" + total_con +"</b> 건중 <b> "+ data[0].CON + "</b> 건 으로 "
  	  					+ percent + "% 를 차지하여 해당 키워드 분석에서 가장 높은 영향력을 가짐";
  	  					
  	  	    			$('#media_desc').empty().append(text);
  	  		    		
  	  		    		
  	  	    	},
  	  	    	error: function( request, status, error) {
  	  	    		//alert("code : "+request.status+"\n"+request.responseText+"\n"+"error : "+error);
  	  	    	}
  	  	    });
  	  		
  	  		
  	  	     var date_sel = $('#date_selection').val();

  	  		$.ajax({
  	  	    	type: 'POST', 
  	  	    	url: "/bucheon/admin/chart6?start_time="+start_time2 + "&end_time=" + end_time2,  
  	  	    	dataType: "json", 
  	  	    	cache: false, 
  	  	    	success: function(data) {
  	  	    			
  	  	    			var html_text ="<table id='senti_table' class='table table-responsive table-striped' border=1><thead><tr>"
  	  						+ "<td>LHS</td><td>RHS</td><td>SUPPORT</td><td>CONFIDENCE</td><td>LIFT</td><tbody>";
  	  					if(data != null) {
  	  		    		for(var i=0; i<data.length; i++) {
  	  		    			html_text += "<tr><td>" + data[i].LHS + "</td>";
  	  						html_text += "<td>" + data[i].RHS + "</td>";
  	  						html_text += "<td>" + data[i].SUPPORT + "</td>";
  	  						html_text += "<td>" + data[i].CONFIDENCE + "</td>";
  	  						html_text += "<td>" + data[i].LIFT + "</td></tr>";
  	  						
  	  		    		}
  	  					}	    		
  	  		    		html_text += "</table>";
  	  		    		
  	  		    		$('#relation').empty().append(html_text);
  	  		    		
  	  		    	
  	  					var text =  "'<b>" + data[0].LHS + "'</b>는 <b>" + data[0].RHS +"</b>에  <b> "+ data[0].SUPPORT + "</b> 지지도로 "
  	  					+ " 가장높은 연관성을 보임 (신뢰도 : " + data[0].CONFIDENCE + ")";

  	  	    			$('#relation_desc').empty().append(text); 
  	  		    		
  	  	    	},
  	  	    	error: function( request, status, error) {
  	  	    		//alert("code : "+request.status+"\n"+request.responseText+"\n"+"error : "+error);
  	  		    	}
  	  		    });
  	    	  		
  	  		$.ajax({
  	  	    	type: 'POST', 
  	  	    	url: "/bucheon/admin/chart7?start_time="+start_time2 + "&end_time=" + end_time2,  
  	  	    	dataType: "json", 
  	  	    	cache: false, 
  	  	    	success: function(data) {
  	  	    			
  	  	    			var html_text ="<table id='senti_table' class='table table-responsive table-striped' border=1><thead><tr>"
  	  						+ "<td>SITE_HC</td><td>TEXT_HC</td><td>COUNT_HC</td><tbody>";
  	  					if(data != null) {
  	  		    		for(var i=0; i<data.length; i++) {
  	  		    			html_text += "<tr><td>" + data[i].SITE_HC + "</td>";
  	  						html_text += "<td>" + data[i].TEXT_HC + "</td>";
  	  						html_text += "<td>" + data[i].COUNT_HC + "</td></tr>";
  	  						
  	  		    		}
  	  					} 		    		
  	  		    		html_text += "</table>";
  	  		    		
  	  		    		$('#hc').empty().append(html_text);
  	  		    		
  	  					var text =  "하루동안'<b>" + data[0].COUNT_HC + "'</b>회 <b>'" + data[0].TEXT_HC +"</b>' 의 텍스트가 가장 많이 확산됨";

  	  	    			$('#hc_desc').empty().append(text); 
  	  		    		
  	  	    	},
  	  	    	error: function( request, status, error) {
  	  	    		//alert("code : "+request.status+"\n"+request.responseText+"\n"+"error : "+error);
  	  	    	}
  	  	    });
  	  		
  		}
  		  		
  	});

  	</script>

  </body>
</html>
