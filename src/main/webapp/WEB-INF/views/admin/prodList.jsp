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
	font-size: calc(1.325rem + .9vw);
	margin: 40px 40px 40px 0px;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 700;
	color: #39b559;
	text-align: left;
	padding: 0 20px;
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

#searchbar {
	position: absolute;
	top: 0;
	right: 0px;
}

a {
	text-decoration: none;
	color: black;
}
</style>

<div class="d-flex">
<%@ include file="/WEB-INF/views/admin/adminPageSidebar.jsp"%>
<div class="container mt-3" style="overflow: auto;">
	<div class="row">
		<div class="text-left">
			<h2>상품 목록</h2>
			<!-- 검색폼  -->
			<c:if test="${paging.findKeyword ne null and paging.findKeyword ne ''}">
				<h4 class="text-center" style="margin: 30px 0px;">
					- <b><c:out value="${paging.findKeyword}" /></b> - 로 검색한 결과입니다.
				</h4>
			</c:if>



			<div class="row py-1" style="margin-left: 2px;">

				<div class="col-md-3 text-left " style="padding-top: 12px;">
					<form name="pagingSizeF" action="prodList">
						&nbsp; <select name="pageSize" class="pageSize"
							onchange="submit()">
							<!-- <option value=''>항목 노출 선택</option> -->
							<c:forEach var="ps" begin="5" end="20" step="5">
								<option value='${ps}'
									<c:if test="${pageSize eq ps}">selected</c:if>>${ps}</option>
							</c:forEach>
						</select> &nbsp;개씩 보기
						<!-- ---hidden data------------------------------------------ -->
						<input type="hidden" name="findKeyword"
							value="${paging.findKeyword}"> <input type="hidden"
							name="cpage" value="${paging.cpage}">
						<!-- ------------------------------------------------------- -->
					</form>
				</div>
				<!-- 검색창  -->
				<div class="col-md-6" style="width: 500px;">
					<form name="searchF" action="prodList" onsubmit="return check()">
						<!-- ---hidden data------------------------------------------ -->
						<input type="hidden" name="pageSize" value="${pageSize}">
						<input type="hidden" name="cpage" value="${paging.cpage}">
						<!-- ------------------------------------------------------- -->
						<label> <input type="text" name="findKeyword"
							placeholder="검색어를 입력하세요" autofocus="autofocus"
							style='width: 300px;'>
							<button class="btn btn-outline-success" id="searchbar">검
								색</button>
						</label>
					</form>
				</div>
				<div class="col-md-3" >
					<button class="btn btn-outline-warning"
						style="margin: 0px 4px 0px 7px;"
						onclick="location.href='${myctx}/admin/categoryForm'">카테고리등록</button>
					<button class="btn btn-outline-success" style="margin: 0px 7px;"
						onclick="location.href='${myctx}/admin/prodForm'">상품등록</button>
				</div>
			</div>

			<!-- --------------------------------검색폼 -->
			<table class="table table-striped " id="products">
				<thead>
					<tr class="table-success">
						<th>상품번호</th>
						<th>카테고리</th>
						<th data-sort="string">상품명</th>
						<th>이미지</th>
						<th data-sort="string">가 격</th>
						<th>수정&nbsp;|&nbsp;삭제</th>
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
								</b><br> <span class="badge bg-danger">${prod.percent}%
								</span></td>
								<td><a href="prodEdit?pidx=${prod.pidx}">수정</a>&nbsp;| <a
									href="prodDel?pidx=${prod.pidx}">삭제</a></td>
							</tr>
						</c:forEach>
					</c:if>
					<!-- ------------------------ -->
				</tbody>
				<tfoot>
					<tr>
						<td colspan="4" class="text-center">${pageNavi}</td>
						<td colspan="3" class="text-right">총 상품 수:<b><c:out
									value="${paging.totalCount}" /></b> <br> <span
							class="text-danger"><c:out value="${paging.cpage}" /></span> / <c:out
								value="${paging.pageCount}" />
						</td>
					</tr>
				</tfoot>

			</table>
		</div>
	</div>
</div>
</div>

<%@ include file="/WEB-INF/views/foot.jsp"%>