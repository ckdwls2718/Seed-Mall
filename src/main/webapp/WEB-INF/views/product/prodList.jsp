<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/top.jsp"%>
<link
	href='https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css'
	rel='stylesheet'>
<link href='https://use.fontawesome.com/releases/v5.8.1/css/all.css'
	rel='stylesheet'>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;800&display=swap')
	;

.container .product-item {
	min-height: 450px;
	border: none;
	overflow: hidden;
	position: relative;
	border-radius: 0
}

.container .product-item .product {
	width: 100%;
	height: 350px;
	position: relative;
	overflow: hidden;
	cursor: pointer
}

.container .product-item .product img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.container .product-item .product .icons .icon {
	width: 40px;
	height: 40px;
	background-color: #fff;
	border-radius: 50%;
	display: flex;
	justify-content: center;
	align-items: center;
	transition: transform 0.6s ease;
	transform: rotate(180deg);
	cursor: pointer
}

.container .product-item .product .icons .icon:hover {
	background-color: #10c775;
	color: #fff
}

.container .product-item .product .icons .icon:nth-last-of-type(3) {
	transition-delay: 0.2s
}

.container .product-item .product .icons .icon:nth-last-of-type(2) {
	transition-delay: 0.15s
}

.container .product-item .product .icons .icon:nth-last-of-type(1) {
	transition-delay: 0.1s
}

.container .product-item:hover .product .icons .icon {
	transform: translateY(-60px)
}

.container .product-item .tag {
	text-transform: uppercase;
	font-size: 0.75rem;
	font-weight: 500;
	position: absolute;
	top: 10px;
	left: 20px;
	padding: 0 0.4rem;
}

.container .product-item .title {
	font-size: 0.95rem;
	letter-spacing: 0.5px
}

.container .product-item .fa-star {
	font-size: 0.65rem;
	color: #ff0000;
}

.container .product-item .price {
	margin-top: 10px;
	margin-bottom: 10px;
	font-weight: 600;
}

.fw-800 {
	font-weight: 800;
}

.NEW {
	background-color: #208f20 !important;
	color: #fff;
}

.bg-black {
	background-color: #1f1d1d;
	color: #fff
}

.BEST {
	background-color: #bb3535;
	color: #fff
}

.HIT {
	background-color: #ffc107 !important;
	color: #fff;
}

div#upCategory button {
	
}
</style>
<script type='text/javascript' src=''></script>
<script type='text/javascript'
	src='https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js'></script>
<script type='text/javascript'
	src='https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js'></script>
</head>

<script type='text/javascript'>
	const changeSort = function(sort) {
		const urlParams = new URL(location.href).searchParams;

		const keyword = urlParams.get('findKeyword');

		if (keyword) {
			sortF.findKeyword.value = keyword;
		}

		alert(keyword);

		sortF.submit();
	}
