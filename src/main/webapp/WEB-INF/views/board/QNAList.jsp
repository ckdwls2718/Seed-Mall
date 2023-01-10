<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>

$(function(){
	
}) //window------------

const qnaCheck = function(){
	
}

const insertQNA = function(){
	
	qnaCheck()
	
	let qStr = $('#qnaF').serialize();
	//alert(qStr); 
	url="${myctx}/QNA"
	
	$.ajax({
		url:url,
		type:'post',
		dataType:'json',
		data:qStr,
		cache:false,
		success:function(res){
			alert(res);
		},
		error:function(err){
			alert('err : '+err.status);
		}
	})
}

</script>
<div class="container">
<ul class="nav nav-tabs">
  <li class="nav-item">
    <a class="nav-link" href="#">상품상세</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">상품리뷰</a>
  </li>
  <li class="nav-item">
    <a class="nav-link active" aria-current="page" href="#">상품문의</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
  </li>
</ul>
<h1>상품 문의</h1>
<p>어쩌구 저쩌구</p>

<c:if test="${loginUser ne null}">
<form id="qnaF">
<input type="hidden" name="midx" value="${loginUser.midx}">
<input type="hidden" name="pidx" value="${prod.pidx}">
<div class="mb-3">
  <label for="qtitle" class="form-label">제목</label>
  <input type="text" class="form-control" id="qtitle" name="qtitle" required>
</div>
<div class="mb-3">
  <label for="qcontent" class="form-label">내용</label>
  <textarea class="form-control" id="qcontent" name="qcontent" rows="3" required></textarea>
</div>
<input type="checkbox" id="secret" name="secret" value="Y"> <label for="secret">비밀글</label>
<button class="btn btn-info" type="button" onclick="insertQNA()">등록</button>
</form>
</c:if>
<c:if test="${loginUser eq null}">
<a class="btn btn-outline-info" href="#">로그인 하러 가기</a>
</c:if>

<!-- 상품 문의 리스트 -->
<ul>
	<li>1</li>
	<li>12</li>
	<li>13</li>
	<li>14</li>
	<li>15</li>
	<li>16</li>
	<li>17</li>
</ul>
</div>
