<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!--  ---------------------------------------------------------- -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- function taglib------------------------------------------- -->

<%@ include file="/WEB-INF/views/top.jsp"%>

<div class="container mt-3" style="height: 600px; overflow: auto;">
	
	<table class="table table-condensed table-striped">
		<thead>
			<tr>
			<img src="${myctx}/assets/Cbanner3.jpg" style="width:500px; height:auto;">
				<th>글번호</th>
				<th>제목</th>
				<th>글쓴이</th>
				<th>날짜</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody id="boardBody">
			<c:if test="${boardComArr eq null or empty boardComArr}">
				<tr>
					<td colspan="5"><b>데이터가 없습니다.</b></td>
				</tr>
			</c:if>
			<c:if test="${boardComArr ne null and not empty boardComArr}">
				<c:forEach var="board" items="${boardComArr}">
					<tr>
						<td><c:out value="${board.cidx}" /></td>
						<td><a href="${myctx}/boardGet?cidx=${board.cidx}">${board.ctitle}</a>
						</td>
						<td><c:out value="${board.email}" /></td>
						<td><c:out value="${board.cdate}" /></td>
						<td><c:out value="${board.creadnum}" /></td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
	<c:if test="${loginUser.status == 0}">
		<button type="button" class="btn btn-success"
			onclick="location.href='write'">글등록</button>
	</c:if>
	<c:if test="${loginUser.status == 9}">
		<button type="button" class="btn btn-success"
			onclick="location.href='write'">관리자 글등록</button>
	</c:if>

</div>



<%@ include file="/WEB-INF/views/foot.jsp"%>