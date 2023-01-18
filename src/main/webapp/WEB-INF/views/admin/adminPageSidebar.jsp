<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="d-flex flex-column flex-shrink-0 p-3 bg-light mt-4" style="width: 280px;">
    <a href="#" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
      <svg class="bi pe-none me-2" width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
      <span class="fs-4">어드민페이지</span>
    </a>
    <hr>
    <ul class="nav nav-pills flex-column mb-auto">
    	<li>
        <a href="${myctx}/admin/adminPage" class="nav-link link-dark">
          <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#people-circle"></use></svg>
          내 정보
        </a>
      </li>
      <li class="nav-item">
        <a href="${myctx}/admin/orderManagement" class="nav-link link-dark">
          <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#home"></use></svg>
          주문 관리
        </a>
      </li>
      <li>
        <a href="${myctx}/admin/refundManagement" class="nav-link link-dark">
          <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#speedometer2"></use></svg>
          환불 내역
        </a>
      </li>
      <li>
        <a href="${myctx}/admin/plantManagement" class="nav-link link-dark">
          <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#speedometer2"></use></svg>
          식물 관리
        </a>
      </li>
      <li>
        <a href="${myctx}/admin/qnaManagement" class="nav-link link-dark">
          <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#speedometer2"></use></svg>
          Q&A 답변관리
        </a>
      </li>
      <li>
        <a href="${myctx}/admin/history" class="nav-link link-dark">
          <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#grid"></use></svg>
          히스토리
        </a>
      </li>
    </ul>
    <hr>
  </div>