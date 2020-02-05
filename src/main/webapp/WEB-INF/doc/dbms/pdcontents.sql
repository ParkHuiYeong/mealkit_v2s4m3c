/**********************************/
/* Table Name: pdcontents */
/**********************************/
DROP TABLE pdcontents CASCADE CONSTRAINTS; 

CREATE TABLE pdcontents(
		pdcontentsno                  NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		productcateno                 NUMBER(10)		 NOT NULL,
		title                         		    VARCHAR2(300)		 NOT NULL,
		price                             NUMBER(10)    NOT NULL,
		content                       		CLOB		 NOT NULL,
		recom                         		NUMBER(5,1)		 DEFAULT 0		 NOT NULL,
		cnt                           		NUMBER(7)		 DEFAULT 0		 NOT NULL,
		replycnt                      		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
		word                          		VARCHAR2(100)		 NULL ,
		fname                            VARCHAR2(100)         NOT NULL,
    fupname                        VARCHAR2(100)         NOT NULL,
    thumb                           VARCHAR2(100)         NULL ,
    fsize                              NUMBER(10)         DEFAULT 0         NOT NULL,
		FOREIGN KEY (productcateno) REFERENCES productcate (productcateno)
);

COMMENT ON TABLE pdcontents is '��ǰ������';
COMMENT ON COLUMN pdcontents.productcateno is '��ǰ ī�װ� ��ȣ';
COMMENT ON COLUMN pdcontents.title is '��ǰ��';
COMMENT ON COLUMN pdcontents.content is '����';
COMMENT ON COLUMN pdcontents.price is '����';
COMMENT ON COLUMN pdcontents.recom is '����';
COMMENT ON COLUMN pdcontents.cnt is '��ȸ��';
COMMENT ON COLUMN pdcontents.replycnt is '��ۼ�';
COMMENT ON COLUMN pdcontents.rdate is '�����';
COMMENT ON COLUMN pdcontents.word is '�˻���';
COMMENT ON COLUMN pdcontents.fname is '���� ���ϸ�';
COMMENT ON COLUMN pdcontents.fupname is '���ε� ���ϸ�';
COMMENT ON COLUMN pdcontents.thumb is 'Thumb ����';
COMMENT ON COLUMN pdcontents.fsize is '���� ������';

                              
 -- PK ����
 SELECT NVL(MAX(pdcontentsno),0) + 1 as pdcontentsno FROM pdcontents;

 PDCONTENTSNO
 ------------
            1

 -- productcate ���̺� ��� Ȯ�� 
SELECT productcateno, name, seqno, cnt
FROM productcate
ORDER BY seqno ASC; 

