<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
const updatePass = function(){
	if(!passwordCheck()){
		return;
	}
	
	psF.submit();
	
}

const passwordCheck = function(){
	if(!$('input[name=pwd]').val() || !$('input[name=password2]').val() || !$('input[name=password3]').val()){
		alert('빈칸을 입력해주세요');
		return false;
	}
	
	if($('input[name=password2]').val() != $('input[name=password3]').val() ){
		alert('비밀번호 확인과 다릅니다');
		return false;
	}
	return true;
}
</script>
<%@ include file="/WEB-INF/views/top.jsp"%>
<div class="d-flex">
<%@ include file="/WEB-INF/views/member/mypageSidebar.jsp"%>
<div class="container">
<form id="psF" action="updatePass" method="post">
<input type="hidden" name="email" value="${loginUser.email}">
	<table class="table">
			<tr>
				<td width="20%" class="m1"><b>이전 비밀번호</b></td>
				<td width="80%" class="m2">
					<input type="password" name="pwd">
				</td>
					
			</tr>
			<tr>
				<td width="20%" class="m1"><b>새 비밀번호</b></td>
				<td width="80%" class="m2">
					<input type="password" name="password2">
				</td>
					
			</tr>
			<tr>
				<td width="20%" class="m1"><b>새 비밀번호 확인</b></td>
				<td width="80%" class="m2">
					<input type="password" name="password3">
				</td>
					
			</tr>
			<tr>
				<td colspan="2" class="m3 text-center">
					<button class="btn btn-primary" type="button" onclick="updatePass()">비밀번호 변경</button>
				</td>
			</tr>
		</table>
</form>
</div>
</div>

<%@ include file="/WEB-INF/views/foot.jsp"%>