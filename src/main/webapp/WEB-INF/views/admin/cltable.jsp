<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@include file="./adheader.jsp" %> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@include file="./header2.jsp" %>

      <!-- Example DataTables Card-->
      <div class="card mb-3">
        <div class="card-header">
          <i class="fa fa-table"></i> ${id}님의 회원 입니다.</div>
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>                            
                                <th>이 름</th>
                                <th>성 별</th>
                                <th>주 소</th>
                                <th>우편번호</th>
                                <th>번 호</th>
                                <th>메일체크</th>
                                <th>신청날짜</th>
							<c:forEach var="add" items="${addcuslist}" varStatus="vs">
								<th>${add.ac_colum}</th>
							</c:forEach>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="dto" items="${cuslist}" varStatus="vs">
                                <tr onclick="readupdate('${dto.c_code}')">
                                    <td>${dto.c_name}</td>
                                    <td>
                                    	<c:if test="${dto.c_gender eq 'M'}">남 성</c:if>
                                    	<c:if test="${dto.c_gender eq 'F'}">여 성</c:if>
                                    </td>
                                    <td>${dto.c_address} ${dto.c_address2}</td>
                                    <td>${dto.c_zip}</td>
                                    <td>${dto.c_tel}</td>
                                    <td>${dto.c_smscheck}</td>
                                    <td>${dto.c_rdate}</td>
								<c:forEach var="add" items="${addcuslist}" varStatus="vs">
									<c:choose>
										<c:when test="${dto.c_code eq add.ac_code}">
									<td>${add.ac_content}</td>
										</c:when>
										<c:otherwise>
									<td></td>
										</c:otherwise>
									</c:choose>
								</c:forEach>
                                </tr>
                            </c:forEach>
                        </tbody>
            </table>
          </div>
        </div>
        <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
      </div>
    </div>
    <!-- /.container-fluid-->


<%@include file="./footer2.jsp" %>