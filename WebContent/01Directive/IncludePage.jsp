<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
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
SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd");
String todayStr = simple.format(new Date());
%>
</body>
</html>