<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.SQLException" %>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    


<%
	request.setCharacterEncoding("utf-8");
	
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	String list = request.getParameter("list");
	String count = request.getParameter("count");
	
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String uid = "system";
	String upw = "1234";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String sql = "insert into ticket7 values(?, ?, ?, ?)";
	
	try{
		// 1. 드라이버 로드
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		// 2. conn 생성
		conn = DriverManager.getConnection(url, uid, upw);
		
		// 3. pstmt 생성
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, tel);
		pstmt.setString(3, list);
		pstmt.setString(4, count);
		
		
		// 4. sql문 실행
		int result = pstmt.executeUpdate();
		
		if(result == 1){ // 성공
			response.sendRedirect(request.getContextPath() + "/board/boardPro.do");
		} else{ // 실패
			response.sendRedirect("join_fail.jsp");
		}
		
	} catch(Exception e){
		e.printStackTrace();
	} finally{
		try{
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
		} catch(Exception e){
			e.printStackTrace();
		}
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>티켓연동</title>
</head>
<body>