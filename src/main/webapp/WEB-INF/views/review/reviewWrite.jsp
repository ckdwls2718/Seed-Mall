<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/top.jsp"%>
<script src="https://cdn.ckeditor.com/4.17.2/standard/ckeditor.js"></script>
<script>
	$(function() {
		$('#bf').submit(function() {
			if ($('#rtitle').val() == '') {
				alert('제목을 입력하세요');
				$('#rtitle').focus();
				return false;
			}
			if($('#email').val()==''){
				alert('글쓴이를 입력하세요');
				$('#email').focus();
				return false;
			} 
			if ($('#rcontent').val() == '') {
				alert('글내용을 입력하세요');
				$('#rcontent').focus();
				return false;
			}
			alert('등록되었습니다');
			return true;
		})
		
	})//$() end-----------------
const reviewCheck = function(){
		  
	}
	
	function setThumbnail(event) {
	    for (var image of event.target.files) {
	      var reader = new FileReader();

	      reader.onload = function(event) {
	        var img = document.createElement("img");
	        img.setAttribute("src", event.target.result);
	        img.setAttribute("width", "35%");
	        img.setAttribute("height", "35%");
	        document.querySelector("div#image_container").appendChild(img);
	      };

	      console.log(image);
	      reader.readAsDataURL(image);
	    }
	  }


</script>

<div align="center" id="bbs" class="col-md-8 offset-md-2 my-4">
	<h1>리뷰 작성</h1>
	<form name="bf" id="bf" role="form" action="reviewEnd" method="POST" 
		enctype="multipart/form-data">
		<input type="hidden" name="midx" value="${loginUser.midx}">
		<input type="hidden" name="pidx" value="${pidx}">
        <input type="hidden" name="oidx" value="${oidx}">
		<table class="table">
			<tr>
				<td style="width: 20%"><b>제목</b></td>
				<td style="width: 80%"><input type="text" name="rtitle"
					id="rtitle" class="form-control"></td>
			</tr>
			
			<tr>
				<td style="width: 20%"><b>글쓴이</b></td>
				<td style="width: 80%"><input type="text" name="email" id="email" class="form-control" readonly value="${loginUser.email}"></td>
			</tr>
			
			<tr>
				<td style="width: 20%"><b>평점</b></td>
				<td style="width: 80%">
        <!-- <input type="hidden" name="score" id="score"> -->
	    <label for="score1"><input type="radio" name="score" id="score1" value="1" >1점</label>
		<label for="score2"><input type="radio" name="score" id="score2" value="2">2점</label>
		<label for="score3"><input type="radio" name="score"  id="score3" value="3" checked>3점</label>
		<label for="score4"><input type="radio" name="score" id="score4" value="4">4점</label>
		<label for="score5"><input type="radio" name="score"  id="score5"value="5">5점</label>
					</td>
			</tr>
			
			<tr>
						<td><b>상품이미지</b></td>
							<td width="20%"><input type="file" name="rimage"
									onchange="setThumbnail(event)" multiple></td>
							<td width="60%"><span style="border: 1px solid black; border-radius: 2px">선택된이미지</span>
								<div id="image_container"></div> <br></td>
							</tr>
			
			<tr>
				<td style="width: 20%"><b>글내용</b></td>
				<td style="width: 80%"><textarea name="rcontent" id="rcontent"
						rows="10" cols="50" class="form-control"></textarea></td>
			</tr>

			<tr>
				<td colspan="2">
					<button type="submit" id="btnWrite" class="btn btn-success">글쓰기</button>
					<button type="reset" id="btnReset" class="btn btn-warning">다시쓰기</button>
				</td>
			</tr>
			
		
		</table>


	</form>

</div>
<%@ include file="/WEB-INF/views/foot.jsp"%>










