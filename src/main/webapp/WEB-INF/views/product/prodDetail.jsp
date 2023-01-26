<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/top.jsp"%>
<style>
a.thumbnail>img:hover {
	border: 3px solid black;
}

th {
	font-weight: 500;
}
</style>
<script>
$(function(){
	
	
})//---window 

const changeImage = function(idx){
	let url = $('#thumbnailImage'+idx).attr('src');
	
	//원본이미지 출력을 위한 처리
	url = url.replace('Thumb_','');
	
	//alert(url);
	$('#prodImage>div>img').attr('src',url);
}

const changePrice = function(qty){
	
	if(!qty || qty==0){
		$('#prodQty').attr('value',1);
	}
	
	let price = ${prod.psaleprice};
	
	let totalPrice = qty*price;
	//alert(price);
	
	$('#priceSum').html(totalPrice.toLocaleString('ko-KR'));
}

const plusQty = function(){
	
	let qty = $('#prodQty').val();
	qty = Number(qty);
	
	if(qty>=1){
		$('#minusBtn').attr('disabled',false);
	}
	
	if(qty>=${prod.pqty-1}){
		$('#plusBtn').attr('disabled',true);
	} 
	
	qty=qty+1;
	
	$('#prodQty').val(qty);
	changePrice(qty);
}

const minusQty = function(){
	
	let qty = $('#prodQty').val();
	qty = Number(qty);
	
	if(qty<=2){
		$('#minusBtn').attr('disabled',true);
	}
	
	if(qty<=${prod.pqty}){
		$('#plusBtn').removeAttr('disabled',false);
	}
	
	qty=qty-1;
	
	$('#prodQty').val(qty);
	changePrice(qty);
}

const insertCart = function(){
	
	prodF.action = "${myctx}/user/cart";
	prodF.pqty.value = $('#prodQty').val();
	
	prodF.submit();
}

const qQtyCheck = function(){
	let pqty = ${prod.pqty};
	if(pqty<=0){
		alert('재고가 없습니다.');
		return false;
	}
	return true;
}

const prodLike = function(){
	let pidx = ${prod.pidx};
	let url = "${myctx}/user/prod/like";
	
	$.ajax({
		url: url,
		type:'post',
		data:'pidx='+pidx,
		dataType:'json',
		cache:false,
		success:function(res){
			//alert(res);
			if(res>0){
				location.reload();
			}
		},
		error:function(err){
			if(err.status == 200){
				alert('로그인 후 이용해주세요');
				location.href='${myctx}/login';
				return;
			}
			alert("err:"+err.status);
		}
	})
}



