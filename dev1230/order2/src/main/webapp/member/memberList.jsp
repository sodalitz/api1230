<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
 <%@ page import="example1230.domain.*" %> 
 <%@ page import="java.util.*" %>    
 <% 
 ArrayList<MemberVo> alist  =(ArrayList<MemberVo>)request.getAttribute("alist");
 %>   
        
<!DOCTYPE html>
<html>
<style>
    body{width: 900px; height: 100px; margin:auto; text-align: left; background-color: rgb(252, 243, 231);}

</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원목록</h1>
<table border=1 style="border:8px solid green; border-collapse: collapse;">
<tr>
<td style="background-color: orange;">회원번호</td>
<td style="background-color: orange;">회원아이디</td>
<td style="background-color: orange;">회원이름</td>
<td style="background-color: orange;">탈퇴여부</td>
<td style="background-color: orange;">가입일</td>
</tr>
<% for (MemberVo mv : alist) {%>
<tr>
<td><%=mv.getMidx() %></td>
<td><%=mv.getMemberid() %></td>
<td><%=mv.getMembername() %></td>
<td><%=mv.getDelyn() %></td>
<td><%=mv.getWriteday() %></td>
</tr>
<%} %>
</table>

</body>
</html>