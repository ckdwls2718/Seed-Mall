package com.user.model;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpSession;

import lombok.Data;

@Data
public class PagingVO {
	//페이징 처리 관련 프로퍼티
	private int mpage;//현재 보여줄 페이지 번호
	private int pageSize=5;// 한 페이지 당 보여줄 목록 개수
	private int totalCount;//총 게시글 수
	private int pageCount;//페이지 수
	
	//DB에서 레코드를 끊어오기 위한 프로퍼티
	private int start;
	private int end;
	
	//페이징 블럭 처리를 위한 프로퍼티
	private int pagingBlock=5;// 한 블럭 당 보여줄 페이지 수
	private int prevBlock;//이전 5개
	private int nextBlock;//이후 5개
	
	//검색 관련 프로퍼티
	private String findType; //검색 유형
	private String findKeyword;//검색 키워드
	private int findState; //검색 상태 1:신규 2:관리중 3:완료 4:전체보기
	
	//페이징 처리 연산을 수행하는 메서드
	public void init(HttpSession ses) {
		if(ses!=null) {
			ses.setAttribute("pageSize", pageSize);
		}
		pageCount=(totalCount-1)/pageSize+1;
		if(mpage<1) {
			mpage=1;//1페이지를 디폴트로
		}
		if(mpage>pageCount) {
			mpage=pageCount;//마지막 페이지로 설정
		}
		
		start=(mpage-1)*pageSize;
		end=start +(pageSize+1);
		
		prevBlock=(mpage-1)/pagingBlock * pagingBlock;
		nextBlock=prevBlock+(pagingBlock+1);
	}
	public String getPageNavi(String myctx, String loc, String userAgent) {
		//myctx: 컨텍스트명, loc="member/list", userAgent: 브라우저 종류 파악하기 위한 문자열
		//검색관련-------------------
		
		if(findType==null) {
			findType="";
			findKeyword="";
		}else {
			//브라우저 IE일경우 검색어 한글 처리하기
			if(userAgent.indexOf("MSIE")>-1||userAgent.indexOf("Trident")>-1) {
				try {
				findKeyword=URLEncoder.encode(findKeyword,"UTF-8");
				}catch (UnsupportedEncodingException e) {
					System.out.println(e);
				}
			}
		}
		String link=myctx+"/"+loc;
		String qStr="?pageSize="+pageSize+"&findType="+findType+"&findKeyword="+findKeyword+"&findState="+findState;
		link+=qStr;
		String str="";
		StringBuilder buf=new StringBuilder();
		buf.append("<ul class='pagination justify-content-center'>");
		if(prevBlock>0) {
			buf.append("<li class='page-item'>")
			   .append("<a class='page-link' href='"+link+"&mpage="+prevBlock+"'>")
			   .append("Prev")
			   .append("</a>")
			   .append("</li>");
		}
		
		for(int i=prevBlock+1; i<=nextBlock-1 && i<=pageCount;i++) {
			String css=(i==mpage)? "active":"";
			
			buf.append("<li class='page-item "+css+"'>");
			buf.append("<a class='page-link' href='"+link+"&mpage="+i+"'>");
			buf.append(i);
			buf.append("</a>");
			buf.append("</li>");
		}
		
		if(nextBlock<=pageCount) {
		buf.append("<li class='page-item'>") 
		   .append("<a class='page-link' href='"+link+"&mpage="+nextBlock+"'>")
		   .append("Next")
		   .append("</a>")
		   .append("</li>");
		}
		buf.append("</ul>");
		str=buf.toString();
//		System.out.println(str);
		
		return str;
	}
}///////////////////