<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@include file="./adheader.jsp" %> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@include file="./header2.jsp" %>
    <!-- 커뮤니티 구성원 목록 시작 -->
    <div class="card mb-3">
        <div class="card-header">
        	<h1 class="h3 mb-2 text-gray-800" style="font-weight: bold"> ${id}님의 주문관리 페이지입니다.</h1>
       	</div> <!-- card-header -->
        <div class="card-body">
			<div class="mytool">
		        <%-- 주문 등록 --%>
				<button type="button" id="myBtn" class="btn-light border-0" style="color: darkgreen; font-weight: bold"> 주문 등록하기 </button>
				<%-- 리스트 삭제 버튼 --%>
	            <button id="approvalBtn" name="approvalBtn" onclick="return delclient()" class="btn-light border-0" style="color: darkred; font-weight: bold">
	                <i class="fas fa-check"></i> 삭제</button> 				
		        <%-- 검색창 --%>
		        <form name="keyword" action="../accountlist/${id}" method="get"  style="display:inline; float: right;">
		        	<input type="hidden" name="pageNum" value="1">
		            <input type="text" name="keyword" value="${keyword}" placeholder=" 찾아보기">
		            <input type="submit" class="btn-dark" value="검색">
		        </form>
				<%-- 검색창 END --%>    
			</div> <%--card tool end --%>      
             
                    
	    <%-- 고객 생성하기 버튼  ------------------------------------------------------------------------------%>
			<!-- Modal -->
			<div class="modal fade" id="test_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h4 class="modal-title" id="myModalLabel">주문 생성하기</h4>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
			      </div>
			      <form id="Account" name="Account" method="post" >
			      <div class="modal-body">
					<div class="table-responsive">
					<%-- Code 생성하기 --%>
					
					<!-- **  코드 자동생성 : s + 날짜(yyyymmdd) 이 -->
					<c:set var="now" value="<%=new java.util.Date()%>" />
					<c:set var="date"><fmt:formatDate value="${now}" pattern="yyMMddhhmmss" /></c:set>
					<c:set var="acode" value="o${date}"></c:set>
					<c:set var="min"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set>

                    <table class="table table-hover" id="dataTable1" width="100%" cellspacing="0">
						<input type="hidden" name="r_acode" id="r_acode" value="${acode}">
						<input type="hidden" name="r_id" id="r_id" value="${id}">
                        <thead>
							<tr>
								<th>이 름</th>
								<td>
							      <input type="hidden" name="r_code" id="r_code" size="15" readonly>
							      <input type="text" name="c_name" id="c_name" size="15" readonly>
							      <input type="button" value="고객확인" onclick="checkcl()"> 								 
								</td>
							</tr>								
							<tr>
								<th>배 달</th>
								<td> 
								 <input type="radio" name="r_deli" value="택배"> 택배
								 <input type="radio" name="r_deli" value="배달"> 배달
								</td>
							</tr>	
							<tr>
								<th>물 품</th>
								<td> 
								 <input type="text" name="r_title" id="r_title" >
								</td>
							</tr>	
							<tr>
								<th>금 액</th>
								<td> 
								 <input type="number" name="r_total" id="r_total" >
								</td>
							</tr>														
                        </thead>						
                        <tbody>
                        </tbody>
                    </table> 
                	</div> <!-- table-responsive end -->
			      </div> <!-- modal-body -->
			      <div class="modal-footer">
			        <button type="reset" class="btn btn-default" data-dismiss="modal">취소</button>
			        <button type="submit" name="submit" class="btn btn-primary" onclick="alinsert()" value="check" >생성하기</button>
			      </div> 
			      </form>
			    </div> <!-- modal-content end -->
			  </div> <!-- modal-dialog end -->
			</div> <!-- modal fade end -->
		<%-- 고객 생성 버튼--%>
		
		<%-- 고객 생성하기 버튼  ------------------------------------------------------------------------------%>
			<!-- Modal -->
			<div class="modal fade" id="test_modal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="margin:auto;">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
						</div>			  
 			      		<div class="modal-body">
				        <%-- 검색창 --%>
				        
				            <input type="text" name="searchname" id="searchname" onkeyup="searchnames(this);" placeholder=" 찾아보기">
				            <input type="button" onclick="searchname()" class="btn-dark" value="검색">
					        <div id="namelist"></div>
					        <h1 id="selected"></h1>
				                  
			     		 </div> <!-- modal-body end -->
					     <div class="modal-footer">
					     </div>
					</div> <!-- modal-content end -->
				</div>
			</div>
		<%-- 고객 생성 버튼--%>		
		
				<script>
				/* 1번째 모달 */
					$("#myBtn").on( "click", function() {
						$('.modal-body').find($('input[name=c_name]')).attr('value','');
						$('.modal-body').find($('input[name=c_tel]')).attr('value', '');
						$('.modal-body').find($('input[name=c_address]')).attr('value','');
						$('.modal-body').find($('input[name=r_title]')).attr('value', '');
						$('.modal-body').find($('input[name=r_total]')).attr('value', '');
						$('.modal-body').find($('input[name=r_acode]')).attr('value', '${acode}');
						$('.modal-body').find($("input:radio[name='r_deli']")).prop("checked", false);
	                	$('.modal-content').find($('button[name=submit]')).attr("onclick", 'alinsert()');
				        $("#test_modal").modal();
						});
					
				   function alinsert(){
						document.Account.action = "/admin/alinsert";
						document.Account.submit();
				   }// clinsert() end
				   
				   function checkcl() {
					   $("#test_modal2").modal();					   				   
				   }// checkcl() end
				   
				   function searchname() {
					   var keyword = $('#searchname').val();
					   searchnames(keyword);
				   }
				   
