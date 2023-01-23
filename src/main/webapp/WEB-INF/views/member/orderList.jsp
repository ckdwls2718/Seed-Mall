<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>

var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
  return new bootstrap.Tooltip(tooltipTriggerEl)
})


const detailOrder = function(oidx){
	$('input[name=oidx]').val(oidx);
	odF.submit();
}

const orderEnd = function(oidx){
	$.ajax({
		type:'post',
		url:'orderEnd',
		dataType:'json',
		data:'oidx='+oidx,
		cache:false,
		success:function(res){
			//alert(res);
			if(res>0){
				location.reload();
			}
		},
		error:function(err){
			alert('err:'+err.status);
		}
	})
}
</script>
<style>
 #deliveryInfo div{
 	 margin-right:35px; 
 }
</style>
<%@ include file="/WEB-INF/views/top.jsp"%>
<div class="d-flex">
<%@ include file="/WEB-INF/views/member/mypageSidebar.jsp"%>
  <div class="container" style="text-align: center">
	<div class="row">
		<div class="col-md-12">
			<h2 class="text-center m-4" style="margin: 1em">:::주문 목록:::</h2>
			<hr>
			<div id="deliveryInfo" class="d-flex container" style="justify-content: center;">
				<div id="status0" >
					상품준비중<br>
					<img src="${myctx}/resources/img/status0.png" width="70px">
					<!-- <p>결제가 완료되어<br> 상품을 준비하는 중</p> -->
				</div>
				<div style="padding-top: 40px"><i class="fa-solid fa-ellipsis"></i></div>	
				<div id="status1" >
					배송준비중<br>
					<img src="${myctx}/resources/img/status1.png" width="70px">
					<!-- <p>상품을 <br>배송할 준비하는 중</p> -->
				</div>
				<div style="padding-top: 40px"><i class="fa-solid fa-ellipsis"></i></div>
				<div id="status2" >
					배송중<br>
					<img src="${myctx}/resources/img/status2.png" width="70px">
					<!-- <p>상품을 <br>고객님께 배송하는 중</p> -->
				</div>
				<div style="padding-top: 40px"><i class="fa-solid fa-ellipsis"></i></div>
				<div id="status3" >
					배송완료<br>
					<img src="${myctx}/resources/img/status3.png" width="70px">
					<!-- <p>고객님께 <br> 상품 배송완료</p> -->
				</div>
				<div style="padding-top: 40px"><i class="fa-solid fa-ellipsis"></i></div>
				<div id="status4" >
					구매확정<br>
					<img src="${myctx}/resources/img/status4.png" width="70px">
					<!-- <p>고객님께서 <br>상품의 주문을 확정</p> -->
				</div>
				<div></div>
				<div id="status5" >
					식물배양중<br>
					<img src="${myctx}/resources/img/status5.png" width="70px">
					<!-- <p>고객님의 식물이<br> 자라는 중</p> -->
				</div>
				<div></div>
				<div id="status6" >
					환불처리중<br>
					<img src="${myctx}/resources/img/status6.png" width="70px">
					<!-- <p>고객님의 주문을<br> 환불처리하는 중</p> -->
				</div>
				<div style="padding-top: 40px"><i class="fa-solid fa-ellipsis"></i></div>
				<div id="status7">
					환불완료<br>
					<img src="${myctx}/resources/img/status7.png" width="70px">
					<!-- <p>고객님의 주문<br> 환불 완료</p> -->
				</div>
			</div>
			<hr>
			<table class="table table-striped" id="products">
				<thead>
					<tr>
						<th>주문번호</th>
						<th>주문상품</th>
						<th>주문날짜</th>
						<th>배송상태</th>
						<th>총 주문가격</th>
						<th>상세보기</th>
					</tr>
				</thead>
				<tbody>
					<!-- ------------------------ -->
					<c:if test="${orderArr eq null or empty orderArr}">
						<tr>
							<td colspan="5">주문한 상품이 없습니다</td>
						</tr>
					</c:if>
					
					<c:if test="${orderArr ne null and not empty orderArr}">
						<form id="odF" action="order" method="post">
						<input type="hidden"  name="oidx">
						<c:forEach var="order" items="${orderArr}">
							<tr>
								<td>${order.desc_oidx}</td>
								<td>
									${order.prodList[0].pname}
									<c:if test="${fn:length(order.prodList) > 1}">외 ${fn:length(order.prodList)-1} 건 </c:if>
								</td>
								<td>${order.desc_odate}</td>
								<td>${order.statusStr}</td>
								<td><fmt:formatNumber pattern="###,###,###" value="${order.desc_oTotalPrice}"/>원</td>
								<td>
									<button class="btn btn-outline-danger" type="button" onclick="detailOrder('${order.desc_oidx}')" >상세보기</button>
									<c:if test="${order.deliveryState eq 3}">
									<button class="btn btn-outline-success" type="button" onclick="orderEnd('${order.desc_oidx}')" >구매확정</button>
									</c:if>
								</td>
								
							</tr>
						</c:forEach>
						</form>
					</c:if>
					
					<!-- ------------------------ -->
				</tbody>
			</table>		
		</div>
	</div>
</div>
</div>
<%@ include file="/WEB-INF/views/foot.jsp"%>