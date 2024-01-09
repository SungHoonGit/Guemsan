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
          <i class="fa fa-table"></i> ${id}님의 판매현황 입니다.</div>
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                            <tr>                            
                                <th>이 름</th>
                                <th>주 소</th>
                                <th>번 호</th>
                                <th>주문날짜</th>
                                <th>배 송</th>
                                <th>상 품</th>
                                <th>총금액</th>
                                <th>결 제</th>
                                <th>결제날</th>
                                <th>배송비</th>
							<c:forEach var="add" items="${addcuslist}" varStatus="vs">
								<th>${add.ac_colum}</th>
							</c:forEach>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="dto" items="${cuslist}" varStatus="vs">
                                <tr onclick="readupdate('${dto.r_acode}')">
                                    <td>${dto.c_name}</td>
                                    <td>${dto.c_address} ${dto.c_address2}</td>
                                    <td>${dto.c_tel}</td>
                                    <td>${dto.r_ordate}</td>
                                    <td>${dto.r_deli}</td>
                                    <td>${dto.r_title}</td>
                                    <td>${dto.r_total}</td>
                                    <td onclick="event.cancelBubble=true, payed('${dto.r_acode}')">
                                    	<input type="hidden" id="S${dto.r_acode}" value="${dto.r_pay}">
                                    	<input type="hidden" id="${dto.r_acode}" value="${dto.r_deli}">${dto.r_pay}
                                    </td>
									<td onclick="event.cancelBubble=true, payed('${dto.r_acode}')">${dto.r_pdate}</td>
                                	<td onclick="event.cancelBubble=true, payed('${dto.r_acode}')">${dto.r_dpay}</td>                                    
                                </tr>
                            </c:forEach>
                        </tbody>
            </table>
          </div>
        </div>
        <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
      </div>
    <!-- /.container-fluid-->

<%@include file="./footer2.jsp" %>