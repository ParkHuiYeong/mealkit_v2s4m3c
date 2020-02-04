package dev.mvc.notice_contents;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dev.mvc.notice_cate.Notice_cateProcInter;
import dev.mvc.notice_cate.Notice_cateVO;

@Controller
public class No_contentsCont {
  @Autowired
  @Qualifier("dev.mvc.notice_contents.No_contentsProc") // �̸� ����
  private No_contentsProcInter no_contentsProc;

  @Autowired
  @Qualifier("dev.mvc.notice_cate.Notice_cateProc") // �̸� ����
  private Notice_cateProcInter notice_cateProc;

  public No_contentsCont() {
    System.out.println("-->No_contents created");
  }

  // http://localhost:9090/team3/notice_contents/create.do?memberno=1&cateno=1
  @RequestMapping(value = "/notice_contents/create.do", method = RequestMethod.GET)
  public ModelAndView create(int cateno) {
    ModelAndView mav = new ModelAndView();

    Notice_cateVO notice_cateVO = notice_cateProc.read(cateno);
    mav.addObject("notice_cateVO", notice_cateVO);

    mav.setViewName("/notice_contents/create"); // /webapp/notice_cate/create.jsp

    return mav;
  }

  // ��� ó��
  @RequestMapping(value = "/notice_contents/create.do", method = RequestMethod.POST)
  public ModelAndView create(RedirectAttributes ra, No_contentsVO no_contentsVO) {
    ModelAndView mav = new ModelAndView();

    int count = no_contentsProc.create(no_contentsVO);

    if (count == 1) {
      notice_cateProc.increaseCnt(no_contentsVO.getCateno()); // ī�װ� �ۼ� ����
   
    }
    ra.addAttribute("count", count); // redirect parameter ����
    ra.addAttribute("cateno", no_contentsVO.getCateno());

    mav.setViewName("redirect:/notice_contents/create_msg.jsp");

    return mav;
  }


   // ��� �׳� ������ ��ü ��� ������ �� // http://localhost:9090/team3/notice_contents/list_all.do

    @RequestMapping(value ="/notice_contents/list_all.do", method =RequestMethod.GET) 
    public ModelAndView list_all() { 
    ModelAndView mav = new ModelAndView();
    
    List<No_contentsVO> list = no_contentsProc.list_all(); 
    mav.addObject("list",list); mav.setViewName("/notice_contents/list_all");
    
    return mav; 
    }
  
    // http://localhost:9090/team3/notice_contents/list.do?cateno=1&no_word=����
   
  /*
   * @RequestMapping(value = "/notice_contents/list_by_cateno_search.do", method =
   * RequestMethod.GET) public ModelAndView list_by_cateno_search( String no_word)
   * { ModelAndView mav = new ModelAndView();
   * 
   * HashMap<String, Object> hashMap = new HashMap<>();
   * 
   * hashMap.put("no_word", no_word);
   * 
   * List<No_contentsVO> list = no_contentsProc.list_by_cateno_search(hashMap);
   * //�˻� mav.addObject("list", list); // /webapp/contents/list.jsp
   * 
   * int search_count = no_contentsProc.search_count(hashMap);
   * mav.addObject("search_count", search_count); mav.addObject("list",list);
   * 
   * mav.setViewName("/notice_contents/list_by_cateno_search"); // ī�װ� �׷캰 ���
   * 
   * return mav; }
   */
   

  /**
   * ��ȸ http://localhost:9090/team3/notice_contents/read.do?no_contentsno=1
   * 
   * @param contentsno
   * @return
   */
  @RequestMapping(value = "/notice_contents/read.do", method = RequestMethod.GET)
  public ModelAndView read(int no_contentsno) {
    ModelAndView mav = new ModelAndView();

    No_contentsVO no_contentsVO = no_contentsProc.read(no_contentsno);
    mav.addObject("no_contentsVO", no_contentsVO);

    Notice_cateVO notice_cateVO = notice_cateProc.read(no_contentsVO.getCateno());
    mav.addObject("notice_cateVO", notice_cateVO);

    mav.setViewName("/notice_contents/read");

    return mav;
  }

  // http://localhost:9090/team3/no_contents/update.do?memberno=1&categrpno=1
  @RequestMapping(value = "/notice_contents/update.do", method = RequestMethod.GET)
  public ModelAndView update(int cateno, int no_contentsno) {
    ModelAndView mav = new ModelAndView();

    Notice_cateVO notice_cateVO = notice_cateProc.read(cateno);
    mav.addObject("notice_cateVO", notice_cateVO);

    No_contentsVO no_contentsVO = no_contentsProc.read(no_contentsno);
    mav.addObject("no_contentsVO", no_contentsVO);

    mav.setViewName("/notice_contents/update"); // /webapp/contents/update.jsp

    return mav;
  }

  /**
   * ���� ó��
   * 
   * @param contentsVO
   * @return
   */
  @RequestMapping(value = "/notice_contents/update.do", method = RequestMethod.POST)
  public ModelAndView update(RedirectAttributes ra, No_contentsVO no_contentsVO) {
    ModelAndView mav = new ModelAndView();

    int count = no_contentsProc.update(no_contentsVO);

    ra.addAttribute("count", count);
    ra.addAttribute("cateno", no_contentsVO.getCateno());
    ra.addAttribute("no_contentsno", no_contentsVO.getNo_contentsno());

    mav.setViewName("redirect:/notice_contents/update_msg.jsp");

    return mav;
  }

