<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/top.jsp"%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />

<script>
function setThumbnail(event) {
    for (var image of event.target.files) {
      var reader = new FileReader();

      reader.onload = function(event) {
        var img = document.createElement("img");
        img.setAttribute("src", event.target.result);
        img.setAttribute("width", "45%");
        img.setAttribute("height", "45%");
        document.querySelector("div#image_container").appendChild(img);
      };

      console.log(image);
      reader.readAsDataURL(image);
    }
  }



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
</script>

<div>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h2
					style="text-align: left; margin: 40px 40px 0 0; font-weight: bolder">상품
					수정</h2>
				<br>
				<hr>
				<form name="prodF" id="prodF" method="POST"
					enctype="multipart/form-data" action="updateProd"
					onsubmit="return check()">
					<!-- 파일업로드시: enctype="multipart/form-data"-->
					<table class="table table-condensed table-bordered mt-4">
						<thead class="table-success">
							<tr>
								<th colspan=3><input type="hidden" name="pidx"
									value="${pvo.pidx}"></th>
								
							</tr>
						</thead>
						<tbody>
							<tr>
								<td width="20%"><b>카테고리</b></td>
								<td width="80%" colspan=2><select name="upCg_code"
									id="upCg_code">
										<c:forEach var="up" items="${UpArr}">
											<option value="${up.upCg_code}"
												<c:if test="${up.upCg_code == pvo.upCg_code}">selected</c:if>>${up.upCg_name}</option>
										</c:forEach>
								</select> <select name="downCg_code" id="downCg_code">
										<c:forEach var="down" items="${DownArr}">
											<option value="${down.downCg_code}"
												<c:if test="${down.downCg_code == pvo.upCg_code}">selected</c:if>>${down.downCg_name}</option>
										</c:forEach>

								</select></td>
							</tr>

							<tr>
								<td width="20%"><b>상품명</b></td>
								<td width="80%" colspan=2><input type="text" name="pname"
									id="pname" value="${pvo.pname}"> <span
									style="color: red"></span></td>
							</tr>
							<tr>
								<td width="20%"><b>상품스펙</b></td>
								<td width="80%" colspan=2><select name="pspec" id="pspec">
										<option value="NEW"
											<c:if test="${pvo.pspec == 'NEW'}">selected</c:if>>NEW</option>
										<option value="HIT"
											<c:if test="${pvo.pspec == 'HIT'}">selected</c:if>>HIT</option>
										<option value="BEST"
											<c:if test="${pvo.pspec == 'BEST'}">selected</c:if>>BEST</option>
										<option value="NORMAL"
											<c:if test="${pvo.pspec == 'NORMAL'}">selected</c:if>>NORMAL</option>
								</select></td>
							</tr>
							<tr>
								<td rowspan=2><b>상품이미지</b></td>
								<td colspan=2><input type="file" name="pimage"
									onchange="setThumbnail(event)" accept="image/*" multiple>
								</td>
							</tr>
							<tr>
								<td width="40%"><span
									style="border: 1px solid black; border-radius: 2px">선택된
										이미지</span>
									<div id="image_container"></div></td>
								<td width="40%"><span
									style="border: 1px solid black; border-radius: 2px">수정 전
										이미지</span> <br> <c:forEach var="prodImg"
										items="${pvo.pimageList}">
										<img src="${myctx}/resources/product_images/${prodImg.pimage}"
											style="width: 45%">
									</c:forEach> <!-- 예전에 업로드한 파일명을 hidden으로 보내자  --------------------------------- -->
									<input type="hidden" name="old_filename"
									value="${prodImg.pimage}"></td>
							</tr>

							<tr>
								<td width="20%"><b>상품수량</b></td>
								<td width="80%" colspan=2><input type="number" name="pqty"
									id="pqty" value="${pvo.pqty}"> 개 <span
									style="color: red"> </span></td>

							</tr>
							<tr>
								<td width="20%"><b>상품정가</b></td>
								<td width="80%" colspan=2><input type="text" name="price"
									id="price" value="${pvo.price}"> 원 <span
									style="color: red"> </span></td>
							</tr>
							<tr>
								<td width="20%"><b>상품판매가</b></td>
								<td width="80%" colspan=2><input type="text"
									name="psaleprice" id="saleprice" value="${pvo.psaleprice}">
									원 <span style="color: red"> </span></td>
							</tr>
							<tr>
								<td width="20%" rowspan=3><b>환경</b></td>
								<td width="20%" colspan=2><b>햇빛 : </b><br>
								<textarea name="sun" id="sun" rows="3" cols="40">${pvo.sun}</textarea></td>
							</tr>
							<tr>
								<td width="20%" colspan=2><b>온도 : </b><br>
								<textarea name="temp" id="temp" rows="3" cols="40">${pvo.temp}</textarea></td>
							</tr>
							<tr>
								<td width="20%" colspan=2><b>토양,물관리 : </b><br>
								<textarea name="soil" id="soil" rows="3" cols="40">${pvo.soil}</textarea></td>
							</tr>
							<tr>
								<td width="20%"><b>상품설명</b></td>
								<td width="80%" colspan=2><textarea name="pcontent"
										id="pcontent" rows="5" cols="60">${pvo.pcontent}</textarea></td>
							</tr>
							<tr>
								<td width="20%"><b>포인트</b></td>
								<td width="80%" colspan=2><input type="number"
									name="ppoint" id="point" value="${pvo.ppoint}"> POINT</td>
							</tr>
							<tr>
								<td colspan="3" class="text-center">
									<button class="btn btn-outline-success">상품수정</button>
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