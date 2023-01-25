<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/top.jsp"%>

<script type="text/javascript" src="./js/scripts2.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/addressapi.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<style>
h2 {
	font-size: calc(1.325rem + .9vw);
	margin: 40px 0px 40px 0px;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: bold;
	color: #39b559;
	text-align: center;
}
</style>

<div class="container" style="height: 750px; width: 470px; overflow: auto;">
	<h2>비밀번호 찾기</h2>

	<form name="mf" id="mf" action="find_Password" method="post">
		<!-- hidden data----------------------------------------- -->
		<input type="hidden" name="id_flag" id="id_flag" value="N">

		<table class="table">
			<tr>
				<td width="14%" class="m1">
					<b>이름</b>
				</td>
				<td width="86%" class="m2">
					<input type="text" name="Mname" id="Mname" class="form-control" style="width: 229px;">
					<span class='ck' style="color:#0000008c; font-size: 14px;">*이름을 입력해주세요</span>
				</td>
			</tr>

			<tr>
				<td width="14%" class="m1">
					<b>연락처</b>
				</td>
				<td width="86%" class="m2">
					<input type="text" name="Mhp1" id="Mhp1"  class="form-control" maxlength="3" style="width:108px; display: inline-block;">
					 - <input type="text" name="Mhp2" id="Mhp2" class="form-control" maxlength="4" style="width:108px; display: inline-block;">
					  - <input type="text" name="Mhp3" id="Mhp3" class="form-control" maxlength="4" style="width:108px; display: inline-block;">
					  <br>
					  <span class='ck' style="color:#0000008c; font-size: 14px;">*휴대전화 번호를 입력해주세요</span>
				</td>
			<tr>
				<td width="14%" class="m1">
					<b>이메일</b>
				</td>
				<td width="86%" class="m2">
					<input type="text" name="Email" id="email" onkeyup="" class="form-control" style="width: 349px;">
				
					  <span class='ck' style="color:#0000008c; font-size: 14px;">*이메일을 입력해주세요</span>
			<tr>
			<tr>
				<td colspan="2" class="m3 text-center" style="border:0;">
					<button class="btn btn-primary" type="submit" value="check" style=" margin-top:20px;">비밀번호 찾기</button>
					<!-- 이름과 전화번호가 일치할때-->
					<c:if test="${check == 1}">
						<script>
							alert("찾으시는 비밀번호는' ${pwd}' 입니다.");
						</script>
					</c:if>
					<!-- 이름과 비밀번호가 일치하지 않을 때 -->
					<c:if test="${check == 0}">
						<script>
							alert('일치하는 정보가 존재하지 않습니다');
						</script>
					</c:if>
				</td>
			</tr>

		</table>
	</form>


</div>
<%@ include file="/WEB-INF/views/foot.jsp"%>
