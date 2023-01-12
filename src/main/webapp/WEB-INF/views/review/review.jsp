<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!--  ---------------------------------------------------------- -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- function taglib------------------------------------------- -->
<script>

$(function(){
	listReview();
}) //window------------


const insertReview = function(){
	let rStr = $('#rnaF').serialize();
	alert(rStr); 
	let myctx = "${pageContext.request.contextPath}";
	url= myctx+"/review";
	
	$.ajax({
		url:url,
		type:'post',
		dataType:'json',
		data:rStr,
		cache:false,
		success:function(res){
			//alert(res);
			if(res>0){
				//location.reload();
				listReview();
			}
		},
		error:function(err){
			alert('err : '+err.status);
		}
	})
}

const listReview =function(){
	$('#a').html("리뷰 목록 들어올 예정");
}
</script>

<div class="container">
<ul class="nav nav-tabs">
  <li class="nav-item">
    <a class="nav-link" href="#">상품상세</a>
  </li>
  <li class="nav-item">
    <a class="nav-link active" aria-current="page" href="#">상품리뷰</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">상품문의</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
  </li>
</ul>
<h1>상품 리뷰</h1>


<c:if test="${loginUser ne null}">
<form id="rnaF">
<input type="text" name="midx" value="${loginUser.midx}">
<input type="text" name="ridx" value="${prod.pidx}">
<input type="text" name="oidx" value="2">
<div class="mb-3">
  <label for="rtitle" class="form-label">제목</label>
  <input type="text" class="form-control" id="rtitle" name="rtitle" required>
</div>
<div class="mb-3">
  <label for="rcontent" class="form-label">내용</label>
  <textarea class="form-control" id="rcontent" name="rcontent" rows="3" required></textarea>
</div>
<button class="btn btn-info" type="button" onclick="insertReview()">등록</button>
</form>
</c:if>
<table class="table">
 <tr>
 	<th>상태</th>
  	<th>제목</th>
  	<th>작성자</th>
  	<th>작성일</th>
 </tr>
 </table>
 <c:if test="${rArr eq null or empty rArr}">
 	<table>
 	<tr>
 		<td colspan="4" id="a">등록된 리뷰가 없습니다</td>
 	</tr>
 	</table>
 </c:if>
 
 </table>
</div>