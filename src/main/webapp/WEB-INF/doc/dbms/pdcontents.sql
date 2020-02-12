/**********************************/
/* Table Name: pdcontents */
/**********************************/
DROP TABLE pdcontents CASCADE CONSTRAINTS; 

DROP TABLE pdcontents;
CREATE TABLE pdcontents(
		pdcontentsno                  NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		productcateno                 NUMBER(10)		 NOT NULL,
		title                         		    VARCHAR2(300)		 NOT NULL,
		price                             NUMBER(10)    NOT NULL,
		content                       		CLOB		 NOT NULL,
		recom                         		NUMBER(5,2)		 DEFAULT 0		 NOT NULL,
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

DELETE FROM PDCONTENTS;
-- 1) contents ��� (member:1, categrpno: 1),
--     varchar�� ''��ϵǸ� null�� insert ��. 

-- �ѽ� ī�װ� ��ȣ Ȯ���� �Ͻ� ī�װ��� insert
INSERT INTO pdcontents(pdcontentsno, 
                              productcateno, title, price, content,
                              recom,cnt,replycnt,rdate,word, fname, fupname, thumb, fsize )
 VALUES((SELECT NVL(MAX(pdcontentsno),0)+1 as pdcontentsno FROM pdcontents),
              4, '�Ұ���� ������ä', 19400, '<div style="text-align:center"><input alt="" src="/mealkit/ckstorage/images/%EC%86%8C%EA%B3%A0%EA%B8%B0%EC%9E%A1%EC%B1%84/beef.jpg" style="width: 755px; height: 1200px;" type="image" />  <p><span style="font-size:36px"><strong>�Ұ���� ������ä</strong></span></p>    <div style="text-align:left"><span style="font-size:16px">��� ���� ���� �ִ� ��ĩ���̸� ���� �� ���� �޴��� �ٷ� ��ä�ε���. ���� ��� ���������� ��� �غ���� ���ΰ� �ȳ��̴ٸ�, �ٷ� COOKIT�� �Ұ���� ������ä ��õ�帳�ϴ�. �����帮�� ����� �Ұ�� ��л�� ����� �� ���� ����, �ż��� �� ���� ä�Ҹ� ���ִ� �����信 ������ �ֽñ⸸ �ϸ� �絵 ǳ�̵� �ְ�!</span><br />  &nbsp;</div>    <div><span style="font-size:16px"><input alt="" src="/mealkit/ckstorage/images/%EC%86%8C%EA%B3%A0%EA%B8%B0%EC%9E%A1%EC%B1%84/beef1.gif" style="width: 780px; height: 500px;" type="image" /></span>    <div style="text-align:left"><span style="font-size:24px"><strong>����� �Ұ��� �پ��� ����, ä�Ұ� ��췯�� �ⱳ ��� ���� ��</strong></span></div>    <p style="text-align:left">����ϰ� �̱��� ������ ���� �Ա����� ä�� Ǫ���� �Ұ�Ⱑ COOKIT ��ä�� ����������. ���߿��� �Ǹ��ϴ� ��� �ñ�ġ�θ� ���� ��ä�ʹ� Ȯ���� �ٸ��ٰ� ������ �ſ���. �Ҽ��� �츮 ������ �ϻ� COOKIT �Ұ���� ������ä�� �Բ� ��� ���� ��ĩ��ó�� �����ø� ����.</p>    <p><input alt="" src="/mealkit/ckstorage/images/%EC%86%8C%EA%B3%A0%EA%B8%B0%EC%9E%A1%EC%B1%84/beef2.jpg" style="width: 780px; height: 520px;" type="image" /></p>    <p><input alt="" src="/mealkit/ckstorage/images/%EC%86%8C%EA%B3%A0%EA%B8%B0%EC%9E%A1%EC%B1%84/beef3.jpg" style="width: 780px; height: 520px;" type="image" /></p>  <br />  <p style="text-align:left"><span style="font-size:24px"><strong>�̷��� ���������!</strong></span></p>    <div style="text-align:left"><span style="font-size:16px"><strong>3�κ�&nbsp;<img alt="enlightened" src="http://localhost:9090/mealkit/ckeditor/plugins/smiley/images/lightbulb.png" style="height:23px; width:23px" title="enlightened" /></strong><br />  <strong>1.</strong>�Ұ�� 1��&nbsp;&nbsp;&nbsp;<strong>2.</strong>��� 2��&nbsp;&nbsp;&nbsp;<strong>3.</strong>����Ұ���� 1��&nbsp;<strong>4.</strong>�����밣���� 1��&nbsp;<strong>5.</strong>ȥ��ä�� [��������ī, ����, ���] 1��&nbsp;&nbsp;&nbsp;<strong>6.</strong>ȥ�չ��� [ǥ�����, �����ڹ���, ��Ÿ������] 1��&nbsp;&nbsp;&nbsp;<strong>7.</strong>���� 1��&nbsp;&nbsp;&nbsp;<strong>8.</strong>�������� 1�� &nbsp;&nbsp;&nbsp;<strong>9.</strong>��⸧ 1��&nbsp;&nbsp;&nbsp;<strong>10.</strong>���⸧ 1��&nbsp;&nbsp;</span></div>    <p style="text-align:left"><strong><span style="color:#e74c3c"><span style="font-size:16px">*���޻�Ȳ�� ���� �Ϻ� ���� ����� �� �ֽ��ϴ�.</span></span></strong><br />  &nbsp;</p>    <p><strong><span style="color:#e74c3c"><span style="font-size:16px"><input alt="" src="/mealkit/ckstorage/images/%EC%86%8C%EA%B3%A0%EA%B8%B0%EC%9E%A1%EC%B1%84/beef6.PNG" style="width: 600px; height: 546px;" type="image" /></span></span></strong><br />  <input alt="" src="/mealkit/ckstorage/images/%EC%86%8C%EA%B3%A0%EA%B8%B0%EC%9E%A1%EC%B1%84/receipe1.PNG" style="width: 600px; height: 763px;" type="image" /><br />  <input alt="" src="/mealkit/ckstorage/images/%EC%86%8C%EA%B3%A0%EA%B8%B0%EC%9E%A1%EC%B1%84/receipe2.PNG" style="width: 422px; height: 546px;" type="image" /></p>    <div>&nbsp;</div>  </div>  </div>',
             0, 10, 0, sysdate, '�Ұ��,��ä,������ä,�Ұ����ä', 'japchae1.jpg', 'japchae1.jpg', 'japchae1_t.jpg', 92275);
             
