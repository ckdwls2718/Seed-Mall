<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/top.jsp"%>

<div class="d-flex">
<%@ include file="/WEB-INF/views/member/mypageSidebar.jsp"%>
	<div class="container">
	
		<div id="imgList">
		<!-- 캐러셀 이용해서 이미지와 날짜 띄워주기 -->
		
		</div>
	
		<div id="plantInfo">
			<input type="text" name="nickname" value="${plant.nickname}"> <button>이름 수정하기</button>
			<h1>${plant.percent}% 자랐음</h1>
			<h1>${plant.pcomment}</h1>
			<h1>${plant.pdate}</h1>
		</div>
	
	</div>

</div>



<%@ include file="/WEB-INF/views/foot.jsp"%>