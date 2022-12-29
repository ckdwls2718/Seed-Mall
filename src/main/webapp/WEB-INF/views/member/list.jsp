<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/top.jsp"%>



<style>
h2 {
	margin: 40px 40px 40px 0px;
	font-weight: bolder;
	color: #133337;
}
tr>th {
	text-align: center;
	font-size: 14px;
}
tr>td {
	vertical-align: middle;
	text-align: center;
	font-size: 14px;
}
label {
	position: relative;
}
input {
	border: 1px solid gray;
	border-radius: 4.5px;
	padding: 0 10px;
	height: 38px;
}
button {
	position: absolute;
	top: 0;
	right: 0px;
}
</style>
<script>
	function check() {
		if (!searchF.fingKeyword.value) {
			alert('검색어를 입력하세요');
			return false;
		}
		return ture;
	}
</script>

<div class="container mt-3" style=" overflow: auto;">
	<h2 class="text-left">회원리스트</h2>
	<hr>
	<!-- 검색폼  -->
	<c:if test="${pagind.findType ne null and paging.findType ne ''}">
		<h3 class="text-center">
			<c:out value="${paging.findKeyword}" />
			로 검색한 결과
		</h3>
	</c:if>

	<div class="row py-3">
		<div class="col-md-8 text-center">
			<form name="searchF" action="list" onsubmit="return check()">
				<!-- ---hidden data------------------------------------------ -->
				<input type="hidden" name="pageSize" value="${pageSize}"> <input
					type="hidden" name="cpage" value="${paging.cpage}">
				<!-- ------------------------------------------------------- -->
				<label> <select name="findType" style="padding: 6px;">

						<option value="1"
							<c:if test="${paging.findType eq 1}">selected</c:if>>이름</option>
						<option value="2"
							<c:if test="${paging.findType eq 2}">selected</c:if>>이메일</option>
						<option value="3"
							<c:if test="${paging.findType eq 3}">selected</c:if>>등급</option>
				</select> <input type="text" name="findKeyword" placeholder="검색어를 입력하세요"
					autofocus="autofocus" style='width: 300px;'>
					<button class="btn btn-outline-success">검 색</button>
				</label>
			</form>
		</div>
		<div class="col-md-4 text-right">
			<form name="pagingSizeF" action="list">
				<!-- ---hidden data------------------------------------------ -->
				<input type="hidden" name="findType" value="${paging.findType}">
				<input type="hidden" name="findKeyword"
					value="${paging.findKeyword}"> <input type="hidden"
					name="cpage" value="${paging.cpage}">
				<!-- ------------------------------------------------------- -->
				<select name="pageSize" style="padding: 6px;" onchange="submit()">
					<!-- <option value=''>항목 노출 선택</option> -->
					<c:forEach var="ps" begin="10" end="20" step="10">
						<option value='${ps}'
							<c:if test="${pageSize eq ps}">selected</c:if>>${ps}</option>
					</c:forEach>
				</select>
			</form>
		</div>
	</div>
	<!-- --------------------------------검색폼 -->
	<hr>
	<div>
		<table class="table table-condensed ">
			<thead>
				<tr class="table-success">
					<th>번호</th>
					<th>이메일</th>
					<th>이름/등급</th>
					<th>연락처</th>
					<th>주소</th>
					<th>가입일자</th>
					<th>회원상태</th>
					<th>수정&nbsp;|&nbsp;삭제</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach var="user" items="${userArr}">
					<!-- ----------------------  -->
					<tr>
						<td>${user.midx}</td>
						<td>${user.email}</td>
						<td>${user.mname}<br> [${user.grade}]
						</td>
						<td>${user.allHp}</td>
						<td>[${user.mpost}] <br> ${user.allAddr}
						</td>
						<td>${user.mdate}</td>
						<td class="txt${user.status}">${user.status}</td>
						<td><a href="javascript:userEdit('${user.midx}')">수정</a>&nbsp;|
							<a href="#" onclick="userDel('${user.midx}')">삭제</a></td>
					</tr>
				</c:forEach>
				<!-- ----------------------  -->
			</tbody>
			<tfoot>
				<tr>
					<td colspan="3" class="text-center">${pageNavi}</td>
					<td colspan="2" class="text-right">전체 페이지: <b><c:out
								value="${paging.totalCount}" /></b> <c:out value="${paging.cpage}" />
						/ <c:out value="${paging.pageCount}" />
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
</div>
<form name="frm" id="frm" method="post">
	<input type="hidden" name="idx" id="idx">
</form>
<script>
	function userDel(vidx) {
		$('#midx').val(vidx);
		//attr():정적인 속성을 추가할 때 사용 , prop(): 기능적인 속성을 추가할 때 사용
		$('#frm').prop('action', 'userDel');
		$('#frm').submit();
	}
	function userEdit(vidx) {
		$('#midx').val(vidx);
		$('#frm').prop('action', 'userEdit');
		$('#frm').submit();
	}
</script>

<%@ include file="/WEB-INF/views/foot.jsp"%>



