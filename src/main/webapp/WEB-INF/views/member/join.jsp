<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/top.jsp"%>

<script type="text/javascript" src="./js/scripts2.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/addressapi.js"></script>
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
#Mhp1, #Mhp2, #Mhp3 { /* 연락처 */
	width: 19.5%;
	height: 35px;
	border-radius: 5px;
	border: 1px solid #ced4da;
}
#Mpost{/* 주소 */
	width: 95px;
	height: 35px;
	margin-bottom: 10px;
	display: inline;
}
#Mpostbtn{/* 주소찾기 버튼  */
	width: 22%;
	height: 35px;
	vertical-align: top;
	font-size: 15px; 
	font-weight: bold;
	float: right;
	margin-right: 33%;
}
#Maddr1{/* 도로명 주소 */
	width: 67%;
	height: 35px;
	float: left;
	margin-bottom: 10px;
}
#Maddr2{/* 상세주소 */
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
						<input type="text" name="Mpost"id="Mpost" placeholder="우편번호" maxlength="5" class="form-control">
						<button type="button" id="Mpostbtn"class="btn btn-outline-success">주소 찾기</button>
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
