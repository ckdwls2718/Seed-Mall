<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<%@ include file="/WEB-INF/views/top.jsp"%>

<div class="container" style="height: 1500px; overflow: y:hidden;">
	<h1 class="text-center mt-5 mb-5">주문 명세서</h1>
	<form id="prodF" action="${myctx}" method="post">

		<div class="text-center">
			<button class="btn btn-success">홈으로</button>
		</div>
	</form>
</div>
<%@ include file="/WEB-INF/views/foot.jsp"%>