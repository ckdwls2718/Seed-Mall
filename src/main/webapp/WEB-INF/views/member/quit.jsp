<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/top.jsp"%>
<script>
const memberQuit = function(){
	
	
	let url= "${myctx}/user/mypage/quit";
	let midx = ${loginUser.midx};
	
	$.ajax({
		url:url,
		type:'post',
		dataType:'json',
		data:'midx='+midx,
		cache:false,
		success:function(res){
			//alert(res);
			if(res>0){
				alert('그동안 이용해주셔서 감사합니다.');
				location.href="${myctx}";
			}
		},
		error:function(err){
			alert('err : '+err.status);
		}
	})
}
</script>
<style>
	td{
		vertical-align: middle;
	}
</style>
<div class="d-flex">
	<%@ include file="/WEB-INF/views/member/mypageSidebar.jsp"%>
	<div class="container" >
		<div class="text-center mt-3"><h1>회원 탈퇴</h1></div>
		<div class='text-center'>
		<h3>탈퇴 전 안내사항</h3>
		<hr>
		</div>
		<div>
		<ol>
			<li>회원탈퇴 처리 후에는 회원님의 개인정보를 복원할 수 없으며 회원탈퇴 진행 시 해당 아이디는 영구적으로 삭제되어 재가입이 불가능합니다.</li>
			<li>회원탈퇴 시 회원님의 마일리지는 모두 소멸됩니다.</li>
		</ol>
		<hr>
		</div>
		<div class="text-center">
		<button class="btn btn-danger" type="button" onclick="memberQuit()">탈퇴하기</button>
		</div>
	</div>
		
</div>
<%@ include file="/WEB-INF/views/foot.jsp"%>