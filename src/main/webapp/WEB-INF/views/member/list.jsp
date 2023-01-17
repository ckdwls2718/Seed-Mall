<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/top.jsp"%>

<style>
h2 {/* 머릿말 */
	margin: 40px 40px 40px 0px;
	padding: 0 20px;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 700;
	color: #39b559;
	font-size: calc(1.325rem + .9vw);
}
.List{ /* 머릿말 a링크  */
	text-decoration: none;
	color: #39b559;
}
.List:hover{/* 머릿말 a링크  */
	color: #39b559;
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
.page-link {
    position: relative;
    display: block;
    color: #198754;
    text-decoration: none;
    background-color: #fff;
    border: 1px solid #dee2e6;
    transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;
}

.page-link:hover {
  z-index: 2;
  color: #198754;
  background-color: #e9ecef;
  border-color: #dee2e6;
}
.page-link:focus {
  z-index: 3;
  color: #198754;
  background-color: #e9ecef;
  outline: 0;
  box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.25);
}

.page-item.active .page-link {
  z-index: 3;
  color: #fff;
  background-color: #198754;
  border-color: #198754;
}
.total{
	width:16%;
	text-align:right;
	padding-right:15px;
	padding-top: 10px;
}
.findType{
	padding-bottom: 15px;
	padding: 6px;
}
.pageSize{
	padding: 1px;
}

</style>
<!-- 검색 오류 알림 -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	function check() {
		if (!searchF.findKeyword.value) {
			alert('검색어를 입력하세요');
			searchF.findKeyword.focus();
			return false;
		}
		return true;
	}
	function userDel(vidx) {
		$('#midx').val(vidx);
		$('#df').prop('action', 'userDel');
		$('#df').submit();
	}
	function userEdit(vidx, i) {
		//alert(vidx+"//"+i)
		let status = $('#status' + i + " option:selected").val();
		//alert(status);
		$('#midx2').val(vidx);
		$('#status').val(status);

		$('#ef').prop('action', 'userEdit');
		$('#ef').submit();
	}
</script>

<div class="container mt-3" style="overflow: auto;">
	<h2 class="text-left">
		<a class="List" href="memberList">회원리스트</a>
	</h2>
	<c:if test="${paging.findType ne null and paging.findType ne ''}">
		<h4 class="text-center" style="margin: 30px 0px;">
			- <b><c:out value="${paging.findKeyword}"/></b> -
			로 검색한 결과입니다.
		</h4>
	</c:if>
	
	<div class="row py-1" style="margin-left: 2px;">
		<!-- 페이지 사이즈 처리 -->
		<div class="col-md-4 text-left " style="padding-top: 12px;">
			<form name="pagingSizeF" action="memberList">
				Show&nbsp;
				<select name="pageSize" class="pageSize" onchange="submit()">
					<!-- <option value=''>항목 노출 선택</option> -->
					<c:forEach var="ps" begin="5" end="20" step="5">
						<option value='${ps}'
							<c:if test="${pageSize eq ps}">selected</c:if>>${ps}개씩</option>
					</c:forEach>
				</select>
				&nbsp;entries
				<!-- ---hidden data------------------------------------------ -->
				<input type="hidden" name="findType" value="${paging.findType}">
				<input type="hidden" name="findKeyword" value="${paging.findKeyword}">
				<input type="hidden" name="mpage" value="${paging.mpage}">
				<!-- ------------------------------------------------------- -->
			</form>
		</div>
		
		
		<!-- 검색창  -->
		<div class="col-md-6">
			<form name="searchF" action="memberList" onsubmit="return check()">
				<!-- ---hidden data------------------------------------------ -->
				<%-- <input type="hidden" name="pageSize" value="${pageSize}"> --%>
				<%-- <input type="hidden" name="mpage" value="${searchF.mpage}"> --%>
				<!-- ------------------------------------------------------- -->
				<select name="findType" class="findType">
					<option value="1"
						<c:if test="${paging.findType eq 1}">selected</c:if>>이름</option>
					<option value="2"
						<c:if test="${paging.findType eq 2}">selected</c:if>>이메일</option>
					<option value="3"
						<c:if test="${paging.findType eq 3}">selected</c:if>>등급</option>
				</select>
				<label>
					<input type="text" name="findKeyword"
					placeholder="검색어를 입력하세요" autofocus="autofocus"
					style='width: 300px;'>
					<button class="btn btn-outline-success">검 색</button>
				</label>
			</form>
		</div>
		<!-- 전체 회원 수 표시-->
		<div class="total">
			<div>전체 회원수: 
				<b><c:out value="${paging.totalCount}"/></b>
			</div>
		</div>
	</div>
	<!-- 회원 리스트 -->
	<div>
		<table class="table table-condensed">
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
						<td>${user.mname}<br> [${user.grade}]
						</td>
						<td>${user.allHp}</td>
						<td>[${user.mpost}] <br> ${user.allAddr}
						</td>
						<td>${user.mdate}</td>
						<td><c:if test="${user.status ne 9}">
								<select id="status${st.index}" name="status" style="padding: 1px;">
									<option value="0"
										<c:if test="${user.status eq 0}">selected</c:if>>일반회원</option>
									<option value="1"
										<c:if test="${user.status eq 1}">selected</c:if>>정지회원</option>
									<option value="2" style="color: red;"
										<c:if test="${user.status eq 2}">selected</c:if>>탈퇴회원</option>
								</select>
							</c:if> <c:if test="${user.status eq 9}">
								<c:out value="-관리자-"></c:out>
							</c:if></td>
						<td>
						<c:if test="${user.status ne 9}">
							<a href="#" onclick="userEdit('${user.midx}','${st.index}')">수정</a>&nbsp;|
							<a href="#" onclick="userDel('${user.midx}')">삭제</a>
						</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
			<!-- 페이지 기능  -->
			<tfoot>
				<tr>
					<td colspan="9" class="text-center">${pageNavi}</td>
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

<%@ include file="/WEB-INF/views/foot.jsp"%>
