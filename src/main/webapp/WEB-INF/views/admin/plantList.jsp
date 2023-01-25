<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<script>
	const detailPlant = function(pidx) {
		$('input[name=pidx]').val(pidx);
		pdF.submit();
	}
</script>
<%@ include file="/WEB-INF/views/top.jsp"%>

<div class="d-flex">
	<%@ include file="/WEB-INF/views/admin/adminPageSidebar.jsp"%>

	<main class="m-3" style="width: 70%">
		<section class="py-5 text-center container">
			<div class="row py-lg-5">
				<div class="col-lg-6 col-md-8 mx-auto">
					<h1 class="fw-light" >나의 소중한 식물</h1>
					<p class="lead text-muted">식물의 상태를 확인해보세요</p>
					<p>
						<a href="#" class="btn btn-primary my-2">쇼핑하러 가기</a> <a href="#" class="btn btn-secondary my-2">장바구니 가기</a>
					</p>
				</div>
			</div>
		</section>

		<div class="album py-5 bg-light">
			<div class="container">

				<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
					<c:if test="${plantArr eq null or empty plantArr}">
						<p class="lead text-muted">식물이 없습니다</p>
					</c:if>

					<c:if test="${plantArr ne null and not empty plantArr}">

						<c:forEach var="plant" items="${plantArr}">
							<div class="col">
								<div class="card shadow-sm">
									<img src="${myctx}/resources/plant_images/${plant.plantImage}">
									<div class="card-body">
										<h4 class="cart-text">${plant.nickname}</h4>
										<small class="text-muted"><b>${plant.percent}%</b></small>
										<p class="card-text">${plant.pcomment}</p>
										<div class="d-flex justify-content-between align-items-center">
											<div class="btn-group">
												<button class="btn btn-sm btn-outline-secondary" type="button" onclick="detailPlant('${plant.plant_idx}')">상세보기</button>
											</div>
											<small class="text-muted">${plant.pdate}</small>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>

					</c:if>
					<!-- --------------------- -->
				</div>
			</div>
		</div>

	</main>
</div>
<form id="pdF" action="plantManagementDetail" method="post">
	<input type="hidden" name="pidx" id="pidx">
</form>

<%@ include file="/WEB-INF/views/foot.jsp"%>