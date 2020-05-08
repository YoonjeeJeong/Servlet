<%@page import="model.BbsDTO"%>
<%@page import="model.BbsDAO"%>
<%@page import="oracle.net.aso.d"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%--글 수정 페이지 진입전 로그인 체크하기 --%>
<%@include file="../common/isLogin.jsp"%>
<% 
//폼값 받기 - 파라미터로 전달된 게시물의 일련번호
String num = request.getParameter("num");
BbsDAO dao = new BbsDAO(application);

//게시물을 가져와서 dto객체로 반환
BbsDTO dto = dao.selectView(num);
dao.close();
%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../common/boardhead.jsp" />
<body>
<div class="container">
	<jsp:include page="../common/boardTop.jsp" />
	<div class="row">		
		<jsp:include page="../common/boardleft.jsp" />
		<div class="col-9 pt-3">
			<h3>게시판 - <small>Edit(수정)</small></h3>
						
			<script>		
			 function checkValidate(text){
				if(text.title.value==""){
					alert("제목 입력좀 ㅎㅎ");
					text.title.focus();
					return false;//이게 없었음
				}
				if(text.content.value==""){
					alert("내용을 입력좀 ㅎㅎ");
					text.content.focus();
					return false;//이게 없었음
					}
				}  
			
			//유기명 함수
			/* function checkValidate(frm){
				if(frm.title.value==""){
					alert("제목을 입력하세요");//경고창
					frm.title.focus();//입력란으로 포커스 이동
					return false;//전송되지 않도록 이벤트리스너로 false반환.
				}
				if(frm.content.value==""){
					alert("내용을 입력하세요");//경고창
					frm.content.focus();//입력란으로 포커스 이동
					return false;//전송되지 않도록 이벤트리스너로 false반환.
				}
			}			
			//무기명 함수
			var checkValidate2= function(frm){
				//실행부는 유기명함수와 동일함				
			} */
			</script>
						
			<div class="row mt-3 mr-1">
				<table class="table table-bordered table-striped">
				<form action="EditProc.jsp" name="writeFrm" method="post" 
					onsubmit="return checkValidate(this);">
					
					<!-- 해당게시물의 일련번호를 전송해야 수정이 가능하다. hidden속성으로 처리하면
					화면에서는 사라지지만 서버로는 값을 전송할 수 있다-->
					<input type="hidden" name="num" value="<%=dto.getNum()%>">
				<colgroup>
					<col width="20%"/>
					<col width="*"/>
				</colgroup>
				<tbody>
					<!-- <tr>
						<th class="text-center align-middle">작성자</th>
						<td>
							<input type="text" class="form-control"	style="width:100px;"/>
						</td>
					</tr> -->
					<!-- <tr>
						<th class="text-center" 
							style="vertical-align:middle;">패스워드</th>
						<td>
							<input type="password" class="form-control"
								style="width:200px;"/>
						</td>
					</tr> -->
					<tr>
						<th class="text-center" 
							style="vertical-align:middle;">제목</th>
						<td>
							<input type="text" class="form-control" name="title" value="<%=dto.getTitle() %>" />
						</td>
					</tr>
					<tr>
						<th class="text-center"
							style="vertical-align:middle;">내용
						</th>
						<td>
							<textarea rows="10" class="form-control" name="content"><%=dto.getContent() %></textarea>
						</td>
					</tr>
					<!-- <tr>
						<th class="text-center"
							style="vertical-align:middle;">첨부파일</th>
						<td>
							<input type="file" class="form-control" />
						</td>
					</tr> -->
				</tbody>
				</table>
			</div>
			<div class="row mb-3">
				<div class="col text-right">
					<!-- 각종 버튼 부분 -->
					<!-- <button type="button" class="btn">Basic</button> -->
					<!-- <button type="button" class="btn btn-primary" 
						onclick="location.href='BoardWrite.jsp';">글쓰기</button> -->
					<!-- <button type="button" class="btn btn-secondary">수정하기</button>
					<button type="button" class="btn btn-success">삭제하기</button>
					<button type="button" class="btn btn-info">답글쓰기</button>
					<button type="button" class="btn btn-light">Light</button>
					<button type="button" class="btn btn-link">Link</button> -->
					<button type="submit" class="btn btn-danger">전송하기</button>
					<button type="reset" class="btn btn-dark">Reset</button>
					<button type="button" class="btn btn-warning" onclick="location.href='BoardList.jsp';">리스트보기</button>
				</div>
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="../common/boardbottom.jsp" />
</div>
</body>
</html>

<!-- 
	<i class='fas fa-edit' style='font-size:20px'></i>
	<i class='fa fa-cogs' style='font-size:20px'></i>
	<i class='fas fa-sign-in-alt' style='font-size:20px'></i>
	<i class='fas fa-sign-out-alt' style='font-size:20px'></i>
	<i class='far fa-edit' style='font-size:20px'></i>
	<i class='fas fa-id-card-alt' style='font-size:20px'></i>
	<i class='fas fa-id-card' style='font-size:20px'></i>
	<i class='fas fa-id-card' style='font-size:20px'></i>
	<i class='fas fa-pen' style='font-size:20px'></i>
	<i class='fas fa-pen-alt' style='font-size:20px'></i>
	<i class='fas fa-pen-fancy' style='font-size:20px'></i>
	<i class='fas fa-pen-nib' style='font-size:20px'></i>
	<i class='fas fa-pen-square' style='font-size:20px'></i>
	<i class='fas fa-pencil-alt' style='font-size:20px'></i>
	<i class='fas fa-pencil-ruler' style='font-size:20px'></i>
	<i class='fa fa-cog' style='font-size:20px'></i>
	아~~~~힘들다...ㅋ
 -->