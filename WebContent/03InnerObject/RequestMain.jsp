<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀</title>
</head>
<body>
   <h2>전송방식(Post,Get) 테스트</h2>
   
   <!-- 
   Get방식에는 3가지 전송방식이 있다
   1. <a href="" 를 사용하는 방법
   2. JS의 location.href="" 를 사용하는 방법
   3. form method="get" 을사용하는방법
    -->
   <h3>Get방식 전송</h3>
   <a href="RequestInfo.jsp?paramNum=123&paramEng=Hello&paramHan=안녕">
   Get방식
   </a>
   
   <h3>Post방식 전송</h3>
   <form action="RequestInfo.jsp" method="post">
      문자열입력: <input type="text" name="paramHan"/>
      <input type="submit" value="Post방식" />
   </form>
  
  	<h2>파라미터 및 값전달</h2>
	<%
	String encodeName = URLEncoder.encode("홍길동", "UTF-8");
	%>
	<a href="RequestParameter.jsp?name=<%=encodeName%>
		&id=hong&sex=man&favorite=&self_intro=">Get방식</a>
	<br>
	<br>
	<script>
		function checkForm(f) {
			if(f.id.value==""){
				alert("아이디를 입력해주세요");
				f.id.focus();
				return false;
			}
		}
	</script>
	<form method="post" name="regFrm" action="RequestParameter.jsp"
		onsubmit="return checkForm(this);">
		이름: <input type="text" name="name" value="홍길동">
		<br>
		아이디: <input type="text" name="id" value="">
		<br>
		관심사항:
			<input type="checkbox" name="favorite" 
			value="sport" checked="checked">스포츠
			
			<input type="checkbox" name="favorite" value="economic">경제

			<input type="checkbox" name="favorite" value="politics" 
			checked="checked">정치
			<br>
			성별: 
			<input type="radio" name="sex" value="man">남자
			<input type="radio" name="sex" value="woman" checked="checked">여자	
			<br>
			자기소개: 
			<textarea name="self_intro" rows="10" cols="30">나는 집이 부유해서 대충살다 망했음
			</textarea>			
			<br>
				<input type="submit" value="POST방식">
	</form>
	<h3>요청헤더 보기</h3>
	
	<a href="RequestHeader.jsp">RequestHeader 바로가기</a>
	<div style="font-size: 14px, color: blue;">
		<ol>
			<li>RequestHeader자체실행: referer항목 안 보임</li>
			<li>Main을 실행후 링크를 통해 접촉: referer항목 보임</li>
		<!-- referer : 현재 접속한 페이지의 이전 url의 정보를 담고 있다.
		이 정보를 통해 어떤 사이트에서 유입되었는지를 알수 있다. -->
		</ol>
	</div>  
  
	
</body>
</html>