<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!--  ---------------------------------------------------------- -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- function taglib------------------------------------------- -->

<%@ include file="/WEB-INF/views/top.jsp"%>
<ul class="nav nav-tabs">
  <li class="nav-item">
    <a class="nav-link" href="#">상품상세</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">상품리뷰</a>
  </li>
  <li class="nav-item">
    <a class="nav-link active" aria-current="page" href="#">상품문의</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
  </li>
</ul>
<%@ include file="/WEB-INF/views/foot.jsp"%>