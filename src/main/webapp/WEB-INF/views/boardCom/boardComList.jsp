<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!--  ---------------------------------------------------------- -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- function taglib------------------------------------------- -->

<%@ include file="/WEB-INF/views/top.jsp"%>
<style>
a{
	text-decoration: none;
	color: black;
}
</style>
<div class="container mt-3" style="width: 1100px; height:60em;overflow: auto;">

	<div style="text-align: center;">
		<img src="${myctx}/assets/Cbanner3.jpg" style="width: 550px;   margin: 20px 0;">
	</div>
	<table class="table table-condensed " style="background:#f7f9fa; text-align: center; border: 1px solid #cccccc;">
		<thead>
			<tr>
				<th style="width: 7%"></th>
				<th style="width: 59%">제목</th>
				<th style="width: 16%">아이디</th>
				<th style="width: 10%">날짜</th>
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
						<td>
							<span style="float:left; margin-left: 1.5em;">
							<a href="${myctx}/boardGet?cidx=${board.cidx}">${board.ctitle}</a>
							</span>
						</td>
						<td>
							<c:out value="${board.email}" />
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
	<div style="text-align: center; margin-top:3em;">
	<c:if test="${loginUser.status == 0}">
		<button type="button" class="btn btn-success" onclick="location.href='write'">글쓰기</button>
	</c:if>
	<c:if test="${loginUser.status == 9}">
		<button type="button" class="btn btn-success" onclick="location.href='write'">글쓰기(Admin)</button>
	</c:if>
	</div>

</div>



<%@ include file="/WEB-INF/views/foot.jsp"%>