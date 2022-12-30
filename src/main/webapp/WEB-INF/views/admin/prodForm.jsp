<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/top.jsp"%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<link href="${myctx}/css/styles.css" rel="stylesheet" />
<script>
	function selectDownCategory(upCode) {
		//alert(upCode);
		//ajax로 요청보내기. get방식으로 upCg_code를 파라미터값으로 전달하면, json으로 받아보자
		//url: getDownCategory
		$.ajax({
			type : 'get',
			url : 'getDownCategory?upCg_code=' + upCode,
			dataType : 'json',
			cache : false
		}).done(
				function(res) {
					//alert(JSON.stringify(res));
					//응답 결과를 받아서 select 태그 만들어서 id가 selectDcg인 곳에 응답 html데이터를 넣기
					let str = '<select name="downCg_code" id="downCg_code">';
					str += '<option value="">::하위 카테고리::</option>';
					$.each(res, function(i, item) {
						str += '<option value="'+item.downCg_code+'">'
								+ item.downCg_name + '</option>';
					});

					str += '</select>';
					$('#selectDcg').html(str);
				}).fail(function(err) {
			alert('err');
		})

	}//----------------------------

	function check() {
		if (!$('#upCg_code').val()) {
			alert('상위 카테고리를 선택하세요');
			$('#upCg_code').focus();
			return false;
		}
		if (!$('#downCg_code').val()) {
			alert('하위 카테고리를 선택하세요');
			$('#downCg_code').focus();
			return false;
		}
		if (!$('#pname').val()) {
			alert('상품명을 입력하세요');
			$('#pname').focus();
			return false;
		}

		let $price = $('#price').val();
		let pattern = /^[0-9]+$/
		if (!pattern.test($('#pqty').val())) {
			alert('수량은 숫자로 입력해야 해요');
			$('#pqty').select();
			return false;
		}
		if (!pattern.test($price)) {
			alert('정가는 숫자로 입력해야 해요');
			$('#price').select();
			return false;
		}
		if (!pattern.test($('#saleprice').val())) {
			alert('판매가는 숫자로 입력해야 해요');
			$('#saleprice').select();
			return false;
		}
		if (!pattern.test($('#point').val())) {
			alert('포인트는 숫자로 입력해야 해요');
			$('#point').select();
			return false;
		}
		return true;
	}
	$(function() {
		/* 이미지 업로드 */
		$("input[type='file']").on("submit", function(e) {
			let formData = new FormData();
			let fileInput = $('input[name="pimage"]');
			let fileList = fileInput[0].files;
			let fileObj = fileList[0];

			for (let i = 0; i < fileList.length; i++) {
				formData.append("pimage", fileList[i]);
				console.log(fileList[i]);
			}

			$.ajax({
				url : '/seedmall/admin/imageUpload',
				processData : false,
				contentType : false,
				data : formData,
				type : 'POST',
				dataType : 'json',

			});

		});
		
	});
</script>

<div class="py-5">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h2 class="text-center">상품 등록</h2>

				<form name="prodF" id="prodF" method="POST"
					enctype="multipart/form-data" action="prodInsert"
					onsubmit="return check()">
					<!-- 파일업로드시: enctype="multipart/form-data"-->
					<table class="table table-condensed table-bordered mt-4">
						<thead>
							<tr>
								<th colspan="2" class="text-center">
									<h3>:::Product Register:::</h3>
								</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td width="20%"><b>카테고리</b></td>
								<td width="80%"><select name="upCg_code" id="upCg_code"
									onchange="selectDownCategory(this.value)">
										<option value="">::상위 카테고리::</option>
										<c:forEach var="up" items="${upCgList}">
											<option value="${up.upCg_code}">${up.upCg_name}</option>
										</c:forEach>
								</select> <span id="selectDcg"> </span></td>
							</tr>

							<tr>
								<td width="20%"><b>상품명</b></td>
								<td width="80%"><input type="text" name="pname" id="pname">
									<span style="color: red"> </span></td>
							</tr>
							<tr>
								<td width="20%"><b>상품스펙</b></td>
								<td width="80%"><select name="pspec" id="pspec">
										<option value="NEW" selected>NEW</option>
										<option value="HIT">HIT</option>
										<option value="BEST">BEST</option>
								</select></td>
							</tr>
							<tr>
								<td>상품이미지</td>
								<td><input type="file" name="pimage" multiple><br>
								</td>
							</tr>

							<tr>
								<td width="20%"><b>상품수량</b></td>
								<td width="80%"><input type="number" name="pqty" id="pqty">
									개 <span style="color: red"> </span></td>

							</tr>
							<tr>
								<td width="20%"><b>상품정가</b></td>
								<td width="80%"><input type="text" name="price" id="price">

									원 <span style="color: red"> </span></td>
							</tr>
							<tr>
								<td width="20%"><b>상품판매가</b></td>
								<td width="80%"><input type="text" name="psaleprice"
									id="saleprice"> 원 <span style="color: red"> </span></td>
							</tr>
							<tr>
								<td width="20%"><b>상품설명</b></td>
								<td width="80%"><textarea name="pcontent" id="pcontent"
										rows="5" cols="60"></textarea></td>
							</tr>
							<tr>
								<td width="20%"><b>포인트</b></td>
								<td width="80%"><input type="number" name="ppoint"
									id="point"> POINT</td>
							</tr>
							<tr>
								<td colspan="2" class="text-center">
									<button class="btn btn-outline-success">상품등록</button>
								</td>
							</tr>
						</tbody>
					</table>
				</form>

			</div>
		</div>
	</div>
</div>



<%@ include file="/WEB-INF/views/foot.jsp"%>