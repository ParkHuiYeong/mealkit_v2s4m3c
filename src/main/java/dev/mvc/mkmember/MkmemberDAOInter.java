package dev.mvc.mkmember;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface MkmemberDAOInter {
  
  /**
   * ���̵� �ߺ� �˻�
   * @param id ���̵�
   * @return �ߺ� ���̵� ����
   */
  public int checkId(String id);
  
  /**
  * ȸ������
  * @param memberVO
  * @return ��ϵ� ȸ���� 1 or 0
  */
  public int create(MkmemberVO mkmemberVO);
  
  /**
   * ��޺� ȸ�� ���
   * @param memcateno
   * @return
   */
  public List<MkmemberVO> list_by_memcateno(int memcateno);
  
  /**
   * ��ü ȸ�� ���
   * @return
   */
  public List<MkmemberVO> list_all();
  
  /**
   * ȸ�� ���� ��ȸ(memberno ����)
   * @param memberno
   * @return
   */
  public MkmemberVO read(int memberno);
  
  /**
   * ȸ�� ���� ��ȸ(id ����)
   * @param id
   * @return
   */
  public MkmemberVO readById(String id);
  
  /**
   * ȸ�� ���� ����
   * @param mkmemberVO
   * @return
   */
  public int update(MkmemberVO mkmemberVO);
  
  /**
   * �н����� �˻�
   * @param map
   * @return
   */
  public int passwd_check(HashMap<Object, Object> map);
  
  /**
   * �н����� ����
   * @param map
   * @return
   */
  public int passwd_update(HashMap<Object, Object> map);
  
  /**
   * Ư�� ȸ�� ����
   * @param memberno
   * @return
   */
  public int delete(int memberno);
  
  /**
   * ��޺� ȸ����
   * @param memcateno
   * @return
   */
  public int count_by_memcateno(int memcateno);
  
  /**
   * ��޺� ȸ�� ����
   * @param memcateno
   * @return
   */
  public int delete_by_memcateno(int memcateno);
  
  /**
   * �α���
   * @param map
   * @return
   */
  public int login(Map<Object, Object> map);

  /**
   * ȸ�� ��� ����
   * @param map
   * @return
   */
  public int grade_update(HashMap<Object, Object> map);
  
  /**
   * ���̵� ã��
   * @param map
   * @return
   */
  public List<String> id_find(HashMap<Object, Object> map);
  
  /**
   * ��ȭ��ȣ �˻�(���̵� ã��)
   * @param id
   * @param tel
   * @return
   */
  public int tel_check_id(HashMap<Object, Object> map);  
  
  /**
   * ��й�ȣ ã��
   * @param id
   * @return
   */
  public String passwd_find(HashMap<Object, Object> map);
  
  /**
   * ��ȭ��ȣ �˻�(��й�ȣ ã��)
   * @param id
   * @param tel
   * @return
   */
  public int tel_check_passwd(HashMap<Object, Object> map); 
  
  /**
   * ��޺� ȸ�� ��� + ����¡
   * @param map
   * @return
   */
  public ArrayList<MkmemberVO> list_by_memcateno_paging(HashMap<String, Object> map);
  
}
