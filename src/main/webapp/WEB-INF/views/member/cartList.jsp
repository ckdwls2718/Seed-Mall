<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/top.jsp"%>

<script>
const edit = function(cidx){
	// ajax 요청으로 수정 요청 보내기
}

const remove = function(cidx){
	// ajax 요청으로 삭제 요청 보내기
}

</script>

<div class="container" style="text-align: center">
	<div class="row">
		<div class="col-md-12">
			<h2 class="text-center m-4" style="margin: 1em">:::장바구니 목록:::</h2>
			<form action="${myctx}/user/order">
			<table class="table table-striped" id="products">
				<thead>
					<tr>
						<th>상품번호</th>
						<th>카테고리</th>
						<th data-sort="string">상품명</th>
						<th>이미지</th>
						<th data-sort="string">가 격</th>
						<th>수 량</th>
						<th>총 가격</th>
						<th>수정|삭제</th>
					</tr>
				</thead>
				<tbody>
					<!-- ------------------------ -->
					<c:if test="${cartArr eq null or empty cartArr}">
						<tr>
							<td colspan="6">장바구니에 담긴 상품이 없습니다</td>
						</tr>
					</c:if>
					
					<c:if test="${cartArr ne null and not empty cartArr}">
						<c:forEach var="cart" items="${cartArr}" varStatus="status">
							<tr>
								<td><input type="checkbox" name="cidx" value="${cart.cart_idx}"> ${cart.product.pidx}</td>
								<td>${cart.product.upCg_name}>${cart.product.downCg_name}</td>
								<td>${cart.product.pname}</td>
								
								<td width="15%"><a href="#" target="_blank"> 
								<img src="${myctx}/resources/product_images/${cart.product.pimageList[0].pimage}"
									style="width: 90%; margin: auto" class="img-fluid"></a>
								</td>
								
								<td><del>
										정 가:
										<fmt:formatNumber value="${cart.product.price}" pattern="###,###" />
										원
									</del> <br> <b class="text-primary">판매가 : <fmt:formatNumber
											value="${cart.product.psaleprice}" pattern="###,###" /> 원
								</b><br> <span class="badge bg-danger">${cart.product.percent}
										%할인</span></td>
								<td><input type="number" value="${cart.pqty}"></td>
								<td><fmt:formatNumber value="${cart.ctotalprice}" pattern="###,###,### 원"/></td> 
								<td><a href="javascript:edit('${cart.cart_idx}')">수정</a> | <a
									href="#" onclick="remove('${cart.cart_idx}')">삭제</a></td>
							</tr>
						</c:forEach>
					</c:if>
					<!-- ------------------------ -->
				</tbody>
			</table>
			<div class="text-right" style="text-align: right" id="cartTotalPrice">장바구니 총 가격 : <fmt:formatNumber value="${cartTotalPrice}" pattern="###,###,### 원"/><br>
				<button class="m-3 btn btn-outline-info btn-lg">주문하기</button>
			</div>
			
			</form>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/foot.jsp"%>