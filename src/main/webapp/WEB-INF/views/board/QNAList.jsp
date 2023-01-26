<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="myctx" value="${pageContext.request.contextPath}" />
<script>

$(function(){
	
}) //window------------

const deleteQna = function(qidx){
	
	let myctx = "${myctx}";
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
	let myctx = "${myctx}";
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

<style>
	td{
		vertical-align: middle;
	}
</style>
<div class="container" >
<ul class="nav nav-tabs">
  <li class="nav-item">
    <a class="nav-link" href="#1">상품상세</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#2">상품리뷰</a>
  </li>
  <li class="nav-item">
    <a class="nav-link active" aria-current="page" href="#3" name="3">상품문의</a>
  </li>
</ul>
<br>
<h4>상품 문의</h4>
<ul style="font-size: 0.8rem; padding-left: 20px">
	<li>구매한 상품의 취소/반품은 마이페이지에서 신청 가능합니다.</li>
	<li>상품문의 및 후기게시판을 통해 취소나 환불, 반품 등은 처리되지 않습니다.</li>
	<li>가격, 판매자, 교환/환불 및 배송 등 해당 상품 자체와 관련 없는 문의는 고객센터 내 1:1 문의하기를 이용해주세요.</li>
	<li>"해당 상품 자체"와 관계없는 글, 양도, 광고성, 욕설, 비방, 도배 등의 글은 예고 없이 이동, 노출제한, 삭제 등의 조치가 취해질 수 있습니다.</li>
	<li>공개 게시판이므로 전화번호, 메일 주소 등 고객님의 소중한 개인정보는 절대 남기지 말아주세요.</li>
</ul>

<hr>

<c:if test="${loginUser ne null}">
<form id="qnaF">
<input type="hidden" name="midx" value="${loginUser.midx}">
<input type="hidden" name="pidx" value="${prod.pidx}">
<div class="mb-3" >
  <label for="qcontent" class="form-label">문의 내용</label>
  <div class="form-check form-switch">
  <input class="form-check-input" type="checkbox" id="secret" name="secret" value="Y"> 
  <label class="form-check-label" for="secret">비밀글</label>
  </div>
  
  <textarea class="form-control" id="qcontent" name="qcontent" rows="3" required style="width:70%;display: inline-block;"></textarea>
  <button class="btn btn-success btn-lg mb-5" type="button" onclick="insertQNA()">등록</button>
</div>


</form>
</c:if>
<c:if test="${loginUser eq null}">
<a class="btn btn-outline-info" href="${myctx}/login">로그인 하러 가기</a>
</c:if>

<hr style="3px">

<!-- 상품 문의 리스트 -->
<div id="qnaList" class="mb-5">
<table class="table">
 <tr>
 	<th>상태</th>
  	<th>내용</th>
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
 <c:if test="${qna.secret eq 'N' or loginUser.midx eq qna.midx or loginUser.status eq 9}">
	 <tr>
	 <td>
	 	<c:if test="${qna.isCom ne 'Y'}">미답변</c:if>
	 	<c:if test="${qna.isCom eq 'Y'}">답변완료</c:if>
	 </td>
	 	<td>${qna.qcontent}</td>
	 	<td>${qna.email}</td>
	 	<td>${qna.qdate }</td>
	 	<c:if test="${loginUser.midx eq qna.midx}">
	 	<td><button class="btn btn-info" type="button" onclick="deleteQna('${qna.qidx}')">삭제</button></td>
	 	</c:if>
	 </tr>
	 <!-- 댓글 -->
	 <c:if test="${qna.isCom eq 'Y'}">
										<c:forEach var="reply" items="${qna.qna_ReList}">
											<tr>
												<td><img src="${myctx}/resources/img/answer.png"></td>
												<td colspan="2">${reply.re_qcontent}</td>
												<td>${reply.re_qdate}</td>
											</tr>
										</c:forEach>
										</c:if>
 </c:if>
 <c:if test="${qna.secret eq 'Y' and loginUser.midx ne qna.midx and loginUser.status ne 9}">
 	<tr>
 		<td colspan="5">비밀 글입니다.</td>
 	</tr>
 </c:if>
 </c:forEach>
 </c:if>
</table>
</div>
</div>
