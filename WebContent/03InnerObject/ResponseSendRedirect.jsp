<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀</title>
</head>
<body>
<%
//폼값받기
String id = request.getParameter("user_id");
String pwd = request.getParameter("user_pwd");

//아이디와 패워가 일치하는 정보인지 확인
if(id.equalsIgnoreCase("kosmo") && pwd.equalsIgnoreCase("1234")){
	response.sendRedirect("../common/Welcome.jsp");
}
else {
%>
<script>
	alert("아이디와 패스워드가 일치 안한다 ㅎㅎㅎ");
	history.go(-1);
</script>
<%
/* js 코드와 jsp코드가 동일한 블럭내에 존재하는 경우 jsp코드가 우선순위가 높으므로
js코드는 무시된다. 아래처럼 주석처리하면 경고창이 뜰 것.
즉 이와 같은 경우는 js코드는 실행되지 않고, 아래 jsp코드가 실행되게 된다. */
	//response.sendRedirect("./ResponseMain.jsp");
}
%>
</body>
</html>