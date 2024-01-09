<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<meta charset="UTF-8">

    <!-- 대부분의 검색엔진 웹 크롤러 차단 -->
    <meta name="robots" content="noindex">
    <!-- 구글 검색엔진 웹 크롤러만 차단 -->
    <meta name="googlebot" content="noindex">
	<!-- <script src="/js/myscript.js"></script> -->
	
        
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="/css/admin.css">
	
<title>SungHoonK</title>

</head>
<body>
  <!-- Hero -->
 
	<div class="mainnav">
		<a class="mainnav-tab" href="../">Home</a> 
				<c:choose>
			<c:when test="${empty id}">
				<a class="mainnav-tab" href="/member/login"></a>
			    <a class="mainnav-tab" href="/member/login"></a>
      			<a class="mainnav-tab" href="/member/login"></a>			
				<a class="mainnav-tab" href="/member/login">Login</a>
			</c:when>
			<c:otherwise>
				<a class="mainnav-tab" href="/admin/">Service</a>
				<a class="mainnav-tab" href="/member/logout">Logout</a>
			</c:otherwise>
			</c:choose>		
	</div>  	
