package com.product.model;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpSession;

import lombok.Data;

/*
 * 페이징 처리 및 검색 기능을 모듈화하여
 * 재사용할 수 있도록 하자
 * 
 * */

@Data
public class PagingVO {
	// 페이징 처리 관련 프로퍼티
	private int cpage; // 현재 보여줄 페이지 번호
	private int pageSize=5; // 한페이지당 보여줄 목록 갯수
	private int totalCount; // 총 게시글 수
	private int pageCount; // 페이지 수

	// DB에서 레코드를 끊어오기 위한 프로퍼티
	private int start;
	private int end;

	// 페이징 블럭 처리를 위한 프로퍼티
	private int pagingBlock = 5; // 한 블럭당 보여줄 페이지 수
	private int prevBlock; // 이전 5개
	private int nextBlock; // 이후 5개

	// 검색 관련 프로퍼티
	private String findType; // 검색 유형
	private String findKeyword; // 검색 키워드
	
	// 정렬 관련 프로퍼티
	private int sort=1; // 정렬 유형

	// 페이징 처리 연산을 수행하는 메서드
	public void init(HttpSession ses) {
		
		if(ses!=null) {
			ses.setAttribute("pageSize", pageSize);
		}
		
		this.pageCount = (totalCount - 1) / pageSize + 1;
		if (cpage < 1) {
			cpage = 1;
		} else if (cpage > pageCount) {
			cpage = pageCount;
		}
		// [1] where 절 between을 사용할 경우
		// end = cpage*pageSize;
		// start = end-(pageSize-1);

		// [2] where절 rn> a and rn<b 를 사용할 경우
		start = (cpage - 1) * pageSize;
		end = start + pageSize + 1;
		
		//페이징 블럭 연산
		/*
		 * cpage
		 * [1][2][3][4][5] | [6][7][8][9][10] | [11][12][13][14][15] | [16][17][18][19][20]
		 * 
		 * cpage		pagingblock			prevBlock(이전 5개) 		nextBlock(이후 5개)
		 * 1~5				5					0							6
		 * 6~10									5							11
		 * 11~15 								10							16
		 * 
		 * */
		prevBlock = (cpage-1)/pagingBlock * pagingBlock;
		nextBlock = prevBlock+(pagingBlock+1);
		
		
	}
	public String getPageNavi(String myctx, String loc, String userAgent) {
		//myctx:컨텍스트명, loc:/multiweb/board/list, userAgent: 브라우저 종류를 파악하기 위한 문자열
		//검색관련---------
		if(findType==null) { //넘어오지 않을경우
			findType="";
			findKeyword="";
		} else {
			//브라우저가 IE일 경우 검색어 한글 처리하기
			if(userAgent.indexOf("MSIE")>-1 || userAgent.indexOf("Trident")>-1) {
				try {
					findKeyword=URLEncoder.encode(findKeyword, "UTF-8");
				} catch(UnsupportedEncodingException e) {
					System.out.println(e);
				}
				
			}
		}
		String link=myctx+"/"+loc;
		String qStr="?pageSize="+pageSize+"&findType="+findType+"&findKeyword="+findKeyword;
		link+=qStr;
		String str="";
		StringBuilder sb = new StringBuilder();
		sb.append("<ul class='pagination justify-content-center'>");
		if(prevBlock>0) {
			sb.append("<li class='page-item'>")
			.append("<a class='page-link' href='"+link+"&cpage="+prevBlock+"'>")
			.append("Prev")
			.append("</a>")
			.append("</li>");	
		}
		for(int i=prevBlock+1; i<=nextBlock-1 && i<=pageCount; i++) {
			String css=(i==cpage)?"active":"";
			sb.append("<li class='page-item "+css+"'>");
			sb.append("<a class='page-link' href='"+link+"&cpage="+i+"'>");
			sb.append(i);
			sb.append("</a>");
			sb.append("</li>");
		}
		
		
		if(nextBlock<=pageCount) {
			sb.append("<li class='page-item'>")
			.append("<a class='page-link' href='"+link+"&cpage="+nextBlock+"'>")
			.append("Next")
			.append("</a>")
			.append("</li>");	
		}
		sb.append("</ul>");
		
		str = sb.toString();
		//System.out.println(str);
		return str;
	}
}
