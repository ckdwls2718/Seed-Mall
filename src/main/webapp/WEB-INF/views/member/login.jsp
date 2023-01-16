<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/top.jsp"%>
<style>
a{
	text-decoration: none;
	color: inherit;
}
a:hover{
	color: #2b7539;
	font-weight: 900;
}
</style>
<div class="container" style="width: 440px;">
	<main class="form-signin w-100 m-auto text-center">
		<form action="login" method="post">
			<!-- <img class="mb-4" src="./assets/name-removebg-preview.png" alt="" width="100" height="80"> -->

			<div class="form-floating mt-4">
				<input type="email" class="form-control" id="floatingInput"
					name="email" placeholder="name@example.com"> <label
					for="floatingInput">이메일</label>
			</div>
			<br>
			<div class="form-floating">
				<input type="password" class="form-control" id="floatingPassword"
					name="pwd" placeholder="Password"> <label
					for="floatingPassword">비밀번호</label>
			</div>
			<div class="checkbox mb-3" style="text-align: left;">
				<label> <input type="checkbox" value="remember-me">
					아이디 저장
				</label>
			</div>
			<div>
				<a href="join">회원가입</a> | <a href="findemail">이메일 찾기</a> | <a
					href="findPassword">비밀번호 찾기</a>
			</div>
			<br>
			<button class="w-100 btn btn-lg btn-primary mb-4" type="submit">로그인</button>
		</form>
	</main>
</div>

<%@ include file="/WEB-INF/views/foot.jsp"%>