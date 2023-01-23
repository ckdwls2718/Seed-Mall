<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/top.jsp"%>
<style>
button {
	filter: invert(100%);
}
</style>
<header>
	<div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active" style="text-align: center;">
				<img src="./assets/template1.jpg" class="" alt="..." style="height: 500px; width: auto;">
			</div>
			<div class="carousel-item" style="text-align: center;">
				<img src="./assets/template2.jpg" class="" alt="..." style="height: 500px; width: auto;">
			</div>
			<div class="carousel-item" style="text-align: center;">
				<img src="./assets/template3.jpg" class="" alt="..." style="height: 500px; width: auto;">
			</div>
		</div>

		<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
		</button>
		
		<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="visually-hidden">Next</span>
		</button>
	  </div>

</header>
<!-- Section-->
<section class="py-5">
	<div class="container px-4 px-lg-5 mt-5 ">
	<div><img src="${myctx}/resources/img/top5.png" ><hr></div>
		<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-5 justify-content-center">
		<c:forEach var="prod" items="${prodArr}" varStatus="status">
			<div class="col mb-5 text-center">
				<i class="fa-solid fa-${status.count}">위</i>
				<div class="card h-100">
					<!-- Product image-->
					<img class="card-img-top" src="${myctx}/resources/product_images/${prod.pimageList[0].pimage}" />
					<!-- Product details-->
					<div class="card-body p-4">
						<div class="text-center">
							<!-- Product name-->
							<h5 class="fw-bolder">${prod.pname}</h5>
							<!-- Product price-->
							<fmt:formatNumber value="${prod.psaleprice}" pattern="###,###"/>원 
						</div>
					</div>
					<!-- Product actions-->
					<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
						<div class="text-center"><a class="btn btn-outline-dark mt-auto" href="${myctx}/prod/${prod.pidx}">상품구매하기</a></div>
					</div>
				</div>
			</div>
		</c:forEach>
		</div>
	</div>
</section>
<%@ include file="/WEB-INF/views/foot.jsp"%>