<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원로그인</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
$(document).ready(function(){
		//자동실행영역
});
function check(){
	//alert("각 값이 있는지 체크하는 구문을 만들어보세요");	
	
	if ($("#memberId").val() == ""){
		alert("아이디를 입력하세요");
		$("#memberId").focus();
		return;
	}else if ($("#memberPwd").val() == ""){
		alert("비밀번호를 입력하세요");
		$("#memberPwd").focus();
		return;
	}
	
	var fm = document.frm;
	//이 경로로 데이터를 감추어서 전송한다
	fm.action ="<%=request.getContextPath()%>/member/memberLoginAction.do";    
	fm.method = "post";
	
	  if ($("#memberId").val() == "admin" && $("#memberPwd").val() == "1234"){
	        fm.action ="<%=request.getContextPath()%>/board/admin.do";
	    }
	fm.submit();   // 전송
	
	return;
}	

function idCheck(){
//	alert("아이디 체크창입니다.");	
	let memberId = $("#memberId").val();
	
	$.ajax({
		url: "<%=request.getContextPath()%>/member/memberIdCheck.do",		
		method: "POST",
		data: {"memberId": memberId },
		dataType: "json",
		success : function(data){	
			if (data.value =="0"){
				alert("사용가능한 아이디입니다.");
				$("#memberIdCheck").val("Y");
			}else{
				alert("사용불가한 아이디 입니다");
			}	
		},
		error : function(request,status,error){
			alert("다시 시도하시기 바랍니다.");		
		}		
	});	
	
	return;
}
</script>

<style>
    body{width:500px; height: 100px; margin:auto; text-align: left; background-color: rgb(252, 243, 231);}
    header{text-align: right;}
    MainTitle{text-align: center;}
    h1{text-align: center;}
    
    
    <style>
    body{width: 900px; height: 100px; margin:auto; text-align: left; background-color: rgb(252, 243, 231); font-weight: bold;
    }

	input[type="text"], input[type="password"] {
	  
      background-color:  #F5F5DC;
      border: 2px solid green;
  
  		input[type="button"]
	   background-color: #4CAF50; 
		  color: darkgreen; 
		    font-weight: bold;
		  
		  padding: 15px 32px; 
		  text-align: center; 
		  text-decoration: none; 
		  display: inline-block; 
		  font-size: 16px; 
		  margin: 4px 2px;
		  cursor: pointer; 
		  border-radius: 10px; 
			}


		#btn {
			width:265px;
		  background-color: #4CAF50;
		  border: none;
		  color: yellow;
  		  font-weight: bold;
		  padding: 12px 24px;
		  text-align: center;
		  text-decoration: none;
		  display: inline-block;
		  font-size: 16px;
		  border-radius: 8px;
		  cursor: pointer;
		  transition: background-color 0.3s ease;
		  float:center;
		  margin-bottom:10px;
		}
		
		#btn:hover {
		  background-color: #3e8e41;
		  
		}
		
		
</style>
    
</style>

</head>
<body>
<h1>회원로그인 페이지</h1>
<form name="frm" id="frm">
<table style="border:1px solid #CCC;width:510px; text-align:center">
<tr>
<td style="font-weight: bold;">ID</td>
<td>
<input type="text" name="memberId" id="memberId">
</td>
</tr>
<tr>
<td style="font-weight: bold;">PWD</td>
<td><input type="password" name="memberPwd" id="memberPwd"></td>
</tr>
<tr>
<td></td>
<td>	<button type="button" name="btn"  id="btn"onclick="location.href='<%=request.getContextPath()%>/member/memberJoin.do'"> 회원가입</button>
<input type="button" name="btn"  id="btn" value="확인" onclick="check();">
 		</td>

</tr>
</table>
</form>
</body>
</html>