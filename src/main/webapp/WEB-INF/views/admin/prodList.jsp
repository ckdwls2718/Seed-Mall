<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/top.jsp"%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
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
</style>
<div class="container" style="text-align: center">

	<div class="row">
		<div class="col-md-12">
			<h2
				style="text-align: left; margin: 40px 40px 0 0; font-weight: bolder">상품
				목록</h2>
			<div style="text-align: right">
				<button class="btn btn-outline-success"
					onclick="location.href='${myctx}/admin/prodForm'">상품등록</button>
			</div>
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
								<c:if test="${paging.findType eq 1}">selected</c:if>>상품번호</option>
							<option value="2"
								<c:if test="${paging.findType eq 2}">selected</c:if>>카테고리</option>
							<option value="3"
								<c:if test="${paging.findType eq 3}">selected</c:if>>상품명</option>
						</select> <label> <input type="text" name="findKeyword"
							placeholder="검색어를 입력하세요" autofocus="autofocus"
							style='width: 300px;'>
							<button class="btn btn-outline-success"
								style="position: absolute; top: 0; right: 0px;">검 색</button>
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
						<select name="pageSize" style="padding: 6px; margin-top: 2px"
							onchange="submit()">
							<!-- <option value=''>항목 노출 선택</option> -->
							<c:forEach var="ps" begin="5" end="20" step="5">
								<option value='${ps}'
									<c:if test="${pageSize eq ps}">selected</c:if>>${ps}</option>
							</c:forEach>
						</select>
					</form>
				</div>
			</div>
			<!-- --------------------------------검색폼 -->
			<hr style="margin-bottom:0">
			<table class="table table-striped " id="products">
				<thead class="table-success">
					<tr>
						<th>상품번호</th>
						<th>카테고리</th>
						<th data-sort="string">상품명</th>
						<th>이미지</th>
						<th data-sort="string">가 격</th>
						<th>수정|삭제</th>
					</tr>
				</thead>
				<tbody>
					<!-- ------------------------ -->
					<c:if test="${prodArr eq null or empty prodArr}">
						<tr>
							<td colspan="6">등록된 상품이 없습니다</td>
						</tr>
					</c:if>
					<c:if test="${prodArr ne null and not empty prodArr}">
						<c:forEach var="prod" items="${prodArr}">
							<tr>
								<td>${prod.pidx}</td>
								<td>${prod.upCg_name}>${prod.downCg_name}</td>
								<td>${prod.pname}</td>

								<td width="15%"><a href="a" target="_blank"> <img
										src="${myctx}/resources/product_images/${prod.pimageList[0].pimage}"
										style="width: 90%; margin: auto" class="img-fluid">
								</a></td>
								<td><del>
										정 가:
										<fmt:formatNumber value="${prod.price}" pattern="###,###" />
										원
									</del> <br> <b class="text-primary">판매가 : <fmt:formatNumber
											value="${prod.psaleprice}" pattern="###,###" /> 원
								</b><br> <span class="badge bg-danger">${prod.percent}
										%할인</span></td>
								<td><a href="prodEdit?pidx=${prod.pidx}">수정</a>| <a
									href="prodDel?pidx=${prod.pidx}">삭제</a></td>
							</tr>
						</c:forEach>
					</c:if>
					<!-- ------------------------ -->
				</tbody>

			</table>
		</div>
	</div>

</div>

<%@ include file="/WEB-INF/views/foot.jsp"%>