package dev.mvc.faq_cate;

public class Faq_cateVO {
	/**�������� ��ȣ*/
	private int faq_cateno;
	/**  ī�װ� ���� */
	private String title;
	/** ��� ���� */
	private int seqno;
	/** ����� */
	private String rdate;
	/** ��ϵ� �ۼ�*/
	private int cnt;
	
	
	public int getFaq_cateno() {
    return faq_cateno;
  }
  public void setFaq_cateno(int faq_cateno) {
    this.faq_cateno = faq_cateno;
  }
  public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getSeqno() {
		return seqno;
	}
	public void setSeqno(int seqno) {
		this.seqno = seqno;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	
}
