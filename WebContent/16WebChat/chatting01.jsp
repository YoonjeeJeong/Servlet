<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>chatting01.jsp</title>
</head>

<body>
<fieldset style="width:350px; text-align:center;">
	<legend>채팅창</legend>	
	<!-- 대화입력창 -->	
	<input type="text" id="inputMessage" style="width:300px; margin-bottom:5px;"/>
	<br />
	<input type="button" onclick="sendMessage();" value="보내기"/>
	<input type="button" onclick="disconnect();" value="채팅종료"/>	
	<br />
	<!-- 대화출력창 -->
	<textarea id="messageWindow" style="width:300px; height:400px; margin-top:10px;" readonly></textarea>
</fieldset>

<!-- 
프론트엔트의 모든 언어는 interpreter방식이다. 나열순서대로 실행된다. 
하지만 자바는 객체지향이라 무조건 1,2,3순서로 실행하지 않는다. 
웹브라우저는 아직 윈도우를 읽어오지 못해서 스트립트를 먼저 두면
읽어오질 못한다. window.onload = function() {} 안에서 작성하면
윈도우 로드 후 실행한다는 뜻이기 때문에 이 경우
스트립트를 헤드 영역에 둬도 괜찮다.
-->
<script>
/*
 자바스크립트의 WebSocket객체를 이용해서 웹소켓 서버에 연결한다.
 웹소켓이므로 ws://으로 시작한다. 마지막 경로에는 @ServerEndpoint어노테이션으로
 지정했던 요청명을 사용한다
 */
var webSocket = new WebSocket("ws://localhost:8282/K07JSPServlet/ChatServer01");

//대화입력창/출력창의 DOM을 가져온다
var messageWindow = document.getElementById("messageWindow");
messageWindow.value = "";

var message = document.getElementById("inputMessage");

//웹소켓이 연결되었을때 호출되는 이벤트
webSocket.onopen = function(message){
	messageWindow.value += "서버연결됨...\n";
};

//종료되었을때 호출
webSocket.onclose = function(message){
	messageWindow.value += "서버종료됨...\n";
};
//에러발생시 호출
webSocket.onerror = function(message){
	messageWindow.value += "채팅중 에러발생...\n";
};
//메세지가 서버에서 전송되었을때 호출
webSocket.onmessage = function(message){
	messageWindow.value += "서버에서 수신 =>" + message.data + "\n";
};

//클라이언트가 "보내기" 버튼을 눌렀을때 메세지를 서버로 전송하는 메소드
function sendMessage(){
	var message = document.getElementById("inputMessage");
	messageWindow.value += "서버로 전송=>" + message.value + "\n";
	//웹소켓 객체의 send()메소드를 이용해서 서버로 전송
	webSocket.send(message.value);
	message.value = "";
}

//웹소켓 종료
function disconnect() {
	webSocket.close();
}
</script>	
</body>
</html>