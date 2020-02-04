package dev.mvc.notice_contents;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


public interface No_contentsDAOInter {
	
	/**
	 * ���
	 * @param no_contentsVO
     * @return ��ϵ� ���ڵ� ����
	 */
	 public int create(No_contentsVO no_contentsVO);
	 
	 public List<No_contentsVO> list_all();
	 
	 public List<No_contentsVO> list_by_cateno(int cateno);
	 
	 public int total_count();
	 
	 public No_contentsVO read(int no_contentsno);
	
	 /**
	   * ����
	   * @param no_contentsVO);
	   * @return ������ ���ڵ� ����
	   */
	  public int update(No_contentsVO no_contentsVO);
	  
	  /**
	   * �Ѱ� ����
	   * @param no_contentsno
	   * @return
	   */
	  public int delete(int no_contentsno);

	  /**
	   * <xmp>
	   * �θ� ī�װ��� ��ȣ�� ���ڵ� ����
	   * <select id="count_by_categrpno" resultType="int">
	   * </xmp>
	   * @param categrpno
	   * @return
	   */
	  public int count_by_cateno(int cateno);
	  
	  /**
	   * <xmp>
	   * �θ� ī�װ��� ��ȣ�� ���ڵ� ����
	   * <delete id="delete_by_categrpno" parameterType="int">
	   * </xmp>
	   * @param categrpno
	   * @return
	   */
	  public int delete_by_cateno(int cateno);
	  
	 
	  
	  /**ī�װ����� �˻� ���*/
	  public List<No_contentsVO> list_by_cateno_search(HashMap<String, Object> hashMap);
	  
	  public List<No_contentsVO> list_all(HashMap<String, Object> hashMap);
	  
	  /**ī�װ����� �˻� ���ڵ� ����
	   * @param hashMap
	   * @return
	   * */
	  public int search_count(HashMap<String, Object> hashMap);
	 
	  public String pagingBox(String listFile, int cateno, int search_count, int nowPage, String no_word);
	  
	  /**
	   * �˻� + ����¡ ���
	   * @param map
	   * @return
	   */
    public ArrayList<No_contentsVO> list_by_search_paging(HashMap<String, Object> map);

}