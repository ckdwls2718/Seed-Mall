<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/top.jsp"%>
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
	<h1>글 등록하기</h1>
	<form name="bf" id="bf" role="form" action="write" method="POST"
		enctype="multipart/form-data">
		<input type="hidden" name="midx" value="${loginUser.midx}">
		<table class="table">
			<tr>
				<td style="width: 20%"><b>제목</b></td>
				<td style="width: 80%"><input type="text" name="ctitle"
					id="ctitle" class="form-control"></td>
			</tr>
			
			<tr>
				<td style="width: 20%"><b>글쓴이</b></td>
				<td style="width: 80%"><input type="text" name="email"
					id="email" class="form-control" readonly></td>
			</tr>
			
			<tr>
				<td style="width: 20%"><b>글내용</b></td>
				<td style="width: 80%"><textarea name="ccontent" id="ccontent"
						rows="10" cols="50" class="form-control"></textarea></td>
			</tr>

			<tr>
				<td colspan="2">
					<button type="submit" id="btnWrite" class="btn btn-success" >글쓰기</button>
					<button type="reset" id="btnReset" class="btn btn-warning">다시쓰기</button>
				</td>
			</tr>

		</table>


	</form>

</div>
<%@ include file="/WEB-INF/views/foot.jsp"%>










