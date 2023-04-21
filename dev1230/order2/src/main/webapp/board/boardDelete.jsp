<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="example1230.domain.BoardVo" %>    
<% 
BoardVo bv = (BoardVo)request.getAttribute("bv");
%>    
 <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function check(){	

	var fm = document.frm;	
	if (fm.pwd.value == "" ){
		alert("비밀번호를 입력하세요");
		fm.pwd.focus();
		return;
	}	
	var flag = confirm("삭제하시겠습니까?");
	if (flag == false){
		return;
	}	
	fm.action = "<%=request.getContextPath()%>/board/boardDeleteAction.do";
	fm.method="post";
	fm.submit();
	return;
}
</script>
</head>


<style>
    body{width: 900px; height: 100px; margin:auto; text-align: center; background-color: rgb(252, 243, 231);}
    header{text-align: right;}
    MainTitle{text-align: center;}
    h1{text-align: center;}
    body{float:center;}
    table {margin: 0 auto;}
    
</style>





<body>

<img src="/order2/image/logo.jpg">
 <a href="/order2/index.jsp"><img src ="/order2/image/d.jpg" width=750px; height=100px;></a>
    <header>
    
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
		<%}%>
 </header>

    
   	 <main>
       
            <a href="<%=request.getContextPath()%>/board/boardPro.do"><img src ="/order2/image/menu.jpg"width=210px; height=100px;></a>
            <a href="<%=request.getContextPath()%>/board/boardIntro.do"><img src ="/order2/image/menb.jpg" width=210px; height=100px;></a>
            <a href="<%=request.getContextPath()%>/board/boardMap.do"><img src ="/order2/image/menc.jpg" width=210px; height=100px;></a>
            <a href="<%=request.getContextPath()%>/board/boardList.do"><img src ="/order2/image/mend.jpg" width=200px; height=100px;></a>
     	</main>
     	



<body>
<h1>삭제페이지입니다</h1>
<form name="frm">
<input type="hidden" name="bidx" value="<%=bv.getBidx()%>">
<table border=1 style="width:400px; border:2px solid green; border-collapse: collapse;">
<tr>
<td  style="background-color: orange;">제목</td>
<td><%=bv.getSubject() %></td>
</tr>
<tr>
<td  style="background-color: orange;">비밀번호</td>
<td><input type="password" name="pwd"></td>
</tr>
<tr><td colspan=2>
<input type="button" name="btn"  value="확인" onclick="check();">
</td></tr>
</table>
</form>
</body>
</html>