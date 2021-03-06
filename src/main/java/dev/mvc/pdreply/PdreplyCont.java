package dev.mvc.pdreply;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.admin.AdminProcInter;
import dev.mvc.pdcontents.PdcontentsProcInter;
import dev.mvc.pdcontents.PdcontentsVO;

@Controller
public class PdreplyCont {
  @Autowired
  @Qualifier("dev.mvc.pdreply.PdreplyProc")
  private PdreplyProcInter pdreplyProc;
  
  @Autowired
  @Qualifier("dev.mvc.admin.AdminProc")
  private AdminProcInter adminProc;
  
  @Autowired
  @Qualifier("dev.mvc.pdcontents.PdcontentsProc")
  private PdcontentsProcInter pdcontentsProc;
  
  public PdreplyCont(){
    System.out.println("--> PdreplyCont created.");
  }
  
  /**
   * 댓글 등록
   * @param pdreplyVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/pdreply/create.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String create_reply(PdreplyVO pdreplyVO) {
    int count = pdreplyProc.create(pdreplyVO);
    
    // 해당 상품 읽기 
    PdcontentsVO pdcontentsVO = pdcontentsProc.read(pdreplyVO.getPdcontentsno());
    int reply_cnt = 0;
     // 댓글 등록 시 pdcontents 댓글 수 증가 
    if (count == 1) {
      pdcontentsProc.increasePdreplycnt(pdreplyVO.getPdcontentsno());
      // 해당 상품 댓글 개수 확인
      reply_cnt = pdcontentsVO.getReplycnt();
      System.out.println("reply_cnt" + reply_cnt);
    }

    // 상품 추천 평점 저장
    if(reply_cnt == 0) {
      int recom = pdreplyVO.getStarcnt();
      pdcontentsVO.setRecom(recom);
    } else {
      float recom = (float) (((pdcontentsVO.getRecom() * reply_cnt) + pdreplyVO.getStarcnt())/(reply_cnt+1));
      pdcontentsVO.setRecom(recom);
    }
    
    int cnt = pdcontentsProc.update_recom(pdcontentsVO);
    
    if( cnt == 1 ) {
      System.out.println("recom_update성공");
      System.out.println("reply_cnt: " + reply_cnt);
      System.out.println("recom: " + pdcontentsVO.getRecom());
    }else {
      System.out.println("recom_update실패");
    }
    JSONObject obj = new JSONObject();
    obj.put("count", count);
    
    return obj.toString(); // {"count":1}
    
  }
  
  /**
   * 댓글 목록
   * @param session
   * @return
   */
  @RequestMapping(value = "/pdreply/list.do", method = RequestMethod.GET)
  public ModelAndView list_all(HttpSession session) {
    ModelAndView mav = new ModelAndView();

    if(adminProc.isAdmin(session)) {
      List<PdreplyVO> list = pdreplyProc.list();
      mav.addObject("list", list);
      mav.setViewName("/pdreply/list"); // /webapp/reply/list.jsp
    } else {
      mav.setViewName("redirect/admin/login_need.jsp");  //  /webapp/admin/login_need.jsp
    }
    return mav;
  }

  /**
   * 댓글 상품별 목록 
   * @param contentsno
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/pdreply/list_by_pdcontentsno.do",
                            method = RequestMethod.GET,
                            produces = "text/plain;charset=UTF-8")
  public String list_by_contentsno(int pdcontentsno) {
    List<PdreplyVO> list = pdreplyProc.list_by_pdcontentsno(pdcontentsno);
    
    JSONObject obj = new JSONObject();
    obj.put("list", list);
    
    return obj.toString(); // {"count":1}
    
  }
  
  /**
   * 댓글 리스트 조인
   * @param pdcontentsno
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/pdreply/list_by_pdcontentsno_join.do",
                            method = RequestMethod.GET,
                            produces = "text/plain;charset=UTF-8")
  public String list_by_contentsno_join(int pdcontentsno) {
    // String msg="JSON 출력";
    // return msg;
    
    List<PdreplyMemberVO> list = pdreplyProc.list_by_pdcontentsno_join(pdcontentsno);
    
    JSONObject obj = new JSONObject();
    obj.put("list", list);
    
    return obj.toString(); 
    
  }
}