<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="example1230.domain.BoardVo" %>  
 <% BoardVo bv   = (BoardVo)request.getAttribute("bv"); %>       
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글수정화면</title>
<script type="text/javascript">
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
</head>



<style>
    body{width: 900px; height: 100px; margin:auto; text-align: left; background-color: rgb(252, 243, 231);}
    header{text-align: right;}
    MainTitle{text-align: center;}
    h1{text-align: center;}
    table {margin: 0 auto;}
    
    header {
    font-size: 24px; /* 글자 크기를 24px로 설정 */
    color: #333; /* 글자 색상을 검정색으로 설정 */
  }
  
  nav {
    background-color: #eee; /* 네비게이션 바 배경색을 연한 회색으로 설정 */
    padding: 10px; /* 네비게이션 바와 내용 간격을 주기 위해 패딩을 추가 */
  }
  
  nav a {
    color: #333; /* 네비게이션 링크 색상을 검정색으로 설정 */
    text-decoration: none; /* 밑줄 제거 */
    margin-right: 10px; /* 각 링크 간격을 조절하기 위해 우측 마진 추가 */
  }
  
  button {
    background-color: #333; /* 버튼 배경색을 검정색으로 설정 */
    color: #fff; /* 버튼 글자 색상을 흰색으로 설정 */
    border: none; /* 테두리 제거 */
    padding: 10px; /* 버튼 내용과 테두리 간격을 주기 위해 패딩을 추가 */
    margin-left: 10px; /* 버튼 간격을 조절하기 위해 좌측 마진 추가 */
  }
  
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
		 		<button type="button" onclick="location.href='<%=request.getContextPath()%>/member/memberJoin.do'"> 회원가입</a>
		
		<%}%>
 </header>

    
   	 <main>
       
            <a href="<%=request.getContextPath()%>/board/boardPro.do"><img src ="/order2/image/menu.jpg"width=210px; height=100px;></a>
            <a href="<%=request.getContextPath()%>/board/boardIntro.do"><img src ="/order2/image/menb.jpg" width=210px; height=100px;></a>
            <a href="<%=request.getContextPath()%>/board/boardMap.do"><img src ="/order2/image/menc.jpg" width=210px; height=100px;></a>
            <a href="<%=request.getContextPath()%>/board/boardList.do"><img src ="/order2/image/mend.jpg" width=200px; height=100px;></a>
     	</main>
     	





<form name="frm">
<input type="hidden" name="bidx" value="<%=bv.getBidx()%>">
<table  border=1 style="width:650px; text-align:center; border:8px solid green; border-collapse: collapse;">
<tr>
<td style="background-color: orange;">제목</td>
<td><input type="text" name="subject" value="<%=bv.getSubject()%>"style="background-color: yellow;"></td>
</tr>
<tr>
<td style="background-color: orange;">내용</td>
<td><textarea name="contents" cols="50"  rows="5"><%=bv.getContents() %></textarea></td>
</tr>
<tr>
<td style="background-color: orange;">작성자</td>
<td><input type="text" name="writer" maxlength=5 value="<%=bv.getWriter()%>"></td>
</tr>
<tr>
<td style="background-color: orange;">비밀번호</td>
<td><input type="password" name="pwd" maxlength=20></td>
</tr>
<tr>
<td style="background-color: orange;">파일첨부</td>
<td><input type="file" name="filename"></td>
</tr>

<tr><td colspan=2>
<input type="button" name="btn"  value="확인" onclick="check();">
<input type="reset" name="rst" value="리셋">
</td></tr>

</table>
</form>
</body>
</html>