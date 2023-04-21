<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import ="example1230.domain.BoardVo" %>   
 <% BoardVo bv = (BoardVo)request.getAttribute("bv"); %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
	function logout(){
		alert("로그아웃");
	location.href='<%=request.getContextPath()%>/member/memberLogOut.do'}
	function check(){	

		var fm = document.frm;	
		if (fm.subject.value == "" ){
			alert("제목을 입력하세요");
			fm.subject.focus();
			return;
		}else if (fm.contents.value == ""){
			alert("내용을 입력하세요");
			fm.contents.focus();
			return;
		}else if (fm.writer.value == ""){
			alert("작성자를 입력하세요");
			fm.writer.focus();
			return;
		}else if (fm.pwd.value == ""){
			alert("비밀번호를 입력하세요");
			fm.pwd.focus();
			return;
		}
		
		fm.action = "<%=request.getContextPath()%>/board/boardModifyAction.do";
		fm.method="post";
		fm.submit();
		return;
	}
	</script>


<body>

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

    
   	
<body>


</body>
</html>