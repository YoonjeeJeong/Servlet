<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
public int showGugudan(int dan, int su){
	for(int i=1; i<=dan; i++){
		for(int j=su; j<=su; j++){
		}
		System.out.printf("%d*%d=%d", dan, su, (dan*su));
	}
}
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀</title>
</head>
<body>
	<h2>jsp로 구구단 출력하기</h2>
	<%!
	public void showGugudan(JspWriter out){
		try{
		out.println("<table border='1' width='700'>");//여긴 html이므로 out.println으로 구분
		for(int i=2; i<=9; i++){
			out.println("<tr>");//여긴 html이므로 out.println으로 구분
			for(int j=1; j<=9; j++){
				out.println("<td>"+i+"*"+j+"="+(i*j)+"</td>");//여긴 html이므로 out.println으로 구분
			}
			out.println("</tr>");//여긴 html이므로 out.println으로 구분
		}
		out.println("</table>");//여긴 html이므로 out.println으로 구분
	}
	catch(Exception e){	
		}
	}	
	%>
	<h3>구구단 출력1 - 메소드로 구현</h3>
	<%
		showGugudan(out);
	%>
	
	<h3>구구단 출력2 - 표현식으로 구현</h3>
	<%-- 
	<table border="1" width="700">
	<% for(int i=2; i<=9 ; i++){%>
		<tr>
		<%for(int j=1; j<=9 ; j++){%>
		<td>
		<%=i %> * <%=j %> = <%=(i*j) %>
		</td>			
		<%}%>
	<%} %>
		</tr>
	</table>--%>
	 <table border="1" width="700">
	 <%
	 for(int dan=2 ; dan<=9; dan++){//여기는 jsp. <%가 html밖에 있음을 알려준다.
	 %>
	<tr><!-- 여기는 html. html안에 jsp를 쓰려면 표현식으로 구분을 준다. -->
		<%
		for(int su=1; su<=9 ; su++){
		%>
		<td><%=dan %> * <%=su %> = <%=(dan*su)%></td>
		<%
		}
		%>
	</tr><!-- 여기는 html -->
	<%//여기는 html밖에 있으므로 <%을 붙여준다. jsp에는 tr, td등의 선언을 할 수 없음을 잊지 말도록.
	}
	%>
	</table>
</body>
</html>