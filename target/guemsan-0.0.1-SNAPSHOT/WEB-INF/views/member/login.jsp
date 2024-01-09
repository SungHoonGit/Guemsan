<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>
<!-- 쿠키 확인 -->
	<!-- 쿠키 확인 -->
	<%
		Cookie[] cookies = request.getCookies();
		String c_id = "";
		if(cookies!=null){ // 쿠키가 존재하는지?
			for(int i=0; i<cookies.length; i++){
				Cookie cookie = cookies[i]; // 쿠키 하나씩 가져오기
				if(cookie.getName().equals("c_id")==true){
					c_id = cookie.getValue();	
				} // if end
			} // for end
		} // if end
	%>
<style>
* { box-sizing:border-box; }

a:link {
	color: #716192;
	text-decoration: none;
}

body {
	font-family: Helvetica;
	background: #eee;
  -webkit-font-smoothing: antialiased;
}

hgroup { 
	text-align:center;
	margin-top: 4em;
}

h1, h3 { font-weight: 300; }

h1 { color: #636363; }

h3 { color: #716192; }

form {
	width: 380px;
	margin: 4em auto;
	padding: 3em 2em 2em 2em;
	background: #fafafa;
	border: 1px solid #ebebeb;
	box-shadow: rgba(0,0,0,0.14902) 0px 1px 1px 0px,rgba(0,0,0,0.09804) 0px 1px 2px 0px;
}

.group { 
	position: relative; 
	margin-bottom: 45px; 
}

input[type="text"],[type="password"] {
	font-size: 18px;
	padding: 10px 10px 10px 5px;
	-webkit-appearance: none;
	display: block;
	background: #fafafa;
	color: #636363;
	width: 100%;
	border: none;
	border-radius: 0;
	border-bottom: 1px solid #757575;
}

input[type="text"]:focus { outline: none; }
input[type="password"]:focus { outline: none; }

/* Label */

label {
	color: #999; 
	font-size: 18px;
	font-weight: normal;
	position: absolute;
	pointer-events: none;
	left: 5px;
	top: 10px;
	transition: all 0.2s ease;
}


/* active */

input:focus ~ label, input.used ~ label {
	top: -20px;
  transform: scale(.75); left: -2px;
	/* font-size: 14px; */
	color: #716192;
}


/* Underline */

.bar {
	position: relative;
	display: block;
	width: 100%;
}

.bar:before, .bar:after {
	content: '';
	height: 2px; 
	width: 0;
	bottom: 1px; 
	position: absolute;
	background: #716192; 
	transition: all 0.2s ease;
}

.bar:before { left: 50%; }

.bar:after { right: 50%; }


/* active */

input[type="text"]:focus ~ .bar:before, input:focus ~ .bar:after { width: 50%; }
input[type="password"]:focus ~ .bar:before, input:focus ~ .bar:after { width: 50%; }

/* Highlight */

.highlight {
	position: absolute;
	height: 60%; 
	width: 100px; 
	top: 25%; 
	left: 0;
	pointer-events: none;
	opacity: 0.5;
}


/* active */

input[type="text"]:focus ~ .highlight {
	animation: inputHighlighter 0.3s ease;
}
input[type="password"]:focus ~ .highlight {
	animation: inputHighlighter 0.3s ease;
}


/* Animations */

@keyframes inputHighlighter {
	from { background: #716192; }
	to 	{ width: 0; background: transparent; }
}


/* Button */

.button {
  position: relative;
  display: inline-block;
  padding: 12px 24px;
  margin: .3em 0 1em 0;
  width: 100%;
  vertical-align: middle;
  color: #fff;
  font-size: 16px;
  line-height: 20px;
  -webkit-font-smoothing: antialiased;
  text-align: center;
  letter-spacing: 1px;
  background: transparent;
  border: 0;
  border-bottom: 2px solid #3160B6;
  cursor: pointer;
  transition: all 0.15s ease;
}
.button:focus { outline: 0; }


/* Button modifiers */

.buttonBlue {
  background: #716192;
  text-shadow: 1px 1px 0 rgba(39, 110, 204, .5);
}

.buttonBlue:hover { background: rgb(136 118 187 / 80%); }


footer { text-align: center; }

footer p {
	color: #888;
	font-size: 13px;
	letter-spacing: .4px;
}

footer a {
	color: #716192;
	text-decoration: none;
	transition: all .2s ease;
}

footer a:hover {
	color: rgb(136 118 187 / 80%);
	text-decoration: underline;
}

footer img {
	width: 80px;
	transition: all .2s ease;
}

footer img:hover { opacity: .83; }

footer img:focus , footer a:focus { outline: none; }
</style>
<script>
$(window, document, undefined).ready(function() {

	  $('input').blur(function() {
	    var $this = $(this);
	    if ($this.val())
	      $this.addClass('used');
	    else
	      $this.removeClass('used');
	  });

	});
</script>


	
<hgroup>
  <h1>Material Design Form</h1>
  <h3>By Josh Adamous <%=c_id%> </h3>
</hgroup>
<form name="Loginfrm" id="Loginfrm" action="/member/logincheck" onsubmit="return loginCheck()">
<input type="hidden" id="prevPage" name="prevPage" value="${page}">
  <div class="group">
  <c:set var="test" value="<%=c_id%>"></c:set>
  <c:choose>
  	<c:when test="${empty test }">
  		<input type="text" name="m_id" id="m_id" minlength="3" maxlength="16" required><span class="highlight"></span><span class="bar"></span>
  	</c:when>
  	<c:otherwise>
  		<input type="text" name="m_id" id="m_id" minlength="3" maxlength="16" value="<%=c_id%>" class="used" required><span class="highlight"></span><span class="bar"></span>
  	</c:otherwise>
  </c:choose>
    <label>Id</label>
  </div>
  <div class="group">
    <input type="password" name="m_pw" id="passwd" maxlength="16" required><span class="highlight"></span><span class="bar"></span>
    <label>Password</label>
  </div>
  <div>
   </div>
  <button type="submit" class="button buttonBlue">Login
  </button>
 <div>
	&nbsp;&nbsp;&nbsp;
	<input type="checkbox" value="SAVE" id="c_id" name="c_id" <%if(!c_id.isEmpty()){out.print("checked");}%>> 아이디 저장
	&nbsp;&nbsp;&nbsp;     		
	 <a href="/member/agreement">회원가입</a>
	 &nbsp;&nbsp;&nbsp;
	 <a href="/member/findid">아이디/비밀번호찾기</a>

 </div>
</form>
<footer><a href="http://www.polymer-project.org/" target="_blank"><img src="https://www.polymer-project.org/images/logos/p-logo.svg"></a>
  <p>You Gotta Love <a href="http://www.polymer-project.org/" target="_blank">Google</a></p>
</footer>

</body>
<script type="text/javascript">
function loginCheck() { // 로그인 유효성 검사 (아이디, 비번)
		
	//1) 아이디 5~10글자 이내인지 검사$
	/* let id=document.getElementById("m_id").value; */ 
	let id= $('#m_id').val();
	id=id.trim();
	if(!(id.length>=5 && id.length<=16)) {
		alert("아이디 5~16글자이내 입력해 주세요");
		document.getElementById("m_id").focus();
		return false;
	}// if end
	
	//2) 비밀번호 5~10글자 이내인지 검사
	/* let passwd=document.getElementById("m_pw").value; */ 
	let passwd= $('#m_pw').val();
	passwd=passwd.trim();
	if(!(passwd.length>=5 && passwd.length<=16)) {
				alert("비밀번호 5~16글자이내 입력해 주세요");
		document.getElementById("m_pw").focus();
		return false;
	}// if end
}// loginCheck() end
</script>	
</html>
