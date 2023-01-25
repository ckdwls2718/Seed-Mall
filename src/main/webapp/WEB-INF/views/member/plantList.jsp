<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script>
	const detailPlant = function(pidx) {
		$('input[name=pidx]').val(pidx);
		pdF.submit();
	}
</script>
<%@ include file="/WEB-INF/views/top.jsp"%>

<div class="d-flex">
	<%@ include file="/WEB-INF/views/member/mypageSidebar.jsp"%>
	<div style="width: 900px; margin: auto;">
		<main class="m-3" style="">
			<section class="py-5 text-center container">
				<div class="row py-lg-5">
					<div class="col-lg-6 col-md-8 mx-auto">
						<h1 class="" style="font-weight: 400;">나의 소중한 식물</h1>
						<p class="lead text-muted">식물의 상태를 확인해보세요</p>
						<p>
							<a href="#" class="btn btn-primary my-2">쇼핑하기</a> <a href="#" class="btn btn-secondary my-2">장바구니</a>
						</p>
					</div>
				</div>
			</section>

			<div class="album py-5 bg-light">
				<div class="container">

					<div class="row md-3 g-3">
						<c:if test="${plantArr eq null or empty plantArr}">
							<div class="lead text-muted" style="text-align: center;">현재 식물이 없습니다</div>
						<div style="width:100%; text-align: center">
						<a href="#" class="btn btn-primary my-2">쇼핑하기</a>
						</div>
						</c:if>
					
						<!-- --------------------- -->
					</div>
				</div>
			</div>
		</main>
	</div>
	<div style="width: 230px;"></div>
</div>
<form id="pdF" action="plant" method="post">
	<input type="hidden" name="pidx" id="pidx">
</form>

<%@ include file="/WEB-INF/views/foot.jsp"%>