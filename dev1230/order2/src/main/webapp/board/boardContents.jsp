<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="example1230.domain.BoardVo" %>   
 
 <% BoardVo bv   = (BoardVo)request.getAttribute("bv"); %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
    body{width: 900px; height: 100px; margin:auto; text-align: left; background-color: rgb(252, 243, 231);}
    header{text-align: right;}
    MainTitle{text-align: center;}
    h1{text-align: center;}
    
</style>






<body>
    <header>
    <img src="/order2/image/logo.jpg">
 <a href="/order2/index.jsp"><img src ="/order2/image/d.jpg" width=750px; height=100px;></a>
	<nav>	
		<% if (session.getAttribute("midx") != null){
		int midx = (int)session.getAttribute("midx");
		out.println("회원번호: "+midx);
		
		String memberId = (String)session.getAttribute("memberId");
		out.println("<br>회원아이디: "+memberId);
		
		String memberName = (String)session.getAttribute("memberName");
		out.println("<br>회원이름: "+memberName);
		%>	
		</nav>
		<button type="button" onclick="logout()">로그아웃</a>
		<%	
		} else{
		%>       <button type="button" onclick="location.href='<%=request.getContextPath()%>/member/memberLogin.do'">로그인</button>
		 		<button type="button" onclick="location.href='<%=request.getContextPath()%>/member/memberJoin.do'"> 회원가입</a>
		
		<%}%>
 </header>

    
   	 <main>
       
            <a href="<%=request.getContextPath()%>/board/boardPro.do"><img src ="/order2/image/menu.jpg"width=210px; height=100px;></a>
            <a href="<%=request.getContextPath()%>/board/boardIntro.do"><img src ="/order2/image/menb.jpg" width=210px; height=100px;></a>
            <a href="<%=request.getContextPath()%>/board/boardMap.do"><img src ="/order2/image/menc.jpg" width=210px; height=100px;></a>
            <a href="<%=request.getContextPath()%>/board/boardList.do"><img src ="/order2/image/mend.jpg" width=200px; height=100px;></a>
     	</main>
     	
     
<h1>내용보기</h1>
<table  border=1 style="width:800px; border:8px solid green; border-collapse: collapse;">
<tr>
<td style="width:50px; background-color: orange;">제목</td>
<td> <%=bv.getSubject() %> &nbsp;&nbsp;&nbsp;&nbsp;  조회수(<span style="color:red;"><%=bv.getViewcnt() %>) </td>
</tr>
<tr>
<td style="background-color: orange;">파일다운로드</td>
<td>
<%if (bv.getFilename() ==null){
}else{ %>
<a href="<%=request.getContextPath()%>/board/fileDownload.do?filename=<%=bv.getFilename()%>"><%=bv.getFilename() %></a></td>
<%} %>
</tr>
<tr>
<td style="background-color: orange;">이미지</td>
<td>
<%
if (bv.getFilename() ==null){
}else{
String exp =  bv.getFilename().substring(bv.getFilename().length()-3, bv.getFilename().length());

if (exp.equals("jpg") || exp.equals("gif") || exp.equals("png")   ) { %>
<img src="<%=request.getContextPath()%>/image/<%=bv.getFilename()%>"  width="400px" height="100px"></td>
<%} 
}
%>
</tr>


<tr>
<td style="height:200px;background-color: orange;">내용</td>
<td><%=bv.getContents() %>  </td>
</tr>
<tr>
<td style="background-color: orange;">작성자</td>
<td><%=bv.getWriter() %></td>
</tr>
<tr>
<td colspan=2 style="text-align:right;">
<button type="button" onclick="location.href='<%=request.getContextPath()%>/board/boardModify.do?bidx=<%=bv.getBidx() %>'   ">수정</button>
<button type="button" onclick="location.href='<%=request.getContextPath()%>/board/boardDelete.do?bidx=<%=bv.getBidx() %>'   ">삭제</button>
<button type="button" onclick="location.href='<%=request.getContextPath()%>/board/boardReply.do?bidx=<%=bv.getBidx() %>&originbidx=<%=bv.getOriginbidx()%>&depth=<%=bv.getDepth()%>&level_=<%=bv.getLevel_()%>'   ">답변</button>
<button type="button" onclick="location.href='<%=request.getContextPath()%>/board/boardList.do'">목록</button>
</td>
</tr>
</table>
</body>
</html>