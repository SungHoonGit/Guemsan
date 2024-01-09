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
             <h1 class="h3 mb-2 text-gray-800" style="font-weight: bold"> ${id}님의 회원수정 페이지입니다.</h1>
		</div> <!-- card-header -->
		<div class="card-body">
			<div class="mytool">
				<%-- 고객 생성 버튼--%>		
				<button type="button" id="myBtn" class="btn-light border-0" style="color: darkgreen; font-weight: bold"> 고객 등록하기 </button>
				<%-- 리스트 삭제 버튼 --%>
                 <button id="approvalBtn" name="approvalBtn" onclick="return delclient()" class="btn-light border-0" style="color: darkred; font-weight: bold">
                     <i class="fas"></i> 삭제</button>
					
		        <%-- 검색창 --%>
		        <form name="keyword" action="../search/${id}" method="get" style="display:inline; float: right;">
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
			        <h4 class="modal-title" id="myModalLabel">고객 생성하기</h4>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
			      </div>
			      <form id="client" name="client" method="post" >
			      <div class="modal-body">
					<div class="table-responsive">
					<%-- Code 생성하기 --%>
					
					<!-- **  코드 자동생성 : s + 날짜(yyyymmdd) 이 -->
					<c:set var="now" value="<%=new java.util.Date()%>" />
					<c:set var="date"><fmt:formatDate value="${now}" pattern="yyMMddhhmmss" /></c:set>
					<c:set var="min"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set>

                    <table class="table table-bordered" id="dataTable1" width="100%" cellspacing="0">
						<input type="hidden" name="c_code" id="c_code" value="m${date}"/>
                        <thead>				
							<tr>
								<th>이 름</th>
								<td> <input type="text" name="c_name" id="c_name" value="${{client.c_code}}"required></input></td>
							</tr>							
							<tr>
								<th>성 별</th>
								<td> <select name="c_gender" id="c_gender">
										<option value="0" selected>선택하세요.</option>
										<option value="M">남자</option>
										<option value="F">여자</option>										
									 </select> 
								</td>
							</tr>			
							<tr>
								<th>우편번호</th>
								<td> 
								 <input type="text" name="c_zip" id="c_zip" readonly></input>
								  <input type="button" value="주소찾기" onclick="DaumPostcode()">
								</td>
							</tr>							
							<tr>
								<th>주 소</th>
								<td> <input type="text" name="c_address" id="c_address" readonly></input> </td>
							</tr>
							<tr>
								<th>상세주소</th>
								<td> <input type="text" name="c_address2" id="c_address2" placeholder="나머지 주소를 입력해 주세요"></input> </td>
							</tr>												
							<tr>
								<th>번 호</th>
								<td> <input type="tel" name="c_tel" id="c_tel"size="5"></input> </td>
							</tr>
							<tr>
								<th>sns 수신여부</th>
								<td> 
									<input type="checkbox" name="smscheck"></input>
								 	<input type="hidden" name="c_smscheck" id="c_smscheck"></input>
								</td>
							</tr>																																																		
							<c:forEach var="add" items="${addcuslist}" varStatus="vs">
							<tr>
								<th>${add.ac_colum}</th>
								<td> <input type="text" id="${add.ac_content}"></input> </td>
							</tr>
							</c:forEach>
                        </thead>
                    </table>
                	</div> <!-- table-responsive end -->
			      </div> <!-- modal-body -->
			      <div class="modal-footer">
			        <button type="reset" class="btn btn-default" data-dismiss="modal">취소</button>
			        <button type="submit" name="submit" class="btn btn-primary" onclick="clinesrt()" value="check" >생성하기</button>
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
		<%--  DAUM 우편번호 API 시작   --%>
					<span>						
						<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:auto;position:relative">
						  <img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
						</div>
						<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
					</span>    
				</div>
			  </div>
			</div>

		
				<script>
				/* 1번째 모달 */
					$("#myBtn").on( "click", function() {
						$('.modal-body').find($('input[name=c_name]')).attr('value','');
						$('.modal-body').find($('select[name=c_gender] option:selected')).removeAttr("selected");
						$('.modal-body').find($('select[name=c_gender]')).attr("value", '');
						$('.modal-body').find($('input[name=c_address]')).attr('value','');
						$('.modal-body').find($('input[name=c_address2]')).attr('value', '');
						$('.modal-body').find($('input[name=c_zip]')).attr('value', '');
						$('.modal-body').find($('input[name=c_tel]')).attr('value', '');
	                	$('.modal-body').find($("input:checkbox[name='smscheck']")).prop("checked", false);
	                	$('.modal-content').find($('button[name=submit]')).attr("onclick", 'clinesrt()');
				        $("#test_modal").modal();
						});
					
				   function clinesrt(){
						if($("input:checkbox[name='smscheck']").is(":checked") == true){
							$("#c_smscheck").val('Y');
						} else if($("input:checkbox[name='smscheck']").is(":checked") == false){
							$("#c_smscheck").val('N');
						}//if end
						
						document.client.action = "/admin/clinsert";
						document.client.submit();
				   }// clinsert()
				   
			       // 우편번호 찾기 화면을 넣을 element
				    var element_wrap = document.getElementById('wrap');
				
				    function foldDaumPostcode() {
				        // iframe을 넣은 element를 안보이게 한다.
				        element_wrap.style.display = 'none';
				    }
				
				    function DaumPostcode() {
				        // 현재 scroll 위치를 저장해놓는다.
				        $("#test_modal2").modal();
				        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
				        new daum.Postcode({
				            oncomplete: function(data) {
				                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				
				                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
				                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				                var fullAddr = data.address; // 최종 주소 변수
				                var extraAddr = ''; // 조합형 주소 변수
				
				                // 기본 주소가 도로명 타입일때 조합한다.
				                if(data.addressType === 'R'){
				                    //법정동명이 있을 경우 추가한다.
				                    if(data.bname !== ''){
				                        extraAddr += data.bname;
				                    }
				                    // 건물명이 있을 경우 추가한다.
				                    if(data.buildingName !== ''){
				                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				                    }
				                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
				                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
				                }
				
				                // 우편번호와 주소 정보를 해당 필드에 넣는다.
				                document.getElementById('c_zip').value = data.zonecode; //5자리 새우편번호 사용
				                document.getElementById('c_address').value = fullAddr;
				
				                // iframe을 넣은 element를 안보이게 한다.
				                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
				                element_wrap.style.display = 'none';
				
				                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
				                document.body.scrollTop = currentScroll;
				                
				                $('#c_address2').focus();
				            },
				            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
				            onresize : function(size) {
				                element_wrap.style.height = size.height+'px';
				            },
				            width : '100%',
				            height : '100%'
				        }).embed(element_wrap);
				
				        // iframe을 넣은 element를 보이게 한다.
				        element_wrap.style.display = 'block';
				    }
				    <!-- ----- DAUM 우편번호 API 종료----- -->
				</script>
		<%-- 고객 생성하기 버튼 끝 ---------------------------------------------------------------------------------------------------------%>
            
        <form name="frm" method="post">
                <!-- 승인/거절 버튼 -->
            
                <div class="table-responsive">
                    <table class="table table-hover" id="dataTable2" width="100%" cellspacing="0" >
                        <thead>
                            <tr>
								<th><p align="right" style="padding-right: 10px" class="text-primary"><input type="checkbox" id="checkAll"></p></th>                            
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
                                	<td onclick="event.cancelBubble=true"><input type="checkbox" name="chkList" id="chkList" value="${dto.c_code}"><input type="hidden" name="checkid" id="checkid" value="${id}"></td>
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
			                document.frm.action = "/admin/delclient";
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
		    			url:"/admin/clread",
		    			data:{'c_code': data},
	    		        success : function(client){  
	    	                   // alert('연결성공!'); //출력 되면 연결 성공을 알 수 있땅 
	    	                   // alert(client.c_code);  // 경고 창에 JSP파일의 내용이 떠야 한다.
	    	                   $('.modal-body').find($('input[name=c_code]')).attr('value',client.c_code);
	    	                   $('.modal-body').find($('input[name=c_name]')).attr('value',client.c_name);
    	                	   $('.modal-body').find($('select[name=c_gender] option:selected')).removeAttr("selected");
	    	                   if (client.c_gender == "M"){
	    	                   		$('.modal-body').find($('select option[value="M"]')).attr("selected",true);
	    	                   } else {
	    	                	   $('.modal-body').find($('select option[value="F"]')).attr("selected",true);
	    	                   }
	    	                	  // $("select option[value='B']").attr("selected","selected");
	    	                   $('.modal-body').find($('input[name=c_address]')).attr('value',client.c_address);
	    	                   $('.modal-body').find($('input[name=c_address2]')).attr('value',client.c_address2);
	    	                   $('.modal-body').find($('input[name=c_zip]')).attr('value',client.c_zip);
	    	                   $('.modal-body').find($('input[name=c_tel]')).attr('value',client.c_tel);
	    	                   if (client.c_smscheck == "Y") {
	    	                	   $('.modal-body').find($("input:checkbox[name='smscheck']")).prop("checked", true);
	    	                   } else {
	    	                	   $('.modal-body').find($("input:checkbox[name='smscheck']")).prop("checked", false);
	    	                   }
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
		        	
					if($("input:checkbox[name='smscheck']").is(":checked") == true){
						$("#c_smscheck").val('Y');
					} else if($("input:checkbox[name='smscheck']").is(":checked") == false){
						$("#c_smscheck").val('N');
					}//if end
		        	
		        	document.client.action = "/admin/upclient";
	                document.client.submit();
		        	// alert("changed");
		        	
		        }// change() end
		        
			</script>   
			</div>                 
                       <!-- 페이징 list -->
					<c:set var="pageCount" value="${totalPage}"></c:set>
					<c:set var="startPage" value="${startPage}"></c:set>
					<c:set var="endPage"   value="${endPage}"></c:set>
					<c:set var="page" value="${page}"></c:set>
					
					    <!-- 페이징 list 끝 -->
					
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
				</div> <!-- cart-footer END -->
		</div><!-- 커뮤니티 구성원 목록 끝 -->

<%@include file="./footer2.jsp" %>