<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
    
    <%
    TicketVo bv = (ticketVo)request.getAttribute("tv");

	%>
	
	<%
	
		%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
	
	<div class="chart">
		<table border="1">
			<tr>					
				<td>이름</td>
				<td>번호</td>
				<td>코스</td>
				<td>갯수</td>					
			</tr>
			<%
				while (rs.next()) {
					%>
			<tr>
				<td><%=rs.getString("name")%></td>
				<td><%=rs.getString("tel")%></td>	
				<td><%=rs.getString("list")%></td>
				<td><%=rs.getString("count")%></td>	
							
			</tr>
			
			<%
				}
			} catch (Exception e) {
			e.printStackTrace();
			} finally {
			try {
			if (rs != null) {
				rs.close();
			}
			if (stmt != null) {
				stmt.close();
			}
			if (conn != null) {
				conn.close();
			}
			} catch (Exception e) {
			e.printStackTrace();
			}
			}
			%>
			
					</table>
					
					</div>
	
	</body>
</html>