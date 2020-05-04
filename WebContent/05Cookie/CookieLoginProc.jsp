<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//클라이언트가 전송한 폼값을 받아온다
String userid = request.getParameter("user_id");
String userpw = request.getParameter("user_pw");
/* 체크박스의 경우 항목이 여러개 이므로 주로 getParameterValues()를 통해 배열로 
받아와야 했지만, 항목이 하나만 있는 경우에는 아래와 같이 처리가능하다. */
String id_save = request.getParameter("id_save");//값이 하나만 있어서 getParameterValues()로 읽지 않아도 된다

//JDBC연동 없이 kosmo/1234일때 로그인 성공
if("kosmo".equals(userid) && "1234".equals(userpw)){
	//회원인증이 완료된 경우에 session영역에 속성 저장
	session.setAttribute("USER_ID", userid);
	session.setAttribute("USER_PWD", userpw);
	
	if(id_save==null){
		//아이디저장하기에 체크를 하지 않았을때...
		//쿠키를 삭제하기 위해 빈 쿠키를 생성한다
		Cookie ck = new Cookie("USER_ID", userid);
		ck.setPath(request.getContextPath());
		ck.setMaxAge(0);//유효시간 0이므로 사용할 수 없는 쿠키이다
		response.addCookie(ck);
	}
	else {//체크했을때...
		//사용자가 입력한 아이디로 쿠키를 생성한다
		Cookie ck = new Cookie("USER_ID", "");
		ck.setPath(request.getContextPath());
		ck.setMaxAge(60*60*24*100);
		response.addCookie(ck);
	}
	//로그인와 쿠키생성이 완료되면 기존 로그인 페이지로 이동한다
	response.sendRedirect("CookieLoginMain.jsp");
}
else {//로그인에 실패한 경우 리퀘스트 영역에 속성을 저장한 후...
	request.setAttribute("ERROR_MSG", "회원이 아닙니다");
	//로그인 페이지로 포워드(전달)한다.
	request.getRequestDispatcher("CookieLoginMain.jsp").forward
										(request, response);
}		//포워드페이지는 리퀘스트 영역이 공유되므로 위에 저장한 속성을 읽어올 수 있다.

%>