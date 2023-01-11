<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/top.jsp"%>

<script src="//cdn.ckeditor.com/4.20.1/standard/ckeditor.js"></script>
​
<style>
.ck.ck-editor {
	max-width: 500px;
}

.ck-editor__editable {
	min-height: 300px;
}
</style>
<script>
	$(function() {
		CKEDITOR.replace('ncontent', {//해당 이름으로 된 textarea에 에디터를 적용
			width : '100%',
			height : '400px',
			filebrowserUploadUrl : "../noticeImg"
		});
		$('#bf').submit(function() {
			var regExp = /^[0-9]{1,3}$/;

			if ($('#subject').val() == '') {
				alert('제목을 입력하세요');
				$('#subject').focus();
				return false;
			}
			if ($('#name').val() == '') {
				alert('글쓴이를 입력하세요');
				$('#name').focus();
				return false;
			}
			if (CKEDITOR.instances.content.getData() == '') {
				alert('글내용을 입력하세요');
				CKEDITOR.instances.content.focus();
				return false;
			}

			if ($('#bpwd').val() == '') {
				alert('비밀번호를 입력하세요');
				$('#bpwd').focus();
				return false;
			}
			if (!regExp.test($('#priority').val())) {
				alert('중요도는 3자리이내 숫자만 입력해주세요');
				$('#priority').focus();
				return false;
			}
			return true;
		})
	})//$() end-----------------
</script>
<c:set var="myctx" value="${pageContext.request.contextPath}" />
<div align="center" id="bbs" class="col-md-8 offset-md-2 my-4">
	<h2 class="text-center">공지 작성</h2>
	<p class="text-center my-4">
		<input type="button" class="btn btn-success btn-sm" value="공지 목록"
			onclick="location.href='../notice'">
	<p>
		<!--파일 업로드시
   method: POST
   enctype: multipart/form-data 
    
    -->
	<form name="bf" id="bf" role="form" action="/seedmall/board/noticeEdit"
		method="POST" enctype="multipart/form-data" onsubmit="return imgSrc()">
		<table class="table">
			<tr>
				<td style="width: 20%"><b>제목</b></td>
				<td style="width: 80%"><input type="text" name="ntitle"
					id="subject" class="form-control" value="${notice.ntitle}">
					<input type="hidden" name="nidx" id="nidx" value="${notice.nidx}"></td>

			</tr>
			<tr>
				<td style="width: 20%"><b>글쓴이</b></td>
				<td style="width: 80%"><input type="text" name="name" id="name"
					class="form-control" readonly value="${loginUser.getMname()}">
					<input type="hidden" name="midx" id="midx"
					value="${loginUser.getMidx()}"></td>
			</tr>
			<tr>
				<td style="width: 20%"><b>글내용</b></td>
				<td style="width: 80%"><textarea name="ncontent" id="ncontent"
						rows="10" cols="50" class="form-control">${notice.ncontent}</textarea>
			</tr>
			<tr>
				<td style="width: 20%"><b>중요도</b></td>
				<td style="width: 80%"><input type="text" name="priority"
					id="priority" class="form-control" value="${notice.priority}"></td>
			</tr>
			<tr>
				<td class="text-center" colspan="2">
					<button type="submit" id="btnWrite" class="btn btn-success btn-sm">글수정</button>
				</td>
			</tr>

		</table>


	</form>

</div>


<%@ include file="/WEB-INF/views/foot.jsp"%>