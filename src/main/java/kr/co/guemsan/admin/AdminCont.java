package kr.co.guemsan.admin;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;




@Controller
@RequestMapping("/admin")
public class AdminCont {
	
	public AdminCont() {
		System.out.println("---- adminCont() 생성됨.");
	}
	
	@Autowired
	AdminDAO adminDAO;
	
	@RequestMapping("/")
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView();
		// System.out.println("check1");
		mav.setViewName("/admin/index");
		return mav;
	}// home() end
	
	@RequestMapping(value="/clientlist/{c_id}" , method=RequestMethod.GET)
	public ModelAndView cuslist(@PathVariable String c_id ,@RequestParam String pageNum, @RequestParam(defaultValue = "new") String order, HttpSession session) {

		System.out.println(c_id);
	   int totalRowCount = Integer.parseInt(adminDAO.cuslistmax(c_id));    //총 행 갯수
	
	    //페이징
	   	// System.out.println(pageNum);
	    int numPerPage   = 10;   //한 페이지당 행 갯수
	    int pagePerBlock = 10;  //페이지 리스트(1~10페이지 : 1세트에 10페이지)
	
	    if(pageNum == null){    //페이징 번호의 a태그 명령어 ? 뒤에서 받아옴
	        pageNum = "1";      //자료가 없으면 무조건 1페이지
	    }
	    
	    int currentPage = Integer.parseInt(pageNum);        //현재 2페이지라면,
	    int startRow    = (currentPage-1)*numPerPage+1;     //시작 rnum은 6
	    int endRow      = currentPage * numPerPage;         //끝 rnum은 10
	
	    //페이지 수
	    double totcnt = (double)totalRowCount/numPerPage;   //총 페이지수 = 글갯수/5
	    int totalPage = (int)Math.ceil(totcnt);             //올림해서 정수형으로 변환
	
	    //페이지가 10이 넘어가면 11~20 페이지가 나와야 함(2세트)
	    double d_page = (double)currentPage/pagePerBlock;   //12페이지라면, 1.2
	    int Pages     = (int)Math.ceil(d_page) - 1;         //1
	    int startPage = Pages * pagePerBlock + 1;           //11
	    int endPage   = startPage + pagePerBlock - 1;       //20
	    
	    ClientDTO rows = new ClientDTO();
	    rows.setStartRow(startRow);
	    rows.setEndRow(endRow);
	    rows.setC_id(c_id);
		
 	    System.out.println("keyword : "+ adminDAO.cuslistmax(c_id));
 	    System.out.println("total : "+totalRowCount);
 	    System.out.println(currentPage);
 	    System.out.println("check"+pageNum);
 		System.out.println("check"+startPage);
 		System.out.println("check"+endPage);
 		
		ModelAndView mav = new ModelAndView();
        mav.addObject("pageNum", currentPage);
        mav.addObject("count", totalRowCount);
        mav.addObject("totalPage", totalPage);
        mav.addObject("startPage", startPage);
        mav.addObject("endPage", endPage);
        mav.addObject("rows", rows);		
        mav.addObject("cuslist", adminDAO.pageclientlist(rows));
		mav.addObject("list", adminDAO.clientlist(c_id));
		//mav.addObject("addcuslist", adminDAO.addclientlist());
		mav.addObject("cuslistmax", adminDAO.cuslistmax(c_id));
		mav.addObject("page", "/admin/clientlist/"+c_id+"");
		mav.setViewName("admin/clientlist");
		return mav;
	}
	
    @RequestMapping(value="/search/{c_id}" , method=RequestMethod.GET)
    public ModelAndView search(@PathVariable String c_id ,@RequestParam String pageNum, @RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "new") String order){
    	ClientDTO keywords = new ClientDTO();
    	keywords.setKeyword(keyword);
    	keywords.setC_id(c_id);
 	   int totalRowCount = Integer.parseInt(adminDAO.searchmax(keywords));    //총 행 갯수
 	   
 	    //페이징
 	   	// System.out.println(pageNum);
 	    int numPerPage   = 10;   //한 페이지당 행 갯수
 	    int pagePerBlock = 10;  //페이지 리스트(1~10페이지 : 1세트에 10페이지)
 	
 	    if(pageNum == null){    //페이징 번호의 a태그 명령어 ? 뒤에서 받아옴
 	        pageNum = "1";      //자료가 없으면 무조건 1페이지
 	    }
 	    
 	    int currentPage = Integer.parseInt(pageNum);        //현재 2페이지라면,
 	    int startRow    = (currentPage-1)*numPerPage+1;     //시작 rnum은 6
 	    int endRow      = currentPage * numPerPage;         //끝 rnum은 10
 	
 	    //페이지 수
 	    double totcnt = (double)totalRowCount/numPerPage;   //총 페이지수 = 글갯수/5
 	    int totalPage = (int)Math.ceil(totcnt);             //올림해서 정수형으로 변환
 	
 	    //페이지가 10이 넘어가면 11~20 페이지가 나와야 함(2세트)
 	    double d_page = (double)currentPage/pagePerBlock;   //12페이지라면, 1.2
 	    int Pages     = (int)Math.ceil(d_page) - 1;         //1
 	    int startPage = Pages * pagePerBlock + 1;           //11
 	    int endPage   = startPage + pagePerBlock - 1;       //20
 	    
 	    ClientDTO rows = new ClientDTO();
 	    rows.setStartRow(startRow);
 	    rows.setEndRow(endRow);
 	    rows.setC_id(c_id);
 	    rows.setKeyword(keyword);
 	    
 	    System.out.println("keyword : "+ adminDAO.searchmax(keywords));
 	    System.out.println("total : "+totalRowCount);
 	    System.out.println(currentPage);
 	    System.out.println("check"+pageNum);
 		System.out.println("check"+startPage);
 		System.out.println("check"+endPage);
 		
 		ModelAndView mav = new ModelAndView();
         mav.addObject("pageNum", currentPage);
         mav.addObject("count", totalRowCount);
         mav.addObject("totalPage", totalPage);
         mav.addObject("startPage", startPage);
         mav.addObject("endPage", endPage);
         mav.addObject("rows", rows);		
        mav.setViewName("admin/clientlist");
        mav.addObject("keyword", keyword);
        mav.addObject("cuslist", adminDAO.pagesearch(rows));
        mav.addObject("list", adminDAO.search(keywords));
        //mav.addObject("addcuslist", adminDAO.addclientlist());
        mav.addObject("cuslistmax", adminDAO.searchmax(keywords));
        mav.addObject("page", "/admin/search/"+c_id+"");
        return mav;
    }//search() end	
	
    @RequestMapping(value = "/clinsert", method = RequestMethod.POST)
    public ModelAndView createForm(@ModelAttribute ClientDTO dto, HttpServletRequest request) throws Exception{
        //파일명 리네임 구현 안 했음.
    	String c_id = dto.getC_id();
        ModelAndView mav = new ModelAndView();
        dto.setC_code(dto.getC_code());
        dto.setC_id(c_id);
        dto.setC_name(dto.getC_name());
        dto.setC_gender(dto.getC_gender());
        dto.setC_address(dto.getC_address());
        dto.setC_address2(dto.getC_address2());
        dto.setC_zip(dto.getC_zip());
        dto.setC_tel(dto.getC_tel());
        dto.setC_smscheck(dto.getC_smscheck());
        dto.setC_rdate(dto.getC_rdate());

        //System.out.println(dto);
        adminDAO.insert(dto);
//        mav.addObject("cuslist", adminDAO.clientlist());
//		mav.addObject("addcuslist", adminDAO.addclientlist());
//		mav.addObject("cuslistmax", adminDAO.cuslistmax());
        mav.setViewName("redirect:/admin/clientlist/"+c_id+"?pageNum=1");    //메인으로 돌아가기
        return mav;
    }//createForm() end
    
    @RequestMapping(value = "/delclient", method = RequestMethod.POST)
    public String delclient(HttpServletRequest req){

        String[] chkArray = req.getParameterValues("chkList");
        String c_id = req.getParameter("checkid");
        List<ClientDTO> delclient = new ArrayList<>();

        for(int i=0; i<chkArray.length; i++){
            //String ac_no = chkArray[i];
            //System.out.println(ac_no);

            ClientDTO dto = new ClientDTO();
            dto.setC_code(chkArray[i]);
            delclient.add(dto);
        }//for end
        // System.out.println(delclient);
        adminDAO.delclient(delclient);
        return "redirect:/admin/clientlist/"+c_id+"?pageNum=1";
    }//approveMember() end

	@RequestMapping(value = "/clread", method = RequestMethod.GET)
	@ResponseBody
	public ClientDTO write(@RequestParam String c_code, Model model) throws Exception {
		System.out.println(c_code);
		ClientDTO dto = new ClientDTO();
		dto = adminDAO.clread(c_code);
		//System.out.println(dto);
		model.addAttribute("client", dto);
		return dto;
	}// write() end    
	
    @RequestMapping(value = "/upclient", method = RequestMethod.POST)
    public ModelAndView updateForm(@ModelAttribute ClientDTO dto, HttpServletRequest request) throws Exception{
        //파일명 리네임 구현 안 했음.
        ModelAndView mav = new ModelAndView();
        String c_id = dto.getC_id();
        dto.setC_code(dto.getC_code());
        dto.setC_id(c_id);
        dto.setC_name(dto.getC_name());
        dto.setC_gender(dto.getC_gender());
        dto.setC_address(dto.getC_address());
        dto.setC_address2(dto.getC_address2());
        dto.setC_zip(dto.getC_zip());
        dto.setC_tel(dto.getC_tel());
        dto.setC_smscheck(dto.getC_smscheck());
        dto.setC_rdate(dto.getC_rdate());
        
        //System.out.println(dto);
        adminDAO.update(dto);
        mav.setViewName("redirect:/admin/clientlist/"+c_id+"?pageNum=1");    //메인으로 돌아가기
        return mav;
    }//createForm() end	
    
    
