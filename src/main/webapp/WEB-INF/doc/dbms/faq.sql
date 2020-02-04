/**********************************/
/* Table Name: �����ϴ����� */
/**********************************/
DROP TABLE faq;

CREATE TABLE faq(
    faqno                          NUMBER(10)     NOT NULL    PRIMARY KEY,
    memberno                    NUMBER(10)     NOT NULL, 
    seqno                          NUMBER(10)     NOT NULL, 
    title                             VARCHAR2(300)    NOT NULL,
    content                        CLOB     NOT NULL,
    word                            VARCHAR2(100)  NULL,
    rdate                             DATE     NOT NULL,
    faq_cateno                      NUMBER(10)     NOT NULL,
    
    FOREIGN KEY (memberno) REFERENCES mkmember (memberno),
    FOREIGN KEY (faq_cateno) REFERENCES faq_cate(faq_cateno)
);

COMMENT ON TABLE faq is 'faq';
COMMENT ON COLUMN faq.faqno is 'faq��ȣ';
COMMENT ON COLUMN faq.seqno is 'faq����';
COMMENT ON COLUMN faq.title is 'faq ����';
COMMENT ON COLUMN faq.content is 'faq ����';

1) ���
-- PK ����
SELECT NVL(MAX(faqno), 0) + 1 as faqno FROM faq;                                
 FAQNO
 ----------
          1

INSERT INTO faq(faqno, memberno, faq_cateno, seqno, title, content, word, rdate)
VALUES((SELECT NVL(MAX(faqno), 0) + 1 as faqno FROM faq),
             1, 1, 1, '����1', '����1',' ',sysdate);
             
-- 2) ���
SELECT faqno, memberno, faq_cateno, seqno, title, content, word, rdate
FROM faq
ORDER BY faqno DESC;


-- 3) ��ü ���ڵ� ��
SELECT COUNT(*) as count
FROM faq;
 
     
-- 4) ��ȸ
SELECT faqno, memberno, faq_cateno, seqno, title, content, word, rdate
FROM faq
WHERE faqno=1;

-- 6) ����
UPDATE faq
SET title='���� ����', content='���� ����'
WHERE faqno = 1;

-- 7) ����
DELETE FROM faq;
WHERE faqno = 1;

