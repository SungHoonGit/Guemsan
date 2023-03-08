package kr.co.guemsan.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class MemberDAO {
	
	public MemberDAO() {
		System.out.println("---- MemberDAO() 객체 생성됨.");
	}// end
	
	@Autowired
	SqlSession sqlSession;
	
	public MemberDTO logincheck(LoginDTO dto) throws Exception {
		return sqlSession.selectOne("member.loginCheck", dto);
	}

	//회원가입
	public int memberinsert(MemberDTO member) {
		return sqlSession.insert("member.memberinsert", member);
	}//memberinsert() end	
	
	// 아이디 중복 확인
	public String checkid(String userid) {
		return sqlSession.selectOne("member.checkid", userid);
	}
	
	// 아이디 중복 확인
	public String checkeamil(String useremail) {
		return sqlSession.selectOne("member.checkeamil", useremail);
	}
	
	// 아이디 find
	public String findid(MemberDTO dto) {
		return sqlSession.selectOne("member.findid", dto);
	}	
	
	public int setpw(MemberDTO dto) {
		return sqlSession.update("member.setpw", dto);
	}
	
		
}// AdminDAO end
