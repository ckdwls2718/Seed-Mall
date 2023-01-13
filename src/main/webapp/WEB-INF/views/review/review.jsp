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

<table class="table">
 <tr>
 	<!-- <th>글번호</th> -->
  	<th>제목</th>
  	<th>평가점수</th>
  	<th>작성자</th>
  	<th>작성일</th>
  	<th>조회수</th>
  	 <c:if test="${rarr ne null and not empty rarr}">
  	<c:forEach var="Review" items="${rarr}">
					<tr>
						<%-- <td><c:out value="${Review.ridx}" /></td> --%>
						<td><a href="${pageContext.request.contextPath}/review/ReviewGet?ridx=${Review.ridx}">${Review.rtitle}</a>
						</td>
						<td><c:out value="${Review.score}" /></td>
						<td><c:out value="${Review.email}" /></td>
						<td><c:out value="${Review.rdate}" /></td>
						<td><c:out value="${Review.rreadnum}" /></td>
					</tr>
				</c:forEach>
			</c:if>
 </tr>
 </table>
 <c:if test="${rarr eq null or empty rarr}">
 	<table>
 	<tr>
 		<td colspan="4" id="a">등록된 리뷰가 없습니다</td>
 	</tr>
 	</table>
 </c:if>

 <table>
				
 </table>
</div>