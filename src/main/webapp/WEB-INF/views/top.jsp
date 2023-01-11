<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    </head>
    <body>
    <c:set var="myctx" value="${pageContext.request.contextPath}"/>
        <!-- Navigation-->
        <nav class="py-2 bg-white border-bottom">
            <div class="container d-flex flex-wrap text-end ">
              <ul class="nav me-auto">
              </ul>
              <ul class="nav">       
              <c:if test="${loginUser == null}">   
                <li class="nav-item"><a href="${myctx}/login" class="nav-link link-dark px-2">로그인 </a></li>
                
                <li class="nav-item"><span href="#" class="nav-link link-dark px-2" style="color:silver"> |</span></li>
                <li class="nav-item" ><a href="${myctx}/join" class="nav-link link-dark px-2" style="margin-right:1em ;">회원가입</a></li>              
              </c:if>  
              </ul>
              <c:if test="${loginUser != null}"> 
              <div class="flex-shrink-0 dropdown">
               
                <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                  <img src="${myctx}/assets/몬스테라.jpg" alt="mdo" width="32" height="32" class="rounded-circle" style="margin-top:3px">
                </a>
                
                <ul class="dropdown-menu text-small shadow" data-popper-placement="bottom-end" style="position: absolute; inset: 0px 0px auto auto; margin: 0px; margin-top:5px;  transform: translate3d(0.5px, 34px, 0px);">
                  <li><span class="dropdown-item">등급</span></li>
                  <li><hr class="dropdown-divider"></li>
                  <li><a class="dropdown-item" href="${myctx}/user/mypage">마이페이지</a></li>
                  <li><a class="dropdown-item" href="#">설정</a></li>
                  <li><hr class="dropdown-divider"></li>                  
                  <li><a class="dropdown-item" href="${myctx}/logout">로그아웃</a></li> 
                </ul>
              </div>
                <a href="${myctx}/user/cart" class="btn btn-outline-dark" style="margin-left:1em">
                    <img src="${myctx}/assets/cart-fill.svg">
                    장바구니
                </a>
            </c:if>
            </div>
          </nav>
        <header class="py-3 mb-4 border-bottom ">
            <div class="container d-flex flex-wrap" >
              <a href="${myctx}"  class="d-flex align-items-center mb-3 mb-lg-2 me-lg-auto text-dark text-decoration-none" style="margin-left:2em">
                <img src="${myctx}/assets/logo-removebg-preview.png" style="width:100%;height:70px" >
              </a>
              <div class="align-items-center" style="margin-right: 10%"><a href="${myctx}">
                <img src="${myctx}/assets/name-removebg-preview.png" style="width:100%"></a>
              </div>
                <form class="col-12 col-lg-4 mb-3 mb-lg-0 " role="search" >
                    <input type="search" class="form-control mb-lg-0" style="margin-left:auto;margin-top:2em ;width:80%" placeholder="검색..." aria-label="검색">
				</form>                    
              </div>
          </header>
        <nav class="navbar navbar-expand navbar-light bg-white">
            <div class="container px-4 px-lg-5 text-start" style="height: 0px;">
                
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="/seedmall">홈</a></li>
                        <li class="nav-item"><a class="nav-link" href="${myctx}/board/notice">공지사항</a></li>
                        <li class="nav-item"><a class="nav-link" href="${myctx}/boardComList">커뮤니티</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">Q&A</a></li>
                        <li class="nav-item"><a class="nav-link" href="${myctx}/FAQ">FAQ</a></li>
                        <li class="nav-item"><a class="nav-link" href="${myctx}/prod">쇼핑하기</a></li>
                        
                        <%-- <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">쇼핑</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="${myctx}/prod">전체보기</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="#!">관엽식물</a></li>
                                <li><a class="dropdown-item" href="#!">다육식물</a></li>
                            </ul>
                        </li> --%>
                        
                        <c:if test="${loginUser.status == 9}">   
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">관리자 도구</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="${myctx}/admin/adminPage">어드민페이지</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="${myctx}/admin/prodForm">상품 등록</a></li>
                                <li><a class="dropdown-item" href="${myctx}/admin/prodList">상품 목록</a></li>
                                <li><a class="dropdown-item" href="${myctx}/admin/memberList">회원 관리</a></li>
                            </ul>
                        </li>
                        </c:if> 
                    </ul>
                    
                </div>
            </div>
        </nav>
        <hr style="margin-bottom:0">

