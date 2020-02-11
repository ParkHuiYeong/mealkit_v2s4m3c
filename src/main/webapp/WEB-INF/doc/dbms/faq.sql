/**********************************/
/* Table Name: �����ϴ����� */
/**********************************/
/*����*/
INSERT INTO faq(faqno, memberno, faq_cateno, seqno, title, content, word, rdate)
VALUES((SELECT NVL(MAX(faqno), 0) + 1 as faqno FROM faq),
             1, 1, 1, 'Q. ��� �� ������ ���� ������ ��� �ϳ���?', '�Ա� ��, ��ǰ �غ��� ���¿����� ���Բ��� ���� ������ ����(����/����ó/�ּ�/��۸޽���) ������ �����մϴ�.
�� ��� �غ��� ���� ���¿����� ��ǰ ��� �غ��ϰ� �־� ���� ������ ����� �� ���� ��Ź�帳�ϴ�. :)',' ',sysdate);

INSERT INTO faq(faqno, memberno, faq_cateno, seqno, title, content, word, rdate)
VALUES((SELECT NVL(MAX(faqno), 0) + 1 as faqno FROM faq),
             1, 1, 2, 'Q. �Ѱ��� �̻� ��ǰ�� �ֹ��� ���, �� ���� ������ �� �ֳ���?', '��ٱ��ϸ� �̿��Ͻø� ���� ���Ͻô� ��ǰ�� �Ѳ����� �����Ͻ� �� �ֽ��ϴ�.

�ٸ�, �����Ͻ� ��ǰ�� ������� �ٸ� ���, ���� ����� ����� �� �ȳ��� �帳�ϴ�. :)', '����,��ǰ,����',sysdate);

INSERT INTO faq(faqno, memberno, faq_cateno, seqno, title, content, word, rdate)
VALUES((SELECT NVL(MAX(faqno), 0) + 1 as faqno FROM faq),
             1, 2, 2, ' Q. ��� �Ⱓ�� �󸶳� �ɸ�����?', '��� �� ��� �Ⱓ�� ���� �ȳ��� �� ��ǰ���� �����ϸ�, ��ǰ ������ �ϴ��� ��� ���������� Ȯ���� �����մϴ�.

���� �ð��� ���� ���� ���� �����ϳ� ���� ��� �Ϸ�� ����� �� ���� ��Ź�帳�ϴ�. :)', '���,�Ⱓ',sysdate);

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

