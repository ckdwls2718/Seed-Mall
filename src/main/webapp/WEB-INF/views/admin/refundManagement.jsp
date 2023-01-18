<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/top.jsp"%>

<script>
	function refundEdit(oidx, i) {
		let status = $('#deliveryState' + i + " option:selected").val();
		
		$('#desc_oidx').val(oidx);
		$('#deliveryState').val(status);

		$('#oefrm').prop('action', 'refundEdit');
		alert('수정이 완료되었습니다');
		$('#oefrm').submit();
	}
</script>
<div class="d-flex">
	<%@ include file="/WEB-INF/views/admin/adminPageSidebar.jsp"%>
	<div class="container">
		<div>
			<table class="table table-condensed">
				<thead>
					<tr class="table-success">
						<th>주문번호</th>
						<th>회원번호</th>
						<th>주문상태</th>
						<th>주문날짜</th>
						<th>지불형태</th>
						<th>지불금액</th>
						<th></th>
						<th>수정</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="order" items="${orderArr}" varStatus="st">
						<tr>
							<td>${order.desc_oidx}</td>
							<td>${order.midx}</td>
							<td>${order.statusStr}</td>
							<td>${order.desc_odate}</td>
							<td><c:if test="${order.payment eq 1}">
									<c:out value="신용카드"></c:out>
								</c:if> ${order.payStr} <c:if test="${order.payment eq 2}">
									<c:out value="무통장입금"></c:out>
								</c:if> ${order.payStr} <c:if test="${order.payment eq 3}">
									<c:out value="휴대폰결제"></c:out>
								</c:if></td>
							<td>${order.desc_oTotalPrice}</td>
							<td><select id="deliveryState${st.index}" name="deliveryState"
								style="padding: 1px;">
									<option value="6"
										<c:if test="${order.deliveryState eq 6}">selected</c:if>>환불처리중</option>
									<option value="7"
										<c:if test="${order.deliveryState eq 7}">selected</c:if>>환불완료</option>
							</select></td>
							<td><a href="#"
								onclick="refundEdit('${order.desc_oidx}','${st.index}')">수정</a></td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="9" class="text-center">${pageNavi}</td>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>
</div>
<!-- 수정 폼  -->
<form name="oefrm" id="oefrm" action="refundEdit" method="post">
	<input type="hidden" name="desc_oidx" id="desc_oidx"> <input type="hidden"
		name="deliveryState" id="deliveryState">
</form>
<%@ include file="/WEB-INF/views/foot.jsp"%>