<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script>
	const updatePass = function() {
		if (!passwordCheck()) {
			return;
		}

		psF.submit();

	}

	const passwordCheck = function() {
		if (!$('input[name=pwd]').val() || !$('input[name=password2]').val()
				|| !$('input[name=password3]').val()) {
			alert('빈칸을 입력해주세요');
			return false;
		}

		if ($('input[name=password2]').val() != $('input[name=password3]')
				.val()) {
			alert('비밀번호 확인과 다릅니다');
			return false;
		}
		return true;
	}
</script>
<%@ include file="/WEB-INF/views/top.jsp"%>
<div class="d-flex">
	<%@ include file="/WEB-INF/views/member/mypageSidebar.jsp"%>
	<div class="container" style="width: 600px; margin: auto">
	<h2 style="	font-size: calc(1.325rem + .9vw);
	margin: 70px 0px 40px 0px;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: bold;
	/* color: #39b559; */
	text-align: center;">비밀번호 변경</h2>
		<form id="psF" action="updatePass" method="post">
			<input type="hidden" name="email" value="${loginUser.email}">
			<table class="table">
				<tr>
					<td width="30%" class="m1">
						<b>이전 비밀번호</b>
					</td>
					<td width="70%" class="m2">
						<input type="password" name="pwd">
					</td>

				</tr>
				<tr>
					<td width="30%" class="m1">
						<b>새 비밀번호</b>
					</td>
					<td width="70%" class="m2">
						<input type="password" name="password2">
					</td>

				</tr>
				<tr>
					<td width="30%" class="m1">
						<b>새 비밀번호 확인</b>
					</td>
					<td width="70%" class="m2">
						<input type="password" name="password3">
					</td>

				</tr>
				<tr>
					<td colspan="2" class="m3 text-center" style="border:0;">
						<button class="btn btn-primary" type="button" onclick="updatePass()" style="margin-top:20px;">비밀번호 변경</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div style="width: 230px;"></div>
</div>

<%@ include file="/WEB-INF/views/foot.jsp"%>