<%@page import="model.BbsDTO"%>
<%@page import="model.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--글 작성 페이지 진입전 로그인 체크하기 --%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../common/boardhead.jsp" />
<body>
<div class="container">
	<jsp:include page="../common/boardTop.jsp" />
	<div class="row">		
		<jsp:include page="../common/boardleft.jsp" />
		<div class="col-9 pt-3">
			<h3>자료실 - <small>Password(패스워드 검증)</small></h3>
						
			<script>		
			//유기명 함수
			function checkValidate(frm){
				
				if(frm.pass.value==""){
					alert("비번을 입력하세요");//경고창
					frm.pass.focus();//입력란으로 포커스 이동
					return false;//전송되지 않도록 이벤트리스너로 false반환.
				}
			}			
			</script>
						
	<div class="row mt-3 mr-1">
		<table class="table table-bordered table-striped">
<!-- 패스워드 검증폼은 첨부파일을 전송 하지 않으므로
enctype삭제해야 함 -->
		
		<form action="../DataRoom/DataPassword" name="writeFrm" method="post"
		 onsubmit="return checkValidate(this);">
		 <!-- 패스워드 검증을 위해 idx, mode는 
		 서버로 전송해야 하므로 hidden폼에 값을 저장한다 -->
		 <input type="hid den" name="idx" value="${param.idx }" />
		 <input type="hid den" name="mode" value="${mode }" />
		 <input type="hid den" name="nowPage" value="" />
		 
		<colgroup>
			<col width="20%"/>
			<col width="*"/>
		</colgroup>
		<tbody>
			<tr>
				<th class="text-center" 
					style="vertical-align:middle;">패스워드</th>
				<td>
					<input type="password" class="form-control"
						style="width:200px;" name="pass"/>
				</td>
			</tr>
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