-- 1) contents ��� (member:1, categrpno: 1),
--     varchar�� ''��ϵǸ� null�� insert ��. 
INSERT INTO pdcontents(pdcontentsno, 
                              productcateno, title, price, content,
                              recom,cnt,replycnt,rdate,word, fname, fupname, thumb, fsize )
 VALUES((SELECT NVL(MAX(pdcontentsno),0)+1 as pdcontentsno FROM pdcontents),
              1, '�Ұ���� ������ä', 19400, '<div style="text-align:center"><input alt="" src="/mealkit/ckstorage/images/%EC%86%8C%EA%B3%A0%EA%B8%B0%EC%9E%A1%EC%B1%84/beef.jpg" style="width: 755px; height: 1200px;" type="image" />  <p><span style="font-size:36px"><strong>�Ұ���� ������ä</strong></span></p>    <div style="text-align:left"><span style="font-size:16px">��� ���� ���� �ִ� ��ĩ���̸� ���� �� ���� �޴��� �ٷ� ��ä�ε���. ���� ��� ���������� ��� �غ���� ���ΰ� �ȳ��̴ٸ�, �ٷ� COOKIT�� �Ұ���� ������ä ��õ�帳�ϴ�. �����帮�� ����� �Ұ�� ��л�� ����� �� ���� ����, �ż��� �� ���� ä�Ҹ� ���ִ� �����信 ������ �ֽñ⸸ �ϸ� �絵 ǳ�̵� �ְ�!</span><br />  &nbsp;</div>    <div><span style="font-size:16px"><input alt="" src="/mealkit/ckstorage/images/%EC%86%8C%EA%B3%A0%EA%B8%B0%EC%9E%A1%EC%B1%84/beef1.gif" style="width: 780px; height: 500px;" type="image" /></span>    <div style="text-align:left"><span style="font-size:24px"><strong>����� �Ұ��� �پ��� ����, ä�Ұ� ��췯�� �ⱳ ��� ���� ��</strong></span></div>    <p style="text-align:left">����ϰ� �̱��� ������ ���� �Ա����� ä�� Ǫ���� �Ұ�Ⱑ COOKIT ��ä�� ����������. ���߿��� �Ǹ��ϴ� ��� �ñ�ġ�θ� ���� ��ä�ʹ� Ȯ���� �ٸ��ٰ� ������ �ſ���. �Ҽ��� �츮 ������ �ϻ� COOKIT �Ұ���� ������ä�� �Բ� ��� ���� ��ĩ��ó�� �����ø� ����.</p>    <p><input alt="" src="/mealkit/ckstorage/images/%EC%86%8C%EA%B3%A0%EA%B8%B0%EC%9E%A1%EC%B1%84/beef2.jpg" style="width: 780px; height: 520px;" type="image" /></p>    <p><input alt="" src="/mealkit/ckstorage/images/%EC%86%8C%EA%B3%A0%EA%B8%B0%EC%9E%A1%EC%B1%84/beef3.jpg" style="width: 780px; height: 520px;" type="image" /></p>  <br />  <p style="text-align:left"><span style="font-size:24px"><strong>�̷��� ���������!</strong></span></p>    <div style="text-align:left"><span style="font-size:16px"><strong>3�κ�&nbsp;<img alt="enlightened" src="http://localhost:9090/mealkit/ckeditor/plugins/smiley/images/lightbulb.png" style="height:23px; width:23px" title="enlightened" /></strong><br />  <strong>1.</strong>�Ұ�� 1��&nbsp;&nbsp;&nbsp;<strong>2.</strong>��� 2��&nbsp;&nbsp;&nbsp;<strong>3.</strong>����Ұ���� 1��&nbsp;<strong>4.</strong>�����밣���� 1��&nbsp;<strong>5.</strong>ȥ��ä�� [��������ī, ����, ���] 1��&nbsp;&nbsp;&nbsp;<strong>6.</strong>ȥ�չ��� [ǥ�����, �����ڹ���, ��Ÿ������] 1��&nbsp;&nbsp;&nbsp;<strong>7.</strong>���� 1��&nbsp;&nbsp;&nbsp;<strong>8.</strong>�������� 1�� &nbsp;&nbsp;&nbsp;<strong>9.</strong>��⸧ 1��&nbsp;&nbsp;&nbsp;<strong>10.</strong>���⸧ 1��&nbsp;&nbsp;</span></div>    <p style="text-align:left"><strong><span style="color:#e74c3c"><span style="font-size:16px">*���޻�Ȳ�� ���� �Ϻ� ���� ����� �� �ֽ��ϴ�.</span></span></strong><br />  &nbsp;</p>    <p><strong><span style="color:#e74c3c"><span style="font-size:16px"><input alt="" src="/mealkit/ckstorage/images/%EC%86%8C%EA%B3%A0%EA%B8%B0%EC%9E%A1%EC%B1%84/beef6.PNG" style="width: 600px; height: 546px;" type="image" /></span></span></strong><br />  <input alt="" src="/mealkit/ckstorage/images/%EC%86%8C%EA%B3%A0%EA%B8%B0%EC%9E%A1%EC%B1%84/receipe1.PNG" style="width: 600px; height: 763px;" type="image" /><br />  <input alt="" src="/mealkit/ckstorage/images/%EC%86%8C%EA%B3%A0%EA%B8%B0%EC%9E%A1%EC%B1%84/receipe2.PNG" style="width: 422px; height: 546px;" type="image" /></p>    <div>&nbsp;</div>  </div>  </div>',
             0, 10, 0, sysdate, '�Ұ��,��ä,������ä,�Ұ����ä', 'japchae1.jpg', 'japchae1.jpg', 'japchae1_t.jpg', 92275);
             
