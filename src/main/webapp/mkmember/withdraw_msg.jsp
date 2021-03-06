<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Meal Kit</title>
<link href="../css/style.css" rel="Stylesheet" type="text/css">

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>



</head>
<body>
<jsp:include page="/menu/top.jsp" flush='false' />

<DIV class='title_line'>알림</DIV>
 
<DIV class='message'>
  <fieldset class='fieldset_basic'>
    <UL>
      <c:choose>
        <c:when test="${param.count == 0 }">
          <LI class='li_none'>
            <span class='span_fail'>비밀번호가 일치하지 않습니다.</span>
          </LI>
          <LI class='li_none'>
            <button type='button' 
                        onclick="history.back();"
                        class="btn btn-primary">재시도</button>
            <button type='button' 
                        onclick="location.href='${pageContext.request.contextPath}'" 
                        class="btn btn-primary">탈퇴 취소</button>                        
          </LI>
        </c:when>
        <c:otherwise>
          <LI class='li_none'>
            <span class='span_success'>탈퇴에 성공했습니다.</span>
          </LI>
          <LI class='li_none'>
            <button type='button' 
                        onclick="location.href='${pageContext.request.contextPath}'" 
                        class="btn btn-primary">확인</button>                  
          </LI>
        </c:otherwise>
      </c:choose>
     </UL>
  </fieldset>
 
</DIV>
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>