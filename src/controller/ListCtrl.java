package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controller.DataroomDAO;
import controller.DataroomDTO;

public class ListCtrl extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		//DAO객체 생성 및 커넥션풀을 통한 DB연결
		DataroomDAO dao = new DataroomDAO();
		
		//컨트롤러(서블릿) 및 View(JSP)로 전달한 파라미터를 저장하기 위한 맵
		Map param = new HashMap();//제네릭<object, object>지정을 안 했으니 아무거나 저장 가능
		
		//쿼리스트링의 파라미터를 저장하기 위한 문자열
		String addQueryString = "";
		
		String searchColumn = req.getParameter("searchColumn");
		String searchWord = req.getParameter("searchWord");
		if(searchWord!=null) {
			
			//검색어가 있는 경우 파라미터를  Map에 저장및 쿼리스트링 저장
			addQueryString =
					String.format("searchColumn=%s%searchWord", searchColumn, searchWord);
			param.put("Column", searchColumn);
			param.put("Word", searchWord);
		}
		//테이블의 전체 레코드수를 카운트
		int totalRecordCount = dao.getTotalRecordCount(param);
		//전체 카운트수를 Map에 저장함. 차후 View로 전달할 예정임
		param.put("totalCount", totalRecordCount);
		
		//테이블의 전체 ResultSet을 가져옴. (페이지처리 없음)
		List<DataroomDTO> lists = dao.selectList(param);
		
		dao.close();//(자원반납의 의미가 아님)필요없을 때 커넷션 풀에 커넥션객체를 다시 반납.
		
		//컬렉션에 저장된 데이터를 View로 전달하기 위해 Request영역에 속성저장
		req.setAttribute("lists", lists);
		req.setAttribute("map", param);
		req.getRequestDispatcher("/14Dataroom/DataList.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		doGet(req, resp);
		
	}
}