INSERT INTO pdcontents(pdcontentsno, 
                              productcateno, title, price, content,
                              recom,cnt,replycnt,rdate,word, fname, fupname, thumb, fsize )
 VALUES((SELECT NVL(MAX(pdcontentsno),0)+1 as pdcontentsno FROM pdcontents),
              1, '��ū�ÿ� ����', 25000, '<div style="text-align:center"><input alt="" src="/mealkit/ckstorage/images/%EC%86%8C%EA%B3%A0%EA%B8%B0%EC%9E%A1%EC%B1%84/beef.jpg" style="width: 755px; height: 1200px;" type="image" />  <p><span style="font-size:36px"><strong>�Ұ���� ������ä</strong></span></p>    <div style="text-align:left"><span style="font-size:16px">��� ���� ���� �ִ� ��ĩ���̸� ���� �� ���� �޴��� �ٷ� ��ä�ε���. ���� ��� ���������� ��� �غ���� ���ΰ� �ȳ��̴ٸ�, �ٷ� COOKIT�� �Ұ���� ������ä ��õ�帳�ϴ�. �����帮�� ����� �Ұ�� ��л�� ����� �� ���� ����, �ż��� �� ���� ä�Ҹ� ���ִ� �����信 ������ �ֽñ⸸ �ϸ� �絵 ǳ�̵� �ְ�!</span><br />  &nbsp;</div>    <div><span style="font-size:16px"><input alt="" src="/mealkit/ckstorage/images/%EC%86%8C%EA%B3%A0%EA%B8%B0%EC%9E%A1%EC%B1%84/beef1.gif" style="width: 780px; height: 500px;" type="image" /></span>    <div style="text-align:left"><span style="font-size:24px"><strong>����� �Ұ��� �پ��� ����, ä�Ұ� ��췯�� �ⱳ ��� ���� ��</strong></span></div>    <p style="text-align:left">����ϰ� �̱��� ������ ���� �Ա����� ä�� Ǫ���� �Ұ�Ⱑ COOKIT ��ä�� ����������. ���߿��� �Ǹ��ϴ� ��� �ñ�ġ�θ� ���� ��ä�ʹ� Ȯ���� �ٸ��ٰ� ������ �ſ���. �Ҽ��� �츮 ������ �ϻ� COOKIT �Ұ���� ������ä�� �Բ� ��� ���� ��ĩ��ó�� �����ø� ����.</p>    <p><input alt="" src="/mealkit/ckstorage/images/%EC%86%8C%EA%B3%A0%EA%B8%B0%EC%9E%A1%EC%B1%84/beef2.jpg" style="width: 780px; height: 520px;" type="image" /></p>    <p><input alt="" src="/mealkit/ckstorage/images/%EC%86%8C%EA%B3%A0%EA%B8%B0%EC%9E%A1%EC%B1%84/beef3.jpg" style="width: 780px; height: 520px;" type="image" /></p>  <br />  <p style="text-align:left"><span style="font-size:24px"><strong>�̷��� ���������!</strong></span></p>    <div style="text-align:left"><span style="font-size:16px"><strong>3�κ�&nbsp;<img alt="enlightened" src="http://localhost:9090/mealkit/ckeditor/plugins/smiley/images/lightbulb.png" style="height:23px; width:23px" title="enlightened" /></strong><br />  <strong>1.</strong>�Ұ�� 1��&nbsp;&nbsp;&nbsp;<strong>2.</strong>��� 2��&nbsp;&nbsp;&nbsp;<strong>3.</strong>����Ұ���� 1��&nbsp;<strong>4.</strong>�����밣���� 1��&nbsp;<strong>5.</strong>ȥ��ä�� [��������ī, ����, ���] 1��&nbsp;&nbsp;&nbsp;<strong>6.</strong>ȥ�չ��� [ǥ�����, �����ڹ���, ��Ÿ������] 1��&nbsp;&nbsp;&nbsp;<strong>7.</strong>���� 1��&nbsp;&nbsp;&nbsp;<strong>8.</strong>�������� 1�� &nbsp;&nbsp;&nbsp;<strong>9.</strong>��⸧ 1��&nbsp;&nbsp;&nbsp;<strong>10.</strong>���⸧ 1��&nbsp;&nbsp;</span></div>    <p style="text-align:left"><strong><span style="color:#e74c3c"><span style="font-size:16px">*���޻�Ȳ�� ���� �Ϻ� ���� ����� �� �ֽ��ϴ�.</span></span></strong><br />  &nbsp;</p>    <p><strong><span style="color:#e74c3c"><span style="font-size:16px"><input alt="" src="/mealkit/ckstorage/images/%EC%86%8C%EA%B3%A0%EA%B8%B0%EC%9E%A1%EC%B1%84/beef6.PNG" style="width: 600px; height: 546px;" type="image" /></span></span></strong><br />  <input alt="" src="/mealkit/ckstorage/images/%EC%86%8C%EA%B3%A0%EA%B8%B0%EC%9E%A1%EC%B1%84/receipe1.PNG" style="width: 600px; height: 763px;" type="image" /><br />  <input alt="" src="/mealkit/ckstorage/images/%EC%86%8C%EA%B3%A0%EA%B8%B0%EC%9E%A1%EC%B1%84/receipe2.PNG" style="width: 422px; height: 546px;" type="image" /></p>    <div>&nbsp;</div>  </div>  </div>',
             0, 10, 0, sysdate, '�Ұ��,��ä,������ä,�Ұ����ä', 'japchae1.jpg', 'japchae1.jpg', 'japchae1_t.jpg', 92275);
             
             
