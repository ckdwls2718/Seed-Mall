<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>

<%@ include file="/WEB-INF/views/top.jsp"%>
<div class="d-flex">
	<%@ include file="/WEB-INF/views/admin/adminPageSidebar.jsp"%>

	<div class="container" style="width: 30%; height: 600px;">
	<!-- 	<main class="form-signin w-100 m-auto text-center">
			<form action="adminPage" method="post">

				<div class="form-floating mt-4">
					<input type="email" class="form-control" id="floatingInput"
						name="email"> <label for="floatingInput">이메일</label>
				</div>
				<br>
				<div class="form-floating">
					<input type="password" class="form-control" id="floatingPassword"
						name="pwd"> <label for="floatingPassword">비밀번호</label>
				</div>
				<br>
				<button class="w-100 btn btn-lg btn-primary mb-4" type="submit">내
					정보 수정하기</button>
			</form>
		</main> -->
	</div>
</div>
<%@ include file="/WEB-INF/views/foot.jsp"%>