<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/top.jsp"%>

<script type="text/javascript" src="./js/scripts2.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/addressapi.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<style>
h3 {
	margin: 40px 0 60px;
	font-weight: bolder;
	color: #2B7539;
	font-size: calc(1.325rem + .9vw);
}
.table>:not(caption)>*>*{
	padding:10px;
}
#last {
	border-bottom: 0;
}
</style>

<div class="container" style="height:auto; overflow: auto;">
	<div style="width: 590px; margin:auto; ">
	<h3 class="text-center">회원가입</h3>

	<form name="mf" id="mf" action="join" method="post">
		<!-- hidden data----------------------------------------- -->
		<input type="hidden" name="id_flag" id="id_flag" value="N">

		<table class="table">
			<tr>
				<td width="26%" class="m1"><b>이름</b></td>
				<td width="74%" class="m2"><input type="text" name="Mname"
					id="Mname" placeholder="이름" class="form-control" style="width: 67%; height: 35px;">
					
				<span class='ck' style="font-size: 14px;">* 이름은 한글로 입력해 주세요.</span></td>
			</tr>
			<tr>
				<td width="26%" class="m1"><b>이메일</b></td>
				<td width="74%" class="m2"><input type="text" name="email"
					id="email" onkeyup="" placeholder="이메일 주소" class="form-control"
					style="width: 67%; height: 35px; display: inline-block;">
					<button type="button" class="btn btn-outline-success" id="emailCheck"
						name="emailCheck" onclick="ajax_email()"
						style="width: 27%; height: 35px; vertical-align: top; font-size: 15px; font-weight: bold; margin: 0 7px;">중복체크</button> <br>
				<!-- <span class='ck' id="id_result">이메일양식 XXX@XXX.XXX</span> -->
				</td>
			</tr>
			<tr>
				<td width="26%" class="m1"><b>비밀번호</b></td>
				<td width="74%" class="m2"><input type="password" name="Pwd"
					id="Pwd" placeholder="비밀번호" class="form-control" style="width:67%; height: 35px;">
					
				<span class='ck' style="font-size: 14px;">* 비밀번호는 문자,숫자,!,. 포함해서 4~8자리 이내</span></td>
			</tr>
			<tr>
				<td width="26%" class="m1"><b>비밀번호 확인</b></td>
				<td width="74%" class="m2"><input type="password" name="Pwd2"
					id="Pwd2" placeholder="비밀번호 확인" class="form-control"
					style="width: 67%; height: 35px;"></td>
			</tr>
			<tr>
				<td width="26%" class="m1"><b>연락처</b></td>
				<td width="74%" class="m2"><input type="text" name="Mhp1"
					id="Mhp1" placeholder=" HP1" maxlength="3" style="width:19.5%; height: 35px; border-radius: 5px; border: 1px solid #ced4da;"> - <input
					type="text" name="Mhp2" id="Mhp2" placeholder=" HP2" maxlength="4" style="width:19.5%; height: 35px; border-radius: 5px; border: 1px solid #ced4da;"> -
					<input type="text" name="Mhp3" id="Mhp3" placeholder=" HP3"
					maxlength="4" style="width:19.5%; height: 35px; border-radius: 5px; border: 1px solid #ced4da;"> <br>
				<!-- <span class='ck' style="font-size: 14px;">* 앞자리(010|011)중에 하나-(숫자3~4자리)-(숫자4자리) 가능해요</span> -->
				</td>
			</tr>
			<tr>
				<td width="26%" class="m1"><b>주소</b></td>
				<td width="74%" class="m2"><input type="text" name="Mpost"
					id="Mpost" placeholder="우편번호" maxlength="5" class="form-control"
					style="width:95px; height: 35px; margin-bottom: 10px; display: inline;">
					<button type="button" class="btn btn-outline-success"
						style="width: 22%; height: 35px; vertical-align: top; font-size: 15px;
						font-weight: bold; float:right; margin-right: 33%;">주소 찾기</button>
					<!-- <button type="button" class="btn btn-outline-success"
						style="width: 27%; height: 35px; vertical-align: top; font-size: 15px;
						font-weight: bold; float:right; margin-right: 3.5%;">주소 찾기</button> -->
				<input type="text" name="Maddr1"
					id="Maddr1" placeholder="도로명주소" class="form-control"
					style="width: 67%;height: 35px; float:left; margin-bottom: 10px;" >
					<input type="text"
					name="Maddr2" id="Maddr2" placeholder="상세주소" class="form-control"
					style="width: 67%; height: 35px;"></td>
			</tr>
			<tr>
				<td colspan="2" class="text-center" id="last" ">
					<button class="btn btn-success" type="button"
						onclick="member_check()" style="margin:20px 15px 20px;">회원가입</button>
					<button class="btn btn-outline-danger" type="reset">다시쓰기</button>
				</td>
			</tr>
		</table>
	</form>

	</div>
	
</div>





<%@ include file="/WEB-INF/views/foot.jsp"%>
