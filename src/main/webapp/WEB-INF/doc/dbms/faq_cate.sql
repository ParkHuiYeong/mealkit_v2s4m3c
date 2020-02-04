/**********************************/
/* Table Name: �����ϴ����� �з� ī�װ�*/
/**********************************/
-- 1)����
DROP TABLE faq_cate;

-- 2)����
CREATE TABLE faq_cate(
  faq_cateno NUMBER(10) NOT NULL, 
  title VARCHAR(50) NOT NULL,
  seqno NUMBER(10) DEFAULT 0 NOT NULL,
  rdate DATE NOT NULL,
  cnt NUMBER(10) DEFAULT 0 NOT NULL,
  PRIMARY KEY(faq_cateno)
);

COMMENT ON TABLE faq_cate is '�����ϴ����� ī�װ� �׷�';
COMMENT ON COLUMN faq_cate.faq_cateno is '�����ϴ����� ��ȣ';
COMMENT ON COLUMN faq_cate.title is '�����ϴ����� ����';
COMMENT ON COLUMN faq_cate.seqno is '��� ����';
COMMENT ON COLUMN faq_cate.rdate is '�����';
COMMENT ON COLUMN faq_cate.cnt is '�����ϴ����� ��� ����';

-- 3)���
INSERT INTO faq_cate(faq_cateno, title, seqno, rdate, cnt)
VALUES((SELECT NVL(MAX(faq_cateno), 0) + 1 as faq_cateno FROM faq_cate),
                '�ֹ� ����', 1, sysdate, 0);
INSERT INTO faq_cate(faq_cateno, title, seqno, rdate, cnt)
VALUES((SELECT NVL(MAX(faq_cateno), 0) + 1 as faq_cateno FROM faq_cate),
                '��� �ȳ�', 2, sysdate, 0);
INSERT INTO faq_cate(faq_cateno, title, seqno, rdate, cnt)
VALUES((SELECT NVL(MAX(faq_cateno), 0) + 1 as faq_cateno FROM faq_cate),
                '��ǰ ����', 3, sysdate, 0);
            
-- 4)���            
SELECT * FROM faq_cate ORDER BY seqno ASC;

DELETE FROM faq_cate;

-- 5)��ȸ
SELECT faq_cateno, title, seqno, rdate, cnt
FROM faq_cate
WHERE faq_cateno=1;

-- 6)����
UPDATE notice_cate
SET title='��Ÿ����', seqno=5, visible='Y'
WHERE cateno=4;

-- 7)����
DELETE FROM notice_cate
WHERE cateno=4;
