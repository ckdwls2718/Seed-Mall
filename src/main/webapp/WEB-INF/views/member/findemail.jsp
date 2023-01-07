<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/top.jsp"%>

<script type="text/javascript" src="./js/scripts2.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/addressapi.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<div class="container" style="height: 750px; overflow: auto;">
	<h1 class="text-center mt-1"></h1>

	<form name="mf" id="mf" action="find_email" method="post">
		<!-- hidden data----------------------------------------- -->
		<input type="hidden" name="id_flag" id="id_flag" value="N">

		<table class="table">
			<tr>
				<td width="20%" class="m1"><b>이름</b></td>
				<td width="80%" class="m2"><input type="text" name="Mname"
					id="Mname" placeholder="이름" class="form-control" style="width: 14%">
					<br> <span class='ck'>*이름은 한글만 가능해요</span></td>
			</tr>

			<tr>
				<td width="20%" class="m1"><b>연락처</b></td>
				<td width="80%" class="m2"><input type="text" name="Mhp1"
					id="Mhp1" placeholder="HP1" maxlength="3">- <input
					type="text" name="Mhp2" id="Mhp2" placeholder="HP2" maxlength="4">-
					<input type="text" name="Mhp3" id="Mhp3" placeholder="HP3"
					maxlength="4"> <br> <span class='ck'>*앞자리(010|011)중에
						하나-(숫자3~4자리)-(숫자4자리) 가능해요</span></td>
			<tr>
				<td colspan="2" class="m3 text-center">
					<button class="btn btn-primary" type="submit" value="check">아이디
						찾기</button>
						<!-- 이름과 전화번호가 일치할때-->

			<c:if test="${check == 1}">
				<script>alert("찾으시는 이메일은' ${email}' 입니다.");</script>
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
