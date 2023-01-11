<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="/WEB-INF/views/top.jsp"%>

<div class="container mt-3" style="height: 600px; overflow: auto;">
	<h2 class="text-center">공지 내용</h2>

	<c:if test="${notice eq null}">
		<div class="alert alert-danger my-5 text-center">
			<h4>존재 하지 않는 글입니다.</h4>
		</div>
	</c:if>

	<c:if test="${notice ne null}">
		<table class="table">
			<thead style="background-color: #d1e7dd; border: 1px black">
				<tr>
					<td width="10%"><b>글번호</b></td>
					<td width="50%"><c:out value="${notice.nidx}" /></td>
					<td width="10%"><b>작성일</b></td>
					<td width="20%"><fmt:formatDate value="${notice.ndate}"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>


				</tr>
				<tr>
					<td width="10%"><b>제목</b></td>
					<td width="50%"><c:out value="${notice.ntitle}" /></td>

					<td width="10%"><b>조회수</b></td>
					<td width="20%"><c:out value="${notice.nreadnum}" /></td>
				</tr>
			</thead>
			<tbody>
				<tr height="60">
					<td colspan="4" align="left">${notice.ncontent}</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="4" align=center><a href="../noticeWriteForm">글쓰기</a>|
						<a href="../notice">목록</a>| <a
						href="../noticeEdit/<c:out value="${notice.nidx}"/>">편집</a>| <a
						href="../noticeDelete/<c:out value="${notice.nidx}"/>">삭제</a></td>
				</tr>
			</tfoot>
		</table>
	</c:if>
</div>
<script>
function noticeDelete(int nidx){
    let f = document.createElement('form');
    f.setAttribute('method', 'post');
    f.setAttribute('action', '../noticeDelete');
    document.body.appendChild(f);
    f.submit();
}
</script>

<%@ include file="/WEB-INF/views/foot.jsp"%>



