<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈페이지</title>
</head>
	<style>
	    body{width: 850px; height: 100px; margin:auto; text-align: left; background-color: rgb(252, 243, 231);}
	    header{text-align: right;}
	    MainTitle{text-align: center;}
	    #banner {
	     width: 850px;
	     height: 400px;
	     overflow: hidden;}
	  	 #banner img {
	     width: 850px;
	     height: 400px;}
	     #banner {
		  position: relative;
		}
		
		#banner img {
		  position: absolute;
		  top: 0;
		  left: 0;
		  opacity: 0;
		  transition: opacity 1.5s ease-in-out;
		}
		
		#banner img.active {
		  opacity: 1;
		}
	     
	     
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
	<button type="button" onclick="logout()">로그아웃</button>
	
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
	    <MainBody>
	       
					<div id="banner">
				        <img src="/order2/image/main2.jpg" alt="Banner 1">
				        <img src="/order2/image/main3.jpg" alt="Banner 2">
				        <img src="/order2/image/main.jpg" alt="Banner 3">
				    </div>
				    <script>
				    var banner = document.getElementById('banner');
				    var images = banner.getElementsByTagName('img');
				    var index = 0;
				    images[index].classList.add('active');

				    var interval = setInterval(function() {
				      images[index].classList.remove('active');
				      index++;
				      if (index >= images.length) {
				        index = 0;
				      }
				      images[index].classList.add('active');
				    }, 2000);

				    </script>
	
	    </MainBody>
	
	    
	    <footer>
	        <img src ="/order2/image/download.jpg" width=850px; height=100px;>
	
		
<div id="ww_377c91075ca4f" v='1.3' loc='id' a='{"t":"responsive","lang":"ko","sl_lpl":1,"ids":[],"font":"Arial","sl_ics":"one_a","sl_sot":"celsius","cl_bkg":"image","cl_font":"#FFFFFF","cl_cloud":"#FFFFFF","cl_persp":"#81D4FA","cl_sun":"#FFC107","cl_moon":"#FFC107","cl_thund":"#FF5722"}'>Weather Data Source: <a href="https://wetterlabs.de/wetter_busan/woche/" id="ww_377c91075ca4f_u" target="_blank">7 tage wetter Busan</a></div><script async src="https://app1.weatherwidget.org/js/?id=ww_377c91075ca4f"></script>			
	    </footer>
	
	    
	</body>
</html>



