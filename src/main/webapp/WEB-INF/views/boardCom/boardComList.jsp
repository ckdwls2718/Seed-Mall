<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!--  ---------------------------------------------------------- -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- function taglib------------------------------------------- -->

<%@ include file="/WEB-INF/views/top.jsp"%>
<style>
td{
	vertical-align: middle;
}
</style>
<div class="container mt-3" style="width: 1100px; height:1000px;overflow: auto;">

	<div style="text-align: center;">
		<img src="${myctx}/assets/Cbanner3.jpg" style="width: 550px;   margin: 20px 0;">
	</div>
	
	<div style="text-align: right; margin-top:3em;">
	<span>총 게시글 : ${paging.totalCount}건 </span><br>

	<table class="table " style=" text-align: center; border: 1px solid #cccccc;">
		<thead>
			<tr style="background:#0000000d;">
				<th style="width: 6%">번호</th>
				<th style="width: 46%">제목</th>
				<th style="width: 15%">아이디</th>
				<th style="width: 13%">날짜</th>
				<th style="width: 7%">추천수</th>
				<th style="width: 7%">조회수</th>

			</tr>
		</thead>
		<tbody id="boardBody">
			<c:if test="${boardComArr eq null or empty boardComArr}">
				<tr>
					<td colspan="5" style="height:24px;">
						<b>데이터가 없습니다.</b>
					</td>
				</tr>
			</c:if>
			<c:if test="${boardComArr ne null and not empty boardComArr}">
				<c:forEach var="board" items="${boardComArr}">
					<tr style="padding:0;">
						<td style="height:24px; padding:0;">
							<c:out value="${board.cidx}" />
						</td>
						<td style="height:24px; padding:0 5px; text-align: left; ">
							<a class="btn btn-default" href="${myctx}/boardGet?cidx=${board.cidx}">${board.ctitle}</a>
						</td>
						<td style="height:24px; padding:0;">
							<c:out value="${board.email}" />
						</td>
						<td style="height:24px; padding:0;">
							<c:out value="${board.cdate}" />
						</td>
						<td style="height:24px; padding:0;">
							<c:out value="${board.clikenum}" />
						</td>
						<td style="height:24px; padding:0;">
							<c:out value="${board.creadnum}" />
						</td>					
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
	
	</div>
	<div>
	${pageNavi}
	</div>
	<div style="text-align: center; margin-top:25px;">
		<c:if test="${loginUser.status == 0}">
		<button type="button" class="btn btn-success" onclick="location.href='write'" >글쓰기</button>
	</c:if>
	<c:if test="${loginUser.status == 9}">
		<button type="button" class="btn btn-success" onclick="location.href='write'">글쓰기(Admin)</button>
	</c:if>
	</div>
</div>



<%@ include file="/WEB-INF/views/foot.jsp"%>