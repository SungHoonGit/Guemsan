package kr.co.guemsan.member;

import java.io.File;
import java.util.Date;
import java.util.Map;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.Out;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;



@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	MemberDAO memberDAO;
	
	public MemberController() {
		System.out.println("---- MemberController()객체 생성됨. ");
	}// end
	
	@RequestMapping("/login")
	public ModelAndView login(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		System.out.println(req.getHeader("Referer"));
		String page = "";
		if (req.getHeader("Referer") != null) {
			page = "redirect:/";
		} else if (req.getHeader("Referer") == "http://localhost:9095/member/insert"){
			page = "redirect:" + req.getHeader("Referer");
		} else {
			page = "redirect:/";
		} // if end
		System.out.println(page);
		mav.addObject("page", page);
		
		mav.setViewName("member/login");
		return mav;
	}// home() end

	@RequestMapping("/logincheck")
	public ModelAndView logincheck(@ModelAttribute LoginDTO dto, HttpSession session, @RequestParam String prevPage, HttpServletRequest req, HttpServletResponse resp) throws Exception {
		ModelAndView mav = new ModelAndView();
		System.out.println(dto);
		
		String m_id = dto.getM_id();
		String c_id = Utility.checkNull(req.getParameter("c_id"));
		System.out.println("cid"+c_id);
		System.out.println("mid"+m_id);
		Cookie cookie = null;
		if(memberDAO.logincheck(dto) == null) {
			mav.setViewName("member/logincheck");
		}else {
			mav.setViewName(prevPage);
			mav.addObject("member", memberDAO.logincheck(dto));
			session.setAttribute("id", memberDAO.logincheck(dto).getM_id());
			if(c_id.equals("SAVE")) {
				cookie = new Cookie("c_id", m_id);
				cookie.setMaxAge(60*60*24*30);
			} else {
				cookie = new Cookie("c_id", "");
				cookie.setMaxAge(0);
			} // if end
			resp.addCookie(cookie);
			System.out.println("cookie : "+cookie);
		}
		return mav;
	}// home() end
	
	// 로그아웃
	@RequestMapping("/logout")
	 public ModelAndView logout(HttpSession session) {
		 session.removeAttribute("id");
		 ModelAndView mav=new ModelAndView();
		 mav.setViewName("redirect:/");
		 return mav;
	}//logout() end
		
	// 이용약관 불러오기	
	@RequestMapping("/agreement")
	public ModelAndView agreement() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/agreement");
		return mav;
	}// home() end	

	// 회원가입 폼 불러오기
	@RequestMapping("/memberform")
	public ModelAndView member() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/memberform");
		return mav;
	}// Member() end
	
	// 아이디 중복확인 버튼을 눌렀을때 버튼옆에 출력하기
	@RequestMapping("idcheckproc.do")
	@ResponseBody
	public String idcheckproc(HttpServletRequest req) throws Exception {
		String userid = req.getParameter("m_id");
		String message = "";
		String checkid = memberDAO.checkid(userid);
		
		if (userid.length()<5 || userid.length()>15) {
			message = "<span style='color: red; font-weight: bold'>아이디는 5~15글자 이내 입력해주세요</span>";
		} else {
			if (userid.equals(checkid) ) {
				message = "<span style='color: red; font-weight: bold'>중복된 아이디 입니다!!</span>";
			} else {
				message = "<span style='color: green; font-weight: bold'>사용가능한 아이디입니다~~~!</span>";
			} // if end
		} // if end
		return message;
	}// idCheckProc() end

	// 이메일 중복확인 버튼을 눌렀을때 버튼옆에 출력하기
	@RequestMapping("emailcheckproc.do")
	@ResponseBody
	public String emailCheckProc(HttpServletRequest req) {
		String useremail = req.getParameter("m_email").trim();
		String message = "";
		String checkemail = memberDAO.checkeamil(useremail);
		
		if (useremail.length()<5 || useremail.length()>25) {
			message = "<span style='color: red; font-weight: bold'>이메일은 5~25글자 이내 입력해주세요</span>";
		} else {
			if (useremail.equals(checkemail)) {
				message = "<span style='color: red; font-weight: bold'>중복된 이메일 입니다!!</span>";
			} else {
				message = "<span style='color: green; font-weight: bold'>사용가능한 아메일입니다~~~!</span>";
			} // if end
		} // if end
		return message;
	}// idCheckProc() end
	
	
	@RequestMapping("nicknamecheckproc.do")
	@ResponseBody
	public String nicknamecheckproc(HttpServletRequest req) {
		String usernickname = req.getParameter("m_nick").trim();
		String message = "";

		if (usernickname.length()<2 || usernickname.length()>8) {
			message = "<span style='color: red; font-weight: bold'>닉네임은 2~8글자 이내 입력해주세요</span>";
		} else {
			if (usernickname.equals("nick") || usernickname.equals("nickname")) {
				message = "<span style='color: red; font-weight: bold'>중복된 닉네임 입니다!!</span>";
			} else {
				message = "<span style='color: green; font-weight: bold'>사용가능한 닉네임입니다~~~!</span>";
			} // if end
		} // if end
		return message;
	}// idCheckProc() end
	
	// 회원가입을 했을때 member테이블에 insert하기 + 파일 저장
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	@ResponseBody	
	public ModelAndView insert(@ModelAttribute MemberDTO dto ,@RequestParam Map<String, Object> map
						, @RequestParam(value = "file", required = false)  MultipartFile img 
						, HttpServletRequest req) throws Exception {

		/*
		  System.out.println("아이디:" + req.getParameter("m_id"));
		 * System.out.println("비번:" + req.getParameter("passwd"));
		 * System.out.println("이름:" + req.getParameter("mname"));
		 * System.out.println("이메일:" + req.getParameter("m_mail"));
		 * System.out.println("닉네임:" + req.getParameter("nickname"));
		 * System.out.println("생년:" + req.getParameter("my_year"));
		 * System.out.println("월:" + req.getParameter("month")); System.out.println("일:"
		 * + req.getParameter("day")); System.out.println("주소:" +
		 * req.getParameter("address1")); System.out.println("주소2:" +
		 * req.getParameter("address2")); System.out.println("직업:" +
		 * req.getParameter("job")); System.out.println("전화번호:" +
		 * req.getParameter("tel"));
		 */
		ModelAndView mav=new ModelAndView();
		
		String imgname="/storage/profile_none.png";
		if(img != null && !img.isEmpty()) {
			imgname=img.getOriginalFilename();
			try {
				ServletContext appliaction=req.getSession().getServletContext();
				String path= appliaction.getRealPath("/storage");
				img.transferTo(new File(path+"/"+imgname)); 	//파일 저장
			} catch (Exception e) {
				e.printStackTrace();
			}//try end
		}//if end
		map.put("imgname", imgname);
		
		MemberDTO member = new MemberDTO();
	//	member.setM_img(imgname);				//--sql멤버테이블 수정(추가)
		member.setM_id(dto.getM_id());
		member.setM_pw(dto.getM_pw());
		member.setM_name(dto.getM_name());
	//	member.setM_nick(dto.getM_nick());
		member.setM_birth(dto.getM_birth());
		member.setM_gender(dto.getM_gender());
		member.setM_zip(dto.getM_zip());
		member.setM_add1(dto.getM_add1());
		member.setM_add2(dto.getM_add2());
		member.setM_tel(dto.getM_tel());
		member.setM_email(dto.getM_email());
	//	member.setM_mailcheck(dto.getM_mailcheck());
		member.setM_smscheck(dto.getM_smscheck());
		member.setM_rdate(dto.getM_rdate());
		
		memberDAO.memberinsert(member);
		
		mav.setViewName("member/welcomeform");
		
		return mav;
  
	}// insert() end	
	
	// 아이디/찾기 불러오기	
	@RequestMapping("/findid")
	public ModelAndView findid() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/findid");
		return mav;
	}// home() end
	
	@RequestMapping("/findidpw")
	public ModelAndView findidpw(MemberDTO dto) throws MessagingException {
		
		ModelAndView mav = new ModelAndView();
		// 아이디 찾기
		String id = memberDAO.findid(dto);
		
		if (id == null) {
			mav.addObject("result", "실패");
			mav.addObject("dto", dto);
			mav.setViewName("member/findresult");			
		} else {
		
        //[ 임시 비밀번호 발급]
        // 대문자, 소문자, 숫자를 이용해서 랜덤하게 10글자를 만들기
        String[] ch = {
                "A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z",
                "a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z",
                "0","1","2","3","4","5","6","7","8","9"
        };// ch[0]~ch[61] 인덱스
        
        StringBuilder imsiPW=new StringBuilder(); //2)임시 비밀번호
        for(int i=0; i<10; i++) {
            int num=(int)(Math.random()*ch.length);
            imsiPW.append(ch[num]);
        }//for end
        
        System.out.println(id);
        System.out.println(imsiPW);
        dto.setM_pw(imsiPW.toString());
        System.out.println(dto.getM_email());
        memberDAO.setpw(dto);
		
        //임시 비밀번호로 테이블이 수정 되었다면, 아이디와 비밀번호를 이메일 전송하기
        String content="⁙ 임시 비밀번호로 로그인 한 후, 회원 정보 수정에서 비밀번호를 변경하시기 바랍니다.";
        // content+="<style> table {margin:30px 30px 30px 50px; } th, td{ padding: 10px 5px;}</style>";
        content+="<div>";
        content+="<hr>";
        content+="<table style='margin:30px 30px 30px 50px; '>";
        content+="<tr>";
        content+="    <th style='padding: 15px;'>아이디</th>";
        content+="    <td style='padding: 15px;'>" + id + "</td>";
        content+="</tr>";
        content+="<tr>";
        content+="  <th style='padding: 15px;'>임시비밀번호</th>";
        content+="  <td style='padding: 15px;'>"+ imsiPW.toString() +"</td>";
        content+="</tr>";
        content+="	<tr><td style=\"padding: 15px; text-align:center\"colspan=\"2\"> <a href='http://ksa134652.cafe24.com'>천일건재 바로가기 </a></td></tr>";
        content+="</table>";
        
        content+="</div>";
        String mailServer="mw-002.cafe24.com"; //cafe24 메일서버
        Properties props=new Properties();
        props.put("mail.smtp.host", mailServer);
        props.put("mail.smtp.auth", true);
        Authenticator myAuth=new MyAuthenticator();//다형성
        Session sess=Session.getInstance(props, myAuth);
 
        InternetAddress[] address={ new InternetAddress(dto.getM_email()) };
        Message msg=new MimeMessage(sess);
        msg.setRecipients(Message.RecipientType.TO, address);
        msg.setFrom(new InternetAddress("ksa134652@gmail.com"));
        msg.setSubject("Myweb 아이디/비번 입니다.");
        msg.setContent(content, "text/html; charset=UTF-8");
        msg.setSentDate(new Date());
        Transport.send(msg);
        
        mav.addObject("result", "성공");
		mav.addObject("dto", dto);
		mav.setViewName("member/findresult");
		}
		return mav;
	}// home() end	
}// class end
