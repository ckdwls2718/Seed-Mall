<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<script>

$(function(){
	
}) //window------------

const deleteQna = function(qidx){
	
	let myctx = "${pageContext.request.contextPath}";
	url= myctx+"/QNA/del";
	
	$.ajax({
		url:url,
		type:'post',
		dataType:'json',
		data:'qidx='+qidx,
		cache:false,
		success:function(res){
			//alert(res);
			if(res>0){
				location.reload();
			}
		},
		error:function(err){
			alert('err : '+err.status);
		}
	})
}

const qnaCheck = function(){
	
	if(!$('#qtitle').val()){
		alert('제목을 입력해주세요');
		return false;
	}
	
	if(!$('#qcontent').val()){
		alert('내용을 입력해주세요');
		return false;
	}
	
	return true;
}

const insertQNA = function(){
	
	if(!qnaCheck()){
		return;
	}
	
	
	let qStr = $('#qnaF').serialize();
	//alert(qStr); 
	let myctx = "${pageContext.request.contextPath}";
	url= myctx+"/QNA";
	
	$.ajax({
		url:url,
		type:'post',
		dataType:'json',
		data:qStr,
		cache:false,
		success:function(res){
			//alert(res);
			if(res>0){
				location.reload();
			}
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
<table class="table">
 <tr>
 	<th>상태</th>
  	<th>제목</th>
  	<th>작성자</th>
  	<th>작성일</th>
 </tr>
 
 <c:if test="${qArr eq null or empty qArr}">
 	<tr>
 		<td colspan="4">등록된 QNA가 없습니다</td>
 	</tr>
 </c:if>
 
 <c:if test="${qArr ne null and not empty qArr}">
 <c:forEach var="qna" items="${qArr}" varStatus="status">
 <c:if test="${qna.secret eq 'N' or loginUser.email eq qna.email or loginUser.status eq 9}">
	 <tr>
	 <td>
	 	<c:if test="${qna.qna_ReList eq null or empty qna.qna_ReList}">미답변</c:if>
	 	<c:if test="${qna.qna_ReList ne null and not empty qna.qna_ReList}">답변완료</c:if>
	 </td>
	 	<td>
	 		<div class="accordion accordion-flush" id="accordionFlushExample">
  				<div class="accordion-item">
    			<h2 class="accordion-header" id="flush-heading${status.index}">
      				<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse${status.index}" aria-expanded="false" aria-controls="flush-collapse${status.index}">
      				${qna.qtitle}
      				</button>
    				</h2>
		    <div id="flush-collapse${status.index}" class="accordion-collapse collapse" aria-labelledby="flush-heading${status.index}" data-bs-parent="#accordionFlushExample">
		      <div class="accordion-body">${qna.qcontent}</div>
		    </div>
		  </div>
		</div>
	 	</td>
	 	<td>${qna.email}</td>
	 	<td>${qna.qdate }</td>
	 	<c:if test="${loginUser.email eq qna.email}">
	 	<td><button type="button">수정</button><button type="button" onclick="deleteQna('${qna.qidx}')">삭제</button></td>
	 	</c:if>
	 </tr>
	 <!-- 댓글 -->
 </c:if>
 <c:if test="${qna.secret eq 'Y' and loginUser.email ne qna.email and loginUser.status ne 9}">
 	<tr>
 		<td colspan="5">비밀 글입니다.</td>
 	</tr>
 </c:if>
 </c:forEach>
 </c:if>
</table>
</div>