INSERT INTO pdcontents(pdcontentsno, 
                              productcateno, title, price, content,
                              recom,cnt,replycnt,rdate,word, fname, fupname, thumb, fsize )
 VALUES((SELECT NVL(MAX(pdcontentsno),0)+1 as pdcontentsno FROM pdcontents),
              1, '��ū�ÿ� ����', 25000, '<input alt="" src="/mealkit/ckstorage/images/%EC%95%8C%ED%83%95/altang_1.jpg" style="width: 755px; height: 1200px;" type="image" />  <p style="text-align:center"><span style="font-size:28px"><strong>��ū �ÿ� ����</strong></span></p>  ���� �ǰ��� �� �ÿ��� ������ ���� �� �� ����� �Ļ絵 �ϰ� ���ݾƿ�. ���̵��� �����ϴ� �޴��� ������, ����ϴ� �츮 �κθ� ���� �޴� �����. COOKIT �����̶�� ���ۺ��� ��������� �ÿ��ϰ� ĮĮ�� �޴��� ���� �� �� �ϸ鼭 �������� �̾߱⸦ ������ ������ �Ļ簡 �� �ſ���.<br />  <input alt="" src="/mealkit/ckstorage/images/%EC%95%8C%ED%83%95/altang_2.gif" style="width: 780px; height: 500px;" type="image" /><br />  <span style="font-size:16px"><strong>�ż��� ����� ����, Ǫ���� �ᳪ��, ����, ���̹���, ����, ����, ���߸� �Ƴ�����</strong></span>    <p>�ż��� ����� ����, Ǫ���� �ᳪ��, ����, ���̹���, ����, ����, ���߸� �Ƴ����� �ְ� �����ָ� �ÿ��� ���� �췯����. �������� �ʰ� ����ϰ� �����ϰ� ���� ��� ��� ���԰� �Ǵ� �׷� ��������.</p>    <p><input alt="" src="/mealkit/ckstorage/images/%EC%95%8C%ED%83%95/altang_3.jpg" style="width: 780px; height: 1115px;" type="image" /></p>    <p><input alt="" src="/mealkit/ckstorage/images/%EC%95%8C%ED%83%95/altang_4.jpg" style="width: 780px; height: 520px;" type="image" /></p>  &nbsp;    <p><strong>�̷��� ���������!</strong></p>  <strong>3�κ�&nbsp;<img alt="enlightened" src="http://localhost:9090/mealkit/ckeditor/plugins/smiley/images/lightbulb.png" title="enlightened" /><br />  1.</strong>�����ҽ� 1��&nbsp;<strong>2.</strong>��� 1��&nbsp;<strong>3.</strong>���� 1��&nbsp;<strong>4.</strong>�ᳪ�� 1��&nbsp;<strong>5.</strong>�� 1��&nbsp;<strong>6.</strong>���尡�� 1��&nbsp;<strong>7.</strong>ȥ��ä�ҥ�[���̹���, ����]1��&nbsp;<strong>8.</strong>ȥ��ä�ҥ�[����, û�����, ȫ����, ����]1��&nbsp;<strong>9.</strong>�κ� 1��&nbsp;<strong>10.</strong>�������� 1��    <p><strong>*���޻�Ȳ�� ���� �Ϻ� ���� ����� �� �ֽ��ϴ�.</strong><br />  &nbsp;</p>    <p><strong><input alt="" src="/mealkit/ckstorage/images/%EC%95%8C%ED%83%95/altang_5.jpg" style="width: 780px; height: 480px;" type="image" /></strong><br />  <input alt="" src="/mealkit/ckstorage/images/%EC%95%8C%ED%83%95/altang_6.PNG" style="width: 732px; height: 619px;" type="image" /></p>    <p><strong>�ÿ��� ���� ���ְ� �Դ� ���</strong></p>    <p>1.����� ���� ��ô ��! ��ô�� ���Ͻø� �ұݹ�(�Ǵ� ������)�� &#39;���&#39; �󱸼���. �帣�� ���� �󱸸� ����� Ǯ���� �� �־��.<br />  2.��� ���� �ʷϻ����� ���� ���� ������ ��Ҵ� ������ ��ŵ� �����մϴ�. Ȥ�� ������ �� �� ������ �߶󳻰� �����ϼŵ� �˴ϴ�.</p>'
              ,0, 10, 0, sysdate, '����,��ū,����,�ÿ��� ����,�ÿ�', 'altang1.jpg', 'altang1.jpg', 'altang1_t.jpg', 75471);
             
