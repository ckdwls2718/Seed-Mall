<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>시드몰</title>
<!-- Favicon-->
<!-- Bootstrap icons-->
<!-- Core theme CSS (includes Bootstrap)-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<!-- font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<style>
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);

body, h1, h2, h3, h4, h5, h6, input, textarea, select {
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 400;
}

.navbar-expand .navbar-nav .nav-link {
	margin-right: 3.3rem;
	margin-left: 3.3rem;
	margin:;
	font-weight: 600;
}

.navbar-expand .navbar-collapse {
	display: flex;
	flex-basis: auto;
	justify-content: center;
}
</style>
<body>
	<c:set var="myctx" value="${pageContext.request.contextPath}" />
	<!-- Navigation-->
	<nav class="py-2 bg-white border-bottom">
		<div class="container d-flex flex-wrap text-end ">
			<ul class="nav me-auto">
				<%-- 	<c:if test="${loginUser.status == 9}">
					<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">관리자 도구</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="${myctx}/admin/adminPage">어드민페이지</a></li>
							<li><hr class="dropdown-divider" /></li>
							<li><a class="dropdown-item" href="${myctx}/admin/prodForm">상품 등록</a></li>
							<li><a class="dropdown-item" href="${myctx}/admin/prodList">상품 목록</a></li>
							<li><a class="dropdown-item" href="${myctx}/admin/memberList">회원 관리</a></li>
						</ul></li>
				</c:if> --%>
			</ul>
			<ul class="nav">
				<c:if test="${loginUser == null}">
					<li class="nav-item"><a href="${myctx}/login" class="nav-link link-dark px-2">로그인 </a></li>
					<li class="nav-item"><span class="nav-link link-dark px-2" style="color: silver"> |</span></li>
					<li class="nav-item"><a href="${myctx}/join" class="nav-link link-dark px-2" style="margin-right: 1em;">회원가입</a></li>
				</c:if>
			</ul>
			<c:if test="${loginUser != null}">
				<p style="padding-top: 4px; margin: 0;">${loginUser.mname}님</p>
				<div class="flex-shrink-0 dropdown" style="padding-top: 4px;">
					<a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false"> <%-- <img src="${myctx}/resources/grade_images/${loginUser.grade}.jpg" alt="mdo" width="32" height="32" class="" style="margin-top: 3px"> --%>
					</a>

					<ul class="dropdown-menu text-small shadow" data-popper-placement="bottom-end" style="position: absolute; inset: 0px 0px auto auto; margin: 0px; margin-top: 5px; transform: translate3d(0.5px, 34px, 0px);">
						<li><span class="dropdown-item" id="grade">${loginUser.grade} <img src="${myctx}/resources/grade_images/${loginUser.grade}.png" alt="mdo" width="auto" height="26px;" class=""></span></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="${myctx}/user/mypage">마이페이지</a></li>
						<!-- <li><a class="dropdown-item" href="#">설정</a></li> -->
						<c:if test="${loginUser.status == 9}">
							<li><hr class="dropdown-divider" /></li>
							<li><a class="dropdown-item" href="${myctx}/admin/adminPage">관리자페이지</a></li>
							<li><hr class="dropdown-divider" /></li>
							<li><a class="dropdown-item" href="${myctx}/admin/prodForm">상품 등록</a></li>
							<li><a class="dropdown-item" href="${myctx}/admin/prodList">상품 목록</a></li>
							<li><a class="dropdown-item" href="${myctx}/admin/memberList">회원 관리</a></li>
						</c:if>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="${myctx}/logout">로그아웃</a></li>
					</ul>
				</div>
				<a href="${myctx}/user/cart" class="btn btn-outline-dark" style="margin-left: 1em"> <img src="${myctx}/assets/cart-fill.svg"> 장바구니
				</a>
			</c:if>
		</div>
	</nav>
	<header class="py-3 mb-4 border-bottom ">

		<div class="container" style="text-align: center; width: 1224px;">
			<div style="display: inline;">
				<a href="${myctx}" class=" align-items" style="float: left"> <img src="${myctx}/assets/logo-removebg-preview.png" style="width: 70px;">
				</a>
			</div>

			<div class="align-items" style="">
				<a href="${myctx}"> <img src="${myctx}/assets/name-removebg-preview.png" style="width: 170px; margin-right: 70px;"></a>
			</div>
			<!-- <form class="col-12 col-lg-4 mb-3 mb-lg-0 " role="search">
				<input type="search" class="form-control mb-lg-0" style="margin-left: auto; margin-top: 2em; width: 80%" placeholder="검색..." aria-label="검색">
			</form> -->
		</div>
	</header>
	<nav class="navbar navbar-expand navbar-light bg-white" style="flex: content;">
		<div class="container px-4 px-lg-5 text-start" style="height: 0px;">

			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link active" aria-current="page" href="/seedmall">홈</a></li>
					<li class="nav-item"><a class="nav-link" href="${myctx}/prod">쇼핑하기</a></li>
					<li class="nav-item"><a class="nav-link" href="${myctx}/board/notice">공지사항</a></li>
					<li class="nav-item"><a class="nav-link" href="${myctx}/boardComList">커뮤니티</a></li>
					<li class="nav-item"><a class="nav-link" href="${myctx}/FAQ">FAQ</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<hr style="margin-bottom: 0">