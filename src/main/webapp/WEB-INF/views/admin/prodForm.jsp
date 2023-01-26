<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/top.jsp"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />

<script>
function setThumbnail(event) {
    for (var image of event.target.files) {
      var reader = new FileReader();

      reader.onload = function(event) {
        var img = document.createElement("img");
        img.setAttribute("src", event.target.result);
        img.setAttribute("width", "35%");
        img.setAttribute("height", "35%");
        document.querySelector("div#image_container").appendChild(img);
      };

      console.log(image);
      reader.readAsDataURL(image);
    }
  }//------------

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
					str += '<option value="">하위 카테고리</option>';
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
	}//---------
</script>

<div>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h2 style="text-align: left; margin: 40px 40px 0 0; font-weight: bolder">상품 등록</h2>
				<br>
				<hr>

				<form name="prodF" id="prodF" method="POST"
					enctype="multipart/form-data" action="prodInsert"
					onsubmit="return check()">
					<!-- 파일업로드시: enctype="multipart/form-data"-->
					<table class="table table-condensed table-bordered mt-4">
						<thead class="table-success">
							<tr>
								<th colspan=3></th>

							</tr>
						</thead>
						<tbody>
							<tr>
								<td width="20%"><b>카테고리</b></td>
								<td width="80%" colspan=2><select name="upCg_code"
									id="upCg_code" onchange="selectDownCategory(this.value)">
										<option value="">상위 카테고리</option>
										<c:forEach var="up" items="${upCgList}">
											<option value="${up.upCg_code}">${up.upCg_name}</option>
										</c:forEach>
								</select> <span id="selectDcg"> </span></td>
							</tr>

							<tr>
								<td width="20%"><b>상품명</b></td>
								<td width="80%" colspan=2><input type="text" name="pname"
									id="pname"> <span style="color: red"> </span></td>
							</tr>
							<tr>
								<td width="20%"><b>상품스펙</b></td>
								<td width="80%" colspan=2><select name="pspec" id="pspec">
										<option value="NEW" selected>NEW</option>
										<option value="HIT">HIT</option>
										<option value="BEST">BEST</option>
										<option value="BEST">NORMAL</option>
								</select></td>
							</tr>
							<tr>
								<td><b>상품이미지</b></td>
								<td width="20%"><input type="file" name="pimage"
									onchange="setThumbnail(event)" multiple></td>
								<td width="60%"><span
									style="border: 1px solid black; border-radius: 2px">선택된
										이미지</span>
									<div id="image_container"></div> <br></td>
							</tr>

							<tr>
								<td width="20%"><b>상품수량</b></td>
								<td width="80%" colspan=2><input type="number" name="pqty"
									id="pqty"> 개 <span style="color: red"> </span></td>

							</tr>
							<tr>
								<td width="20%"><b>상품정가</b></td>
								<td width="80%" colspan=2><input type="text" name="price"
									id="price"> 원 <span style="color: red"> </span></td>
							</tr>
							<tr>
								<td width="20%"><b>상품판매가</b></td>
								<td width="80%" colspan=2><input type="text"
									name="psaleprice" id="saleprice"> 원 <span
									style="color: red"> </span></td>
							</tr>
							<tr>
								<td width="20%" rowspan=3><b>환경</b></td>
								<td width="20%" colspan=2><b>햇빛 : </b><br>
								<textarea name="sun" id="sun" rows="3" cols="40"></textarea></td>
							</tr>
							<tr>
								<td width="20%" colspan=2><b>온도 : </b><br>
								<textarea name="temp" id="temp" rows="3" cols="40"></textarea></td>
							</tr>
							<tr>
								<td width="20%" colspan=2><b>토양,물관리 : </b><br>
								<textarea name="soil" id="soil" rows="3" cols="40"></textarea></td>
							</tr>
							<tr>
								<td width="20%"><b>상품설명</b></td>
								<td width="80%" colspan=2><textarea name="pcontent"
										id="pcontent" rows="5" cols="60"></textarea></td>
							</tr>
							<tr>
								<td width="20%"><b>포인트</b></td>
								<td width="80%" colspan=2><input type="number"
									name="ppoint" id="point"> POINT</td>
							</tr>
							<tr>
								<td colspan="3" class="text-center">
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