<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!--  ---------------------------------------------------------- -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- function taglib------------------------------------------- -->
<c:set var="myctx" value="${pageContext.request.contextPath}" />
<script>

/* $(function(){
	listReview();
}) //window------------
 */

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

const Like = function(ridx){
	/* alert("dsfsdfsd") */
	let btn=$(event.currentTarget);
	let btnTxt=$(event.currentTarget).text();
	//alert(btnTxt)
	
	$('input[name=ridx]').val(ridx);
	let qs=$('#bf').serialize();
	/* alert(qs) */
	/* alert(qs) */
	if(btnTxt=='추천!'){
	$.ajax({
		url:'../review/reviewLikeNum',
		type:'post',
		data:qs,
		dataType:'json',
		cache:false,
		success:function(res){
			/* alert(res)  */
			if(res>0){
				alert('추천!');
				btn.text("추천 취소!");
			}
			//$("#like").hide();
		//	$("#likeC").show();
			
		},
		error:function(err){
			alert("err:"+err.status);
		}
	})
	}else if(btnTxt=='추천 취소!'){
		LikeC();
	}
}

const LikeC = function(){
	
	
	/* alert(qs) */
	let btn=$(event.currentTarget);
	let btnTxt=$(event.currentTarget).text();
	alert(btnTxt)
	
	let qs=$('#bf').serialize();
	$.ajax({
		url:'../review/reviewLikeNumCancel',
		type:'post',
		data:qs,
		dataType:'json',
		cache:false,
		success:function(res){
			/* alert(res) */;
			if(res>0){
				alert('추천 취소!');
				btn.text("추천!");
			}
			//$("#like").show();
			//$("#likeC").hide();
			
		},
		error:function(err){
			alert("err:"+err.status);
		}
	})
}
	 
</script>
<style>
.img-fluid1:hover{
 	transform: scale(2);
 }
 
 .re{ margin:1em;
 
 }
 .re1{
 margin:1.2em 0px;
 }
 .retitle{
 font-weight:bold;
 
 margin:0.7em 0px;
 }
 .re23{
 font-size:21px;
 }

 
</style>
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

<form name="bf" id="bf" role="form" method="post" >
<input type="hidden" name="ridx" value=""> 
<c:forEach var="Review" items="${rarr}">
<div class='review main'> 
<article class='re' >
<c:if test="${rarr ne null and not empty rarr}"/>
<%-- <input type="hidden" name="rlikenum" value="${Review.rlikenum}">  --%>


<div class='re2'>작성자: <c:out value="${Review.email}" /></div>
<div class='re23'><img src="${myctx}/resources/Review_image/star.jpg" width="20">:<c:out value="${Review.score}"/></div>
<div class='re2'>작성일: <c:out value="${Review.rdate}" /></div>

<div>
<c:forEach var="image" items="${Review.boardReviewImageList}">
								<img src="${myctx}/resources/Review_image/${image.rimage}" class="img-fluid1" style="width:200px">
							</c:forEach>
							</div>
							
<div class='retitle'><c:out value="${Review.rtitle}" /> </div>
<div class='re1' style="white-space:pre-wrap"><c:out value="${Review.rcontent} " /> </div>

<div>
<c:out value="${Review.rlikenum}"/>명이 추천합니다!
 <button type="button" id="like" class="btn btn-success" onclick="Like('${Review.ridx}')">추천!</button>
 </div>
<hr>



</article>

</div>
</c:forEach>

 <c:if test="${rarr eq null or empty rarr}">
 	<table>
 	<tr>
 		<td colspan="4" id="a">등록된 리뷰가 없습니다</td>
 	</tr>
 	</table>	
 </c:if>

</form>  
</div>