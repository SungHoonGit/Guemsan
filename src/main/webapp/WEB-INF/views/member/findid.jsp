<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>
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

<!-- 본문시작 findID.jsp -->
<hgroup>
<h1> 아이디/비번찾기</h1>
<h3> 이름과 이메일을 입력해주세요. </h3>
</hgroup>

<form name="Loginfrm" id="Loginfrm" method="post" action="/member/findidpw" onsubmit="return blankCheck()">
<div class="group">
<input type="text" name="m_name" id="m_name" minlength="2" maxlength="10" required><span class="highlight"></span><span class="bar"></span>
<label>Name</label>
</div>
  <div class="group">
    <input type="text" name="m_email" id="m_email" minlength="6" maxlength="16" required><span class="highlight"></span><span class="bar"></span>
    <label>E-mail</label>
  </div>
  <div>
   </div>
  <button type="submit" class="button buttonBlue">Find Id / PW
  </button>  
 <div>
	&nbsp;&nbsp;&nbsp;
	 <a href="/member/agreement">회원가입</a>
	&nbsp;&nbsp;&nbsp;     		
	 &nbsp;&nbsp;&nbsp;
	 <a href="/member/login"> 로그인 돌아가기 </a>
 </div>  

</form>
<footer><a href="http://www.polymer-project.org/" target="_blank"><img src="https://www.polymer-project.org/images/logos/p-logo.svg"></a>
  <p>You Gotta Love <a href="http://www.polymer-project.org/" target="_blank">Google</a></p>
</footer>

</body>
	<script>
	function blankCheck() {
		 try{
			/* let m_name=document.getElementById("m_name").value; */
			let m_name=$('#m_name').val();
			/* let m_email=document.getElementById("m_email").value; */
			let m_email=$('#m_email').val();
			m_name=m_name.trim();
			m_email=m_email.trim();
			if(m_name.length<2) {
				alert("이름은 2~10글자 이내로 입력해 주세요")
				return false;
			}//if end
			if(m_email.length<10) {
				alert("이메일은 10~20글자 이내로 입력해 주세요")
				return false;
			}// if end		
			return true;
		   } 
		   catch ( error ){
		      alert( error );
		      return false;
		   }
	}//blankCheck() end
	</script>

</script>	
</html>
