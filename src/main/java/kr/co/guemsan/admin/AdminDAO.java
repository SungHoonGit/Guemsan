package kr.co.guemsan.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class AdminDAO {
	
	public AdminDAO() {
		System.out.println("---- AdminDAO() 객체 생성됨.");
	}// end
	
	@Autowired
	SqlSession sqlSession;
	
	public List<ClientDTO> pageclientlist(ClientDTO rows) {
		return sqlSession.selectList("client.pagelist", rows);
	}// 페이징 리스트
	
	public List<ClientDTO> clientlist(String c_id) {
		return sqlSession.selectList("client.list", c_id);
	}// 리스트
	
	public String cuslistmax(String c_id) {
		return sqlSession.selectOne("client.cuslistmax", c_id);
	}

    //목록페이지에서 검색
    public List<ClientDTO> pagesearch(ClientDTO rows){
        return sqlSession.selectList("client.pagesearch", rows);
    }//search() end
    
    public List<ClientDTO> search(ClientDTO keywords){
        return sqlSession.selectList("client.search", keywords);
    }//search() end    

	public String searchmax(ClientDTO keywords) {
		return sqlSession.selectOne("client.searchmax", keywords);
	}

	public List<addclientDTO> pageaddclientlist(ClientDTO rows) {
		return sqlSession.selectList("client.pageaddlist", rows);
	}
	
	public List<addclientDTO> addclientlist() {
		return sqlSession.selectList("client.addlist");
	}
	
	public int insert(ClientDTO dto) {
		return sqlSession.insert("client.insert", dto);
	}
	
	public int delclient(List<ClientDTO> delclient) {
		return sqlSession.delete("client.delclient", delclient);
	}

	public ClientDTO clread(String c_code) {
		return sqlSession.selectOne("client.clread", c_code);
	}
	
	public int update(ClientDTO dto) {
		return sqlSession.update("client.update", dto);
	}	
	
// Account list
	
	public String accountmax(RecordDTO keywords) {
		return sqlSession.selectOne("account.accountmax", keywords);
	}

    public List<RecordDTO> accountsearch(RecordDTO rows){
        return sqlSession.selectList("account.accountsearch", rows);
    }//search() end
    
    public List<RecordDTO> acsearch(RecordDTO keywords){
        return sqlSession.selectList("account.search", keywords);
    }//search() end        
	
	public int delaccount(List<RecordDTO> delaccount) {
		return sqlSession.delete("account.delaccount", delaccount);
	}    
	
	public int alinsert(RecordDTO dto) {
		return sqlSession.insert("account.alinsert", dto);
	}
	
	public RecordDTO acread(String r_acode) {
		return sqlSession.selectOne("account.acread", r_acode);
	}	

	public int recoupdate(RecordDTO dto) {
		System.out.println("test2");
		return sqlSession.update("account.recoupdate", dto);
	}

	public int payed(RecordDTO dto) {
		return sqlSession.update("account.payed", dto);
	}		

	public int depayed(RecordDTO dto) {
		return sqlSession.update("account.depayed", dto);
	}		
	
	public List<RecordDTO> accountlist(String r_id) {
		return sqlSession.selectList("account.aclist", r_id);
	}// 리스트		
}// AdminDAO end
