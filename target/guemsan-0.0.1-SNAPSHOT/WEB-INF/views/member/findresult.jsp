<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>
<div>
	<div>
		<span>${result} 하셨습니다.</span>
		<c:choose>
			<c:when test="${result eq '성공' }">
				<a href="../">홈으로 이동</a>
				<a href="../member/logincheck">로그인하기</a>
			</c:when>
			<c:otherwise>
				<a href="../">홈으로 이동</a>
				<a href="javascript:history.back();">돌아가기</a>
			</c:otherwise>
		</c:choose>
	</div>
</div>
<%@include file="../footer.jsp" %>