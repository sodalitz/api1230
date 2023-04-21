<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="com.myezen.myapp.domain.BoardVo" %>   
 
 <% BoardVo bv   = (BoardVo)request.getAttribute("bv"); %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=bv.getFilename()%></title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	var originalFileName = getOriginalFileName("<%=bv.getFilename()%>");
	alert(originalFileName);
});

function getOriginalFileName(fileName){	
	var idx = fileName.lastIndexOf("_")+1;	
	return fileName.substr(idx);
}

</script>
</head>
<body>
내용보기
<table  border=1 style="width:500px;">
<tr>
<td style="width:50px;">제목</td>
<td> <%=bv.getSubject() %> &nbsp;&nbsp;&nbsp;&nbsp;  조회수(<%=bv.getViewcnt() %>) </td>
</tr>
<tr>
<td>파일다운로드</td>
<td>
<%if (bv.getFilename() ==null){
}else{ %>
<a href="<%=request.getContextPath()%>/board/fileDownload.do?filename=<%=bv.getFilename()%>"><%=bv.getFilename() %></a></td>
<%} %>
</tr>
<tr>
<td>이미지</td>
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
<td style="height:200px;">내용</td>
<td><%=bv.getContents() %>  </td>
</tr>
<tr>
<td>작성자</td>
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