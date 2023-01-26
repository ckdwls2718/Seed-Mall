<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/addressapi.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<%@ include file="/WEB-INF/views/top.jsp"%>
<div class="d-flex">
	<%@ include file="/WEB-INF/views/admin/adminPageSidebar.jsp"%>
	<div class="container mt-4" style="width: 1200px">
		<div>
			<table class="table table-condensed">
				<tr>
					<td width="20%" class="m1">받는분</td>
					<td width="80%" class="m2">${order.omname}</td>
				</tr>
				<tr>
					<td width="20%" class="m1">연락처</td>
					<td width="80%" class="m2">${order.omhp1} -
						${order.omhp2} - ${order.omhp3}</td>
				</tr>
				<tr>
					<td width="20%" class="m1">우편번호</td>
					<td width="80%" class="m2">${order.ompost}</td>
				</tr>
				<tr>
					<td width="20" class="m1">주소</td>
					<td width="80%" class="m2">${order.omaddr1},
						${order.omaddr2}</td>
				</tr>
				<tr>
					<td width="20%" class="m1">배송 요청사항</td>
					<td width="80%" class="m3">${order.ocomment}</td>
				</tr>
			</table>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/foot.jsp"%>