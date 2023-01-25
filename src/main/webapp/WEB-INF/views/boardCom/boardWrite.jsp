<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/top.jsp"%>

<style>
h2 {
	font-size: calc(1.325rem + .9vw);
	margin: 40px;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: bold;
	color: #39b559;
}

tr:nth-child(3)>td, td:nth-child(3) {
	border-bottom: 0;
}
</style>

<script src="https://cdn.ckeditor.com/4.17.2/standard/ckeditor.js"></script>
<script>
	$(function() {

		CKEDITOR.replace('ccontent');

		$('#bf').submit(function() {
			if ($('#ctitle').val() == '') {
				alert('제목을 입력하세요');
				$('#ctitle').focus();
				return false;
			}
			/* if($('#email').val()==''){
				alert('글쓴이를 입력하세요');
				$('#email').focus();
				return false;
			} */
			if (CKEDITOR.instances.content.getData() == '') {
				alert('글내용을 입력하세요');
				CKEDITOR.instances.content.focus();
				return false;
			}
			alert('등록되었습니다');
			return true;
		})
	})//$() end-----------------
</script>
<%
String ctx = request.getContextPath();
%>
<div align="center" id="bbs" class="col-md-8 offset-md-2 my-4">
	<h2>글 작성하기</h2>
	<form name="bf" id="bf" role="form" action="write" method="POST" enctype="multipart/form-data">
		<input type="hidden" name="midx" value="${loginUser.midx}">
		<table class="table" style="text-align: center; width: 1000px;">
			<tr>
				<td style="width: 10%">
					<b>제목</b>
				</td>
				<td style="width: 80%">
					<input type="text" name="ctitle" id="ctitle" class="form-control">
				</td>
				<td style="width: 10%"></td>
			</tr>

			<tr>
				<td style="width: 10%">
					<b>작성자</b>
				</td>
				<td style="width: 80%">
					<input type="text" name="email" id="email" class="form-control" readonly value="${loginUser.email}">
				</td>
			</tr>

			<tr>
				<td style="width: 10%">
					<b>내용</b>
				</td>
				<td style="width: 80%">
					<textarea name="ccontent" id="ccontent" rows="10" cols="50" class="form-control"></textarea>
				</td>
			</tr>
			<!-- 			<tr>
				<td colspan="2" class="btn" style="float: right;">
						<button type="reset" id="btnReset" class="btn btn-warning">다시쓰기</button>
				</td>
			</tr> -->
		</table>

		<div>
			<button type="submit" id="btnWrite" class="btn btn-success" style="">글쓰기</button>
			<button type="button" id="btncancel" class="btn btn-danger" onclick="history.back(-1)" style="right: 0 auto;">취소</button>
		</div>
	</form>
</div>

<%@ include file="/WEB-INF/views/foot.jsp"%>