</script>
<body oncontextmenu='return false' class='snippet-body bg-white'>
	<div class="container bg-white">
		<div id="upCategory" class='container row'>
			<div class="col-md-5">
				<button class="btn btn-outline-success" type="button"
					data-bs-toggle="collapse" data-bs-target="#multiCollapseExample1"
					aria-expanded="false" aria-controls="multiCollapseExample1">초보</button>
			</div>
			<div class="col-md-5">
				<button class="btn btn-outline-primary" type="button"
					data-bs-toggle="collapse" data-bs-target="#multiCollapseExample2"
					aria-expanded="false" aria-controls="multiCollapseExample2">중급</button>
			</div>
			<div class="col-md-2">
				<button class="btn btn-outline-danger" type="button"
					data-bs-toggle="collapse" data-bs-target="#multiCollapseExample3"
					aria-expanded="false" aria-controls="multiCollapseExample3">전문가</button>
			</div>
		</div>


		<div class="row">
			<div class="col">
				<div class="collapse multi-collapse" id="multiCollapseExample1">
					<div class="card card-body">
						<ul class="list-group list-group-flush">
							<!-- db에서 카테고리 목록 가져오기  -->
							<c:forEach var="downcategory" items="${downcategory}">
								<c:if test="${downcategory.upCg_code eq 1 }">
									<li class="list-group-item"><a class="btn btn-default"
										href="${myctx}/prod?upcg=${downcategory.upCg_code}&downcg=${downcategory.downCg_code}">${downcategory.downCg_name}</a></li>
								</c:if>
							</c:forEach>

							<!-- <li class="list-group-item"><a class="btn btn-default" href="#">관엽식물</a></li>
  			<li class="list-group-item"><a class="btn btn-default" href="#">꽃식물</a></li>
  			<li class="list-group-item"><a class="btn btn-default" href="#">난초</a></li>
  			<li class="list-group-item"><a class="btn btn-default" href="#">허브</a></li>
  			<li class="list-group-item"><a class="btn btn-default" href="#">다육이</a></li> -->
						</ul>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="collapse multi-collapse" id="multiCollapseExample2">
					<div class="card card-body">
						<c:forEach var="downcategory" items="${downcategory}">
							<c:if test="${downcategory.upCg_code eq 2 }">
								<li class="list-group-item"><a class="btn btn-default"
									href="${myctx}/prod?upcg=${downcategory.upCg_code}&downcg=${downcategory.downCg_code}">${downcategory.downCg_name}</a></li>
							</c:if>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="collapse multi-collapse" id="multiCollapseExample3">
					<div class="card card-body">
						<c:forEach var="downcategory" items="${downcategory}">
							<c:if test="${downcategory.upCg_code eq 3 }">
								<li class="list-group-item"><a class="btn btn-default"
									href="${myctx}/prod?upcg=${downcategory.upCg_code}&downcg=${downcategory.downCg_code}">${downcategory.downCg_name}</a></li>
							</c:if>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>

		<!-- 정렬 방식 -->
		<div class="row mt-3 ml-3 mb-3 mr-0">
			<form name="sortF" id="sortF">
				<input type="hidden" name="findKeyword"> <select
					class="form-select" style="width: 15%; margin-left: auto"
					name="sort" onchange="changeSort(this.value)">
					<option value="1" <c:if test="${paging.sort eq 1}">selected</c:if>>최신순</option>
					<option value="2" <c:if test="${paging.sort eq 2}">selected</c:if>>평점순</option>
					<option value="3" <c:if test="${paging.sort eq 3}">selected</c:if>>높은
						가격순</option>
					<option value="4" <c:if test="${paging.sort eq 4}">selected</c:if>>낮은
						가격순</option>
				</select>
			</form>
		</div>

		<!-- 검색창 -->
		<div class="row mb-3">
			<form name="searchF" id="searchF" class="d-flex" role="search">
				<input name="findKeyword" class="form-control me-2" type="search"
					placeholder="검색어를 입력하세요" aria-label="Search"
					style="width: 25%; margin-left: auto">
				<button class="btn btn-outline-success" type="submit">검색</button>
			</form>
		</div>

		<!-- 식물 목록 출력 -->
		<div class="row">
			<c:forEach var="prod" items="${prodArr}">
				<div
					class="col-lg-3 col-sm-6 d-flex flex-column align-items-center justify-content-center product-item my-3">
					<div class="product">
						<a href="prod/${prod.pidx}"><img
							src="${myctx}/resources/product_images/${prod.pimageList[0].pimage}"
							alt=""> </a>
						<ul
							class="d-flex align-items-center justify-content-center list-unstyled icons">
							<li class="icon"><span class="fas fa-expand-arrows-alt"></span></li>
							<li class="icon mx-3"><span class="far fa-heart"></span></li>
							<li class="icon"><span class="fas fa-shopping-bag"></span></li>
						</ul>
					</div>
					<div class="tag ${prod.pspec}">${prod.pspec}</div>
					<div class="title pt-4 pb-1">${prod.pname}</div>
					<div class="d-flex align-content-center justify-content-center">
						<span class="fas fa-star"></span> <span class="fas fa-star"></span>
						<span class="fas fa-star"></span> <span class="fas fa-star"></span>
						<span class="fas fa-star"></span>
					</div>
					<div class="price">
						<fmt:formatNumber value="${prod.psaleprice}"
							pattern="###,###,### 원" />
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>
<%@ include file="/WEB-INF/views/foot.jsp"%>