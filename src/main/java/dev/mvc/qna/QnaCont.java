package dev.mvc.qna;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
public class QnaCont {
	@Autowired
	@Qualifier("dev.mvc.qna.QnaProc")
	private QnaProcInter qnaProc;
	
	public QnaCont() {
		System.out.println("-->QNA created");
	}
	
	// http://localhost:9090/team3/qna/create.do
	@RequestMapping(value="/qna/create.do", method=RequestMethod.GET)
	public ModelAndView create() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/qna/create"); 
		    
		return mav;
	}
	
	@RequestMapping(value="/qna/create.do", method=RequestMethod.POST)
  public ModelAndView create(QnaVO qnaVO) {
    ModelAndView mav = new ModelAndView();
    
    int count = qnaProc.create(qnaVO);
    
    if (count == 1) {
      mav.setViewName("redirect:/qna/create_msg.jsp?count=" + count);
    } else {
      mav.setViewName("redirect:/qna/list.do");
    }
        
    return mav;
  }
	//목록
	 @RequestMapping(value="/qna/list.do", method=RequestMethod.GET)
	  public ModelAndView list(){
	    ModelAndView mav = new ModelAndView();
	    
	    List<QnaVO> list = qnaProc.list();
	    mav.addObject("list", list);
	    mav.setViewName("/qna/list"); 
	    
	    return mav;
	 }
	
	 //조회
	 @RequestMapping(value="/qna/read.do", method=RequestMethod.GET)
   public ModelAndView read(int qnano){
	   ModelAndView mav = new ModelAndView();
	   QnaVO qnaVO = qnaProc.read(qnano);
	   mav.addObject("qnaVO",qnaVO);
	   mav.setViewName("/qna/read"); 
	   
	   return mav;
	 }
	 
	 //수정
	 @RequestMapping(value="/qna/update.do", method=RequestMethod.GET)
   public ModelAndView update(int qnano){
     ModelAndView mav = new ModelAndView();
     QnaVO qnaVO = qnaProc.read(qnano);
     
     mav.addObject("qnaVO",qnaVO);
     mav.setViewName("/qna/update"); 
     
     return mav;
	 }
	 
	 @RequestMapping(value="/qna/update.do", method=RequestMethod.POST)
   public ModelAndView update(QnaVO qnaVO){
     ModelAndView mav = new ModelAndView();
     
     int count = qnaProc.update(qnaVO);
     String url = "redirect:/qna/update_msg.jsp?count=" + count +
                       "&qnano=" + qnaVO.getQnano();
     mav.setViewName(url);
                                
     return mav;
	 }
	 
	 // 삭제
	 @RequestMapping(value="/qna/delete.do", method=RequestMethod.GET)
   public ModelAndView delete(int qnano){
     ModelAndView mav = new ModelAndView();
	 
     QnaVO qnaVO = qnaProc.read(qnano);
     mav.addObject("qnaVO", qnaVO);
     
     mav.setViewName("/qna/delete");
     
     return mav;
	 }
	 
	 @RequestMapping(value="/qna/delete.do", method=RequestMethod.POST)
   public ModelAndView delete(HttpSession session, 
                                        RedirectAttributes ra,
                                        int qnano){
     ModelAndView mav = new ModelAndView();
     
     int memberno = (Integer)session.getAttribute("memberno" );
     if(memberno == qnaProc.read(qnano).getMemberno()) {
       int count = qnaProc.delete(qnano);
       
       if(count == 1) {
         
       }
       ra.addAttribute("count", count);
       ra.addAttribute("qnano",qnano);
       
       mav.setViewName("redirect:/qna/delete_msg.jsp");
       }else {
         mav.setViewName("redirect:/qna/auth_fail_msg.jsp");
         
       }

     return mav;
   }
   
	 @RequestMapping(value="/qna/reply.do", method=RequestMethod.GET)
	  public ModelAndView reply(QnaVO qnaVO){
	    
	    ModelAndView mav = new ModelAndView();
	    mav.setViewName("/qna/reply");
	   
	    mav.addObject("qnaVO", qnaVO);
	   
	    return mav;
	  }

	   @RequestMapping(value="/qna/reply.do", method=RequestMethod.POST)
	    public ModelAndView reply(HttpServletRequest request,   
	                                         RedirectAttributes ra, 
	                                         int qnano)
	    {  
	      ModelAndView mav = new ModelAndView();
	      mav.setViewName("/qna/reply_msg"); 
	      
	      QnaVO qnaVO = qnaProc.read(qnano);
	    
	      QnaVO parentVO = qnaProc.read(qnaVO.getQnano()); // 부모글 정보 추출
	    
	      qnaVO.setGrpno(parentVO.getGrpno());
	      qnaVO.setAnsnum(parentVO.getAnsnum());
	      
	      qnaProc.updateAnsnum(qnaVO);

	      qnaVO.setIndent(parentVO.getIndent() + 1); // 답변 차수 증가
	      qnaVO.setAnsnum(parentVO.getAnsnum() + 1); // 부모 바로 아래 등록

	      int count = qnaProc.reply(qnaVO);

	      ra.addAttribute("count", count);
	      ra.addAttribute("qnano",qnaVO.getQnano());
	      
	      mav.setViewName("redirect:/qna/reply_msg.jsp");
	      
	      return mav;
	    }
	   
	 /*@RequestMapping(value="/qna/choice_list.do", method=RequestMethod.GET)
   public ModelAndView choice_list(String choice){
     ModelAndView mav = new ModelAndView();
     List<QnaVO> choice_list = qnaProc.choice_list(choice);
     
     mav.addObject("choice_list", choice_list);
     mav.setViewName("/qna/choice_list"); 
     
     
     return mav;
  }*/
	 
	 
	 
	 
}
