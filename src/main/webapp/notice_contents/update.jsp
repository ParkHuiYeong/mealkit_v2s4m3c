<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title></title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
 
<script type="text/JavaScript">
  window.onload=function(){
    CKEDITOR.replace('no_contents');  // <TEXTAREA>태그 id 값
  }; 
</script>

</head> 
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
 
  <ASIDE style='float: left;'>
    <A href='../notice_cate/list.do'>카테고리 그룹</A> > 
    <A href='./list.do?cateno=${cateno }'>${notice_cateVO.title }</A> >
    수정
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href='./list.do?cateno=${param.cateno }'>목록</A>
    <!-- <span class='menu_divide' >│</span> --> 
  </ASIDE> 
 
  <div class='menu_line'></div>
  <FORM name='frm' method='POST' action='./update.do' class="form-horizontal">
      <input type='hidden' name='cateno' value='${notice_cateVO.cateno }'>
      <input type='hidden' name='no_contentsno' value='${no_contentsVO.no_contentsno }'>
      
      <div class="form-group">   
        <label class="col-md-1 control-label">제목</label>
        <div class="col-md-11">
          <input type='text' class="form-control input-lg" name='no_title' value='${no_contentsVO.no_title}' required="required" style='width: 80%;'>
        </div>
      </div>   
      <div class="form-group">   
        <label class="col-md-1 control-label">내용</label>
        <div class="col-md-11">
          <textarea class="form-control input-lg" name='no_contents' id='no_contents' rows='10'>${no_contentsVO.no_contents}</textarea>
        </div>
      </div>
      
      <div class="form-group">   
        <label class="col-md-1 control-label"><span style='font-size: 0.99em;'>검색어</span></label>
        <div class="col-md-11">
          <input type='text' class="form-control input-lg" name='no_word' value='${no_contentsVO.no_word }' placeholder="검색어">
        </div>
      </div>
      
      <DIV style='text-align: right;'>
        <button type="submit" class="btn btn-info">변경된 내용 저장</button>
        <button type="button" onclick="location.href='./list.do?cateno=${notice_cateVO.cateno}'" class="btn btn-info">취소[목록]</button>
      </DIV>
  </FORM>
 
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html> 
 
 
 
 