INSERT INTO pdcontents(pdcontentsno, 
                              productcateno, title, price, content,
                              recom,cnt,replycnt,rdate,word, fname, fupname, thumb, fsize )
 VALUES((SELECT NVL(MAX(pdcontentsno),0)+1 as pdcontentsno FROM pdcontents),
              1, '���ʽ� �ڴٸ���', 18600, '<p style="text-align:center"><span style="font-size:36px"><strong><input alt="" src="/mealkit/ckstorage/images/%EC%BD%94%EB%8B%A4%EB%A6%AC%EC%B0%9C/codari_01.jpg" style="height:1200px; width:755px" type="image" /><br />  ���ʽ� �ڴٸ���</strong></span></p>  <span style="font-size:16px">���� ���� �� �ٶ��� �Ҿ���� �� ���ְ� �������� ���, Ȥ�� �ƽó���? ������ �ٷ� �ڴٸ�! ���¸� ������ ��, ��¦ �������� �̱��� ���� �ŷ����� ������Դϴ�. �ڴٸ��� ������ �丮�ϸ� �� ���־����µ���, �׷��� COOKIT�� �غ��߽��ϴ�.<br />  <input alt="" src="/mealkit/ckstorage/images/%EC%BD%94%EB%8B%A4%EB%A6%AC%EC%B0%9C/codari_02.gif" style="height:500px; width:780px" type="image" /></span><br />  <span style="font-size:20px"><strong>���� �迡 �ڴٸ���� �ƻ��� �ᳪ���� ������ ����</strong></span>    <p><span style="font-size:16px">���� ���� �ε巯��鼭�� �˵��� �ڴٸ��� ŭ���ϰ� �� ���� COOKIT�� �����帮�� ��信 �����ϰ� �������⸸ �ϸ� �Ǵ� ������ �޴��ε���. �Բ� �����帮�� ���� �迡 �߶� ������ �ڴٸ� ��� �ƻ��� �ᳪ���� ��� �Բ� �Դ� ���� �����Դϴ�. ���޴��� ¬©�� ��信 ������ �ִ� ���� ��信 �񺭼� �Բ� �� ��ø� ����Կ� ���� ������ ���� �ſ���.<br />  <input alt="" src="/mealkit/ckstorage/images/%EC%BD%94%EB%8B%A4%EB%A6%AC%EC%B0%9C/codari_03.jpg" style="height:520px; width:780px" type="image" /><input alt="" src="/mealkit/ckstorage/images/%EC%BD%94%EB%8B%A4%EB%A6%AC%EC%B0%9C/codari_04.jpg" style="height:520px; width:780px" type="image" /></span></p>    <p><span style="font-size:16px"><strong>�̷��� ���������!</strong></span></p>    <hr /><span style="font-size:16px">3�κ�<br />  <strong>1.</strong>�ڴٸ� 1��&nbsp;&nbsp;&nbsp;<strong>2.</strong>������������� 1��&nbsp;&nbsp;&nbsp;<strong>3.</strong>ȥ��ä�� [�ʸ�����, û�����] 1��&nbsp;&nbsp;&nbsp;<strong>4.</strong>�� 1��&nbsp;&nbsp;&nbsp;<strong>5.</strong>�ᳪ�� 1��&nbsp;&nbsp;&nbsp;<strong>6.</strong>���� �� 1��&nbsp;&nbsp;&nbsp;<strong>7.</strong>���߱⸧ 1��&nbsp;&nbsp;&nbsp;<strong>8.</strong>���尡�� 1��&nbsp;&nbsp;</span>    <p><span style="color:#e74c3c"><span style="font-size:16px">*���޻�Ȳ�� ���� �Ϻ� ���� ����� �� �ֽ��ϴ�.</span></span><br />  &nbsp;</p>    <p style="text-align:center"><span style="color:#e74c3c"><span style="font-size:16px"><input alt="" src="/mealkit/ckstorage/images/%EC%BD%94%EB%8B%A4%EB%A6%AC%EC%B0%9C/codari_07.PNG" style="height:575px; width:717px" type="image" /></span></span></p>    <p style="text-align:center"><span style="color:#e74c3c"><span style="font-size:16px"><input alt="" src="/mealkit/ckstorage/images/%EC%BD%94%EB%8B%A4%EB%A6%AC%EC%B0%9C/codari_08.PNG" style="height:605px; width:650px" type="image" /></span></span><input alt="" src="/mealkit/ckstorage/images/%EC%BD%94%EB%8B%A4%EB%A6%AC%EC%B0%9C/codari_09.PNG" style="height:576px; width:715px" type="image" /></p>'
              ,0, 10, 0, sysdate, '�ڴٸ���,�ڴٸ�,��', 'codari.jpg', 'codari.jpg', 'codari_t.jpg', 23005);

