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
		return true;
	}
</script>

<div class="container mt-3" style=" overflow: auto;">
	<h2 class="text-left">회원리스트</h2>
	<hr>
	<!-- 검색폼  -->
	<c:if test="${paging.findType ne null and paging.findType ne ''}">
		<h3 class="text-center">
			<c:out value="${paging.findKeyword}" />
			로 검색한 결과
		</h3>
	</c:if>
	<div class="row py-3">
		<div class="col-md-8 text-center">
			<form name="searchF" action="list" onsubmit="return check()">
				<!-- ---hidden data------------------------------------------ -->
				<input type="hidden" name="pageSize" value="${pageSize}">
				<input type="hidden" name="cpage" value="${paging.cpage}">
				<!-- ------------------------------------------------------- -->
				<select name="findType" style="padding: 6px;">
					<option value="1"
						<c:if test="${paging.findType eq 1}">selected</c:if>>이름</option>
					<option value="2"
						<c:if test="${paging.findType eq 2}">selected</c:if>>이메일</option>
					<option value="3"
						<c:if test="${paging.findType eq 3}">selected</c:if>>회원등급</option>
				</select>
				<label>
				<input type="text" name="findKeyword" placeholder="검색어를 입력하세요"
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
					<c:forEach var="ps" begin="5" end="20" step="5">
						<option value='${ps}'
							<c:if test="${pageSize eq ps}">selected</c:if>>
							${ps}
						</option>
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
				<c:forEach var="user" items="${userArr}" varStatus="st">
					<!-- ----------------------  -->
					<tr>
						<td>${user.midx}</td>
						<td>${user.email}</td>
						<td>${user.mname}<br> [${user.grade}]</td>
						<td>${user.allHp}</td>
						<td>[${user.mpost}] <br> ${user.allAddr}</td>
						<td>${user.mdate}</td>
						<td>
						<c:if test="${user.status ne 9}">
						 <select id="status${st.index}"name="status" style="padding: 1px;">
							<option value="0" 
							<c:if test="${user.status eq 0}">selected</c:if>>일반회원</option>
							<option value="1"
							<c:if test="${user.status eq 1}">selected</c:if>>정지회원</option>
							<option value="2" style="color: red;"
							<c:if test="${user.status eq 2}">selected</c:if>>탈퇴회원</option>							
						</select>
						</c:if>
						<c:if test="${user.status eq 9}">
							<c:out value="-관리자-"/>
						</c:if>
						</td>
						<td>
						<c:if test="${user.status ne 9}">
							<a href="#" onclick="userEdit('${user.midx}','${st.index}')">수정</a>&nbsp;|
							<a href="#" onclick="userDel('${user.midx}')">삭제</a>
						</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		<!-- 페이지 작업 -->	
			<tfoot>
				<tr>
					<td colspan="3" class="text-center">${pageNavi}</td>
					<td colspan="2" class="text-right">Total : <b>
						<c:out value="${paging.totalCount}" /></b> <c:out value="${paging.cpage}" />
						/ <c:out value="${paging.pageCount}" />
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
</div>
<!-- 삭제 폼  -->
<form name="df" id="df" action="userDel" method="post">
	<input type="hidden" name="midx" id="midx">
</form>
<!-- 수정 폼  -->
<form name="ef" id="ef" action="userEdit" method="post">
	<input type="hidden" name="midx" id="midx2">
	<input type="hidden" name="status" id="status">
</form>

<script>
	function userDel(vidx) {
		$('#midx').val(vidx);
		$('#df').prop('action', 'userDel');
		$('#df').submit();
	}
	function userEdit(vidx, i){
		//alert(vidx+"//"+i)
		let status=$('#status'+i+" option:selected").val();
		//alert(status);
		$('#midx2').val(vidx);
		$('#status').val(status);
		
		$('#ef').prop('action', 'userEdit');
		$('#ef').submit();
	}
</script>

<%@ include file="/WEB-INF/views/foot.jsp"%>
