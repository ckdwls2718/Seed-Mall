<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
const reviewForm = function(oidx){
	$('input[name=oidx]').val(oidx);
	goReviewF.submit();
}
</script>
<%@ include file="/WEB-INF/views/top.jsp"%>
<div class="d-flex">
<%@ include file="/WEB-INF/views/member/mypageSidebar.jsp"%>
<div class="container" style="height: 1500px; overflow: y:hidden;">
	<h1 class="text-center mt-5 mb-5">주문 명세서</h1>
	<form id="prodF" action="${myctx}" method="post">
		<table class="table">
			<tr>
				<td width="20%" class="m1">주문번호</td>
				<td width="80%" class="m2">${order.desc_oidx}</td>
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
		<table class="table">
			<tr>
				<th>상품이름</th>
				<th>구매가격</th>
				<th>구매수량</th>
				<th>포인트</th>
				<th>총 가격</th>
			</tr>
			
			<!-- 상품 반복문 -->
			<c:forEach var="product" items="${orderProduct}">
			<tr>
				<td>${product.pname}</td>
				<td>${product.osalePrice}</td>
				<td>${product.oqty}</td>
				<td>${product.opoint}</td>
				<td>${product.osalePrice*product.oqty}</td>
				<c:if test="${order.deliveryState eq '4'}">
				<td><button type="button" onclick="reviewForm('${product.oidx}')">리뷰 작성</button></td>
				</c:if>
			</tr>
			</c:forEach>
		</table>
		<!-- 결제, 배송비, 총가격, 등등 상세정보 출력 -->
		<div class="container">${order.desc_oTotalPrice-4000} + 배송비(4000) = ${order.desc_oTotalPrice}</div>
		<div class="text-center">
			<button class="btn btn-success" type="button" onclick="javascript:history.back()">뒤로가기</button>
			<c:if test="${order.deliveryState ne '4'}">
			<button class="btn btn-danger" type="button" >주문취소</button>
			</c:if>
		</div>
	</form>
</div>
</div>
<form id="goReviewF" action="../review" method="post">
<input type="hidden" name="oidx">
</form>
<%@ include file="/WEB-INF/views/foot.jsp"%>