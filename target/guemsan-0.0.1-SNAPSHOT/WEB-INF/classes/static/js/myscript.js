/** myscript.js */

function loginCheck() { // 로그인 유효성 검사 (아이디, 비번)
	//1) 아이디 5~10글자 이내인지 검사
	alert("check!!");
	let id=document.getElementById("m_id").value;
	id=id.trim();
	if(!(id.length>=5 && id.length<=16)) {
		alert("아이디 5~16글자이내 입력해 주세요");
		document.getElementById("m_id").focus();
		return false;
	}// if end
	
	//2) 비밀번호 5~10글자 이내인지 검사
	let passwd=document.getElementById("m_pw").value; 
	passwd=passwd.trim();
	if(!(passwd.length>=5 && passwd.length<=16)) {
				alert("비밀번호 5~16글자이내 입력해 주세요");
		document.getElementById("m_pw").focus();
		return false;
	}// if end
}// loginCheck() end