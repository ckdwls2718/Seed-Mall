<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<script src="${myctx}/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${myctx}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${myctx}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${myctx}/resources/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="${myctx}/resources/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="${myctx}/resources/js/demo/chart-area-demo.js"></script>
    <script src="${myctx}/resources/js/demo/chart-pie-demo.js"></script>
    <!-- Custom fonts for this template-->
	    <link href="${myctx}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	    <link
	        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	        rel="stylesheet">
	
      <!-- Custom styles for this template-->
	  <link href="${myctx}/resources/css/sb-admin-2.min.css" rel="stylesheet">

<div class="wrapper" style="height: auto">
    <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion flex-column" id="accordionSidebar" >

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="#">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">${loginUser.mname}</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item">
                <a class="nav-link" href="${myctx}/admin/history">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>히스토리</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                기능
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fa-solid fa-store"></i>
                    <span>주문관리</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">주문 상태</h6>
                        <a class="collapse-item" href="${myctx}/admin/orderManagement">상품 준비</a>
                        <a class="collapse-item" href="${myctx}/admin/deliveryManagement">배송 중</a>
                        <a class="collapse-item" href="${myctx}/admin/refundManagement">환불 내역</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fa-solid fa-seedling"></i>
                    <span>식물 관리</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Custom Utilities:</h6>
                        <a class="collapse-item" href="${myctx}/admin/plantManagement?findState=4">전체보기</a>
                        <a class="collapse-item" href="${myctx}/admin/plantManagement?findState=1">신규 등록</a>
                        <a class="collapse-item" href="${myctx}/admin/plantManagement?findState=2">관리 중</a>
                        <a class="collapse-item" href="${myctx}/admin/plantManagement?findState=3">완료</a>
                    </div>
                </div>
            </li>
            
            <!-- Nav Item - Charts -->
            <li class="nav-item">
                <a class="nav-link" href="${myctx}/admin/qnaManagement">
                    <i class="fa-solid fa-q"></i>
                    <span>QNA 관리</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                등록
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>상품 관리</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="${myctx}/admin/prodForm">상품 등록</a>
                        <a class="collapse-item" href="${myctx}/admin/prodList">상품 목록</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Charts -->
            <li class="nav-item">
                <a class="nav-link" href="${myctx}/admin/memberList">
                    <i class="fa-solid fa-users"></i>
                    <span>회원 목록</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            

            <!-- Sidebar Message -->
            <!-- <div class="sidebar-card d-none d-lg-flex">
                <img class="sidebar-card-illustration mb-2" src="img/undraw_rocket.svg" alt="...">
                <p class="text-center mb-2"><strong>SB Admin Pro</strong> is packed with premium features, components, and more!</p>
                <a class="btn btn-success btn-sm" href="https://startbootstrap.com/theme/sb-admin-pro">Upgrade to Pro!</a>
            </div> -->

        </ul>
        <!-- End of Sidebar -->
</div>


	
  