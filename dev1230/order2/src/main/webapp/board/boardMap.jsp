<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찾아오시는길</title>
</head>

<style>
    body{width: 850px; height: 100px; margin:auto; text-align: center; background-color: rgb(252, 243, 231);}
    header{text-align: right;}
    MainTitle{text-align: center;}
    h1{text-align: center;}
    
</style>


<script>
function logout(){
	alert("로그아웃");
location.href='<%=request.getContextPath()%>/member/memberLogOut.do'}
</script>

<body>
    <header>
    <img src="/order2/image/logo.jpg">
 <a href="/order2/index.jsp"><img src ="/order2/image/d.jpg" width=750px; height=100px;></a>
     <a href="/order2/index.jsp"></a>
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
     	
<body>
<h1>찾아오는길</h1>
<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d25881.162521547987!2d127.1070796251297!3d35.82091023390369!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x35703b549529b1fd%3A0x885506486ca1c028!2z7KCE7KO87ZmU7IKw7LK07Jyh6rSA!5e0!3m2!1sko!2skr!4v1679904950004!5m2!1sko!2skr" width="830" height="600" style="border: 15px solid green;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>" 


</body>
</html>