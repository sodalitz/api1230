<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.PreparedStatement"%>

<%@ page import="example1230.domain.TicketVo" %>
<%@ page import="example1230.service.TicketDao" %>



<%
request.setCharacterEncoding("UTF-8");

String name = request.getParameter("name");
String tel = request.getParameter("tel");


TicketVo tv = new TicketVo(name, tel, null, 0);
TicketDao dao = new TicketDao();

if (dao.ticketCheck(tv) > 0) {
    out.println("<script>alert('예약이 확인되었습니다.');</script>");
} else {
    out.println("<script>alert('취소할 예약이 없습니다.');</script>");
}
out.println("<script>location.href='"+request.getContextPath()+"/board/boardPro.do';</script>");
%>
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
    </head>
    <body>

    
	</body>
</html>

