package dev.mvc.faq;

public class FaqVO {
  /**faq ������ ��ȣ*/
  private int faqno;
  
  /**ȸ�� ��ȣ*/
  private int memberno;
  
  private int faq_cateno;
  
  private int seqno;
  
  /** ����*/
  private String title;
  
  /**����*/
  private String content;
  
  private String word;
  
  /** ����� */
  private String rdate;

  public int getFaqno() {
    return faqno;
  }

  public void setFaqno(int faqno) {
    this.faqno = faqno;
  }

  public int getMemberno() {
    return memberno;
  }

  public void setMemberno(int memberno) {
    this.memberno = memberno;
  }

  public int getFaq_cateno() {
    return faq_cateno;
  }
    
  public void setFaq_cateno(int faq_cateno) {
    this.faq_cateno = faq_cateno;
  }

  public int getSeqno() {
    return seqno;
  }

  public void setSeqno(int seqno) {
    this.seqno = seqno;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public String getWord() {
    return word;
  }

  public void setWord(String word) {
    this.word = word;
  }

  public String getRdate() {
    return rdate;
  }

  public void setRdate(String rdate) {
    this.rdate = rdate;
  }

}
