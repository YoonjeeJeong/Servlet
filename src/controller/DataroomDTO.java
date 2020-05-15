package controller;

public class DataroomDTO {
	
	/*
	 DTO객체로 만들때 테이블 칼럼의 타입과는 상관없이 대부분의 멤버변수는 String형으로 정의하면 된다.
	 jsp에서 산술연산이 꼭 필요한 경우에만 int, double같이 숫자형으로 정의한다.
	 */
	//멤버변수
	private String idx;//게시판의 일련번호
	private String name;//이름
	private String title;//제목
	private String content;//
	private java.sql.Date postdate;//작성일
	private String attachedfile;//
	private int downcount;
	private String pass;//
	private int visitcount;
	
	//getter/setter
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public java.sql.Date getPostdate() {
		return postdate;
	}
	public void setPostdate(java.sql.Date postdate) {
		this.postdate = postdate;
	}
	public String getAttachedfile() {
		return attachedfile;
	}
	public void setAttachedfile(String attachedfile) {
		this.attachedfile = attachedfile;
	}
	public int getDowncount() {
		return downcount;
	}
	public void setDowncount(int downcount) {
		this.downcount = downcount;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public int getVisitcount() {
		return visitcount;
	}
	public void setVisitcount(int visitcount) {
		this.visitcount = visitcount;
	}
	
}
