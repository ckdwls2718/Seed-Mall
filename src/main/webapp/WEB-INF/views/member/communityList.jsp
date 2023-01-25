<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/top.jsp"%>
<style>
a {
	text-decoration: none;
	color: black;
}
</style>
<div class="d-flex">
	<%@ include file="/WEB-INF/views/member/mypageSidebar.jsp"%>
	<div class="container mt-3" style="width: 1000px; height: 1000px; margin: auto; overflow: auto;">
		<h2 style="font-size: calc(1.325rem + .9vw); margin: 50px 0px 40px 0px; font-family: 'Noto Sans KR', sans-serif; font-weight: bold; /* color: #39b559; */ text-align: center;">작성한 글</h2>
		<table class="table table-condensed " style="text-align: center; border: 1px solid #cccccc;">
			<thead>
				<tr style="background: #0000000d;">
					<th style="width: 7%">글번호</th>
					<th style="width: 56%">제목</th>
					<th style="width: 13%">날짜</th>
					<th style="width: 8%">조회수</th>
				</tr>
			</thead>
			<tbody id="boardBody">
				<c:if test="${boardComArr eq null or empty boardComArr}">
					<tr>
						<td colspan="5">
							<b>데이터가 없습니다.</b>
						</td>
					</tr>
				</c:if>
				<c:if test="${boardComArr ne null and not empty boardComArr}">
					<c:forEach var="board" items="${boardComArr}">
						<tr>
							<td>
								<c:out value="${board.cidx}" />
							</td>
							<td style="height:24px; padding:0 5px; text-align: left; vertical-align: middle;">
								<a href="${myctx}/boardGet?cidx=${board.cidx}">${board.ctitle}</a>
							</td>
							<td>
								<c:out value="${board.cdate}" />
							</td>
							<td>
								<c:out value="${board.creadnum}" />
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
	<div style="width: 230px;"></div>
</div>


<%@ include file="/WEB-INF/views/foot.jsp"%>