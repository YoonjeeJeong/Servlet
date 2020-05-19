<%@page import="model.BbsDTO"%>
<%@page import="model.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../common/boardhead.jsp" />
<body>
<div class="container">
	<jsp:include page="../common/boardTop.jsp" />
	<div class="row">		
		<jsp:include page="../common/boardleft.jsp" />
		<div class="col-9 pt-3">
			<h3>자료실 - <small>View(상세보기)</small></h3>
						
			<!-- <div class="row mt-3 mr-1"> 있었음 -->
				<table class="table table-bordered" border=1 width=90% >
				<colgroup>
					<col width="20%"/>
					<col width="30%"/>
					<col width="20%"/>
					<col width="30%"/>
				</colgroup>
				<tbody>
					<tr>
						<th class="text-center table-active align-middle">작성자</th>
						<td>${dto.name }</td>
						<th class="text-center table-active align-middle">작성일</th>
						<td>${dto.postdate }</td>
					</tr>
					<tr>
						<th class="text-center table-active align-middle">다운로드수</th>
						<td>${dto.downcount }</td>
						<th class="text-center table-active align-middle">조회수</th>
						<td>${dto.visitcount }</td>
					</tr>
					<tr>
						<th class="text-center table-active align-middle">제목</th>
						<td colspan="3">${dto.title }</td>
					</tr>
					<tr>
						<th class="text-center table-active align-middle">내용</th>
						<td colspan="3" class="align-middle" style="height:200px;">
							${dto.content }
						</td>
					</tr>
					<tr>
						<th class="text-center table-active align-middle">첨부파일</th>
						<td colspan="3">
						<!--아래는 첨부파일이 있는 경우에만 디스플레이 함 -->
							<c:if test="${not empty dto.attachedfile }">
							${dto.attachedfile } 
								<a href="./Download?filename=${dto.attachedfile}&idx=${dto.idx}">
								[다운로드]
								</a>
							</c:if>
						</td>
					</tr>
					<tr>
						<td colspan="4" align="center" >
						
							<button type="button" class="btn btn-secondary"
								onclick="location.href='../DataRoom/DataPassword?mode=edit&idx=${param.idx}&nowPage=${param.nowPage}&searchColumn=${param.searchColumn}&searchWord=${param.searchWord}';">
							수정하기</button>
							
							<button type="button" class="btn btn-success"
								onclick="location.href='../DataRoom/DataPassword?mode=delete&idx=${dto.idx}&nowPage=${param.nowPage}&searchColumn=${param.searchColumn}&searchWord=${param.searchWord}';">
							삭제하기</button>
							
							<button type="button" class="btn btn-warning"
								onclick="location.href='./DataList?nowPage=${param.nowPage}&searchColumn=${param.searchColumn}&searchWord=${param.searchWord}';">
								리스트보기</button>
						</td>					
					</tr>
					</tbody>
				</table>
	</div>
	<jsp:include page="../common/boardbottom.jsp" />
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