INSERT INTO pdcontents(pdcontentsno, 
                  productcateno, title, price, content,
                  recom,cnt,replycnt,rdate,word, fname, fupname, thumb, fsize )
 VALUES((SELECT NVL(MAX(pdcontentsno),0)+1 as pdcontentsno FROM pdcontents),
              1, '�Ұ��κ�����', 24800, '<p style="text-align:center"><span style="font-size:28px"><strong><input alt="" src="/mealkit/ckstorage/images/%EC%86%8C%EA%B3%A0%EA%B8%B0%EB%91%90%EB%B6%80%EC%A0%84%EA%B3%A8/tofustew_01.jpg" style="height:1200px; width:755px" type="image" /><br />  �Ұ��κ�����</strong></span></p>  <span style="font-size:16px">����ϰ� ����� �κο� ��� �丰 �Ұ���� ��ĥ���� ��췯�� �Ұ�� �κ������� �Ұ��մϴ�. ���ϰ� ��ū�ϰų� ĮĮ�ؼ� �ڱ����� ������ �ƴ϶�, ����̽��� ������ ��� ������ ���� ��ȭ�Ӱ� ��췯���� ���� �丮�� �丮�ð��� ª�� �����ؼ� �ٻ� ���� ���ῡ�� ���ְ� ��� �� �־��.<br />  <input alt="" src="/mealkit/ckstorage/images/%EC%86%8C%EA%B3%A0%EA%B8%B0%EB%91%90%EB%B6%80%EC%A0%84%EA%B3%A8/tofustew_02.gif" style="height:500px; width:780px" type="image" /></span><br />  <span style="font-size:20px"><strong>����� �κ�, �Ұ��, �پ��� ������ ��ä�� ��췯�� �ⱳ ��� ���� ��</strong></span>    <p><span style="font-size:16px">����� �κο� �� ���� ����(���̹���,�����̹���,�ִ�Ÿ������), ���, ����, ��ġ, ��ȣ���� ��� �� ���ѻ꼺 �αٿ��� ������ �κ������� ���� ������ ��ź�����. ���ϸ鼭�� �ǰ��� ���̶� ���� ��� �����Ұſ���.<br />  <input alt="" src="/mealkit/ckstorage/images/%EC%86%8C%EA%B3%A0%EA%B8%B0%EB%91%90%EB%B6%80%EC%A0%84%EA%B3%A8/tofustew_03.jpg" style="height:520px; width:780px" type="image" /><input alt="" src="/mealkit/ckstorage/images/%EC%86%8C%EA%B3%A0%EA%B8%B0%EB%91%90%EB%B6%80%EC%A0%84%EA%B3%A8/tofustew_04.jpg" style="height:520px; width:780px" type="image" /></span></p>    <p><span style="font-size:20px"><strong>�̷��� ���������!</strong></span></p>    <hr /><span style="font-size:16px">3�κ�<br />  <strong>1.</strong>�Ұ�� 1��&nbsp;&nbsp;&nbsp;<strong>2.</strong>����� ������ 1��&nbsp;&nbsp;&nbsp;<strong>3.</strong>������ҽ� 2��&nbsp;&nbsp;&nbsp;<strong>4.</strong>ȥ��ä��I [����, ��ȣ��, �����̹���, �ִ�Ÿ������]&nbsp;&nbsp;&nbsp;<strong>5.</strong>ȥ��ä��II [���̹���, ����]&nbsp;&nbsp;&nbsp;<strong>6.</strong>���߱�ġ 1��&nbsp;&nbsp;&nbsp;<strong>7.</strong>���尡�� 1��&nbsp;&nbsp;&nbsp;<strong>8.</strong>�������� 1�� &nbsp;&nbsp;&nbsp;<strong>9.</strong>��� 1��&nbsp;&nbsp;&nbsp;<strong>10.</strong>�κ� 1��&nbsp;&nbsp;</span>    <p><span style="color:#e74c3c"><strong>*���޻�Ȳ�� ���� �Ϻ� ���� ����� �� �ֽ��ϴ�.<br />  <br />  <input alt="" src="/mealkit/ckstorage/images/%EC%86%8C%EA%B3%A0%EA%B8%B0%EB%91%90%EB%B6%80%EC%A0%84%EA%B3%A8/tofustew_05.jpg" style="height:480px; width:780px" type="image" /></strong></span></p>    <p><strong><span style="font-size:20px">�丮 �� �غ��ϼ���!</span></strong></p>    <hr />  <p><span style="font-size:16px">30��<br />  �غ��Ͻ� ��Ṱ 1400ml(������ ���� �� 7��)�ʿ��� �����������񳿺�, �׸�, ����, ŰģŸ��</span></p>    <p style="text-align:center"><span style="font-size:16px"><input alt="" src="/mealkit/ckstorage/images/%EC%86%8C%EA%B3%A0%EA%B8%B0%EB%91%90%EB%B6%80%EC%A0%84%EA%B3%A8/tofustew_06.PNG" style="height:671px; width:560px" type="image" /><br />  <input alt="" src="/mealkit/ckstorage/images/%EC%86%8C%EA%B3%A0%EA%B8%B0%EB%91%90%EB%B6%80%EC%A0%84%EA%B3%A8/tofustew_07.PNG" style="height:640px; width:527px" type="image" /></span></p>'
              ,0, 10, 0, sysdate, '�κ�����,����,�Ұ��,�Ұ��κ�����', 'tofustew.jpg', 'tofustew.jpg', 'tofustew_t.jpg', 34726);

