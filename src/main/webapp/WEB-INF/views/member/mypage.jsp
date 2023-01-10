<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/top.jsp"%>
<div class="d-flex">
<%@ include file="/WEB-INF/views/member/mypageSidebar.jsp"%>
<div class="container">
	<table class="table">
			<tr>
				<td width="20%" class="m1"><b>등급</b></td>
				<td width="80%" class="m2">${loginUser.grade}</td>
					
			</tr>
			<tr>
				<td width="20%" class="m1"><b>이름</b></td>
				<td width="80%" class="m2">${loginUser.mname}</td>
					
			</tr>
			<tr>
				<td width="20%" class="m1"><b>이메일</b></td>
				<td width="80%" class="m2">${loginUser.email}</td>
					
			</tr>
			<tr>
				<td width="20%" class="m1"><b>연락처</b></td>
				<td width="80%" class="m2">${loginUser.mhp1} - ${loginUser.mhp2} - ${loginUser.mhp3}</td>
			</tr>
			<tr>
				<td width="20%" class="m1" rowspan="2"><b>주소</b></td>
				<td width="80%" class="m2">${loginUser.mpost}</td>
			</tr>
			<tr>
				
				<td width="80%" class="m3">${loginUser.maddr1}<br>${loginUser.maddr2}</td>
			</tr>
			<tr>
				<td colspan="2" class="m3 text-center">
					<button class="btn btn-primary" type="button"
						onclick="member_check()">내 정보 수정</button>
					<button class="btn btn-primary" type="button"
						onclick="member_check()">비밀번호 변경</button>	
				</td>
			</tr>
		</table>
</div>
</div>

<%@ include file="/WEB-INF/views/foot.jsp"%>