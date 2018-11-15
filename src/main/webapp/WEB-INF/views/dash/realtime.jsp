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
                    <li><a href="/bucheon/admin/report">레포트</a></li>
                    <li class="active"><a href="/bucheon/admin/realtime">실시간데이터</a></li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        <!-- /.container-fluid -->
    </nav>
 	
 	<div class="col-sm-1 col-sm-offset-11">
		<button type="button" class="btn btn-info" onclick="printing()">다운로드</button>
 	</div>
 	
 	<script>
 		function printing(){
 			window.print();	
 		}
 		
 	</script>
 	
    <div class="clearfix"></div>
  
  	<div class="col-sm-12 outline">
    	<div id="realbuzz"></div>
  	</div>
  	
  	
  	<div class="clearfix"></div>
  	
  	<div class="col-sm-6">
  		<div id="realsenti"></div>
  	</div>
  	<div class="col-sm-5">
  		<div id="realkey"></div>
  	</div>
  	
  	<div class="clearfix"></div>
  	
  	<div class="col-sm-10 col-sm-offset-1">
  		<div id="realsenti_detail" style="overflow:scroll; width:100%; height:400px;margin-bottom:10px;"></div>
  	</div>
  	
  	<script>

  	$(function () {
  		
  		action();
  		
  		setInterval("action()", 600000);
  		
  		function action(){
  			$.ajax({
  	  	    	type: 'POST', 
  	  	    	url: "/bucheon/admin/realtime_cal",  
  	  	    	dataType: "json", 
  	  	    	cache: false, 
  	  	    	success: function(data) {
  	  	    		 	    		
  	  	    		var time_stamp = [];
  	  	    		
  	  	    		var con_count = [];
  	  	    		if(data != null) {
  		  	    		for(var i=0; i<data.length; i++) {
  		  	    			time_stamp[i] = data[i].TD_STAMP;
  		 	  				 
  		 	  				 var temp = Number(data[i].CON); 	  				 
  		 	  				con_count[i] = temp;
  		
  		 	  			 }
  	  	    		}
  					
  					buzz(time_stamp,con_count);
  	  	    	},
  	  	    	error: function( request, status, error) {
  	  	    		//alert("code : "+request.status+"\n"+request.responseText+"\n"+"error : "+error);
  	  	    	}
  	  	    });
  	  		
  			
  			$.ajax({
  	  	    	type: 'POST', 
  	  	    	url: "/bucheon/admin/realtime_senti",  
  	  	    	dataType: "json", 
  	  	    	cache: false, 
  	  	    	success: function(data) { 

  					var html_text ="<table id='senti_table' class='table table-responsive table-striped' border=1><thead><tr>"
  							+ "<td>TIME</td><td>TEXT</td><td>긍/부정</td><td>URL</td><td>TD_KEY</td><tbody>";
  						if(data != null) {
  				    		for(var i=0; i<data.length; i++) {
  				    			
  				    			var url_link = data[i].TD_URL;
  				    			
  				    			var start = url_link.indexOf("=");
  				    			
  				    			url_link = url_link.substring(start+2, url_link.length);
  				    			
  				    			var end = url_link.indexOf(" ");
  				    			
  				    			url_link = url_link.substring(0, end -1);
  				    			
  				    			html_text += "<tr><td>" + data[i].TD_STAMP + "</td>";
  								html_text += "<td>" + data[i].TD_TITLE + "</td>";
  								html_text += "<td>" + data[i].RESULT + "</td>";
  								html_text += "<td><a target='_blank' href='" + url_link + "''>URL</a>" + "</td>";
  								html_text += "<td>" + data[i].TD_KEY + "</td></tr>";
  								
  				    		}
  						} 		    		
  			    		html_text += "</table>";
  			    		
  			    		$('#realsenti_detail').empty().append(html_text);
  	  	    	},
  	  	    	error: function( request, status, error) {
  	  	    		//alert("code : "+request.status+"\n"+request.responseText+"\n"+"error : "+error);
  	  	    	}
  	  	    });
  	  		
  	  		$.ajax({
  	  	    	type: 'POST', 
  	  	    	url: "/bucheon/admin/realtime_con",  
  	  	    	dataType: "json", 
  	  	    	cache: false, 
  	  	    	success: function(data) {
  					var senti = [];
  					
  					if(data != null) {
  						 for(var i=0; i<data.length; i++) {
  							 
  							 var temp =  Number(data[i].CON);

  							senti.push({
  								 name: data[i].RESULT,
  								 y: temp
  							 }); 
  							 
  						 }
  					}
  	  	    		
  					senti_pie(senti)
  	  	    	},
  	  	    	error: function( request, status, error) {
  	  	    		//alert("code : "+request.status+"\n"+request.responseText+"\n"+"error : "+error);
  	  	    	}
  	  	    });
  	  		
  	  	$.ajax({
  	    	type: 'POST', 
  	    	url: "/bucheon/admin/realtime_td",  
  	    	dataType: "json", 
  	    	cache: false, 
  	    	success: function(data) {
				console.log(data);
				
				var key = [];
				
				if(data != null) {
					 for(var i=0; i<data.length; i++) {
						 
						 var temp =  Number(data[i].CON);

						 key[i] = [data[i].TD_KEY , data[i].CON];
									 
					 }
				}
				
				senti_key(key);
  	    	},
  	    	error: function( request, status, error) {
  	    		//alert("code : "+request.status+"\n"+request.responseText+"\n"+"error : "+error);
  	    	}
  	    });
  	  		
  		}
  		
  	  		
  		function buzz(time_stamp,con_count){
  			$('#realbuzz').highcharts({
				chart: {
			        type: 'line'
			    },
			    title: {
			        text: '가. 시간대별 데이터 양(트위터)'
			    },
			    xAxis: {
			        categories: time_stamp
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
			        name: '트위터',
			        data: con_count
			    }]
			});
  		}
  		
  		
  		function senti_pie(senti){
  			$('#realsenti').highcharts({
	    			chart: {
	    		        plotBackgroundColor: null,
	    		        plotBorderWidth: null,
	    		        plotShadow: false,
	    		        type: 'pie'
	    		    },
	    		    title: {
	    		        text: '나. 긍부정 비율'
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
	    		                format: '<b>{point.name}</b>: {point.percentage:.1f} %',
	    		                style: {
	    		                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
	    		                }
	    		            }
	    		        }
	    		    },
	    		    series: [{
	    		        name: '긍부정 비율',
	    		        colorByPoint: true,
	    		        data:senti
	    		    }]
				});	 
  		  }
  		
  		
  		function senti_key(key){
  			$('#realkey').highcharts({
  				chart: {
  					type: 'column'
  			    },
    		    title: {
    		        text: '다. 수집 키워드 순위'
    		    },
    		    xAxis: {
    		        type: 'category',
    		        labels: {
    		            rotation: -45,
    		            style: {
    		                fontSize: '13px',
    		                fontFamily: 'Verdana, sans-serif'
    		            }
    		        }
    		    },
    		    yAxis: {
    		        min: 0,
    		        title: {
    		            text: '(건수)'
    		        }
    		    },
    		    legend: {
    		        enabled: false
    		    },
    		    credits: {
	            	enabled: false
	        	},
	        	plotOptions: {
	                bar: {
	                    dataLabels: {
	                        enabled: true
	                    }
	                }
	            },
	            series: [{
	                name: '건수',
	                data: key,
	                dataLabels: {
	                    enabled: true,
	                    rotation: -90,
	                    color: '#FFFFFF',
	                    align: 'right',
	                    format: '{point.y:.1f}', // one decimal
	                    y: 10, // 10 pixels down from the top
	                    style: {
	                        fontSize: '13px',
	                        fontFamily: 'Verdana, sans-serif'
	                    }
	                }
	            }]
			});	 
  		  }
  	
  	});

  	</script>

  </body>
</html>
