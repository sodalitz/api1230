<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>   
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>



<style>
    body{width: 850px; height: 100px; margin:auto; text-align: left; background-color: rgb(252, 243, 231);}
    header{text-align: right;}
    MainTitle{text-align: center;}
    h1{text-align: center;}
     a { text-decoration: none; color: black; }
    a:visited { text-decoration: none; }
    a:hover { text-decoration: none; }
    a:focus { text-decoration: none; }
    a:hover, a:active { text-decoration: none; }
    th {  background-color: #ccc;}
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

	<h1>게시판</h1>
	<form name="frm" action="${pageContext.request.contextPath }/board/boardList.do" method="post">
	<table border-collapse:collapse; style="text-align:center;width:800px;">
	<tr>
	<td style="width:600px;"></td>
	<td>
	<select name="searchType">
	<option value="subject">제목</option>
	<option value="writer">작성자</option>
	</select>
	</td>
	<td><input type="text" name="keyword" size="10"></td>
	<td><input type="submit" name="submit" value="검색"></td>
	</tr>
	</table>
	</form>
	<table border=2 style="text-align:center;width:850px; border:8px solid green; border-collapse: collapse;">
	<tr height="70">
	<td style="background-color: orange; font-weight: bold;">게시물번호</td>
	<td  style="background-color: orange; font-weight: bold;">제목</td>
	<td style="background-color: orange; font-weight: bold;">작성자</td>
	<td style="background-color:orange; font-weight: bold;">날짜</td>
	</tr>
	<c:forEach var="bv" items="${blist}">
	<tr>
	<td>${bv.bidx}</td>
	<td>
	<c:forEach var="i"  begin="1"  end="${bv.level_ }"  step="1">
		
	<c:if test="${ i ==bv.level_  }"></c:if> <span style="font-weight: bold; font-size: 5px; color: red;">[Re]:</span></c:forEach>
	<a href="${pageContext.request.contextPath }/board/boardContents.do?bidx=${bv.bidx}">${bv.subject }</a></td>
	<td>${ bv.writer }</td>
	<td>${bv.writeday.substring(0, 10)}</td>
	</tr>
	</c:forEach>
	
	</table>
	<table border=0 style="width:300px;width:800px;">
	<tr>
	<td style="text-align:right;">
	<c:if test="${ pm.prev == true }">
	<a href="${pageContext.request.contextPath }/board/boardList.do?page=${pm.startPage()-1}&searchType=${ pm.scri.searchType}&keyword=${ pm.encoding(pm.scri.keyword) } "> ◀</a>
	</c:if>
	</td>
	<td style="text-align:center;width:300px;">
	<c:forEach var="i"  begin="${pm.startPage}" end="${pm.endPage}"  step="1" >
		<a href="${pageContext.request.contextPath }/board/boardList.do?page=${ i }&searchType=${pm.scri.searchType}&keyword=${ pm.encoding(pm.scri.keyword) } ">${ i }</a>
	</c:forEach>	
	</td>
	<td style="width:200px;text-align:left;">
	<c:if test="${pm.next&&pm.endPage >0 }">
	<a href="${pageContext.request.contextPath }/board/boardList.do?page=${pm.endPage+1}&searchType=${pm.scri.searchType}&keyword=${ pm.encoding(pm.scri.keyword) } ">▶</a>
	</c:if>
	</td>
	</tr>
	</table>
	<button type="button" onclick="location.href='${pageContext.request.contextPath}/board/boardWrite.do'">글쓰기</button>
</body>
</html>