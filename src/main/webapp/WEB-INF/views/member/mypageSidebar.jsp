<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="d-flex flex-column flex-shrink-0 p-3 bg-light" style="width: 230px;" >
	<a href="#" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none"> <svg class="bi pe-none me-2" width="40" height="32">
			<use xlink:href="#bootstrap"></use></svg> <span class="fs-4" style="font-weight: 500;">마이페이지</span>
	</a>
	<hr>
	<ul class="nav nav-pills flex-column mb-auto">
		<li><a href="${myctx}/user/mypage" class="nav-link link-dark"> <svg class="bi pe-none me-2" width="16" height="16">
					<use xlink:href="#people-circle"></use></svg> 내 정보
		</a></li>
		<li class="nav-item"><a href="${myctx}/user/mypage/orderList" class="nav-link link-dark"> <svg class="bi pe-none me-2" width="16" height="16">
					<use xlink:href="#home"></use></svg> 주문 내역
		</a></li>
		<li><a href="${myctx}/user/mypage/plantList" class="nav-link link-dark"> <svg class="bi pe-none me-2" width="16" height="16">
					<use xlink:href="#speedometer2"></use></svg> 식물 관리
		</a></li>
		<li><a href="#" class="nav-link link-dark"> <svg class="bi pe-none me-2" width="16" height="16">
					<use xlink:href="#table"></use></svg> 내가 쓴 리뷰
		</a></li>
		<li><a href="#" class="nav-link link-dark"> <svg class="bi pe-none me-2" width="16" height="16">
					<use xlink:href="#grid"></use></svg> 내가 쓴 글
		</a></li>
		<li><a href="${myctx}/user/mypage/QNA" class="nav-link link-dark"> <svg class="bi pe-none me-2" width="16" height="16">
					<use xlink:href="#grid"></use></svg> 내가 쓴 문의글
		</a></li>
	</ul>
	<hr>
</div>