-- 2) ���
SELECT pdcontentsno, productcateno, title, price, content,
                              recom,cnt,replycnt,rdate,word, fname, fupname, thumb, fsize 
FROM pdcontents
ORDER BY pdcontentsno DESC;

PDCONTENTSNO PRODUCTCATENO TITLE CONTENT RECOM CNT REPLYCNT RDATE                 WORD FNAME       FUPNAME       THUMB         FSIZE
 ------------ ------------- ----- ------- ----- --- -------- --------------------- ---- ----------- ------------- ------------- -----
            1             1 �����   ����1         0   0        0 2019-12-11 17:47:23.0 NULL bibmbap.jpg bibmbap_1.jpg bibmbap_t.jpg  1000
            
-- 3) productcate�� ��ü ���
SELECT pdcontentsno, productcateno, title, price, content,
                              recom,cnt,replycnt,rdate,word, fname, fupname, thumb, fsize 
FROM pdcontents
WHERE productcateno=1 --1: �ѽ�, --2: �߽� 
ORDER BY pdcontentsno DESC;

 PDCONTENTSNO PDTHUMBNO PRODUCTCATENO TITLE CONTENT RECOM CNT REPLYCNT RDATE                 WORD
 ------------ --------- ------------- ----- ------- ----- --- -------- --------------------- ----
            1         1             1 �����   ����1         0   0        0 2019-12-11 16:55:02.0 NULL
         
-- 4) ��ü ���ڵ� �� 
SELECT COUNT(*) as count
FROM pdcontents;

 COUNT
 -----
     1
     
-- 5) ��ȸ
SELECT pdcontentsno, productcateno, title, price, content,
                              recom,cnt,replycnt,rdate,word, fname, fupname, thumb, fsize 
