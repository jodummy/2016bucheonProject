<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html>
<head>
<title>Gogreat Bigdata Platform</title>
<link rel="icon" href="/bucheon/resources/img/g.png">

<link rel="stylesheet" type="text/css" href="/bucheon/resources/css/login.css">
<link rel="stylesheet" type="text/css" href="/bucheon/resources/css/boot_test.css">

<script src="/bucheon/resources/jquery/jquery-1.10.2-login.js"></script>

</head>
<body>

	<div class="outer">
		<div class="inner">
			<div>
				<div class="container logo_wrapper" align="center">
					<img src="/bucheon/resources/img/bucheon_logo.jpg" style="width: 300px;padding: 50px 0px"> 		
				</div>
				<div class="container">

      <form class="form-signin" action="/bucheon/check" method="post">
        
        <c:if test="${requestScope.message != null}">
        	<h6>로그인 
        	정보가 잘못 되었습니다</h6>
        </c:if>
        
        <table>
        	<tr>
        <td align="center" width="15%;"><label for="inputEmail"> ID </label></td>
        <td style="padding: 2%;"><input type="text" id="id" class="form-control" placeholder="Id" required autofocus name="id"></td>
        <td rowspan="2">
        	<button class="btn btn-lg btn-primary btn-block" type="submit" style="height: 88px;">로그인</button>
        </td>
        	</tr>
        	<tr>
        <td align="center"><label for="inputPassword">PW</label></td>
        <td style="padding: 2%;"><input type="password" id="inputPassword" class="form-control" placeholder="Password" required name="password"></td>
        	
        	</tr>
        </table>
      </form>
	
	</div>
				
			</div>
		</div>
	</div>
</body>
</html>