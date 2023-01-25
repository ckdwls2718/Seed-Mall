<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/top.jsp"%>
<div class="d-flex">
<%@ include file="/WEB-INF/views/member/mypageSidebar.jsp"%>
<div class="container">
	<table class="table">
			<tr>
				<td width="20%" class="m1" rowspan="2"><b>등급</b></td>
				<td width="80%" class="m2">
					<img width="30px" src="${myctx}/resources/grade_images/${loginUser.grade}.png">
					${loginUser.grade}
					<span style="color:gray;font-size: 0.9em">
					( 다음 등급까지 <fmt:formatNumber value="${nextGrade.gpoint-loginUser.mileage}" pattern="###,###"/>마일리지 남았습니다 )
					</span>
				</td>
			</tr>
			<tr>
				<td>
					<div class="progress ml-2" style="width: 50%;height:20px">
  						<div class="progress-bar" role="progressbar" style="width: <fmt:formatNumber value="${loginUser.mileage/nextGrade.gpoint}" type="percent"/>;" aria-valuenow="${loginUser.mileage}" aria-valuemin="0" aria-valuemax="${nextGrade.gpoint}">
  						<fmt:formatNumber value="${loginUser.mileage/nextGrade.gpoint}" type="percent"/>
  						</div>
					</div>
				</td>
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
					<a class="btn btn-primary" href="mypage/infoForm">내 정보 수정</a>
					<a class="btn btn-primary" href="mypage/editPassForm">비밀번호 변경</a>	
				</td>
			</tr>
		</table>
</div>
</div>

<%@ include file="/WEB-INF/views/foot.jsp"%>