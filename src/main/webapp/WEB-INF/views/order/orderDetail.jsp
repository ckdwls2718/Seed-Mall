<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript" src="./js/orderCheck.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<%@ include file="/WEB-INF/views/top.jsp"%>

<script>
//배송메시지 200자 이내로 작성하도록 처리하는 스크립트
$(document).ready(function() {
	$('#ocomment').on('keyup', function() {
		$('#ocomment_cnt').html("("+$(this).val().length+" / 200)");
		
		if($(this).val().length > 200) {
			$(this).val($(this).val().substring(0, 200));
			$('#ocomment_cnt').html("(200 / 200)");
		}
	});
});
</script>
<!-- 상품 상세페이지에서 주문페이지로 들어왔을 때 화면 -->
<div class="container" style="height: 2300px; overflow: y:hidden;">
	<h1 class="text-center mt-5 mb-5">배송지정보</h1>
	<div class="checkbox mb-3" style="text-align: left;">
		<label> <input type="checkbox" value="remember-me"> 기본
			배송지 설정
		</label>
	</div>

	<form name="frm" id="frm" action="payment" method="post"
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
				<td width="80%" class="m3"><textarea name="ocomment"
						id="ocomment" rows="5" cols="60"></textarea>
					<div id="ocomment_cnt">(0 / 200)</div> <br> <span class='ck'>*200자
						이내</span></td>
			</tr>
		</table>

		<div style="height: 400px; overflow: auto;">
			<h1 class="text-center mt-5 mb-5">주문상품</h1>
			<table class="table">
				<thead>
					<tr class="info text-left">
						<th>상품정보</th>
						<th>판매가</th>
						<th>배송비</th>
						<th>수량</th>
						<th>총액</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<h4>김상품</h4> <br> <%-- <img
							src="../resources/product_images/${prod.pimage1}"
							class="img-thumbnail" style="width: 140px"> --%>
						</td>
						<td><fmt:formatNumber value=""
								pattern="###,###" /> 원<br> <span
							class="badge badge-danger">40</span>POINT</td>
						<td>4,000원</td>
						<td>개</td>
						<td><fmt:formatNumber value=""
								pattern="###,###" /> 원</td>
					</tr>
				</tbody>
			</table>
		</div>

		<div style="height: 300px; overflow: auto;">
			<h1 class="text-center mt-5 mb-5">등급할인 정보</h1>
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
			<h1 class="text-center mt-5 mb-5">결제수단 선택</h1>
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
					<td width="80%" class="m1"><fmt:formatNumber
							value="${prod.totalPrice}" pattern="###,###" /> 원</td>
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