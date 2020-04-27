<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%--
    include 지시어: 공통으로 사용할 jsp파일을 생성한 후
    현재 문서에 포함시킬때 사용한다. 각각의 jsp파일 상단에는
    반드시 page지시어(directive)가 삽입되어야 한다.
    ※단, 하나의 jsp파일에는 page지시어가 중복되어서는 안된다.
     --%>
<%@include file="IncludePage.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀</title>
<!-- css코드는 양이 많으므로 외부파일로 선언하여 현재문서에 링크시킨다(아래 참고) -->
<link rel="stylesheet" href="./css/div_layout.css">
</head>
<body>
	<div class="AllWrap">
		<div class="header">
		<!-- GNB(global navigation bar)영역 - 전체공통메뉴 -->
		<%@ include file="../common/Top.jsp" %>
		</div>
		<div class="body">
			<div class="left_menu">
			<!-- LNB영역(local navigation bar) - 로컬메뉴-->
			<%@ include file="../common/Left.jsp" %>
		</div>
		<div class="contents">
			<!-- contents영역 -->
			<%--해당 변수는 외부파일에 선언하여 본 문서에 include처리되었다.
			include는 문서자체를 포함시키는 개념이므로 에러없이 사용할 수 있다.
			맨위에 파일 IncludePage를 include처리했다. --%>
			<h2>오늘의 날짜: <%=todayStr %></h2>
			<br/><br/>
			누구나 나이가 든다. 그러나 모두가 힘없고 나약한 노인으로 늙는 것은 아니다.<br>  
			단순히 오래 살고 있을 뿐만 아니라 늘 바쁘게 활동적으로, <br>
			여유로우면서도 쾌활하게 살아는 사람들이 있다.<br> 
			이와 같은 생활태도와 장수 비결은 모두 ‘이키가이’에서 나온다고 두 저자는 강조한다.<br> 
			이키가이란 살아가는 보람, 살아가는 의미를 뜻한다.<br> 
			이키가이를 발견한 사람들은 항상 활발하게 살며, 자신이 하는 모든 일을 진심으로 즐긴다.<br> 
			자신이 어떤 일을 하든 그것에 삶의 가치가 있다고 여기기 때문에,<br> 
			결과에 상관없이 과정 자체가 그들에게는 즐거움이 된다.
			<br/><br/>		
		</div>
	</div>
	<div class="copyright">
	<!-- copyright --><%--바깥 부분이라고 이해하면 된다. --%>
		<%@ include file="../common/Copyright.jsp" %>
	</div>
</body>
</html>