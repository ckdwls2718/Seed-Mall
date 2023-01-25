<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>

<%@ include file="/WEB-INF/views/top.jsp"%>
<script>
	function updateDeliveryState(oidx) {
		$('input[name=desc_oidx]').val(oidx);
		let selectVal = $('#select' + oidx).val();
		$('input[name=deliveryState]').val(selectVal);

		omfrm.submit();
	}
</script>
<div class="d-flex">
	<%@ include file="/WEB-INF/views/admin/adminPageSidebar.jsp"%>
	<form name="omfrm" id="omfrm" action="deliveryStatus" method="post">
		<input type="hidden" name="desc_oidx"> <input type="hidden"
			name="deliveryState">
		<div class="container" style="width: 1200px">
			<div>
				<table class="table table-condensed">
					<thead>
						<tr>
							<th>주문개요번호</th>
							<th>주문상품</th>
							<th>주문날짜</th>
							<th>총 주문가격</th>
							<th>주문상태</th>
							<th>배송상태 설정</th>
							<th>배송상태 설정완료</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${orderArr eq null or empty orderArr}">
							<tr>
								<td colspan="7"><b>데이터가 없습니다.</b></td>
							</tr>
						</c:if>
						<c:if test="${orderArr ne null and not empty orderArr}">
							<c:forEach var="order" items="${orderArr}">
								<tr>
									<td>${order.desc_oidx}</td>
									<td>${order.prodList[0].pname} <c:if
											test="${fn:length(order.prodList) > 1}">외 ${fn:length(order.prodList)-1} 건 </c:if>
									</td>
									<td>${order.desc_odate}</td>
									<td><fmt:formatNumber value="${order.desc_oTotalPrice}"
											pattern="###,###" /> 원</td>
									<td>${order.statusStr}</td>
									<td><select id="select${order.desc_oidx}">
											<option value="">::배송상태 설정::</option>
											<option value="0">상품준비중</option>
											<option value="1">배송준비중</option>
											<option value="2">배송중</option>
											<option value="3">배송완료</option>
											<option value="4">구매확정</option>
											<option value="5">식물배양중</option>
											<option value="6">환불처리중</option>
											<option value="7">환불완료</option>
									</select></td>
									<td><button type="button" class="btn btn-success"
											onclick="updateDeliveryState('${order.desc_oidx}')">설정
											완료</button></td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="9" class="text-center">${pageNavi}</td>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
	</form>
</div>
<%@ include file="/WEB-INF/views/foot.jsp"%>