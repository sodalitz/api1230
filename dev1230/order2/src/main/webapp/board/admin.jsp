<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자모드</title>
</head>
<body>
	<button type="button" onclick="location.href='/ticketList.jsp'"> 티켓</button>
	

	<button type="button" onclick="location.href='<%=request.getContextPath()%>/board/boardList.do'"> 글 ㄱ</button>

</body>
</html>