  /**
   * �Ѱ� ������
   * 
   * @param categrpno
   * @param contentsno
   * @return
   */
  // http://localhost:9090/team3/notice_contents/delete.do?cateno=1&no_contentsno=1
  @RequestMapping(value = "/notice_contents/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int cateno, int no_contentsno) {
    ModelAndView mav = new ModelAndView();

    Notice_cateVO notice_cateVO = notice_cateProc.read(cateno);
    mav.addObject("Notice_cateVO", notice_cateVO);

    No_contentsVO no_contentsVO = no_contentsProc.read(no_contentsno);
    mav.addObject("no_contentsVO", no_contentsVO);

    // FK contentsno �÷� ���� ���� ���ڵ� ���� ����: id="count_by_contentsno"
    // int count_by_contentsno = attachfileProc.count_by_contentsno(contentsno);
    // mav.addObject("count_by_contentsno", count_by_contentsno);

    mav.setViewName("/notice_contents/delete"); // /webapp/contents/delete.jsp

    return mav;
  }

  /**
   * �Ѱ� ���� ó��
   * 
   * @param ra
   * @param categrpno
   * @param contentsno
   * @return
   */
  @RequestMapping(value = "/notice_contents/delete.do", 
                          method = RequestMethod.POST)
  public ModelAndView delete(RedirectAttributes ra,
                                       int cateno, int no_contentsno,
      @RequestParam(value="no_word", defaultValue="") String no_word,
      @RequestParam(value="nowPage", defaultValue="1") int nowPage) {
    ModelAndView mav = new ModelAndView();

     int count = no_contentsProc.delete(no_contentsno);
     if(count==1) {
      notice_cateProc.decreaseCnt(cateno);
 // ������ �������� ���ڵ� �������� ������ ��ȣ -1 ó��
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("cateno", cateno);
    map.put("no_word", no_word);
    if (no_contentsProc.search_count(map) % Notice.RECORD_PER_PAGE == 0) {
      nowPage = nowPage - 1;
      if (nowPage < 1) {
        nowPage = 1;
      }
    }
    }
      //int count = no_contentsProc.delete(no_contentsno); 
     ra.addAttribute("count",count);
     ra.addAttribute("cateno", cateno);
     ra.addAttribute("no_contentsno", no_contentsno);
     ra.addAttribute("nowPage", nowPage);
     
     mav.setViewName("redirect:/notice_contents/delete_msg.jsp");

    return mav;
  }

  /**
   * FK �÷����� �̿��� ���ڵ� ���� ó��
   * 
   * @param ra
   * @param categrpno
   * @return
   */
  @RequestMapping(value = "/notice_contents/delete_by_cateno.do", method = RequestMethod.POST)
  public ModelAndView delete_by_cateno(RedirectAttributes ra, int cateno) {
    ModelAndView mav = new ModelAndView();

    int count = no_contentsProc.delete_by_cateno(cateno);
    if (count > 0) { // FK �÷� ���� ���� ���������� �����Ǿ��ٸ� cnt �÷� 0���κ���
      notice_cateProc.cnt_zero(cateno);
    }

    ra.addAttribute("count", count); // ������ ���ڵ� ����
    ra.addAttribute("cateno", cateno);

    mav.setViewName("redirect:/notice_contents/delete_by_cateno_msg.jsp");

    return mav;
  }

  @RequestMapping(value = "/notice_contents/list.do", 
      method = RequestMethod.GET)
public ModelAndView list_by_search_paging(
@RequestParam(value="cateno", defaultValue="1") int cateno,
@RequestParam(value="no_word", defaultValue="") String no_word,
@RequestParam(value="nowPage", defaultValue="1") int nowPage
) { 
System.out.println("--> nowPage: " + nowPage);

ModelAndView mav = new ModelAndView();
mav.setViewName("notice_contents/list_by_search_paging");   

// ���ڿ� ���ڿ� Ÿ���� �����ؾ������� Obejct ���
HashMap<String, Object> map = new HashMap<String, Object>();
map.put("cateno", cateno); // #{cateno}
map.put("no_word", no_word);     // #{word}
map.put("nowPage", nowPage);       

// �˻� ���
List<No_contentsVO> list = no_contentsProc.list_by_search_paging(map);
mav.addObject("list", list);

// �˻��� ���ڵ� ����
int search_count = no_contentsProc.search_count(map);
mav.addObject("search_count", search_count);

Notice_cateVO notice_cateVO = notice_cateProc.read(cateno);
mav.addObject("notice_cateVO", notice_cateVO);

/*
* SPAN�±׸� �̿��� �ڽ� ���� ����, 1 ���������� ���� 
* ���� ������: 11 / 22   [����] 11 12 13 14 15 16 17 18 19 20 [����] 
* 
* @param listFile ��� ���ϸ� 
* @param categrpno ī�װ���ȣ 
* @param search_count �˻�(��ü) ���ڵ�� 
* @param nowPage     ���� ������
* @param word �˻���
* @return ����¡ ���� ���ڿ�
*/ 
String paging = no_contentsProc.pagingBox("list.do", cateno, search_count, nowPage, no_word);

mav.addObject("paging", paging);

mav.addObject("nowPage", nowPage);

return mav;
}    
  
}
