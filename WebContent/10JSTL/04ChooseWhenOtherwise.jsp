<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="my" uri="myTagLibTld" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<!-- 
	choose문
		if문과는 다르게 여러가지 조건이 있는 경우 문장을 구성할 때 사용한다.
		형식]
			choose
				when test="조건1"
				when test="조건2"
				otherwise
 			/choose
 -->
	<h2>choose~when~otherwise태그</h2>
	
	<c:set var="numVar" value="101" />
	<c:set var="strVar">자바</c:set>
	
	<h3>choose태그로 홀짝 판단하기</h3>
	<c:choose>
		<c:when test="${numVar mod 2 eq 0}">
			${numVar }는 짝수입니다
		</c:when>
		<c:otherwise>
			${numVar }는 홀수입니다
		</c:otherwise>
	</c:choose>
	
	<br>
	<c:set var="number1" value="7" />
	<c:set var="number2" value="17" />
	
	<c:choose>
		<c:when test="${number1 mod 5 eq 0 }">
			${number1 }은 7의 배수입니다
		</c:when>
		<c:when test="${(number1 + number2) eq 17}">
			${number1 }과${numer2 }의 합은 ${(number1 + number2)}입니다
		</c:when>
		<c:otherwise>
			${number1 }은 7의 공배수입니다
		</c:otherwise>
	</c:choose>
	
	<br>
	<c:set var="string1" value="Sicilia" />
	<c:choose>
		<c:when test="${string1 eq 'Sicily' }" >
		string1=Sicily
		</c:when>
		<c:when test="${string1 eq 'Sicilia' }">
		string1=Sicilia
		</c:when>
		<c:otherwise>
		string1=시칠리아	
		</c:otherwise>
	</c:choose>
	
	
	<h3>국영수 점수를 입력받아 평균점수로 학점출력</h3>
	<h4>점수를 입력하세요</h4>
	<form>
		국어: <input type="text" name="kor"><br>
		영어: <input type="text" name="eng"><br>
		수학: <input type="text" name="math"><br>
		<input type="submit" value="학점구하기">
	</form>
	
		<br>
	
	<c:if test="${not empty param.kor}">
		<c:set var="avg" value="${(param.kor + param.eng + param.math)/3}"></c:set>
		평균 성적은 ${avg }입니다.
		<br>
		<c:choose>
			<c:when test="${avg ge 90}">A level</c:when>
			<c:when test="${avg ge 80}">B level</c:when>
			<c:when test="${avg ge 70}">C level</c:when>
			<c:when test="${avg gt 59}">D level</c:when>
			<c:otherwise>F level</c:otherwise>
		</c:choose>
	</c:if>
	
	<!-- 
	시나리오] JDBC를 사용하여 회원인 경우 "X님 반갑습니다" 아닌경우 
		"로그인후 사용하세요" 라는 메세지를 출력하는 프로그램을 작성하시오. 
		단, 태그라이브러리(TLD)를 정의한후 EL식으로 자바의 함수를 호출하는
		방식으로 구현해야 한다. 
		메소드형식] boolean memberLogin(아이디,패스워드,JDBC드라이버,커넥션URL)
	 -->	 
	<h3>로그인 구현(JDBC사용)</h3>
	<form>
		아이디:<input type="text" name="userid" />
		<br />
		패스워드:<input type="password" name="userpw" />
		<br />
		<input type="submit" value="로그인" />
	</form>
	
	<c:if test="${not empty param.userid }">
		<c:choose>
			<c:when test="${my:memberLogin(param.userid
					,param.userpw
					,initParam.JDBCDriver
					,initParam.ConnectionURL) }">
				${param.userid }회원님 반갑습니다^^
			</c:when>
			<c:otherwise>
				회원이 아니시네요 -_-;
			</c:otherwise>
		</c:choose>
	</c:if>
	
	
	
	
	
	
	
</body>
</html>