FROM pdcontents
WHERE pdcontentsno=2;
     
-- 6) ����
UPDATE pdcontents
SET title='��ġ������', content='���� ����', word='�˻���'
WHERE pdcontentsno = 1;


-- ��õ ����
UPDATE pdcontents
SET recom= 3
WHERE pdcontentsno = 2;

SELECT pdcontentsno, productcateno, title, price, 
                              recom,cnt,replycnt,rdate,word, fname, fupname, thumb, fsize 
FROM pdcontents
WHERE pdcontentsno=1;

-- 7) ����
DELETE FROM pdcontents
WHERE pdcontentsno = 1;


-- 8) FK �θ� ���̺� ���ڵ� ���� ����
SELECT pdcontentsno, productcateno, title, price, 
FROM pdcontents
WHERE productcateno = 1;

 MKCONTENTSNO PRODUCTCATENO TITLE
 ------------ ------------- -----
            1             1 ���� ����
            
SELECT COUNT(*) as cnt
FROM pdcontents
WHERE productcateno = 1;

 CNT
 ---
   1

   --- ������� ��12.09
-- 9) FK �θ� ���̺� ���ڵ� ����
DELETE FROM contents
WHERE categrpno = 1;

/**********************************/
/* Table Name: ��� */
/**********************************/
CREATE TABLE reply(
		rplyno                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		contentsno                    		NUMBER(10)		 NULL ,
  FOREIGN KEY (contentsno) REFERENCES contents (contentsno)
);

COMMENT ON TABLE reply is '���';
COMMENT ON COLUMN reply.rplyno is '��۹�ȣ';
COMMENT ON COLUMN reply.contentsno is '��������ȣ';


/**********************************/
/* Table Name: �μ� */
/**********************************/
CREATE TABLE department(
		departmentno                  		NUMBER(10)		 NOT NULL		 PRIMARY KEY
);

COMMENT ON TABLE department is '�μ�';
COMMENT ON COLUMN department.departmentno is '�μ���ȣ';


/**********************************/
/* Table Name: ���� */
/**********************************/
CREATE TABLE employee(
		employeeno                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		departmentno                  		NUMBER(10)		 NULL ,
  FOREIGN KEY (departmentno) REFERENCES department (departmentno)
);

COMMENT ON TABLE employee is '����';
COMMENT ON COLUMN employee.employeeno is '������ȣ';
COMMENT ON COLUMN employee.departmentno is '�μ���ȣ';


/**********************************/
/* Table Name: ȸ�� �α��� ���� */
/**********************************/
CREATE TABLE login(
		loginno                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		memberno                      		NUMBER(10)		 NULL ,
  FOREIGN KEY (memberno) REFERENCES member (memberno)
);

COMMENT ON TABLE login is 'ȸ�� �α��� ����';
COMMENT ON COLUMN login.loginno is '�α��ι�ȣ';
COMMENT ON COLUMN login.memberno is 'ȸ����ȣ';


/**********************************/
/* Table Name: ���� �α��� ���� */
/**********************************/
CREATE TABLE login2(
		login2no                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		employeeno                    		NUMBER(10)		 NULL ,
  FOREIGN KEY (employeeno) REFERENCES employee (employeeno)
);

COMMENT ON TABLE login2 is '���� �α��� ����';
COMMENT ON COLUMN login2.login2no is '�α��ι�ȣ2';
COMMENT ON COLUMN login2.employeeno is '������ȣ';


/**********************************/
/* Table Name: ÷������ */
/**********************************/
CREATE TABLE attachfile(
		attachfileno                  		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		contentsno                    		NUMBER(10)		 NULL ,
  FOREIGN KEY (contentsno) REFERENCES contents (contentsno)
);

COMMENT ON TABLE attachfile is '÷������';
COMMENT ON COLUMN attachfile.attachfileno is '÷�����Ϲ�ȣ';
COMMENT ON COLUMN attachfile.contentsno is '��������ȣ';


