<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 
</head>
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
  <ASIDE style='float: left;'>
    <A href='../productcate/list.do'>카테고리 그룹</A> > 
    <A href='./list.do'>모든 댓글</A>
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">새로고침</A>
<!--     <span class='menu_divide' > | </span> -->

  </ASIDE> 
  <DIV class='menu_line' style='clear: both;'></DIV>
  
  <div style='width: 100%;'>
    <table class="table table-striped" style='width: 100%;'>
      <colgroup>
        <col style="width: 5%;"></col>
        <col style="width: 5%;"></col>
        <col style="width: 5%;"></col>
        <col style="width: 65%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 10%;"></col>
        
      </colgroup>
      <%-- table 컬럼 --%>
      <thead>
        <tr>
          <th style='text-align: center;'>평점</th>
          <th style='text-align: center;'>글<br>번호</th>
          <th style='text-align: center;'>회원 번호</th>
          <th style='text-align: center;'>내용</th>
          <th style='text-align: center;'>등록일</th>
          <th style='text-align: center;'>기타</th>
        </tr>
      
      </thead>
      
      <%-- table 내용 --%>
      <tbody>
        <c:forEach var="pdreplyVO" items="${list }">
          <c:set var="pdcontentsno" value="${pdreplyVO.pdcontentsno }" />
          <c:set var="pdreplyno" value="${pdreplyVO.pdreplyno }" />
          
          <tr style='height: 50px;'> 
            <td style='vertical-align: middle; text-align: center;'>
              ${pdreplyVO.pdreplyno }
            </td>
            <td style='text-align: center; vertical-align: middle;'>
              <a href="../pdcontents/read.do?pdcontentsno=${pdcontentsno }">${pdcontentsno}</a>
            </td>
            <td style='text-align: center; vertical-align: middle;'>
              <a href="../mkmember/read.do?memberno=${pdreplyVO.memberno}">${pdreplyVO.memberno}</a>
            </td>
            <td style='text-align: left; vertical-align: middle;'>${pdreplyVO.content}</td>
            <td style='text-align: center; vertical-align: middle;'>${pdreplyVO.rdate.substring(0,10)}</td>
            <td style='text-align: center; vertical-align: middle;'>
              <a href="./delete.do?pdreplyno=${pdreplyVO.pdreplyno}"><img src="./images/delete2.png" title="삭제"  border='0' /></a>
            </td>
          </tr>
        </c:forEach>
        
      </tbody>
    </table>
    <br><br>
  </div>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>
    
 
  