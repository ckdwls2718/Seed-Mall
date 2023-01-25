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
	
	<div class="container d-flex">
	
	<div class="container px-4 px-lg-5 mt-5">
	<div><img src="${myctx}/resources/img/comtop5.png" ><hr></div>
	<table class="table table-condensed " style="background:#f7f9fa; text-align: center; border: 1px solid #cccccc;">
		<thead>
			<tr>
				<th style="width: 7%"></th>
				<th style="width: 59%">제목</th>
				<th style="width: 16%">작성자</th>
			</tr>
		</thead>
		<tbody id="boardBody">
			<c:if test="${comArr eq null or empty comArr}">
				<tr>
					<td colspan="5">
						<b>데이터가 없습니다.</b>
					</td>
				</tr>
			</c:if>
			<c:if test="${comArr ne null and not empty comArr}">
				<c:forEach var="board" items="${comArr}" varStatus="status">
					<tr>
						<td>
							<c:out value="${status.count}위" />
						</td>
						<td>
							<a class="btn btn-default" href="${myctx}/boardGet?cidx=${board.cidx}">${board.ctitle}</a>
						</td>
						<td>
							<c:out value="${board.email}" />
						</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
	</div>
	
	<div class="container px-4 px-lg-5 mt-5" style="width: 70%">
	<div><img src="${myctx}/resources/img/retop3.png" ><hr></div>
	<table class="table table-striped" id="products">
					
					<tbody>
						<!-- ------------------------ -->
						<c:if test="${reviewArr eq null or empty reviewArr}">
							<tr>
								<td colspan="1">작성한 리뷰가 없습니다</td>
							</tr>
						</c:if>

						<c:if test="${reviewArr ne null and not empty reviewArr}">
							<form id="reF" action="review" method="post">
								<input type="hidden" name="ridx">
								
								<c:forEach var="review" items="${reviewArr}" varStatus="status">	
										<tr>
										<td><a href="${myctx}/prod/${review.pidx}" style="color: black; text-decoration: none;">
										<div class="mb-2">
											<div>
											<c:forEach begin="1" end="${review.score}"><img src="${myctx}/resources/Review_image/star.png" width="20"></c:forEach>
											<small >추천 ${review.rlikenum}</small> <span style="margin-left: auto" >${review.email}</span><br>
											</div>
											<b>${review.rtitle}</b> <small>${review.rdate}</small><br>
											${review.rcontent}
										</div>
										<div>
											<c:forEach  var="image" items="${review.boardReviewImageList}">
												<img style="width:100px" src="${myctx}/resources/Review_image/${image.rimage}">
											</c:forEach>
										</div>
										</a>
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
	
</section>
<%@ include file="/WEB-INF/views/foot.jsp"%>