-- �Ͻ� ī�װ� ��ȣ Ȯ���� �Ͻ� ī�װ��� insert
INSERT INTO pdcontents(pdcontentsno, 
                  productcateno, title, price, content,
                  recom,cnt,replycnt,rdate,word, fname, fupname, thumb, fsize )
 VALUES((SELECT NVL(MAX(pdcontentsno),0)+1 as pdcontentsno FROM pdcontents),
              3, '��ǣ������', 24800, '<div style="text-align:center"><input alt="" src="/mealkit/ckstorage/images/%EB%B0%80%ED%91%80%EC%9C%A0%EB%82%98%EB%B2%A0/nabe_01.jpg" style="width: 763px; height: 1200px;" type="image" />  <p><span style="font-size:28px"><strong>��ǣ������</strong></span></p>    <div><span style="font-size:16px">�������鼭�� �Ű� �� ���� �λ��� �� �� �ִ� �丮. ����� ��Ź��, ���� �Դ� �Ļ縦 ���� Ư���ϰ� ���� �ʹٴ� ������ ��ٸ�, �������� �����غ�����. �����帮�� ��Ḧ ����� �׾� ���� �������� �׾��ְ� ������ �ξ� �ѹ� ���ۺ��� �������� �ϼ��Ǵϱ�, ���� ������� ū ������<br />  ������ �ſ���.<br />  <input alt="" src="/mealkit/ckstorage/images/%EB%B0%80%ED%91%80%EC%9C%A0%EB%82%98%EB%B2%A0/nabe_02.gif" style="width: 780px; height: 500px;" type="image" /></span>    <div style="text-align:left"><span style="font-size:20px"><strong>����ϸ鼭�� ����� �Ϻ��� �����丮</strong></span></div>    <p style="text-align:left"><span style="font-size:16px">�������νø� ����� ������ ������ ����ϸ鼭�� ����� �Ϻ��� �����丮�� ���� ��Ⱦ��. ���⿡ �°� �پ��� ���� ���� �� �ֵ��� ��������ҽ��� ���������ҽ��� �Բ� ���������. ����ϸ鼭�� ����� ������ �� �� ��ð�, Ǫ���ϰ� ����� ���� ��ä�� ���� ���⿡ ���� �� ���� �ҽ��� �� ��ä�ο� ���� ��ܺ�����. ��ǣ�� ������ ���ְ� ���� ��, ���� ������ �����帰 Į���� ���� �־� �ѼҲ� �������� �� �ٸ� ���̰� �ϼ�����.</span></p>  <input alt="" src="/mealkit/ckstorage/images/%EB%B0%80%ED%91%80%EC%9C%A0%EB%82%98%EB%B2%A0/nabe_03.jpg" style="width: 780px; height: 520px;" type="image" /><br />  <input alt="" src="/mealkit/ckstorage/images/%EB%B0%80%ED%91%80%EC%9C%A0%EB%82%98%EB%B2%A0/nabe_04.jpg" style="width: 780px; height: 520px;" type="image" />  <div style="text-align:left">  <p><span style="font-size:20px"><strong>�̷��� ���������!</strong></span></p>    <hr /><span style="font-size:16px">3�κ�<br />  <strong>1.</strong>�Ұ�� 1��&nbsp;<strong>2.</strong>��ȣ�� 1��&nbsp;<strong>3.</strong>ȥ��ä�� (������,����) 1��&nbsp;<strong>4.</strong>ȥ�չ��� (�����ڹ���, ǥ�����, ���̹���) 1��&nbsp;<strong>5.</strong>û��ä 1��&nbsp;<strong>6.</strong>���������� 2��&nbsp;<strong>7.</strong>Į���� 1��&nbsp;<strong>8.</strong>���μҽ� I (��������ҽ�) 1��&nbsp;<strong>9.</strong>���μҽ�II (���������ҽ�) 1��</span>    <p><strong><span style="color:#2980b9">*���޻�Ȳ�� ���� ���ߴ� ��Ÿī��ƾ ���߷� ������ �� �ֽ��ϴ�.<br />  (��Ÿī��ƾ ���ߴ� �� ����� ���� ��� ǰ������, �Ѹ��κп� £�� ����� �Ǵ� �������� Ư¡�Դϴ�)</span></strong><br />  <br />  <strong><span style="color:#e74c3c">*���޻�Ȳ�� ���� �Ϻ� ���� ����� �� �ֽ��ϴ�.</span></strong></p>    <p style="text-align:center"><strong><span style="color:#e74c3c"><input alt="" src="/mealkit/ckstorage/images/%EB%B0%80%ED%91%80%EC%9C%A0%EB%82%98%EB%B2%A0/nabe_05.jpg" style="width: 780px; height: 480px;" type="image" /><br />  <input alt="" src="/mealkit/ckstorage/images/%EB%B0%80%ED%91%80%EC%9C%A0%EB%82%98%EB%B2%A0/nabe_06.PNG" style="width: 530px; height: 491px;" type="image" /></span></strong></p>  </div>  </div>  </div>'
              ,0, 10, 0, sysdate, '����,��ǣ��,��ǣ������', 'nabe.jpg', 'nabe.jpg', 'nabe_t.jpg', 25888);
              
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
    
SELECT pdcontentsno, productcateno, title,content
                              recom,cnt,replycnt
FROM pdcontents;

-- 6) ����
UPDATE pdcontents
SET title='��ġ������', content='���� ����', word='�˻���'
WHERE pdcontentsno = 1;

-- ��� �� 0 �ʱ�ȭ
UPDATE pdcontents
SET replycnt=0;

-- recom 0 �ʱ�ȭ
UPDATE pdcontents
SET recom = 0;

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


