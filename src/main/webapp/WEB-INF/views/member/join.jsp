<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/top.jsp"%>

<script type="text/javascript" src="./js/userCheck.js"></script>


<div class="container" style="height:750px;overflow: auto;">
	<h1 class="text-center mt-1"></h1>
	
	<form name="mf" id="mf" action="join" method="post">
		<!-- hidden data----------------------------------------- -->
		<!-- <input type="text" name="id_flag" id="id_flag" value="N"> -->
		<!-- --------------------------------------------------- -->
		<table class="table">
			<tr>
				<td width="20%" class="m1"><b>이름</b></td>
				<td width="80%" class="m2">
				<input type="text" name="Mname" id="Mname" placeholder="Name">
				<br><span class='ck'>*이름은 한글만 가능해요</span>
				</td>
			</tr>
			<tr>
				<td width="20%" class="m1"><b>이메일</b></td>
				<td width="80%" class="m2">
				<input type="text" name="Email" id="Email"
				 onkeyup=""   placeholder="Email">
				<button type="button"  class="btn btn-success" onclick="">이메일 중복 체크</button>
				<br><span class='ck' id="id_result">이메일양식 XXX@XXX.XXX</span>
				</td>
			</tr>
			<tr>
				<td width="20%" class="m1"><b>비밀번호</b></td>
				<td width="80%" class="m2">
				<input type="password" name="Pwd" id="Pwd" placeholder="Password">
				<br><span class='ck'>*비밀번호는 문자,숫자,!,. 포함해서 4~8자리 이내</span>
				</td>
			</tr>
			<tr>
				<td width="20%" class="m1"><b>비밀번호 확인</b></td>
				<td width="80%" class="m2">
				<input type="password" name="Pwd2" id="Pwd2" placeholder="Re Password">
				</td>
			</tr>
			<tr>
				<td width="20%" class="m1"><b>연락처</b></td>
				<td width="80%" class="m2">
				<input type="text" name="Mhp1" id="Mhp1" placeholder="HP1" maxlength="3">-
				<input type="text" name="Mhp2" id="Mhp2" placeholder="HP2" maxlength="4">-
				<input type="text" name="Mhp3" id="Mhp3" placeholder="HP3" maxlength="4">
				<br><span class='ck'>*앞자리(010|011)중에 하나-(숫자3~4자리)-(숫자4자리) 가능해요</span>
				</td>
			</tr>
			<tr>
				<td width="20%" class="m1"><b>우편번호</b></td>
				<td width="80%" class="m2">
				<input type="text" name="Post" id="Mpost" placeholder="Post" maxlength="5">
				<button type="button" class="btn btn-success">우편번호 찾기</button>
				</td>
			</tr>
			<tr>
				<td width="20%" class="m1"><b>주소</b></td>
				<td width="80%" class="m2">
				<input type="text" name="Maddr1" id="Maddr1" placeholder="Address1"><br>
				<input type="text" name="Maddr2" id="Maddr2" placeholder="Address2">
				</td>
			</tr>
			<tr>
				<td colspan="2" class="m3 text-center">
					<button class="btn btn-primary" type="button" onclick="send()" >회원가입</button>
					<button class="btn btn-danger" type="reset">다시쓰기</button>
				</td>
			</tr>
		</table>	
</form>
	
</div>
	
<script>
function send(){
	let frm=document.getElementById('mf');
	alert('회원가입을 축하드립니다.');
	frm.method='post';
	frm.submit();
}
</script>
<%@ include file="/WEB-INF/views/foot.jsp"%>
