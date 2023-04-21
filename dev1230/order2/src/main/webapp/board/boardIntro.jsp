<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>


<style>
    body{width:850px; height: 100px; margin:auto; text-align: left; background-color: rgb(252, 243, 231);}
    header{text-align: right;}
    MainTitle{text-align: center;}
    h1{text-align: center;}
    main{}
    
</style>
<script>
	function logout(){
		alert("로그아웃");
	location.href='<%=request.getContextPath()%>/member/memberLogOut.do'}
</script>


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
<main>

</main>
<div>
<h1>소개글</h1>

<a href="https://blog.naver.com/jeonju_city"><img src ="/order2/image/main.jpg"width=277px; height=70px;></a>
 <a href="https://www.youtube.com/c/%EC%A0%84%EC%A3%BC"><img src ="/order2/image/main2.jpg"width=277px; height=70px;></a>
 <a href="https://daum.jeonju.go.kr/"><img src ="/order2/image/main3.jpg"width=277px; height=70px;></a>
 <img src="/order2/image/int.jpg" width= 850px; heigh= 600px;>
 
</div>

<body>



</body>
</html>