</script>
<div class='container d-flex' style="width:1200px;">
	<div id="leftDetail" class="m-3" style="width: 60%;">
		<div id="prodImage" style="width: 100%;" >
			<div class="" style="margin: 1em 0;">
				<img class="img-fluid" style="width: 480px; height: 360px;" src="${myctx}/resources/product_images/${prod.pimageList[0].pimage}">
			</div>
			<div class="row">
				<!-- thumnail -->
				<c:forEach var="pimage" items="${prod.pimageList}">
					<div class="col-xs col-md-2">
						<a onclick="changeImage('${pimage.image_pidx}')" class="thumbnail"> <img id="thumbnailImage${pimage.image_pidx}" class="img-fluid" style="width: 100px; height: 100px" src="${myctx}/resources/product_images/Thumb_${pimage.pimage}">
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>

	<div id="rightDetail" class="m-3" style="width: 40%;">
		<form id="prodF" action="${myctx}/user/order" method="post" onsubmit="return qQtyCheck()">
			<p>${prod.upCg_name}> ${prod.downCg_name}</p>
			<p>조회수 ${prod.preadnum }</p>
			<!--right information-->
			<div id="prodName" class="d-flex" >
				<h2 style="margin-right:auto;">${prod.pname}</h2><button class="btn btn-danger" type="button" onclick="prodLike()">Like ${prod.plikenum}</button>
			</div>
			<div class="starBox">
				<!-- <span><img src="/app/layout/web/images/icon_rating.png"></span> -->
				<span class="point"><span class="fas fa-star" style="color: orange;"></span>${avg} </span><span>후기 ${review}개</span>
			</div>
			<br>
			<table class="table">
				<tbody>
					<tr>
						<th>상품가격</th>
						<td>
							<c:if test="${prod.price ne prod.psaleprice}">
								<del style="color: gray;">
									<fmt:formatNumber value="${prod.price}" pattern="###,###,### 원" />
								</del>
								<span class="badge bg-danger">${prod.percent}%할인</span>
								<br>
								<b><fmt:formatNumber value="${prod.psaleprice}" pattern="###,###,### 원" /></b>
								<span class="badge bg-success">${prod.ppoint}P적립</span>
							</c:if>
							<c:if test="${prod.price eq prod.psaleprice}">
								<fmt:formatNumber value="${prod.price}" pattern="###,###,### 원" />
								<b><fmt:formatNumber value="${prod.psaleprice}" pattern="###,###,### 원" /></b>
								<span class="badge bg-success">${prod.ppoint}P적립</span>
							</c:if>
							<!-- 등급할인 추가 -->
						</td>
					</tr>
					<tr>
						<th>배송비</th>
						<td>4,000원 (기본배송비 적용)</td>
					</tr>
					<tr>
						<th>재고수량</th>
						<td>${prod.pqty}개</td>
					</tr>
					<tr>
						<th>수량선택</th>
						<td class="btn-group">
							<input id="prodQty" name="oqty" type="number" value="1" min="1" max="99" onchange="changePrice(this.value)" autocomplete="off">
							<button id="plusBtn" type="button" onclick="plusQty()">▲</button>
							<button id="minusBtn" type="button" onclick="minusQty()" disabled>▼</button>
						</td>
					</tr>
					<tr>
						<th>옵션</th>
						<td>
							<div class="form-check form-switch">
								<input class="form-check-input" type="checkbox" id="growCheck" name="growCheck" value="Y"> <label class="form-check-label" for="growCheck">키워주세요</label>
							</div>
					</tr>
					<tr>
						<th>주문금액</th>
						<td>
							<div id="total">
								<span id="priceSum"><fmt:formatNumber value="${prod.psaleprice}" pattern="###,###,###" /> </span> <span>원</span>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="halfFullButton">
				<div class="halfCell text-center">
					<input type="hidden" name="pidx" value="${prod.pidx}"> <input type="hidden" name="pqty">
					<c:if test="${prod.pqty <= 0}">
						<button class="btn btn-outline-success btn-lg" type="submit" disabled>품절</button>
					</c:if>
					<c:if test="${prod.pqty > 0}">
						<button class="btn btn-outline-success btn-lg" type="submit">주문하기</button>
					</c:if>
					<button class="btn btn-outline-info btn-lg" type="button" onclick="insertCart()">장바구니</button>
				</div>
			</div>
		</form>
	</div>


</div>
<div class="container">
	<hr size="10px">
</div>
<div class="container mb-5" id="content" style="height: 500px;">
	<ul class="nav nav-tabs">
		<li class="nav-item"><a class="nav-link active" aria-current="page" href="#1" name="1">상품상세</a></li>
		<li class="nav-item"><a class="nav-link" href="#2">상품리뷰</a></li>
		<li class="nav-item"><a class="nav-link" href="#3">상품문의</a></li>
	</ul>
	<div class="m-3" >
		<table class="table" >
			<tr>
				<th width="10%">햇빛 <i class="fa-solid fa-sun"></i></th>
				<td>${prod.sun}</td>
			</tr>
			<tr>
				<th width="10%">온도 <i class="fa-solid fa-temperature-three-quarters"></i></th>
				<td>${prod.temp}</td>
			</tr>
			<tr>
				<th width="10%">토양,물관리 <i class="fa-solid fa-droplet"></i></th>
				<td>${prod.soil}</td>
			</tr>
		</table>
	</div>
	<div class="m-3">
		<p class="lead">${prod.pcontent}</p>
	</div>

</div>

<div class="container">
	<hr size="10px">
</div>
<c:import url="/review/${prod.pidx}" />
<div class="container">
	<hr size="10px">
</div>
<c:import url="/QNA/${prod.pidx}" />



<%@ include file="/WEB-INF/views/foot.jsp"%>