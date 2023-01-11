<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
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
<%@ include file="/WEB-INF/views/top.jsp"%>
<div class="d-flex">
<%@ include file="/WEB-INF/views/member/mypageSidebar.jsp"%>
  <div class="container" style="text-align: center">
	<div class="row">
		<div class="col-md-12">
			<h2 class="text-center m-4" style="margin: 1em">:::주문 목록:::</h2>
			<table class="table table-striped" id="products">
				<thead>
					<tr>
						<th>주문번호</th>
						<th>주문날짜</th>
						<th>배송상태</th>
						<th>주문가격</th>
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
								<td>${order.desc_odate}</td>
								<td>${order.statusStr}</td>
								<td>${order.desc_oTotalPrice}</td>
								<td>
									<button class="btn btn-outline-danger" type="button" onclick="detailOrder('${order.desc_oidx}')" >상세보기</button>
									<c:if test="${order.delivaryState eq 3}">
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