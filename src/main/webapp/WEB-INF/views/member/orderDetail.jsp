<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/top.jsp"%>
<script>
$(function(){
	let status = ${order.deliveryState};
	//alert(status);
	let src = $('#status'+status+' img').attr('src');
	//alert(src);
	src = src.replace('_black','');
	//alert(src);
	$('#status'+status+' img').attr('src',src);
})
const reviewForm = function(oidx,pidx){
	$('input[name=oidx]').val(oidx);
	$('input[name=pidx]').val(pidx);
	goReviewF.submit();
}

const orderCancellation = function(oidx) {
	$('input[name=desc_oidx]').val(oidx);
	$('input[name=deliveryState]').val(6);
	alert('주문 취소가 요청되었습니다')
	
	prodF.submit();
}
</script>
<style>
	#deliveryInfo div{
 	 margin-right:35px; 
 }
 td{
 	vertical-align: middle;
 }
</style>

<div class="d-flex">
<%@ include file="/WEB-INF/views/member/mypageSidebar.jsp"%>
<div class="container" style="height: 1500px; overflow: y:hidden;">
	<h1 class="text-center mt-5 mb-5">주문 명세서</h1>
		<hr>
			<div id="deliveryInfo" class="d-flex container" style="justify-content: center;">
				<div id="status0" >
					상품준비중<br>
					<img src="${myctx}/resources/img/status0_black.png" width="70px">
					<!-- <p>결제가 완료되어<br> 상품을 준비하는 중</p> -->
				</div>
				<div style="padding-top: 40px"><i class="fa-solid fa-ellipsis"></i></div>	
				<div id="status1" >
					배송준비중<br>
					<img src="${myctx}/resources/img/status1_black.png" width="70px">
					<!-- <p>상품을 <br>배송할 준비하는 중</p> -->
				</div>
				<div style="padding-top: 40px"><i class="fa-solid fa-ellipsis"></i></div>
				<div id="status2" >
					배송중<br>
					<img src="${myctx}/resources/img/status2_black.png" width="70px">
					<!-- <p>상품을 <br>고객님께 배송하는 중</p> -->
				</div>
				<div style="padding-top: 40px"><i class="fa-solid fa-ellipsis"></i></div>
				<div id="status3" >
					배송완료<br>
					<img src="${myctx}/resources/img/status3_black.png" width="70px">
					<!-- <p>고객님께 <br> 상품 배송완료</p> -->
				</div>
				<div style="padding-top: 40px"><i class="fa-solid fa-ellipsis"></i></div>
				<div id="status4" >
					구매확정<br>
					<img src="${myctx}/resources/img/status4_black.png" width="70px">
					<!-- <p>고객님께서 <br>상품의 주문을 확정</p> -->
				</div>
				<div></div>
				<div id="status5" >
					식물배양중<br>
					<img src="${myctx}/resources/img/status5_black.png" width="70px">
					<!-- <p>고객님의 식물이<br> 자라는 중</p> -->
				</div>
				<div></div>
				<div id="status6" >
					환불처리중<br>
					<img src="${myctx}/resources/img/status6_black.png" width="70px">
					<!-- <p>고객님의 주문을<br> 환불처리하는 중</p> -->
				</div>
				<div style="padding-top: 40px"><i class="fa-solid fa-ellipsis"></i></div>
				<div id="status7">
					환불완료<br>
					<img src="${myctx}/resources/img/status7_black.png" width="70px">
					<!-- <p>고객님의 주문<br> 환불 완료</p> -->
				</div>
			</div>
			<hr>

	<form id="prodF" action="orderCancel" method="post">
		<input type="hidden" name="deliveryState">
		<input type="hidden" name="desc_oidx">
		<table class="table">
			<tr>
				<th colspan="2"><h2>주문 내역</h2></th>
			</tr>
			<tr>
				<td width="20%" class="m1">주문번호</td>
				<td width="80%" class="m2">${order.desc_oidx}</td>
			</tr>
			<tr>
				<td width="20%" class="m1">주문고유번호</td>
				<td width="80%" class="m2">${order.merchant_uid}</td>
			</tr>
			<tr>
				<td width="20%" class="m1">총 결제금액</td>
				<td width="80%" class="m2"><fmt:formatNumber value="${order.desc_oTotalPrice}" pattern="###,###,###" />원</td>
			</tr>
			<tr>
				<td width="20%" class="m1">지불형태</td>
				<td width="80%" class="m2">${order.payStr}</td>
			</tr>
			<tr>
				<td width="20%" class="m1">받는분</td>
				<td width="80%" class="m2">${orderMember.omname}</td>
			</tr>
			<tr>
				<td width="20%" class="m1">연락처</td>
				<td width="80%" class="m2">${orderMember.omhp1} - ${orderMember.omhp2} - ${orderMember.omhp3}</td>
			</tr>
			<tr>
				<td width="20%" class="m1">우편번호</td>
				<td width="80%" class="m2">${orderMember.ompost}</td>
			</tr>
			<tr>
				<td width="20" class="m1">주소</td>
				<td width="80%" class="m2">${orderMember.omaddr1} ${orderMember.omaddr2}
				</td>
			</tr>
			<tr>
				<td width="20%" class="m1">배송 요청사항</td>
				<td width="80%" class="m3">${order.ocomment}</td>
			</tr>
		</table>
		<hr size="10px" style="color: maroon;">
		<table class="table">
			<tr>
				<th colspan="5"><h2>주문 상품 내역</h2></th>
			</tr>
			<tr>
				<th>상품이름</th>
				<th>구매가격</th>
				<th>구매수량</th>
				<th>포인트</th>
				<th>총 가격</th>
			</tr>

			<!-- 상품 반복문 -->
			<c:forEach var="product" items="${orderProduct}">

			<tr bgcolor="lightgreen">
				<td><a href="${myctx}/prod/${product.pidx}" class="btn btn-default">${product.pname}</a></td>
				<td><fmt:formatNumber pattern="###,###,###" value="${product.osalePrice}"/>원</td>
				<td>${product.oqty}</td>
				<td><fmt:formatNumber pattern="###,###,###" value="${product.opoint}"/>P</td>
				<td><fmt:formatNumber pattern="###,###,###" value="${product.osalePrice*product.oqty}"/>원</td>
				<c:if test="${order.deliveryState eq 4}">
				<td><button type="button" onclick="reviewForm('${product.oidx}','${product.pidx}')">리뷰 작성</button></td>
				</c:if>
			</tr>
			</c:forEach>
			<!-- 결제, 배송비, 총가격, 등등 상세정보 출력 -->
			<tr>
				<th colspan="3">합계 포인트</th>
				<td><fmt:formatNumber pattern="###,###,###" value="${order.gradePoint}"/>P</td>
				<td></td>
			</tr>
			<tr>
				<th colspan="4">총 상품 가격</th>
				<td><fmt:formatNumber pattern="###,###,###" value="${order.desc_oTotalPrice-4000}"/>원 + 배송비(4,000원)</td>
			</tr>
			<tr>
				<th colspan="4">합계 가격</th>
				<td><fmt:formatNumber pattern="###,###,###" value="${order.desc_oTotalPrice}"/>원</td>
			</tr>
		</table>
		<hr size="10px" style="color: maroon;">
		<div class="text-center">
			<button class="btn btn-success" type="button" onclick="javascript:history.back()">뒤로가기</button>

			<c:if test="${order.deliveryState ne 4}">
			<button class="btn btn-danger" type="button" onclick="orderCancellation('${order.desc_oidx}')">주문취소</button> 
			</c:if>
		</div>
	</form>
</div>
</div>
<form id="goReviewF" action="../review" method="post">
<input type="hidden" name="oidx">
<input type="hidden" name="pidx">
</form>
<%@ include file="/WEB-INF/views/foot.jsp"%>