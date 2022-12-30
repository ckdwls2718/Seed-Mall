<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/top.jsp"%>
<style>
	a.thumbnail>img:hover{
		border:5px solid black;
	}
</style>
<script>
/* $.(function(){
	
})//---window */

const changeImage = function(idx){
	let url = $('#thumbnailImage'+idx).attr('src');
	//alert(url);
	$('#prodImage>div>img').attr('src',url);
}

const changePrice = function(qty){
	
	let price = ${prod.psaleprice};
	
	let totalPrice = qty*price;
	//alert(price);
	
	$('#priceSum').html(totalPrice);
}
</script>

<div class='container d-flex'>
	<div id="leftDetail" class="m-3" style="width: 60%">
		<div id="prodImage" style="width: 100%">
			<div class="m-3">
				<img class="img-fluid" style="width:480px;height:360px"
					src="${myctx}/resources/product_images/${prod.pimageList[0].pimage}">
			</div>
			<div class="row">
			<!-- thumnail -->
			<c:forEach var="pimage" items="${prod.pimageList}">
				<div class="col-xs col-md-2">
					<a onclick="changeImage('${pimage.image_pidx}')" class="thumbnail"> <img id="thumbnailImage${pimage.image_pidx}" class="img-fluid" style="width:100px; height:100px"
						src="${myctx}/resources/product_images/${pimage.pimage}">
					</a>
				</div>
			</c:forEach>
			</div>
		</div>
	</div>
	<div id="rightDetail" class="m-3" style="width: 40%">
		<p>${prod.upCg_name} > ${prod.downCg_name}</p>
		<!--right information-->
		<div id="prodName">
			<h2>${prod.pname}</h2>
		</div>
		<div class="starBox">
			<!-- <span><img src="/app/layout/web/images/icon_rating.png"></span> -->
			<span class="point">0.0 </span><span>후기 0</span>
		</div>
		<br>
		<div class="discountBox">
			<div class="bt20">
				<h1 id="price"><fmt:formatNumber value="${psaleprice}" pattern="###,###,### 원" /></h1>
			</div>
		</div>
		<table class="table">
			<tbody>
				<tr>
					<th>배송비</th>
					<td>4,000원 (기본배송비 적용)</td>
				</tr>
				<tr>
					<th>재고수량</th>
					<td>${prod.pqty} 개</td>
				</tr>
			</tbody>
		</table>
		<div id="optionSetList">
			<input type="number" value="1" min="1" max="99" onchange="changePrice(this.value)">
		</div>
		<div class="text-right">
			<div>주문금액</div>
			<div id="total">
				<span id="priceSum"> ${prod.psaleprice}</span> <span>원</span>
			</div>
		</div>
		<div class="halfFullButton">
			<div class="halfCell text-center">
				<button class="btn btn-outline-success btn-lg" type="button">주문하기</button>
			</div>
		</div>
	</div>
	<!--right-->
</div>


<%@ include file="/WEB-INF/views/foot.jsp"%>