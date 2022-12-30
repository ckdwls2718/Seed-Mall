<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<%@ include file="/WEB-INF/views/top.jsp"%>
<script>
	function order_check() { //유효성체크 
		if (!$('#oname').val()) {
			alert('받는분을 입력하세요.');
			$('#oname').focus();
			return false;
		}
		if (!$('#ohp1').val()) {
			alert('연락처를 입력하세요.');
			$('#ohp1').focus();
			return false;
		}
		if (!$('#ohp2').val()) {
			alert('연락처를 입력하세요.');
			$('#ohp2').focus();
			return false;
		}
		if (!$('#ohp3').val()) {
			alert('연락처를 입력하세요.');
			$('#ohp3').focus();
			return false;
		}
		if (!$('#oaddr1').val()) {
			alert('주소를 입력하세요.');
			$('#oaddr1').focus();
			return false;
		}
		return true;
	}
	
</script>
<!-- 상품 클릭 후 주문하기 버튼을 통해 주문페이지를 바로 들어왔을 때 화면 -->
<div class="container" style="height: 600px; overflow: auto;">
	<h1 class="text-center mt-5 mb-5">배송지정보</h1>
	<div class="checkbox mb-3" style="text-align: left;">
		<label> <input type="checkbox" value="remember-me"> 기본
			배송지 설정
		</label>
	</div>

	<form name="frm" id="frm" action="index" method="post"
		enctype="multipart/form-data" onsubmit="return order_check()">
		<table class="table">
			<tr>
				<td width="20%" class="m1">받는분</td>
				<td width="80%" class="m2"><input type="text" name="oname"
					id="oname"></td>
			</tr>
			<tr>
				<td width="20%" class="m1">연락처</td>
				<td width="80%" class="m2"><input type="text" name="ohp1"
					id="ohp1" placeholder="HP1" maxlength="3">- <input
					type="text" name="ohp2" id="ohp2" placeholder="HP2" maxlength="4">-
					<input type="text" name="ohp3" id="ohp3" placeholder="HP3"
					maxlength="4"></td>
			</tr>
			<tr>
				<td width="20%" class="m1">우편번호</td>
				<td width="80%" class="m2"><input type="text" name="opost"
					id="opost" maxlength="5">
					<button type="submit" class="btn btn-success">우편번호 찾기</button></td>
			</tr>
			<tr>
				<td width="20" class="m1">주소</td>
				<td width="80%" class="m2"><input type="text" name="oaddr1"
					id="oaddr1"> <input type="text" name="oaddr2" id="oaddr2">
				</td>
			</tr>
			<tr>
				<td width="20%" class="m1">배송 요청사항</td>
				<td width="80%" class="m2"><input type="text" name="omsg"
					id="omsg"></td>
			</tr>
		</table>

		<div style="height: 400px; overflow: auto;">
			<h1 class="text-center mt-1 mb-5">주문상품</h1>
			<table class="table">
				<thead>
					<tr class="info text-left">
						<th>상품정보</th>
						<th>판매가</th>
						<th>수량</th>
						<th>구매가</th>
					</tr>
				</thead>
				<%-- <tbody>
			<c:forEach var="ovo" items="${orderArr}" varStatus="state">
				<tr>
					<td>
					<label> 
					<input type="checkbox" name="pnum${state.index}" id="pnum" value="${cvo.pnum_fk}">
							${cvo.pnum_fk}</label>
					</td>
					<td>
						<h4>${cvo.pname}</h4> <br> <a
						href="../prodDetail?pnum=${cvo.pnum_fk}" target="_blank"> <img
							src="../resources/product_images/${cvo.pimage1}"
							class="img-thumbnail" style="width: 140px">
					</a>
					</td>
					<td><input type="number" name="oqty" id="oqty${state.index}"
						value="${cvo.oqty}" min="1" max="50" size="3">
						<button type="button" class="btn btn-success"
							onclick="cartEdit('${cvo.cartNum}','${state.index}')">
							수정</button></td>
					<td><fmt:formatNumber value="${cvo.saleprice}"
							pattern="###,###" /> 원<br> <span class="badge badge-danger">${cvo.point}</span>POINT</td>
					<td><fmt:formatNumber value="${cvo.totalPrice}"
							pattern="###,###" /> 원<br> <span class="badge badge-danger">${cvo.totalPoint}</span>POINT</td>
					<td><a href="#" onclick="cartDel('${cvo.cartNum}')">삭제</a></td>
				</tr>
			</c:forEach>
		</tbody> --%>
			</table>
		</div>

		<div style="height: 300px; overflow: auto;">
			<h1 class="text-center mt-1 mb-5">등급할인 정보</h1>
			<table class="table">
				<tr class="info text-left">
					<th>어쩌구님의 회원 등급 :</th>
				</tr>
				<tr>
					<td width="50%" class="m1">할인율</td>
				</tr>
				<tr>
					<td width="50%" class="m2">할인된가격</td>
				</tr>
			</table>
		</div>

		<div style="height: 400px; overflow: auto;">
			<h1 class="text-center mb-5">결제수단 선택</h1>
			<input type="radio" name="paymentMethod" value="creditCard" checked>신용카드<br>
			<br> <input type="radio" name="paymentMethod"
				value="bankTransfer">무통장입금<br> <br> <input
				type="radio" name="paymentMethod" value="mobliePayment">휴대폰결제
		</div>

		<div style="height: 400px; overflow: auto;">
			<h1 class="text-center mt-1 mb-5">최종 결제정보</h1>
			<table class="table">
				<tr>
					<td width="20%" class="m1">총 상품금액</td>
					<td width="80%" class="m1">10원</td>
				</tr>
				<tr>
					<td width="20%" class="m2">할인금액</td>
					<td width="80%" class="m2">10원</td>
				</tr>
				<tr>
					<td width="20%" class="m2">최종 결제금액</td>
					<td width="80%" class="m2">10원</td>
				</tr>
			</table>
		</div>
		<div class="text-center">
			<button class="btn btn-success">결제하기</button>
		</div>
	</form>
</div>

<%@ include file="/WEB-INF/views/foot.jsp"%>