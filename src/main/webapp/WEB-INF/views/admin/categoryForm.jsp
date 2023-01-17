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
	margin: 40px 0px 80px;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 700;
	color: #39b559;
	text-align: center;
	padding: 0 20px;
}

th, td:first-child {
	text-align: center;
}

/* td {
	border-style: solid;
	border-width: 0;
}

.table-bordered>:not(caption)>*>* {
	border-width: 0;
} */


</style>

<script>
	function upCheck() {
		if (!$('#upCg_code').val()) {
			alert('상위 카테고리를 입력하세요');
			$('#upCg_code').focus();
			return false;
		}
		return true;
	}
	function downCheck() {
		if (!$('#upCg_code').val()) {
			alert('상위 카테고리를 선택하세요');
			$('#upCg_code').focus();
			return false;
		}
		if (!$('#downCg_code').val()) {
			alert('하위 카테고리를 입력하세요');
			$('#downCg_code').focus();
			return false;
		}

		return true;
	}
</script>

<div>
	<div class="container mt-3" style="overflow: auto;  margin-left:auto; 
    margin-right:auto;">
		<div class="row">
			<div class="col-md-12">
				<h2>카테고리 등록</h2>
				<div style="width: 620px; margin-left:auto; 
    margin-right:auto;">
					<form name="prodF" id="prodF" method="POST"
						enctype="multipart/form-data" action="addUpcategory"
						onsubmit="return check()">
						<!-- 파일업로드시: enctype="multipart/form-data"-->
						<table class="table table-condensed table-bordered mt-4" >
							<thead class="table table-success">
								<tr>
									<th colspan=3>상위 카테고리 등록</th>

								</tr>
							</thead>
							<tbody>
								<tr>
									<td width="20%"><b>상위 카테고리</b></td>
									<td width="80%" colspan=2><input type="text"
										name="upCg_name" id="upCg_name"></td>
								</tr>
								<tr>
									<td colspan="3" class="text-center">
										<button class="btn btn-outline-success">등록</button>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
					<div style="height: 60px;"></div>
					<form name="prodF" id="prodF" method="POST"
						enctype="multipart/form-data" action="addDowncategory"
						onsubmit="return check()">
						<!-- 파일업로드시: enctype="multipart/form-data"-->
						<table class="table table-condensed table-bordered mt-4">
							<thead class="table" style="background: #e6ee9c;">
								<tr>
									<th colspan=3>하위 카테고리 등록</th>

								</tr>
							</thead>
							<tbody>
								<tr>
									<td width="20%"><b>상위 카테고리</b></td>
									<td width="80%" colspan=2><select name="upCg_code"
										id="upCg_code" onchange="selectDownCategory(this.value)">
											<option value="">상위 카테고리</option>
											<c:forEach var="up" items="${upCgList}">
												<option value="${up.upCg_code}">${up.upCg_name}</option>
											</c:forEach>
									</select></td>
								</tr>
								<tr>
									<td width="20%"><b>하위 카테고리</b></td>
									<td width="80%" colspan=2><input type="text"
										name="downCg_name" id="downCg_name"></td>
								</tr>
								<tr>
									<td colspan="3" class="text-center">
										<button class="btn btn-outline-success">등록</button>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
					
				</div>

			</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/foot.jsp"%>