// Account List
    
    @RequestMapping(value="/accountlist/{r_id}" , method=RequestMethod.GET)
    public ModelAndView acountsearch(@PathVariable String r_id ,@RequestParam String pageNum, @RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "new") String order){
    	RecordDTO keywords = new RecordDTO();
    	keywords.setKeyword(keyword);
    	keywords.setR_id(r_id);
    	
 	   int totalRowCount = Integer.parseInt(adminDAO.accountmax(keywords));    //총 행 갯수
 	   
 	    //페이징
 	   	// System.out.println(pageNum);
 	    int numPerPage   = 10;   //한 페이지당 행 갯수
 	    int pagePerBlock = 10;  //페이지 리스트(1~10페이지 : 1세트에 10페이지)
 	
 	    if(pageNum == null){    //페이징 번호의 a태그 명령어 ? 뒤에서 받아옴
 	        pageNum = "1";      //자료가 없으면 무조건 1페이지
 	    }
 	    
 	    int currentPage = Integer.parseInt(pageNum);        //현재 2페이지라면,
 	    int startRow    = (currentPage-1)*numPerPage+1;     //시작 rnum은 6
 	    int endRow      = currentPage * numPerPage;         //끝 rnum은 10
 	
 	    //페이지 수
 	    double totcnt = (double)totalRowCount/numPerPage;   //총 페이지수 = 글갯수/5
 	    int totalPage = (int)Math.ceil(totcnt);             //올림해서 정수형으로 변환
 	
 	    //페이지가 10이 넘어가면 11~20 페이지가 나와야 함(2세트)
 	    double d_page = (double)currentPage/pagePerBlock;   //12페이지라면, 1.2
 	    int Pages     = (int)Math.ceil(d_page) - 1;         //1
 	    int startPage = Pages * pagePerBlock + 1;           //11
 	    int endPage   = startPage + pagePerBlock - 1;       //20
 	    
 	    RecordDTO rows = new RecordDTO();
 	    rows.setStartRow(startRow);
 	    rows.setEndRow(endRow);
 	    rows.setR_id(r_id);
 	    rows.setKeyword(keyword);
 	    
// 	    System.out.println("keyword : "+ adminDAO.accountmax(keywords));
// 	    System.out.println( adminDAO.accountsearch(rows));
// 	    System.out.println( adminDAO.acsearch(keywords));
// 	    System.out.println( adminDAO.clientlist(r_id));
 	    
 		ModelAndView mav = new ModelAndView();
         mav.addObject("pageNum", currentPage);
         mav.addObject("count", totalRowCount);
         mav.addObject("totalPage", totalPage);
         mav.addObject("startPage", startPage);
         mav.addObject("endPage", endPage);
         mav.addObject("rows", rows);		
        mav.setViewName("admin/accountlist");
        mav.addObject("keyword", keyword);
        mav.addObject("cuslist", adminDAO.accountsearch(rows));
        mav.addObject("list", adminDAO.acsearch(keywords));
        mav.addObject("cllist", adminDAO.clientlist(r_id));
        //mav.addObject("addcuslist", adminDAO.addclientlist());
        mav.addObject("cuslistmax", adminDAO.accountmax(keywords));
        mav.addObject("page", "/admin/accountlist/"+r_id+"");
        return mav;
    }//search() end	    
    

    @RequestMapping(value = "/delaccount", method = RequestMethod.POST)
    public String delaccount(HttpServletRequest req){

        String[] chkArray = req.getParameterValues("chkList");
        String c_id = req.getParameter("checkid");
        List<RecordDTO> delaccount = new ArrayList<>();

        for(int i=0; i<chkArray.length; i++){
            //String ac_no = chkArray[i];
            //System.out.println(ac_no);

        	RecordDTO dto = new RecordDTO();
            dto.setR_acode(chkArray[i]);
            delaccount.add(dto);
        }//for end
        // System.out.println(delaccount);
        adminDAO.delaccount(delaccount);
        return "redirect:/admin/accountlist/"+c_id+"?pageNum=1";
    }//approveMember() end
    
    @RequestMapping(value = "/alinsert", method = RequestMethod.POST)
    public ModelAndView alinsert(@ModelAttribute RecordDTO dto, HttpServletRequest request) throws Exception{
        //파일명 리네임 구현 안 했음.
    	String r_id = dto.getR_id();
        ModelAndView mav = new ModelAndView();
        dto.setR_acode(dto.getR_acode());
        dto.setR_id(r_id);
        dto.setR_code(dto.getR_code());
        dto.setR_deli(dto.getR_deli());
        dto.setR_title(dto.getR_title());
        dto.setR_total(dto.getR_total());
        System.out.println(dto);

        //System.out.println(dto);
        adminDAO.alinsert(dto);
//        mav.addObject("cuslist", adminDAO.clientlist());
//		mav.addObject("addcuslist", adminDAO.addclientlist());
//		mav.addObject("cuslistmax", adminDAO.cuslistmax());
        mav.setViewName("redirect:/admin/accountlist/"+r_id+"?pageNum=1");    //메인으로 돌아가기
        return mav;
    }//createForm() end    
    
    @RequestMapping(value="/searchname/{c_id}" , method=RequestMethod.GET)
    @ResponseBody
    public List<ClientDTO> searchname(@PathVariable String c_id , @RequestParam(defaultValue = "") String keyword){
    	ClientDTO dto = new ClientDTO();
    	dto.setC_id(c_id);
    	dto.setKeyword(keyword);	
    	// System.out.println(adminDAO.search(dto));
    	return adminDAO.search(dto); 
    }// searchname() end
    
	@RequestMapping(value = "/acread", method = RequestMethod.GET)
	@ResponseBody
	public RecordDTO acwrite(@RequestParam String r_acode, Model model) throws Exception {
		// System.out.println(r_acode);
		RecordDTO dto = new RecordDTO();
		dto = adminDAO.acread(r_acode);
		// System.out.println(dto);
		model.addAttribute("client", dto);
		return dto;
	}// write() end      
    
	
    @RequestMapping(value = "/uprecord", method = RequestMethod.POST)
    public ModelAndView updaterecord(@ModelAttribute RecordDTO dto, HttpServletRequest request) throws Exception{
        //파일명 리네임 구현 안 했음.
        ModelAndView mav = new ModelAndView();
    	String r_id = dto.getR_id();
        dto.setR_acode(dto.getR_acode());
        dto.setR_id(r_id);
        dto.setR_code(dto.getR_code());
        dto.setR_deli(dto.getR_deli());
        dto.setR_title(dto.getR_title());
        dto.setR_total(dto.getR_total());
        
        //System.out.println(dto);
        adminDAO.recoupdate(dto);
        mav.setViewName("redirect:/admin/accountlist/"+r_id+"?pageNum=1");    //메인으로 돌아가기
        return mav;
    }//createForm() end

    @RequestMapping(value = { "/payed/{r_acode}/{r_dpay}", "/payed/{r_acode}" }, method = RequestMethod.POST)
    public String payed(@PathVariable(value = "r_acode", required = false ) String r_acode, @PathVariable(value = "r_dpay", required = false ) String r_dpay, HttpServletRequest req){
    	RecordDTO dto = new RecordDTO();
    	String c_id = req.getParameter("checkid");
    	if (r_dpay == null) {
            dto.setR_acode(r_acode);
            adminDAO.payed(dto);       		
    	}else {
            dto.setR_acode(r_acode);
            dto.setR_dpay(Integer.parseInt(r_dpay));
            adminDAO.payed(dto);    		
    	}// if end

        return "redirect:/admin/accountlist/"+c_id+"?pageNum=1";
    }//payed() end    
    
    @RequestMapping(value =  "/depayed/{r_acode}", method = RequestMethod.POST)
    public String depayed(@PathVariable(value = "r_acode", required = false ) String r_acode, HttpServletRequest req){
    	RecordDTO dto = new RecordDTO();
    	String c_id = req.getParameter("checkid");
        dto.setR_acode(r_acode);
        adminDAO.depayed(dto);       		

        return "redirect:/admin/accountlist/"+c_id+"?pageNum=1";
    }//payed() end       
    
    
    // admin page
    @RequestMapping(value = { "/cltable/{c_id}", "/cltable/"}, method = RequestMethod.GET)
    public ModelAndView cltable(@PathVariable(value = "c_id", required = false ) String c_id) {
    	System.out.println("cltable controller in -- "+c_id);
    	ModelAndView nav = new ModelAndView();
    	nav.addObject("cuslist", adminDAO.clientlist(c_id));
    	nav.setViewName("admin/cltable");
    	return nav;
    }
    
    @RequestMapping(value = {"/actable/{c_id}", "/actable/"}, method = RequestMethod.GET)
    public ModelAndView actable(@PathVariable( value = "c_id", required = false ) String c_id) {
    	System.out.println("actable controller in -- "+c_id);
    	ModelAndView nav = new ModelAndView();
    	System.out.println(adminDAO.accountlist(c_id));
    	nav.addObject("cuslist", adminDAO.accountlist(c_id));
    	nav.setViewName("admin/actable");
    	return nav;
    }
    
    @RequestMapping(value = {"/chart/{c_id}", "/chart/"}, method = RequestMethod.GET)
    public ModelAndView chart(@PathVariable( value = "c_id", required = false ) String c_id) {
    	System.out.println("chart controller in -- ");
    	ModelAndView nav = new ModelAndView();
    	nav.setViewName("admin/chart");
    	return nav;
    }
    
}// end