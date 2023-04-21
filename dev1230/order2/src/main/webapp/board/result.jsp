<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.SQLException" %>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	    body{width: 200px; height: 100px; margin:auto; text-align: center; background-color: rgb(252, 243, 231); font-weight:bold; font-size:20px;}
	#btn {
			width:200px;
		  background-color: #4CAF50;
		  border: none;
		  color: Yellow;
		  padding: 12px 24px;
		  text-align: center;
		  text-decoration: none;
		  font-weight:bold;
		  display: inline-block;
		  font-size: 16px;
		  border-radius: 8px;
		  cursor: pointer;
		  transition: background-color 0.3s ease;
		  float:center;
		  margin-bottom:10px;
		}
		
		#btn:hover {
		  background-color: #3e8e41;
		  
		}
</style>
</head>
<body>


<body>
<form action="ticketLink.jsp" method="post">
    <%
String name =request.getParameter("name");
String tel= request.getParameter("tel");
String list = request.getParameter("list");
String count = request.getParameter("count");
int price = Integer.parseInt(count)*5000;


%>

<div id="container">
<h2 style="color:darkgreen">주문완료</h2>
<h5 style="color:green">감사합니다</h5>
<hr>

<p>
이름:<%=name %> <br>
<input type="hidden" name="name" value="${param.name}">
전화번호 :<%=tel %><br>
<input type="hidden" name="tel" value="${param.tel}">
코스 : <%=list %><br>
<input type="hidden" name="list" value="${param.list}">
<hr>

금액 : <%=price %><br>
<input type="hidden" name="count" value="${param.count}">

</p>


<input type="submit" id="btn"  value="확인">
<button type="button"  id="btn" onclick="location.href='<%=request.getContextPath()%>/board/boardPro.do'; alert('취소되었습니다.');">구매 취소</button>
</div>  </form>                           
</body>
</html>


