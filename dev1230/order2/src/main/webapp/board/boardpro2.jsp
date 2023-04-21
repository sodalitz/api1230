<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
    <%@ page import="example1230.service.Ticket" %>  
    
    <%
	request.setCharacterEncoding("utf-8");
	Connection conn= null;
	Statement stmt= null;
	ResultSet rs=null;
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String uid = "system";
	String upw = "1234";
	String sql= "SELECT list, SUM(count), lpad('▒', SUM(COUNT)/5,'▒') AS 예매율 FROM TICKET7 GROUP BY list ORDER BY list ASC";

	%>
	
	<%
		try {
		// 데이터베이스를 접속하기 위한 드라이버 SW 로드
		Class.forName("oracle.jdbc.driver.OracleDriver");
		// 데이터베이스에 연결하는 작업 수행
		conn = DriverManager.getConnection(url, uid, upw);
		// 쿼리를 생성gkf 객체 생성
		stmt = conn.createStatement();
		// 쿼리 생성
		rs = stmt.executeQuery(sql);

		%>
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
	    .my_img {display: none;} 
		.my_box:active .my_img {display: block;}
		 td:nth-child(2) {color: blue;}
	
	</style>


	<script>


	function check_form(f) {
		var name_chk = document.getElementById("name_chk");
		var tel_chk = document.getElementById("tel_chk");
		var count_chk = document.getElementById("count_chk");
			name_chk.innerHTML = "";
			tel_chk.innerHTML = "";
			count_chk.innerHTML = "";
		if (f.name.value == "" || f.name.value.length == 0) {
			name_chk.innerHTML = "* 이름을 입력해주세요";
		}
		if (f.tel.value == "" || f.tel.value.length == 0){
			tel_chk.innerHTML = "* 전화번호를 입력해주세요";
		}
		if(f.count.value ==0){
			count_chk.innerHTML="* 수량을 선택해주세요";
		}
		if(f.name.value != "" && f.tel.value != "" && f.count.value !=0 ){
		var result =confirm("상품을 주문 하시겠습니까?");
		if(result) return true;
		}
		return false;
		}
		function reset_ok(f) {
		var result = confirm("주문을 취소하시겠습니까?");
		if (!result) {
		return false;
		}
		}		
		function total_chk(f){			
		var total_price = document.getElementById("total_price");
		if(f.count.value!=0){
		var count_chk = document.getElementById("count_chk");
			count_chk.innerHTML = "";		
		}
		var count = parseInt(f.count.value)*5000;	
			total_price.innerHTML=count;		
		}
		
		function name_focus(f){
		var name_chk = document.getElementById("name_chk");
		if(f.name.value=="" && name_chk.value!="" ){
			name_chk.innerHTML = "";
		}}
		function tel_focus(f){
		var tel_chk = document.getElementById("tel_chk");
		if(f.tel.value=="" && tel_chk.value!=""){
			tel_chk.innerHTML = "";
		}}		
		function logout(){
			alert("로그아웃");
		location.href='<%=request.getContextPath()%>/member/memberLogOut.do'}
		
		
		//배너
		
		 
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
	     	
	
		<div id="container">
			<h2>티켓구매</h2>
				<p style="color: red; font-size: 10px">모든 항목을 모두 채워주세요.</p>
				
				
		
				<form action="<%=request.getContextPath()%>/board/result.do"  name="form" method="post"
				onsubmit="return check_form(this)" onreset="return reset_ok(this)">				
			<p>이름</p>
				<input type="text" id="name" name="name" onfocus="name_focus(this.form)" autofocus>
				<span id="name_chk"> </span>						
			</div>
			<p>전화번호</p>
				<input type="text" id="tel" name="tel" placeholder="-제외하고 입력"
				onfocus="tel_focus(this.form)"><span id="tel_chk"> </span>
			<p>코스(클릭시 미리보기)</p>
				<label> 
			<div class="my_box"><input type="radio" id="list" name="list" value=" A코스"checked onclick="alert('A코스를 선택하셨습니다.')">A코스
				<img class="my_img" src="/order2/image/tk.jpg" width=500px; height=400px;>
			</div>
			
			<div class="my_box">
			    <input type="radio" id="list" name="list" value="B코스" checked onclick="alert('B코스를 선택하셨습니다.')"> B코스
				<img class="my_img" src="/order2/image/tk2.jpg" width=500px; height=400px;>
			</div>
						 			
			<div class="my_box"> 
				<input type="radio" id="list" name="list" value="C코스" checked onclick="alert('C코스를 선택하셨습니다.')"> C코스
				<img class="my_img" src="/order2/image/tk3.jpg" width=500px; height=400px;>
			</div>
						
			</label>
			
				<div class="chart">
					<table border="1">
				<tr>					
					<td>인기코스</td>
					<td>판매량</td>					
				</tr>
				
				<%
					while (rs.next()) {
				%>
				<tr>
					<td><%=rs.getString("list")%></td>
					<td><%=rs.getString("예매율")%></td>				
				</tr>
			
	
			<%
				}
			} catch (Exception e) {
			e.printStackTrace();
			} finally {
			try {
			if (rs != null) {
				rs.close();
			}
			if (stmt != null) {
				stmt.close();
			}
			if (conn != null) {
				conn.close();
			}
			} catch (Exception e) {
			e.printStackTrace();
			}
			}
			%>
			</table>
			
			<p>수량</p>
				<select name="count" onclick="total_chk(this.form)">
				<option value="0" selected >선택하세요</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>			
				<option value="5">5</option>
				
				</select> <span id="count_chk"> </span>
			<hr>
			<div class="total">
				금액 : <span id="total_price" style="font-size: 25px"> 0 </span>
				</div>
			<p>	<input type="submit" value="제출"><input type="reset" value="다시쓰기">		
			
			</form>
		</div>
	

		
		
	   
	
	
	</body>
</html>