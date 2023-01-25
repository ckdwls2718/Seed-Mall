<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/top.jsp"%>
<style>
h2 {
	font-size: calc(1.325rem + .9vw);
	margin: 40px;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: bold;
	color: #39b559;
}

td{
	vertical-align: middle;
}
</style>


<div class="container mt-3" style="height: 600px; overflow: auto;">
	<h2 class="text-center">공지사항</h2>

	<!-- 검색 폼 시작----------------------------- -->

	<div class="row py-3">
		<div class="col-md-9 text-center">
			<form name="searchF" action="notice" onsubmit="return check()">
				<!-- hidden data -------------------------------------- -->
				<input type="hidden" name="pageSize" value="${pageSize}"> <input type="hidden" name="bpage" value="${paging.bpage}">
				<!-- -------------------------------------------------- -->
				<select name="findType" style="padding: 6px;">
					<option value="">검색유형</option>
					<option value="1" <c:if test="${paging.findType eq 1}">selected</c:if>>제목</option>
					<option value="2" <c:if test="${paging.findType eq 2}">selected</c:if>>내용</option>
				</select>
				<input type="text" name="findKeyword" placeholder="검색어를 입력하세요" autofocus="autofocus" style='width: 50%; padding: 5px;'>
				<button class='btn btn-outline-primary'>검 색</button>
			</form>
		</div>
		<div class="col-md-3 text-right">
			<form name="pageSizeF" action="notice">
				<!-- hidden data -------------------------------------- -->
				<input type="hidden" name="findType" value="${paging.findType}"> <input type="hidden" name="findKeyword" value="${paging.findKeyword}"> <input type="hidden" name="bpage" value="${paging.bpage}">
				<!-- -------------------------------------------------- -->
				<select name="pageSize" style="padding: 6px;" onchange="submit()">
					<option value=''>페이지 사이즈</option>
					<c:forEach var="ps" begin="5" end="20" step="5">
						<option value='${ps}' <c:if test="${pageSize eq ps}">selected</c:if>>${ps}</option>
					</c:forEach>
				</select>
			</form>
		</div>
	</div>

	<!-- -------------------------------------- -->
	<table class="table table-striped">
		<thead style="background-color: #d1e7dd">
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>날짜</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${noticeArr eq null or empty noticeArr}">
				<tr>
					<td colspan="4">
						<b>데이터가 없습니다.</b>
					</td>
				</tr>
			</c:if>
			<c:if test="${noticeArr ne null and not empty noticeArr}">
				<c:forEach var="notice" items="${noticeArr}">
					<tr>
						<td>
							<c:out value="${notice.nidx}" />
						</td>
						<td width="50%">
							<!-- 글제목 ---------------- -->
							<a class="btn btn-default" href="view/<c:out value="${notice.nidx}"/>"> <c:if test="${fn:length(notice.ntitle)>20}">
									<c:out value="${fn:substring(notice.ntitle,0,20)}" /> ...
						</c:if> <c:if test="${fn:length(notice.ntitle)<=20}">
									<c:out value="${notice.ntitle}" />
								</c:if>
							</a>

						</td>
						<td>
							<c:out value="${notice.ndate}" />
						</td>
						<td>
							<c:out value="${notice.nreadnum}" />
						</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="3" class="text-center">${pageNavi}</td>
				<td colspan="2" class="text-right">
					총 게시글수:<b><c:out value="${paging.totalCount}" /></b> <br> <span class="text-danger"><c:out value="${paging.bpage}" /></span> /
					<c:out value="${paging.pageCount}" />
				</td>
			</tr>
		</tfoot>
	</table>
	<p class="text-center my-4">
		<input type="button" class="btn btn-success btn-sm" value="글쓰기" onclick="location.href='noticeWriteForm'" style="width: 80px;">
	</p>
</div>

<%@ include file="/WEB-INF/views/foot.jsp"%>