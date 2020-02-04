<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Meal Kit 장바구니 그룹</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
   
<script type="text/javascript">
function update_form(cartgrpno) {
    
    var url = './update.do?cartgrpno=' + cartgrpno;
    var win = window.open(url, '카테고리 그룹 수정', 'width=700px, height=400px');
    
    var x = (screen.width - 700) / 2;
    var y = (screen.height - 400) / 2;
    
    win.moveTo(x, y); // 지정된 좌표로 이동    
  }
  
function delete_form(cartgrpno) {
    
    var url = './delete.do?cartgrpno=' + cartgrpno;
    var win = window.open(url, '카테고리 그룹 삭제', 'width=700px, height=400px');
    
    var x = (screen.width - 700) / 2;
    var y = (screen.height - 400) / 2;
    
    win.moveTo(x, y); // 지정된 좌표로 이동    
  }
  
</script>
 
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" />
  
  <DIV class='title_line'>장바구니 그룹</DIV>
 
  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <FORM name='frm_create' id='frm_create' method='POST' action='./create.do'>
      <!-- <input type='hidden' name='lang' id='lang' value='en'> --> <!-- ko, en -->
        
      <label>그룹 이름</label>
      <input type='text' name='name' value='' required="required" style='width: 25%;'>
 
      <label>순서</label>
      <input type='number' name='seqno' value='1' required="required" 
                min='0' max='1000' step='1' style='width: 5%;'>
  
      <label>형식</label>
      <select name='visible'>
        <option value='Y' selected="selected">Y</option>
        <option value='N'>N</option>
      </select>
       
      <button type="submit" id='submit'>등록</button>
      <button type="button" onclick="cancel();">취소</button>
    </FORM>
  </DIV>
 
  
<TABLE class='table table-striped'>
  <colgroup>
    <col style='width: 10%;'/>
    <col style='width: 40%;'/>
    <col style='width: 20%;'/>
    <col style='width: 10%;'/>    
    <col style='width: 20%;'/>
  </colgroup>
 
  <thead>  
  <TR>
    <TH class='th_basic'>순서</TH>
    <TH class='th_basic'>대분류명</TH>
    <TH class='th_basic'>등록일</TH>
    <TH class='th_basic'>출력</TH>
    <TH class='th_basic'>기타</TH>
  </TR>
  </thead>
  
  <tbody>
    <c:forEach var ="cartgrpVO" items ="${list }" >
    <c:set var="cartgrpno" value="${cartgrpVO.cartgrpno }"/>
    
    <TR>
      <TD style='text-align:center;'>${cartgrpVO.seqno }</TD>
      <TD>
        <A href="../cart/list.do?cartgrpno=${cartgrpno }">${cartgrpVO.name }(${cartgrpVO.cnt })</A>
      </TD>
      <TD style='text-align:center;'>${cartgrpVO.rdate.substring(0,10) }</TD>
      <TD style='text-align:center;'>${cartgrpVO.visible }</TD>
      <TD style='text-align:center;'>
        <A href="./update_seqno_up.do?cartgrpno=${cartgrpno }"><Img src='./images/up.png' title='우선순위 높임'></A>
        <A href="./update_seqno_down.do?cartgrpno=${cartgrpno }"><Img src='./images/down.png' title='우선순위 낮춤'></A> 
        <A href="javascript:update_form(${cartgrpno });"><Img src='./images/update.png' title='수정'></A>
        <A href="javascript:delete_form(${cartgrpno });"><Img src='./images/delete.png' title='삭제'></A>
      </TD>
     
    </TR>
    </c:forEach>
  </tbody> 
 
</TABLE>
 
 
<jsp:include page="/menu/bottom.jsp" />
</body>
 
</html> 
 