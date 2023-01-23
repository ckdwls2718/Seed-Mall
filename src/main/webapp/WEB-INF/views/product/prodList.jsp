<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/top.jsp"%>
<!-- <link href='https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css' rel='stylesheet'> -->
<!-- <link href='https://use.fontawesome.com/releases/v5.8.1/css/all.css' rel='stylesheet'> -->
<!-- <script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js'></script> -->
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;800&display=swap')
	;

@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);

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

.list-group-item.active {
	background-color: #dee2e6;
	border-color: #adb5bd;
}

.list-group-item {
	position: relative;
	display: block;
	padding: 0.3rem .5rem;
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
/* 설명 */
.tip {
	position: relative;
	display: #555;
}

.tip .tiptext {
	visibility: hidden; /* 이벤트가 없으면 툴팁 영역을 숨김 */
	/*  width: 120px;      */
	width: 350px; /* 툴팁 영역의 넓이를 설정 */
	background-color: #555;
	color: #fff;
	text-align: center;
	border-radius: 6px;
	padding: 5px 0;
	position: absolute; /* 절대 위치를 사용 */
	z-index: 1;
	opacity: 0;
	transition: opacity 0.3s;
}

.tip:hover .tiptext {
	visibility: visible;
	opacity: 1; /* hover 이벤트 발생시 영역을 보여줌 */
	color: #d1d1d1;
}

.tip .tiptext::after {
	content: " "; /* 정사각형 영역 사용 */
	position: absolute; /* 절대 위치 사용 */
	border-style: solid;
	border-width: 5px; /* 테두리 넓이를 5px 로 설정 */
}

.tip .tip-bottom {
	width: 350px;
	top: 150%;
	right: 0;
	margin-left: -60px; /* 말풍선 위치*/
}

.tip .tip-bottom::after {
	bottom: 100%; /* 사각형 영역이 중앙에 오도록 위치 */
	right: 15%; /* 오른쪽에서 15% 위치에 오도록 위치 */
	margin-left: -5px;
	/* 사각형의 테두리에서 아래만 노출 */
	border-color: transparent transparent #555 transparent;
}

.tip {
	text-decoration: underline;
	text-underline-position: under;
}

h2, h4 {
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 700;
	color: #39b559;
}
/* -------------------------------------------- */
a {
	text-decoration: none;
	color: #404040;
}

.wrap { /*  전체 메인메뉴 영역 */
	background: #98e0ad;
	height: 50px;
}

.menu1>div { /*  메인메뉴 사이즈 초급, 중급, 고급 */
	float: left;
	width: 130px;
	height: 50px;
	line-height: 50px;
	text-align: center;
	position: relative;
	font-weight: 600;
}

.menu1>div:first-child { /*  메인메뉴 사이즈 초급, 중급, 고급 */
	margin-left: 7.6em;
}

.menu1>div:hover .sub {
	display: block;
	color: black;
	font-weight: 600;
}

.menu1>div a { /*  메인메뉴 */
	display: block;
	font-weight: 500;
	font-size: 15px;
	color: #0000008c;
}

.menu1>div a:hover { /*  메인메뉴 오버 백그라운드컬러 */
	background: #e2e4e6;
	color: #1e1e25;
	font-weight: 600;
	font-size: 16px;
}

.menu1 .sub { /* 드롭박스 사이즈 카테고리*/
	position: absolute;
	top: 50px;
	width: 130px;
	display: none;
	z-index: 1;
}

.menu1 .sub div { /* 서브메뉴 배경 */
	background: none;
	border: 0;
}

.menu1 .sub div a { /* 서브메뉴 배경 */
	background: #f2f2f5;
	font-size: 12px;
}

.menu1 .sub div a:hover { /* 서브메뉴 오버 백그라운드컬러  */
	background: #93939f;
	font-size: 12px;
	font-weight: 700;
}
</style>

<script type='text/javascript'>
	const changeSort = function(sort) {
		const urlParams = new URL(location.href).searchParams;

		const keyword = urlParams.get('findKeyword');
		const upcg = urlParams.get('upcg');
		const downcg = urlParams.get('downcg');

		if (keyword) {
			sortF.findKeyword.value = keyword;
		}
		if (upcg) {
			sortF.upcg.value = upcg;
		}
		if (downcg) {
			sortF.downcg.value = downcg;
		}
		//alert(keyword);
		sortF.submit();
	}

	// html dom 이 다 로딩된 후 실행된다.
	$(document).ready(function() {
		// memu 클래스 바로 하위에 있는 a 태그를 클릭했을때
		$(".menu>a").click(function() {
			// 현재 클릭한 태그가 a 이기 때문에
			// a 옆의 태그중 ul 태그에 hide 클래스 태그를 넣던지 빼던지 한다.
			$(this).next("div").toggleClass("hide");
		});
	});
</script>

<body oncontextmenu='return false' class='snippet-body'>
	<div class="container">
		<div class="main">
			<!-- 전체 메인메뉴 영역 -->
			<div class="menu1" style="">
				<!-- 메인 메뉴영역 넓이 -->
				<c:forEach var="k" begin="1" end="4">
					<c:forEach var="upcategory" items="${upcategory}">
						<c:if test="${upcategory.upCg_code eq k }">
							<div class="menu2">
								<a href="#">${upcategory.upCg_name}</a>
								<div class="sub">
									<!-- 드롭박스  -->
									<div class="list-group-item <c:if test='${paging.upcg eq k and empty paging.downcg }'>active</c:if>">
										<a class="btn btn-default" href="${myctx}/prod?upcg=${k}">전체보기</a>
									</div>
									<c:forEach var="downcategory" items="${downcategory}">
										<c:if test="${downcategory.upCg_code eq k }">
											<div class="list-group-item <c:if test='${downcategory.upCg_code eq paging.upcg and downcategory.downCg_code eq paging.downcg}'>active</c:if>">
												<a class="btn btn-default" href="${myctx}/prod?upcg=${downcategory.upCg_code}&downcg=${downcategory.downCg_code}"> ${downcategory.downCg_name} </a>
											</div>
										</c:if>
									</c:forEach>

								</div>
							</div>
						</c:if>
					</c:forEach>
				</c:forEach>
			</div>
		</div>
		<div style="height: 50px; padding-top: 6em;"></div>
		<!-- 메뉴 카테고리 -->
		<div>
			<c:forEach var="upcategory" items="${upcategory}">
				<c:if test='${upcategory.upCg_code eq paging.upcg}'>
					<h4 style="text-align: center;">- ${upcategory.upCg_name} -</h4>
				</c:if>
			</c:forEach>
			<c:forEach var="downcategory" items="${downcategory}">
				<c:if test='${downcategory.upCg_code eq paging.upcg and downcategory.downCg_code eq paging.downcg}'>
					<h2 style="text-align: center; color: #39b559; padding: 0px 0px 80px;">${downcategory.downCg_name}</h2>
				</c:if>
			</c:forEach>
		</div>
		<div id="upCategory" class='container row'>
			<!-- 검색 결과 출력-->
			<div style="text-align: center; font-size: 25px;">
				<c:if test="${not empty paging.findKeyword}">
					<b>${paging.findKeyword}</b> 로 검색한 결과
				</c:if>
			</div>
		</div>
		<br>
		<div style="height: 50px;"></div>
		<!-- 설명 -->
		<div style="margin-bottom: 5px;">
			<c:forEach var="cg_detail" items="${cgdetail}">
				<c:if test='${cg_detail.downCg_code eq paging.downcg}'>
					<div class="tip" style="text-align: right; display: inline-block; float: right; font-weight: 500; color: #00000082">${cg_detail.comment_name}
						<span class="tiptext tip-bottom">${cg_detail.comments}</span>
					</div>
				</c:if>
			</c:forEach>
		</div>
		
			<!-- 분류 카테고리  -->
			<div class="row">
				<form name="sortF" id="sortF" style="padding: 0; margin: 6px 0px; float: right;">
				<input type="hidden" name="findKeyword"> <input type="hidden" name="upcg"> <input type="hidden" name="downcg">
				<select class="form-select" style="width: 124px; margin-left: auto;" name="sort" onchange="changeSort(this.value)">
					<option value="1" <c:if test="${paging.sort eq 1}">selected</c:if>>최신순</option>
					<option value="2" <c:if test="${paging.sort eq 2}">selected</c:if>>추천순</option>
					<option value="3" <c:if test="${paging.sort eq 3}">selected</c:if>>높은가격순</option>
					<option value="4" <c:if test="${paging.sort eq 4}">selected</c:if>>낮은가격순</option>
				</select>
			</form>
			</div>
		<!-- 정렬 방식 -->
		<div class="row ml-3 mb-3 mr-0" style="display: inline;">
				<form name="searchF" id="searchF" class="d-flex" role="search">
					<!-- 상품 카운팅 -->
					<span style="margin-left: 2em;">총 <b>${paging.totalCount}</b>개의 상품
					
					<!-- 서치바 -->
					</span> <input name="findKeyword" class="form-control me-2" type="search" placeholder="검색어를 입력하세요" aria-label="Search" style="width: 25%; margin-left: auto">
					<button class="btn btn-outline-success" type="submit">검색</button>
				</form>
		
		
		
			
		</div>
		<!-- 식물 목록 출력 -->
		<div class="row">
			<c:if test="${prodArr eq null or empty prodArr}">
				<h1>상품이 없습니다</h1>
			</c:if>
			<c:forEach var="prod" items="${prodArr}">
				<div class="col-lg-3 col-sm-6 d-flex flex-column align-items-center justify-content-center product-item my-3">
					<div class="product">
						<a href="prod/${prod.pidx}"><img src="${myctx}/resources/product_images/${prod.pimageList[0].pimage}" alt=""> </a>
						<ul class="d-flex align-items-center justify-content-center list-unstyled icons">
							<li class="icon"><span class="fas fa-expand-arrows-alt"></span></li>
							<li class="icon mx-3"><span class="far fa-heart"></span></li>
							<li class="icon"><span class="fas fa-shopping-bag"></span></li>
						</ul>
					</div>
					<div class="tag ${prod.pspec}">${prod.pspec}</div>
					<div class="title pt-4 pb-1">
						<h5>${prod.pname}</h5>
						<span class="badge bg-danger">${prod.percent}%할인</span>
					</div>
					<!-- <div class="d-flex align-content-center justify-content-center">
						별점
						<span class="fas fa-star"></span> <span class="fas fa-star"></span>
						<span class="fas fa-star"></span> <span class="fas fa-star"></span>
						<span class="fas fa-star"></span>
					</div> -->
					<div class="price">
						<del>
							<small style="color: gray;"><fmt:formatNumber value="${prod.price}" pattern="###,###,### 원" /></small>
						</del>
						<b><fmt:formatNumber value="${prod.psaleprice}" pattern="###,###,### 원" /></b>
					</div>
				</div>
			</c:forEach>
		</div>
		<!-- 페이지 기능  -->
		<div id="pageNavi">${pageNavi}</div>
	</div>
</body>
</html>

<%@ include file="/WEB-INF/views/foot.jsp"%>