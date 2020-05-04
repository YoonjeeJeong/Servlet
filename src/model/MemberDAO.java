package model;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

public class MemberDAO {
	//멤버변수(클래스 전체 멤버메소드에서 접근 가능)
	Connection con;
	PreparedStatement psmt;
	ResultSet rs;

	//기본 생성자
	public MemberDAO() {
		System.out.println("MemberDAO생성자 호출");
	}
	public MemberDAO(String driver, String url) {
		
		try{
			Class.forName(driver);
			String id = "kosmo";
			String pw = "1234";
			con = DriverManager.getConnection(url, id, pw);
			System.out.println("DB연결 성공");
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
	//방법1: 회원의 존재유무만 판단한다(count(*))
	public boolean isMember(String id, String pass) {//쿼리문 뒤와 앞 다 띄어쓰기하기(두개로 나눌 경우에.)
		String sql = "SELECT COUNT(*) FROM member "+ 
					" WHERE id=? AND pass=?"; //count를 쓰므로 일단 결과는 있음. 일치되는 결과 없으면 0, 있으면 1~
		int isMember=0;
		boolean isFlag = false;
		
		try {
			//prepare를 객체로 쿼리문 전송.
			psmt = con.prepareStatement(sql);
			//인파라미터 설정
			psmt.setString(1, id);
			psmt.setString(2, pass);
			//쿼리실행
			rs = psmt.executeQuery();
			//실행결과를 가져오기 위해 next() 호출
			rs.next();
			
			isMember = rs.getInt(1);
			System.out.println("affected:" + isMember);
			if(isMember==0)
				isFlag = false;		
			else
				isFlag = true;
		}
		catch(Exception e) {
			isFlag = false;
			e.printStackTrace();
		}
		return isFlag;
	}
	//방법2: 회원인증 후 MemberDTO객체로 회원정보를 반환한다.
	public MemberDTO getMemberDTO(String uid, String pwd){
		//DTO객체를 생성한다		
		MemberDTO dto = new MemberDTO();
		//쿼리문을 작성
		String sql = "SELECT id, pass, name FROM member " 
					+ " WHERE id=? AND pass=?";//String sql = "SELECT * FROM member " + " WHERE id=? AND pass=?";
		
		try {
			//prepared 객체 생성
			psmt = con.prepareStatement(sql);
			//쿼리문의 인파라미터 설정
			psmt.setString(1, uid);
			psmt.setString(2, pwd);
			//오라클로 쿼리문 전송 및 결과 셋(ResultSet)반환받음
			rs = psmt.executeQuery();
			
			//오라클이 반환해준 ResultSet이 있는지 확인
			if(rs.next()) {
				//true를 반환했다면 결과셋 있음
				//DTO객체에 회원레코드의 값을 저장한다
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString(3));	
			}
			else {//false반환했다면 결과셋 없음
				System.out.println("결과셋 없음");
			}
		}
		catch (Exception e) {
			System.out.println("getMemberDTO오류");
			e.printStackTrace();
		}
		//DTO객체를 반환한다
		return dto;
	}

//내가 했던 부분
//				while(rs.next()) {
//					String id = rs.getString(1);
//					String pass = rs.getString(2);
//					String name = rs.getString(3);
//					String regidate = 
//							rs.getString(4).substring(0, 10);	
//					
//					memberDTO.setId(id);
//					memberDTO.setPass(pass);
//					memberDTO.setName(name);
//				}
//			}
//			catch (SQLException e) {
//				e.printStackTrace();
//			}
public Map<String, String> getMemberMap(String id, String pwd){
	Map<String, String> maps = new HashMap<String, String>();
	
	String sql = "SELECT id, pass, name FROM member " 
			+ " WHERE id=? AND pass=?";
	
	try {
		psmt = con.prepareStatement(sql);
		//쿼리문의 인파라미터 설정
		psmt.setString(1, id);
		psmt.setString(2, pwd);
		//오라클로 쿼리문 전송 및 결과 셋(ResultSet)반환받음
		rs = psmt.executeQuery();
		
		if(rs.next()) {
			maps.put("id", rs.getString(1));
			maps.put("pass", rs.getString("pass"));
			maps.put("name", rs.getString("name"));
		}
		else {
			System.out.println("결과셋 없음");
		}
	}
	catch(Exception e) {
		System.out.println("getMemberDTO오류");
		e.printStackTrace();
	}
	return maps;
	}
}
