<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/top.jsp"%>

<script type="text/javascript" src="./js/scripts2.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<style>
h3 { /* 상단 회원가입 표시*/
	margin: 40px 0 60px;
	font-weight: bolder;
	color: #2B7539;
	font-size: calc(1.325rem + .9vw);
}
span {/* 설명 크기 */
	font-size: 14px;
}
.table>:not(caption)>*>* { /* 테이블내 전체 패딩값 */
	padding: 10px;
}
.form-control { /* text 박스 크기  */
	width: 67%;
	height: 35px;
}
td:first-child{/* 테이블 비율 */
	width:26%;
}
td:last-child{/* 테이블 비율 */
	width:74%;
}
#email { /* 이메일 + 체크박스 */
	width: 67%;
	height: 35px;
	display: inline-block;
}
#emailCheck { /* 중복체크 버튼 */
	width: 27%;
	height: 35px;
	vertical-align: top;
	font-size: 15px;
	font-weight: bold;
	margin: 0 7px;
}
#mhp1, #mhp2, #mhp3 { /* 연락처 */
	width: 19.5%;
	height: 35px;
	border-radius: 5px;
	border: 1px solid #ced4da;
}
#mpost{/* 주소 */
	width: 95px;
	height: 35px;
	margin-bottom: 10px;
	display: inline;
}
#mpostbtn{/* 주소찾기 버튼  */
	width: 22%;
	height: 35px;
	vertical-align: top;
	font-size: 15px; 
	font-weight: bold;
	float: right;
	margin-right: 33%;
}
#maddr1{/* 도로명 주소 */
	width: 67%;
	height: 35px;
	float: left;
	margin-bottom: 10px;
}
#maddr2{/* 상세주소 */
	width: 67%;
	height: 35px;
}
#joinbtn{/* 회원가입 버튼 */
	margin: 20px 15px 20px;
}
#last { /*하단 라인 제거  */
	border-bottom: 0;
}
</style>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function execPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                    	addr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("Maddr1").value = extraAddr;
                
                } else {
                    document.getElementById("Maddr1").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('Mpost').value = data.zonecode;
                document.getElementById("Maddr1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("Maddr2").focus();
            }
        }).open();
    }
</script>
<div class="container" style="height: auto; overflow: auto;">
	<div style="width: 590px; margin: auto;">
		<h3 class="text-center">회원가입</h3>
		<form name="mf" id="mf" action="join" method="post">
			<!-- hidden data----------------------------------------- -->
			<input type="hidden" name="id_flag" id="id_flag" value="N">
			<table class="table">
				<tr>
					<td class="m1">
						<b>이름</b>
					</td>
					<td class="m2">
						<input type="text" name="Mname"id="Mname" placeholder="이름" class="form-control">
						<span class='ck'>* 이름은 한글로 입력해 주세요.</span>
					</td>
				</tr>
				<tr>
					<td class="m1">
					<b>이메일</b>
					</td>
					<td class="m2"><input type="text" name="email" id="email"
					onkeyup="" placeholder="이메일 주소" class="form-control">
						<button type="button" class="btn btn-outline-success" id="emailCheck"
						name="emailCheck" onclick="ajax_email()">중복체크</button>
						<br>
					</td>
				</tr>
				<tr>
					<td class="m1">
					<b>비밀번호</b>
					</td>
					<td class="m2">
						<input type="password" name="Pwd" id="Pwd" placeholder="비밀번호" class="form-control">
						<span class='ck'>* 비밀번호는 문자,숫자,!,. 포함해서 4~8자리 이내</span>
					</td>
				</tr>
				<tr>
					<td  class="m1">
						<b>비밀번호 확인</b>
					</td>
					<td  class="m2">
						<input type="password" name="Pwd2" id="Pwd2" placeholder="비밀번호 확인" class="form-control">
					</td>
				</tr>
				<tr>
					<td class="m1">
						<b>연락처</b>
					</td>
					<td class="m2">
					<select id="Mhp1">
							<option value="1">010</option>
							<option value="2">011</option>
							<option value="3">016</option>
							<option value="4">017</option>
							<option value="5">018</option>
							<option value="6">019</option>
					</select>
					- <input type="text" name="Mhp2" id="Mhp2" maxlength="4">
					- <input type="text" name="Mhp3" id="Mhp3" maxlength="4">
					<br>
					</td>
				</tr>
				<tr>
					<td class="m1">
						<b>주소</b>
					</td>
					<td class="m2">
			<!-- 		<input type="text" id="Mpost" placeholder="우편번호">
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="Maddr1" placeholder="주소"><br>
					<input type="text" id="Maddr2" placeholder="상세주소">
					 -->
					
						<input type="text" name="Mpost"id="Mpost" placeholder="우편번호" maxlength="5" class="form-control">
						<button type="button" id="Mpostbtn"class="btn btn-outline-success" onclick="execPostcode()">주소 찾기</button>
						<input type="text" name="Maddr1" id="Maddr1" placeholder="도로명 주소" class="form-control">
						<input type="text" name="Maddr2" id="Maddr2" placeholder="상세주소" class="form-control" >
					</td>
				</tr>
				<tr>
					<td colspan="2" class="text-center" id="last">
						<button class="btn btn-success" type="button" id="joinbtn"onclick="member_check()">회원가입</button>
						<button class="btn btn-outline-danger" type="reset">다시쓰기</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>

<%@ include file="/WEB-INF/views/foot.jsp"%>
