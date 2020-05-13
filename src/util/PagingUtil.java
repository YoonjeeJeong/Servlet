package util;

public class PagingUtil {
	public static String pagingImg(int totalRecordCount, 
			int pageSize, int blockPage, int nowPage, String pageName) {
		
		String pagingStr = "";
		
		int totalPage = 
				(int)(Math.ceil(((double)totalRecordCount)/pageSize));
		
		int intTemp = (((nowPage-1)/blockPage) * blockPage) + 1;
		
		if(intTemp !=1) {
			pagingStr += ""
					+"<a href='" + pageName + "nowPage=1'>"
					+"<img src='../images/paging1.gif'></a>";
			pagingStr += "&nbsp;";
			pagingStr += ""
					+"<a href='" + pageName + "nowPage="+
								(intTemp-blockPage)+ "'>"
					+"<img src='../images/paging2.gif'></a>";
		}
		int blockCount = 1;
		while(blockCount<=blockPage && intTemp<=totalPage) {
			
			//페이지 바로가기
			if(intTemp==nowPage) {
				pagingStr += "&nbsp;" + intTemp + "&nbsp;"; 
			}
			else {
				//현재페이지가 아닌 경우
				pagingStr += "&nbsp;<a href='" + pageName
							+"nowPage=" + intTemp + "'>" +
							intTemp + "</a>&nbsp;";
			}
			intTemp++;
			blockCount++;
		}
		if(intTemp <= totalPage) {
			//다음 페이지 블록으로
			pagingStr += "<a href='" + pageName + "nowPage="
											+ intTemp + "'>"
					+"<img src='../images/paging3.gif'></a>";
			pagingStr += "&nbsp;";
			
			//마지막 페이지로
			pagingStr += ""
					+"<a href='" + pageName + "nowPage="+
								totalPage+ "'>"
					+"<img src='../images/paging4.gif'></a>";
			
		}
		
		return pagingStr;
	}
}


