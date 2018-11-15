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
  
  	<div class="col-sm-12 outline">
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
	    		 <img src="/bucheon/resources/img/HEAD2.PNG" style="width:100%; margin-bottom: 90px;"> 
	    	</div>
    	
	    	<div class="clearfix"></div>
	    	
	    	
	    	<div class="col-sm-8 col-sm-offset-2">
	    		<span style="font-size: 1.7em;">달 검색 :</span>
	    		<select id="month_selection" style="font-size:1em;width: 50px; padding:5px 0px;">
	    			<option>01</option>
	    			<option>02</option>
	    			<option>03</option>
	    			<option>04</option>
	    			<option>05</option>
	    			<option>06</option>
	    			<option>07</option>
	    			<option>08</option>
	    			<option>09</option>
	    			<option>10</option>
	    			<option>11</option>
	    			<option>12</option>
	    		</select>
	    	</div>
				
			<div class="clearfix"></div>
		
	
    	    	
	  		<div class="col-sm-8 col-sm-offset-2">  			 	
				<div id="chart1" style="width:900px;height: 600px; margin: 0 auto;"></div>
	  		</div>
	  		  		
	  		<div class="clearfix"></div>
	  		
	  		<div class="col-sm-8 col-sm-offset-2 text_sec" style="margin-bottom: 90px;">
					
					<div class="total_text">[총 데이터 양 : <b><span id="total_buzz"></span> </b>건]</div>
									
					<div class="text"><b></b><span id="buzz_time"></span> 일 <b><span id="buzz_cont"></span></b> 건의 최다 데이터 발생</div>
					
	  		</div>
  	
			<div class="clearfix"></div>
	  		
	  		<div class="col-sm-8 col-sm-offset-2 senti_sec" style="margin-bottom: 90px; border-top: black solid 1px;padding-top: 30px;">
	  			
	  			<div id="chart2" style="width:900px;height: 600px; margin: 0 auto"></div>
			</div>		
		
			<div class="col-sm-8 col-sm-offset-2 text_sec" style="margin-bottom: 90px;">
			
				<div id="total_senti_section">[총 긍부정 데이터 양 : <b><span id ="total_senti"></span></b> 건]</div>
				
				<div id="table_section"></div>		
						
			</div>
			
			<div class="clearfix"></div>
				
			<div class="col-sm-8 col-sm-offset-2" style="margin-bottom: 90px;border-top: black solid 1px;padding-top: 30px;">
				<div id="ch3" style="width:900px;height: 600px; margin: 0 auto;"></div>
			</div>
			
			<div class="clearfix"></div>
			
			<div class="col-sm-8 col-sm-offset-2 text_sec" style="margin-bottom: 50px; ">
			
				<p style="font-size:15px;"><!-- 언급 순위 -->관련 키워드 - <b id="sentiWord"></b></p>
				
				
				
				<div id="ws_section" style="overflow-y: auto; height: 400px"></div>
			</div>
			
			<div class="clearfix"></div>	
			<div id="ws_top" class="col-sm-offset-2" style="padding-bottom : 30px"></div>	
		
			<div class="container logo_wrapper" align="center"></div>
			
			
			<div class="col-sm-8 col-sm-offset-2" style="border-top: black solid 1px;padding-bottom: 20px;text-align: center;padding-top: 30px;">
				<p style="font-size:30px;padding-bottom: 20px;">라. 키워드 순위 TOP 20</p>
				<div id="wt_section"  style="min-width: 310px; margin: 0 auto"></div>
			</div>
		
			<div class="clearfix"></div>
			
			<div class="col-sm-8 col-sm-offset-2 text_sec">
				<div id="wt_desc"  style="min-width: 310px; margin: 0 auto"></div>
			</div>
			
			<div class="clearfix"></div>	
	        
	        
	        <div class="col-sm-8 col-sm-offset-2 text_sec" style="margin-bottom:50px;padding-bottom: 20px;text-align: center;border-top: black solid 1px;padding-top: 30px;">
				   <p style="font-size:30px;padding-bottom: 20px;">마.매체별 데이터양</p>
				   <div id="media" style="overflow:scroll; width:100%; height:300px;margin-bottom:20px;"></div>
				   <div id="media_desc"></div>
			</div>
					
					
			<div class="clearfix"></div>	

			<div class="col-sm-8 col-sm-offset-2 text_sec" style="margin-bottom:50px;padding-bottom: 20px;text-align: center;border-top: black solid 1px;padding-top: 30px;">
			     <p style="font-size:1.3em; margin-bottom:20px;">바. 키워드 연관 TOP 20</p>
				 <div id="relation" style="overflow:scroll; width:100%; height:300px;margin-bottom:20px;"></div>
				 <div id="relation_desc"></div>
			</div>	
			
					
			<div class="clearfix"></div>
			
			<div class="col-sm-8 col-sm-offset-2 text_sec" style="margin-bottom:50px;padding-bottom: 20px;text-align: center;border-top: black solid 1px;padding-top: 30px;">
				 <p style="font-size:1.3em; margin-bottom:20px;">사. 확산성 데이터 TOP10 (트위터)</p>
				 <div id="hc" style="overflow:scroll; width:100%; height:400px;margin-bottom:10px;"></div>
				 <div id="hc_desc"></div>
			</div>
					
	
			<div class="clearfix"></div>
			
			<hr style="border-top:black solid 2px !important;">
			
			
			<div class="col-sm-8 col-sm-offset-2 text_sec" style="margin-bottom:50px;padding-bottom: 20px;text-align: center;">
				 <p style="font-size:1.5em; margin-bottom:20px;">아. 이슈 키워드 심층 분석</p>
				 
				 <select id="key_selection" style="font-size:1em;width: 200px; height:50px; padding:5px 0px;"></select>
			</div>
			
			<div class="clearfix"></div>
			
			<div class="col-sm-8 col-sm-offset-2">  			 	
				<div id="chart1_key" style="width:900px;height: 600px; margin: 0 auto"></div>
	  		</div>
	  		
	  		<div class="clearfix"></div>
	  		
	  		<div class="col-sm-8 col-sm-offset-2 text_sec" style="margin-bottom: 90px;">
					
					<div class="total_text2">[총 데이터 양 : <b><span id="total_buzz2"></span> </b>건]</div>
									
					<div class="text2"><b></b><span id="buzz_time2"></span> 일 <b><span id="buzz_cont2"></span></b> 건의 최다 데이터 발생</div>
					
	  		</div>
	  		
	  		<div class="clearfix"></div>
	  	
	  		<div class="col-sm-8 col-sm-offset-2" style="border-top: black solid 1px;padding-top: 30px;">  			 	
				<div id="chart2_key" style="width:900px;height: 600px; margin: 0 auto;"></div>				
	  		</div>
  		
	  		<div class="clearfix"></div>
			
			<div class="col-sm-4 col-sm-offset-4" style="text-align:center; margin-bottom:20px;">
				<span id ='buzz_senti_result' style="font-size:1.5em;"></span>
			</div> 
			
			<div class="clearfix"></div>
			
			<div class="col-sm-8 col-sm-offset-2 text_sec" style="margin-bottom:50px;padding-bottom: 20px;text-align: center;border-top: black solid 1px;padding-top: 30px;">
			     <p style="font-size:1.3em; margin-bottom:10px;">3. 해당 키워드 연관 리스트 </p>
				 <div id="relation2" style="overflow:scroll; width:100%; height:300px;margin-bottom:20px;"></div>
				 <div id="relation_desc2"></div>
			</div>	
			
			<div class="clearfix"></div>
			
			<div class="col-sm-8 col-sm-offset-2 text_sec" style="margin-bottom:50px;padding-bottom: 20px;text-align: center;border-top: black solid 1px;padding-top: 30px;">
				 <p style="font-size:1.3em; margin-bottom:20px;">4. 확산성 데이터 TOP10 (트위터)</p>
				 <div id="hc2" style="overflow:scroll; width:100%; height:400px;margin-bottom:10px;"></div>
				 <div id="hc_desc2"></div>
			</div>
			
			<div class="clearfix"></div>
			
			
			<div class="container logo_wrapper" align="center"><img src="/bucheon/resources/img/bucheon_logo.png" style="padding: 5px 30px;width: 190px;"></div>
		</div>
		  	
  	</div>
  	
  	<script>

  	$(function () {
  		
  		var day = new Date();
  		var getMonth = day.getMonth();
  		$("#month_selection option:eq("+getMonth+")").attr("selected", "selected");
  	
  		var y = day.getFullYear();
  		
  		var searchmonth = $('#month_selection').val(); 
  		
  	
  		
  		var search = y + "-" + searchmonth;
  		 
  	    generate(search);
  	    
  	   $( "#month_selection" ).change(function() {
	  		 var day2 = new Date();
				
	   		var y2 = day2.getFullYear();
	   		
	   		var searchmonth2 = $('#month_selection').val(); 
	   		
	   		var search2 = y2 + "-" + searchmonth2;
	   		
	   		generate(search2);
	   		
	   		var key_se = $('#key_selection').val();
			  	 
			basedonkey(key_se,search2);
		});
	    
  	    
  	    function generate(month){
  	    		  		  		
  	    	no1(month);
  	    	no2(month);
  	    	no3(month);
  	    	no4(month);
  	    }
  	    
  		var date_sel = $('#date_selection').val();

  		
  		function no1(month){
  			 $.ajax({
  	  	    	type: 'POST', 
  	  	    	url: "/bucheon/admin/chart1_2_m?month="+month,  
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
  	  	    	url: "/bucheon/admin/chart1_1_m?month="+month,  
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
  	  	    	url: "/bucheon/admin/chart1_m?month="+month,  
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
  	  			
  		function ch1(time_data,cnt_data){
  			
  			$('#chart1').highcharts({
  				chart: {
  			        type: 'line'
  			    },
  			    title: {
  			        text: '가. 시간대별 데이터 양(월간)'
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
  		
		function no2(month){
  			
  			var site = [];
  	  		var positive = [];
  	  		var negative = [];
  	  		
  			$.ajax({
  	  	    	type: 'POST', 
  	  	    	url: "/bucheon/admin/chart2_m?month="+month,  
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
 	  	    	url: "/bucheon/admin/chart2_1_m?month="+month,  
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
  			    	
  			        text: '<br> 나. 긍부정 데이터양(월간)'
  			    },
  			    xAxis: {
  			        categories: site,
  			        crosshair: true
  			    },
  			    yAxis: {
  			        min: 0,
  			        title: {
  			            text: 'Rainfall (mm)'
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
  		
  		function no3(month){
  			$.ajax({
  	  	    	type: 'POST', 
  	  	    	url: "/bucheon/admin/chart3_m?month="+month,  
  	  	    	dataType: "json", 
  	  	    	cache: false, 
  	  	    	success: function(data) {
  	  	    		console.log(data);
  	  	    		var Chart3 = [];
  	  	    		
  	  	    		var html_text ="<table id='senti_table' class='table table-responsive table-striped' border=1><thead><tr>"
  	  					+ "<td>단어</td><td>건수</td><tbody>";
  	  				if(data != null) {
  	  	    		
  	  	    		
  	  	    		$("#sentiWord").text(data[0].WORD_WS);
  	  	    		
  	  	    		for(var j=0; j<10; j++) {
  	  	    			
  	  	    			 var temp = Number(data[j].COUNT_WS);
  	  	    			
  	  	    			Chart3.push({
  	  	                     name: data[j].WORD_WS, 
  	  	                     y: temp
  	  	                 });
  	  	    		}
  	  				}
  	  				
  	  			var sentiWord = data[0].WORD_WS;
            	var time = $("#month_selection").val();
        
       
        		$.ajax({
        			type: 'POST', 
      	  	    	url: "report_sentiData?sentiWord="+encodeURIComponent(encodeURIComponent(sentiWord)) + "&time=" + time,  
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
  	  					html_text += "<td><a href="+data[i].url+">" + data[i].title.substring(0,60) + "...</a></td>";
  	  			
  	  			/* html_text += "<td><a href="+data[i].url+">링크</a></td>"; */
  	  		html_text += "<td>" + data[i].result + "</td>";
  	  html_text += "<td>" + data[i].time + "</td></tr>"; 
  	  	    		}
  	  	    		
  	  	    
  	  				}
  	  				
  	  	    		html_text += "</tbody></table>";
  	  	    		
  	  	    		
  	  	    		$('#ws_section').empty().append(html_text);
        			
        		},
        		error : function(e) {
        			alert(e);
        		}
        		});
    	    	
  	  				
  	  	    		html_text += "</table>";
  	  	    	var text =  "'<b>" + data[0].WORD_WS + "'</b> 키워드가 <b> "+ data[0].COUNT_WS + "</b> 건 으로 가장 많이 언급 되었다."
  	  	    		
  	  	    		$('#ws_section').empty().append(html_text);
  	  	    		$("#ws_top").append(text);
  	  	    		
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
  			        text: '<br> 다. 감성 키워드(월간)'
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
  			                format: '<b>{point.name}</b>: {point.y}건',
  			                style: {
  			                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
  			                }
  			            }
  			        }
  			    },
  			    series: [{
  			        name: '감성 키워드',
  				        colorByPoint: true,
  				        data: Chart3,
  				        
  				      point: {
		                    events: {
		                        click: function() {
		                        	
		                        	var sentiWord = event.point.name;
		                        	
		                        	$("#sentiWord").text(sentiWord);
		                        	var time = $("#month_selection").val();
		                   
		                    		$.ajax({
		                    			type: 'POST', 
		                  	  	    	url: "report_sentiData?sentiWord="+encodeURIComponent(encodeURIComponent(sentiWord)) + "&time=" + time,  
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
		              	  					html_text += "<td><a href="+data[i].url+">" + data[i].title.substring(0,60) + "...</a></td>";
		              	  			
		              	  			/* html_text += "<td><a href="+data[i].url+">링크</a></td>"; */
		              	  		html_text += "<td>" + data[i].result + "</td>";
		              	  html_text += "<td>" + data[i].time + "</td></tr>"; 
		              	  	    		}
		              	  	    		
		              	  	    
		              	  				}
		              	  				
		              	  	    		html_text += "</tbody></table>";
		              	  	    		
		              	  	    		
		              	  	    		$('#ws_section').empty().append(html_text);
		                    			
		                    		},
		                    		error : function(e) {
		                    			alert(e);
		                    		}
		                    		});
		                	    	
		                	 
		                        	
		                        }
		                    }
		                }
  				    }]
  	  			});		
  			} 
  		
  		    function no4(month){
  		    	$.ajax({
  	  	  	    	type: 'POST', 
  	  	  	    	url: "/bucheon/admin/chart4_m?month="+month,
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
  	  	  	    		
  	  	  	    		var text =  "'<b>" + data[0].WORD_WT + "'</b> 키워드가 <b> "+ data[0].COUNT_WT + "</b> 건 으로 가장 많이 언급 되었다."
  	  	  	    		
  	  	  	    		
  	  	  	    		$('#wt_desc').empty().append(text);
  	  	  	    	},
  	  	  	    	error: function( request, status, error) {
  	  	  	    		//alert("code : "+request.status+"\n"+request.responseText+"\n"+"error : "+error);
  	  	  	  		    	}
  	  	  	  		});
  		    	
  		    	$.ajax({
  	  	  	    	type: 'POST', 
  	  	  	    	url: "/bucheon/admin/chart5_m?month="+month,
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
  		    	
  		    	
  		    	$.ajax({
  	  	  	    	type: 'POST', 
  	  	  	    	url: "/bucheon/admin/chart6_m?month="+month,
  	  	  	    	dataType: "json", 
  	  	  	    	cache: false, 
  	  	  	    	success: function(data) {
  	  	  	    			
  	  	  	    			var html_text ="<table id='senti_table' class='table table-responsive table-striped' border=1><thead><tr>"
  	  	  						+ "<td>부모 키워드</td><td>자식 키워드</td><td>언급 횟수</td><tbody>";
  	  	  					if(data != null) {
  	  	  		    		for(var i=0; i<data.length; i++) {
  	  	  		    			html_text += "<tr><td>" + data[i].PARENTS_WT + "</td>";
  	  	  						html_text += "<td>" + data[i].CHILD_WT + "</td>";
  	  	  						html_text += "<td>" + data[i].SUPPORT + "</td>";
  	  	  						
  	  	  		    		}
  	  	  					}	    		
  	  	  		    		html_text += "</table>";
  	  	  		    		
  	  	  		    		$('#relation').empty().append(html_text);
  	  	  		    		
  	  	  		    	
  	  	  		    	var text =  "'<b>" + data[0].PARENTS_WT + "'</b>은 <b>" + data[0].CHILD_WT +"</b>과  <b> "+ data[0].SUPPORT + "</b> 번  같이 언급되어서 "
	  					+ " 가장 높은 연관성을 보임 (같이 언급된 횟수 : " + data[0].SUPPORT + "번)";

  	  	  	    			$('#relation_desc').empty().append(text); 
  	  	  		    		
  	  	  	    	},
  	  	  	    	error: function( request, status, error) {
  	  	  	    		//alert("code : "+request.status+"\n"+request.responseText+"\n"+"error : "+error);
  	  	  		    	}
  	  	  		    });
  		    	
  		    	$.ajax({
  	  	  	    	type: 'POST', 
  	  	  	    	url: "/bucheon/admin/chart7_m?month="+month, 
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
  		   
  		    	
  		    	$.ajax({
  	  	  	    	type: 'POST', 
  	  	  	    	url: "/bucheon/admin/monthkey?month="+month, 
  	  	  	    	dataType: "json", 
  	  	  	    	cache: false, 
  	  	  	    	success: function(data) {
  	  	  	    			  	  	  	    		
  	  	  	    		var html_text = "";
  	  	  	    			
  	  	  	    		if(data != null) {
  	  	  		    		for(var i=0; i<data.length; i++) {
  	  	  		    			html_text += "<option>" + data[i].WORD_WT + "</option>";  	  	  						
  	  	  		    		}
  	  	  				} 		
  	  	  	    		
  	  	  	    		$('#key_selection').empty().append(html_text);
  	  	  		    	
  	  	  	    		basedonkey(data[0].WORD_WT,month);
  	  	  	    	},
  	  	  	    	error: function( request, status, error) {
  	  	  	    		//alert("code : "+request.status+"\n"+request.responseText+"\n"+"error : "+error);
  	  	  	    	}
  	  	  	    });
  		    	
  		   	
  		   	 }
  		    
  		  	$( "#key_selection" ).change(function() {
  		  		
  		  	 var day2 = new Date();				
 	   		 var y2 = day2.getFullYear();
 	   		 var searchmonth2 = $('#month_selection').val(); 
 	   		 var search2 = y2 + "-" + searchmonth2;
 	   		
 	   		 var key_se = $('#key_selection').val();
  			  	 
  			  	basedonkey(key_se,search2);
  			});
  		    
  		    
  		    	function basedonkey(key,month){
  		    		
  		    		key= escape(encodeURIComponent(key));
  		    		
  		    		$.ajax({
  	  	  	  	    	type: 'POST', 
  	  	  	  	    	url: "/bucheon/admin/monthbuzz?month="+month + "&key=" + key,  
  	  	  	  	    	dataType: "json", 
  	  	  	  	    	cache: false, 
  	  	  	  	    	success: function(data) {
  	  	  	  	    	
  		  	  	  	    	var time_data = [];
  		  	  	    		var cnt_data = [];
  	  	  	    		
  			  	  	    	if(data != null) {
  			  	  			 for(var i=0; i<data.length; i++) {
  			  	  				 time_data[i] = data[i].TIME_WT;
  			  	  				 
  			  	  				 var temp = Number(data[i].COUNT_WT);
  			  	  				 
  			  	  				 cnt_data[i] = temp;
  			  	  			 }
  			  	  	    	}
  			  	  	    	ch1_key(time_data,cnt_data);
  	  	  	  	    	},
  	  	  	  	    	error: function( request, status, error) {
  	  	  	  	    		//alert("code : "+request.status+"\n"+request.responseText+"\n"+"error : "+error);
  	  	  	  	    	}
  	  	  	  	    });
  	  		    	
  	  		    	function ch1_key(time_data,cnt_data){
  	  		    					
  	  		  			$('#chart1_key').highcharts({
  	  		  				chart: {
  	  		  			        type: 'line'
  	  		  			    },
  	  		  			    title: {
  	  		  			        text: '<BR> 1. 해당 키워드 시간대별 데이터 양'
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
  	  		    	

  	  		    	$.ajax({
  	  	  	  	    	type: 'POST', 
  	  	  	  	    	url: "/bucheon/admin/monthbuzz2?month="+month + "&key=" + key,  
  	  	  	  	    	dataType: "json", 
  	  	  	  	    	cache: false, 
  	  	  	  	    	success: function(data) {
  	  		  	  	    	if(data != null) {
  	  		  	  	    		$('#total_buzz2').text(data[0].CON);	
  	  		  	  	    	}
  	  	  	  	    	},
  	  	  	  	    	error: function( request, status, error) {
  	  	  	  	    		//alert("code : "+request.status+"\n"+request.responseText+"\n"+"error : "+error);
  	  	  	  	    	}
  	  	  	  	    });
  	  		    	
  	  		    	$.ajax({
  	  	  	  	    	type: 'POST', 
  	  	  	  	    	url: "/bucheon/admin/monthbuzz3?month="+month + "&key=" + key, 
  	  	  	  	    	dataType: "json", 
  	  	  	  	    	cache: false, 
  	  	  	  	    	success: function(data) {
  	  	  	  	  
  	  	  	  	    		if(data != null) {
  	  	  	  	    		
  		  	  	  	    		$('#buzz_time2').text(data[0].TIME_WT);
  		  	  	  	    		$('#buzz_cont2').text(data[0].COUNT_WT);
  	  	  	  	    		}
  	  	  	  			 
  	  	  	  	    	},
  	  	  	  	    	error: function( request, status, error) {
  	  	  	  	    		//alert("code : "+request.status+"\n"+request.responseText+"\n"+"error : "+error);
  	  	  	  	    	}
  	  	  	  	    }); 
  	  		    	  	  		    	
  	  		    	$.ajax({
  	  	  	  	    	type: 'POST', 
  	  	  	  	    	url: "/bucheon/admin/monthsenti?month="+month + "&key=" + key, 
  	  	  	  	    	dataType: "json", 
  	  	  	  	    	cache: false, 
  	  	  	  	    	success: function(data) {  	  	  	    	
  	  	  	  	    		
  	  	  	  	  			var total = 0;
  	  	  	  	  			
  	  	  	  	  			var po = 0;
  	  	  	  	  			
  	  	  	  	  			var nega = 0;
  	  	  	  	  			
  	  	  	  	  			
  	  	  	  	    		if(data != null) {
  	  	  	  	    			
  		  	  	  	    		for(var i=0; i<data.length; i++) {
  		  	  	  	    			var temp = Number(data[i].CNT);
  		  	  	  	    			total = total + temp;
  		  	  	  	    		}
  		  	  	  	    		
  		  	  	  	    		if(data[0].RESULT == '부정'){
  		  	  	  	    			nega = Number(data[0].CNT);
  		  	  	  	    		}
  		  	  	  	    		else{
  		  	  	  	    			po = Number(data[0].CNT);
  		  	  	  	    			nega = Number(data[1].CNT);
  		  	  	  	    		}

  	  	  	  	    		}
  	  	  	  	    		
  	  	  	  	    		
  	  	  	  	    		var popercent = po / total * 100;
  	  	  	  	    		
  	  	  	  	    		var nepercent = nega /total * 100;
  	  	  	  	    		
  	  	  	  	    		popercent = popercent.toFixed(2);
  	  	  	  	    		
  	  	  	  	    		nepercent = nepercent.toFixed(2);
  	  	  	  	    		
  	  	  	  	    		popercent = Number(popercent);
  	  	  	  	    	
  	  	  	  	    	    nepercent =	Number(nepercent);
  	  	  	  	    		    		
  	  	  	  	    	 	semi(popercent,nepercent);
  	  	  	  	    	 	
  	  	  	  	    	 	var text = '긍정 : ' + popercent + ' %   부정: ' + nepercent + ' %';
  	  	  	  	    	 	
  	  	  	  	    		$('#buzz_senti_result').text(text);
  	  	  	  	    	 	
  	  	  	  	    	},
  	  	  	  	    	error: function( request, status, error) {
  	  	  	  	    		//alert("code : "+request.status+"\n"+request.responseText+"\n"+"error : "+error);
  	  	  	  	    	}
  	  	  	  	    }); 
  	  		    	
  	  		    	function semi(popercent,nepercent){
  	  		    		$('#chart2_key').highcharts({
  	  		    			chart: {
  	  		    		        plotBackgroundColor: null,
  	  		    		        plotBorderWidth: 0,
  	  		    		        plotShadow: false
  	  		    		    },
  	  		  			    title: {
  	  		  			        text: '<BR>2. 해당 키워드 긍부정 비율(%)'
  	  		  			    },
  	  		  			  	credits: {
  	  		  	            	enabled: false
  	  		  	        	},
  	  		  	        	plotOptions: {
  	  		  	       			 pie: {
  			  		  	            dataLabels: {
  			  		  	                enabled: true,
  			  		  	                distance: -50,
  			  		  	                style: {
  			  		  	                    fontWeight: 'bold',
  			  		  	                    color: 'white'
  			  		  	                }
  			  		  	            },
  			  		  	            startAngle: -90,
  			  		  	            endAngle: 90,
  			  		  	            center: ['50%', '75%']
  			  		  	        }
  			  		  	    },
  			  		  		series: [{
  			  		        type: 'pie',
  			  		        name: '긍/부정',
  			  		        innerSize: '50%',
  			  		        data: [
  			  		            ['긍정',   popercent],
  			  		            ['부정',  nepercent]
  			  		        ]
  			  		  	 }]
  	  		  			});		
  	  		    	}
  	  		 
  	  		    	
  	  		    	$.ajax({
  	  	  	  	    	type: 'POST', 
  	  	  	  	    	url: "/bucheon/admin/monthrelation?month="+month + "&key=" + key, 
  	  	  	  	    	dataType: "json", 
  	  	  	  	    	cache: false, 
  	  	  	  	    	success: function(data) {
  	  	  	  	  			
  	  	  	  	    		if(data != null) {
  	  	  	  	    		
  	  	  	  			var html_text ="<table id='senti_table' class='table table-responsive table-striped' border=1><thead><tr>"
  	  	  	  		+ "<td>부모 키워드</td><td>자식 키워드</td><td>언급 횟수</td><tbody>";
	  	  					if(data != null) {
	  	  		    		for(var i=0; i<data.length; i++) {
	  	  		    			html_text += "<tr><td>" + data[i].PARENTS_WT + "</td>";
	  	  						html_text += "<td>" + data[i].CHILD_WT + "</td>";
	  	  						html_text += "<td>" + data[i].SUPPORT + "</td>";
 
  		  	  						
  		  	  		    		}
  		  	  					}	    		
  		  	  		    		html_text += "</table>";
  		  	  		    		
  		  	  		    		$('#relation2').empty().append(html_text);
  		  	  		    		
  		  	  		    	
  		  	  		    	var text =  "'<b>" + data[0].PARENTS_WT + "'</b>은 <b>" + data[0].CHILD_WT +"</b>과  <b> "+ data[0].SUPPORT + "</b> 번  같이 언급되어서 "
  		  					+ " 가장 높은 연관성을 보임 (같이 언급된 횟수 : " + data[0].SUPPORT + "번)";

  		  	  	    			$('#relation_desc2').empty().append(text); 
  	  	  	  	    		}
  	  	  	  			 
  	  	  	  	    	},
  	  	  	  	    	error: function( request, status, error) {
  	  	  	  	    		//alert("code : "+request.status+"\n"+request.responseText+"\n"+"error : "+error);
  	  	  	  	    	}
  	  	  	  	    }); 
  	  		    	
  	  		    	$.ajax({
  	  	  	  	    	type: 'POST', 
  	  	  	  	    	url: "/bucheon/admin/monthhc?month="+month + "&key=" + key,  
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
  	  	  	  		    		
  	  	  	  		    		$('#hc2').empty().append(html_text);
  	  	  	  		    		
  	  	  	  					var text =  "한달동안 ' <b>" + data[0].COUNT_HC + "'</b>회 <b>'" + data[0].TEXT_HC +"</b>' 의 텍스트가 가장 많이 확산됨";

  	  	  	  	    			$('#hc_desc2').empty().append(text); 
  	  	  	  		    		
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
