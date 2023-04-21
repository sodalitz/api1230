<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import ="example1230.domain.BoardVo" %>   
 <% BoardVo bv = (BoardVo)request.getAttribute("bv"); %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글답변화면</title>
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
	}
	
	fm.action = "<%=request.getContextPath()%>/board/boardReplyAction.do";
	fm.method="post";
	
	fm.submit();
	return;
}


</script>

<style>
    body{width: 900px; height: 100px; margin:auto; text-align: left; background-color: rgb(252, 243, 231);}
    header{text-align: right;}
    MainTitle{text-align: center;}
    h1{text-align: center;}
            table {margin: 0 auto; text-align:center;}
    
</style>
</head>
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
     	


<h1>게시판 글답변</h1>

<form name="frm">
<input type="hidden" name="bidx" value="<%=bv.getBidx() %>">
<input type="hidden" name="originbidx" value="<%=bv.getOriginbidx()%>">
<input type="hidden" name="depth" value="<%=bv.getDepth()%>">
<input type="hidden" name="level_" value="<%=bv.getLevel_()%>">
<table  border=1 style="width:645px;  border:8px solid green; border-collapse: collapse;">
<tr>
<td style="background-color: orange;">제목</td>
<td><input type="text" name="subject"></td>
</tr>
<tr>
<td style="background-color: orange;">내용</td>
<td><textarea name="contents" cols="50"  rows="5"></textarea></td>
</tr>
<tr>
<td style="background-color: orange;">작성자</td>
<td><input type="text" name="writer" maxlength=5></td>
</tr>
<tr>
<td style="background-color: orange;">비밀번호</td>
<td><input type="password" name="pwd" ></td>
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