/* 				   $("#searchname").on("click", function(){
					   
				   }); // click search */
				    function setname(data) {
				    	alert(data);
				    } // setname end
		       	 	
				    //후기 목록 searchnames
				    function searchnames(keyword){
				        $.ajax({
				            url    :'/admin/searchname/${id}'
				            ,type   :'get'
				            ,data   :{'keyword':keyword }
				            ,success:function (data){
				            	$("#namelist").empty();
				            	if (data == "") {
				            		$("#namelist").empty();
				            		$("#namelist").html('없슴두~');
				            	}else {
				            	let a = ''; //출력할 결과값
				            		a += '<table class="table table-hover">';
				            		a += '<tr><td>이름</td><td>번호</td><td>주소</td></tr>';
				            	$.each(data, function (key, vale){
				            		 a += '<input type="hidden" id="'+ vale.c_code +'" value="'+ vale.c_name +'"> </input>';
				            		 a += '<tr data-value="'+ vale.c_code +'" onclick="select(this)">';
				            		 a += '<td>'+ vale.c_name +' </td>';
				            		 a += '<td>'+ vale.c_tel +' </td>';
				            		 a += '<td>'+ vale.c_address +  vale.c_address2 +' </td>';
				            		 a += '</tr>';
				            	 });//each() end
				            	 	a += '</table>';
				            	$("#namelist").html(a);
				            	}

				            } // success end
				       	 }) // ajax end
				    } // searchnames
				    
				    function select(e){
				    	var c_code = $(e).data("value");
				    	var c_name = $("#"+c_code).val();
						$('#r_code').attr('value',c_code);
						$('#c_name').attr('value',c_name);		
						$("#test_modal2").modal("hide");
				    }

				</script>
		<%-- 고객 생성하기 버튼 끝 ---------------------------------------------------------------------------------------------------------%>
            
            
        <form name="frm" method="post">        
                <div class="table-responsive">
                    <table class="table table-hover" id="dataTable2" width="100%" cellspacing="0">
                        <thead>
                            <tr>
								<th><p align="right" style="padding-right: 10px" class="text-primary"><input type="checkbox" id="checkAll"></p></th>                            
                                <th>이 름</th>
                                <th>주 소</th>
                                <th>번 호</th>
                                <th>주문날짜</th>
                                <th>배 송</th>
                                <th>상 품</th>
                                <th>총금액</th>
                                <th>결제확인</th>
                                <th>결제확인날짜</th>
                                <th>배송금액</th>
							<c:forEach var="add" items="${addcuslist}" varStatus="vs">
								<th>${add.ac_colum}</th>
							</c:forEach>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="dto" items="${cuslist}" varStatus="vs">
                                <tr onclick="readupdate('${dto.r_acode}')">
                               		<td onclick="event.cancelBubble=true"><input type="checkbox" name="chkList" id="chkList" value="${dto.r_acode}"><input type="hidden" name="checkid" id="checkid" value="${id}"></td>
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
        </form>              
		    <%-- 체크박스 관련 스크립트 --%>
		    <script>
		
		        //체크박스 모두 체크
		        $(document).ready(function (){
		            $("#checkAll").click(function (){
		
		                if($("#checkAll").prop("checked")){
		                    $("input[name=chkList]").prop("checked", true);
		                }else {
		                    $("input[name=chkList]").prop("checked", false);
		                }//if end
		            });//click() end
		        });//ready() end              
		        
		        //삭제 버튼
		        function delclient(){
		            if(confirm("진행할까요?")){
		            	if ($("input:checkbox[name='chkList']").is(":checked")==false) {
		            		alert("적어도 하나는 선택하여 주십시오.");
		            		return false;
		            	}else {		            	
		                document.frm.action = "/admin/delaccount";
		                document.frm.submit();
		                return true;
		            	}
		            }
		            return false;
		        }//approveMember() end
		        
		        // 모달창Read Update
		        function readupdate(data) {
		    		$.ajax({
		    			method: "GET",
		    			url:"/admin/acread",
		    			data:{'r_acode': data},
	    		        success : function(client){  
	    	                   // alert('연결성공!'); //출력 되면 연결 성공을 알 수 있땅 
	    	                   // alert(client.c_code);  // 경고 창에 JSP파일의 내용이 떠야 한다.
	    	                   $('.modal-body').find($('input[name=r_code]')).attr('value',client.c_code);
	    	                   $('.modal-body').find($('input[name=c_name]')).attr('value',client.c_name);
	    	                   $('.modal-body').find($('input[name=r_acode]')).attr('value', client.r_acode);
	    	                   $('.modal-body').find($("input:radio[name='r_deli']")).prop("checked", false);
	    	                   $('.modal-body').find($("input:radio[value='"+client.r_deli+"']")).prop("checked", true);
	    	                   $('.modal-body').find($('input[name=r_title]')).attr('value',client.r_title);
	    	                   $('.modal-body').find($('input[name=r_total]')).attr('value',client.c_tel);
	    	                   $('.modal-content').find($('button[name=submit]')).attr("onclick", 'update()');
	    	                   $("#test_modal").modal();
	    	           }, 
	    	          error : function(){ 
	    	          alert('연결실패 ㅠㅠ'); 
	    	          }
		    		})// ajax end
		    		
		        }// readupdate() end
		        
		        function update() {
		        	// var queryString = $("#client").serialize() ;
		        	// alert(queryString);
		        	
		        	document.Account.action = "/admin/uprecord";
	                document.Account.submit();
		        	// alert("changed");
		        	
		        }// change() end
		        
		        function payed(data) {
		        	if( $("#S"+data).val() == "O" ) {
		        		if (confirm("완료된 주문입니다.취소할까요?")) {
		        			alert("주문 취소되었습니다.");
				        	document.frm.action = "/admin/depayed/"+data;
			                document.frm.submit();	
		        		}
		        	}else {
			        	if( $("#"+data).val() == "택배" ){
			        		alert("택배시네요?");
			        		var userInput = prompt("택배금액은 얼마인가요?"+"");
					        if (!confirm("결제 되었습니까?")) {
					            alert("취소(아니오)를 누르셨습니다.");
					        } else {
					            alert(userInput+"원 배달비 확인(예)을 누르셨습니다.");
					        	document.frm.action = "/admin/payed/"+data+"/"+userInput;
				                document.frm.submit();		            
					        }// if 3 end	
			        	} else {
			        		alert("배달이시네요.");
					        if (!confirm("결제 되었습니까?")) {
					            alert("취소(아니오)를 누르셨습니다.");
					        } else {
					            alert("확인(예)을 누르셨습니다.");
					        	document.frm.action = "/admin/payed/"+data;
				                document.frm.submit();						            
					        }// if 3 end		
			        	}// if 2 end
		        	}// if 3 end
		        }
		        
			</script>    
			</div>                
                       <!-- 페이징 list -->
					<c:set var="pageCount" value="${totalPage}"></c:set>
					<c:set var="startPage" value="${startPage}"></c:set>
					<c:set var="endPage"   value="${endPage}"></c:set>
					<c:set var="page" value="${page}"></c:set>
					
					<div class="card-footer small text-muted" style="text-align: center">
					    <!-- endPage는 10, 20, 30.. ex)총 페이지가 22일 때 endPage 30이 아닌 22까지 출력해야 함 -->
					    <c:if test="${endPage > pageCount}">
					        <c:set var="endPage" value="${pageCount}"></c:set>
					    </c:if>
					
					    <!-- 이전 : startPage는 10, 20, 30.. 따라서 1보다 크면 이전 페이지 이동 가능 -->
					    <c:if test="${startPage > 1}">
					        <a href="${page}?pageNum=${startPage-1}">[이전]</a>      <!-- pageNum값을 Controller에 보냄 -->
					    </c:if>
					
					    <!-- 현재페이지 볼드체 / 현재페이지 외 링크 걸기 -->
					    <c:forEach var="i" begin="${startPage}" end="${endPage}">
					        <c:choose>
					            <c:when test="${pageNum == i}"><span style="font-weight: bold">${i}</span></c:when>
					            <c:when test="${pageNum != i}"><a href="${page}?pageNum=${i}">[${i}]</a></c:when>
					        </c:choose>
					    </c:forEach>
					
					    <!-- 다음 이동 -->
					    <c:if test="${endPage < pageCount}">
					        <a href="${page}?pageNum=${endPage+1}">[다음]</a>
					    </c:if>
					    <!-- 페이징 list 끝 -->
					</div> <!-- cart-footer END -->
				</div><!-- 커뮤니티 구성원 목록 끝 -->
				
<%@include file="./footer2.jsp" %>