<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/addressapi.js"></script>
<script>
	//우편번호 찾기
	function execPostCode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 도로명 조합형 주소 변수

				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
				// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}
				// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
				if (fullRoadAddr !== '') {
					fullRoadAddr += extraRoadAddr;
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				console.log(data.zonecode);
				console.log(fullRoadAddr);

				$("[name=mpost]").val(data.zonecode);
				$("[name=maddr1]").val(fullRoadAddr);

				document.getElementById('mpost').value = data.zonecode; //5자리 새우편번호 사용
				document.getElementById('maddr1').value = fullRoadAddr;
			}
		}).open();
	}
</script>

<%@ include file="/WEB-INF/views/top.jsp"%>
<div class="d-flex">
	<%@ include file="/WEB-INF/views/member/mypageSidebar.jsp"%>
	
	<div class="container" style="width: 600px; margin:auto">
	<h2 style="	font-size: calc(1.325rem + .9vw);
	margin: 70px 0px 40px 0px;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: bold;
	/* color: #39b559; */
	text-align: center;">내 정보 수정</h2>
		<form action="updateInfo" method="post">
			<input type="hidden" name="midx" value="${loginUser.midx}">
			<table class="table">
				<tr>
					<td width="80px;" class="m1">
						<b>등급</b>
					</td>
					<td width="" class="m2">${loginUser.grade}</td>

				</tr>
				<tr>
					<td width="80px;" class="m1">
						<b>이름</b>
					</td>
					<td width="" class="m2">${loginUser.mname}</td>

				</tr>
				<tr>
					<td width="80px;" class="m1">
						<b>이메일</b>
					</td>
					<td width="" class="m2">${loginUser.email}</td>

				</tr>
				<tr>
					<td width="80px;" class="m1">
						<b>연락처</b>
					</td>
					<td width="" class="m2">
						<input type="text" name="mhp1" id="mhp1" maxlength="3" value="${loginUser.mhp1}" style="width: 19.5%; height: 35px; border-radius: 5px; border: 1px solid #ced4da;" required> - <input type="text" name="mhp2" id="mhp2" maxlength="4" value="${loginUser.mhp2}" style="width: 19.5%; height: 35px; border-radius: 5px; border: 1px solid #ced4da;" required> - <input type="text" name="mhp3" id="mhp3" maxlength="4" value="${loginUser.mhp3}" style="width: 19.5%; height: 35px; border-radius: 5px; border: 1px solid #ced4da;" required>
					</td>
				</tr>
				<tr>
					<td width="80px;" class="m1">
						<b>주소</b>
					</td>
					<td width="" class="m2">
						<input type="text" name="mpost" id="mpost" placeholder="우편번호" maxlength="5" class="form-control" style="width: 95px; height: 35px; margin-bottom: 10px; display: inline;" value="${loginUser.mpost}" required>
						<button type="button" class="btn btn-outline-success" style="width: 22%; height: 35px; vertical-align: top; font-size: 15px; font-weight: bold; float: right; margin-right: 36%;" onclick="execPostCode()">주소 찾기</button>
						<!-- <button type="button" class="btn btn-outline-success"
						style="width: 27%; height: 35px; vertical-align: top; font-size: 15px;
						font-weight: bold; float:right; margin-right: 3.5%;">주소 찾기</button> -->
						<input type="text" name="maddr1" id="maddr1" placeholder="도로명주소" class="form-control" style="width: 83%; height: 35px; float: left; margin-bottom: 10px;" value="${loginUser.maddr1}" required> <input type="text" name="maddr2" id="maddr2" placeholder="상세주소" class="form-control" style="width: 83%; height: 35px;" value="${loginUser.maddr2}" required>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="text-center" style="border:0;">
						<button class="btn btn-primary" style="margin-top:20px;">수정하기</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div style="width: 230px;"></div>
</div>

<%@ include file="/WEB-INF/views/foot.jsp"%>