
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>
<div>
	<div>
	<c:choose>
<c:when test="${empty id}">
	로그인 실패
<a href="../">홈으로 이동</a>
<a href="javascript:history.back();">돌아가기</a>
</c:when>
<c:otherwise>
	로그인 성공
<a href="../">홈으로 이동</a>
<a href="javascript:referrer;">돌아가기</a>
</c:otherwise>
</c:choose>
	</div>
</div>

<%@include file="../footer.jsp" %>