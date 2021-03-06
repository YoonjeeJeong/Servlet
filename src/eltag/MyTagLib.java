package eltag;

import model.MemberDAO;

public class MyTagLib {
		
	/*
	 EL에서 자바클래스의 메소드 호출 절차 및 방법
	 1. 클래스와 메소드를 정의한다. 단 메소드 정의시 반드시  
	 	public static 으로 선언해야 한다.
	 */
	
	/*
	 메소드 설명 : 매개변수로 전달된 문자열에 숫자가 아닌 문자가 포함되어 있으면 false를 반환하고,
	 전체가 숫자일때  true를 반환한다.
	 */
		public static boolean isNumber(String value) {
			char[] chArr = value.toCharArray();
			for(int i=0 ; i<chArr.length ; i++) {
				if(!(chArr[i]>='0' && chArr[i]<='9')) {
					return false;
				}
			}
			return true;
		}
		/*
		메소드 설명: 매개변수로 주민번호를 전달받아 성별을 판단하여 반환하는
		메소드를 작성한다. 주민번호는 123456-7890123 형태로 전달된다.
		*/
		public static String getGender(String jumin) {
			
			String result = "";
			int beginIdx = jumin.indexOf("-")+1;//-이후가 성별을 식별자므로 +1을 한다
			
			String gender = jumin.substring(beginIdx, beginIdx+1);
			if(Integer.parseInt(gender)==1 || Integer.parseInt(gender)==3) {
				result="남자";//1,3으로 시작하면 문자열은 "남자"가 된다
			}
			else if(Integer.parseInt(gender)==2 || Integer.parseInt(gender)==4) {
				result="여자";
			}
			else {
				result="잘못되었으 -_-";
			}
			return result;
		}
			
		
		
		/*public static String getGender(String jumin){
			String returnStr = "";
			//indexOf()를 통해 -(하이픈)의 위치를 찾는다
			int beginIdx = jumin.indexOf("-")+1;//1을 더하면 성별을 표현하는 숫자가 된다
			
			String genderStr = jumin.substring(beginIdx, beginIdx+1);
			//성별을 표현하는 문자열을 정수로 변환하여 성별을 판단한다.
			if(Integer.parseInt(genderStr)==1 || Integer.parseInt(genderStr)==3) {
				returnStr = "남자";
			}
			else if(Integer.parseInt(genderStr)==2 || Integer.parseInt(genderStr)==4) {
				returnStr = "여자";
			}
			else {
				returnStr = "주민번호 오류";
			}
			return returnStr;
		}*/
		//내 버전: 
		/*public static void getGender(String value) {
			char[] numArr = value.toCharArray();
			for(int i=0; i<numArr.length ; i++) {
				if(numArr[8]=='1') {
					System.out.println("남자입니다");
				}
				else if(numArr[8]=='2') {
					System.out.println("여자입니다");
				}
				else {
					System.out.println("잘못된 형식입니다");
			}
		}
		
	}*/
		
		/*
		아이디, 패스워드, DB연결을 위한 드라이버, url을 인자로 받아 회원여부를 판단하여
		true/false를 반환해주는 메소드.
		 */
		public static boolean memberLogin(String id, String pw, String drv, String url) {
			
			//1. DB연결을 위한 객체생성
			//DAO파일의 public MemberDAO(String driver, String url)에 해당된다
			MemberDAO dao = new MemberDAO(drv, url);
			
			//2. 아이디/패워를 통한 회원인증 및 결과반환
			//DAO파일의 isMember(String id, String pass)에 해당된다
			boolean isBool= dao.isMember(id, pw);
			
			//3. 2번에서의 결과를 호출한 지점으로 반환
			return isBool;
		}
		
}
