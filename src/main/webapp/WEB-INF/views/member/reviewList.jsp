<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
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

const reviewDetail = function(ridx){
	$('input[name=ridx]').val(ridx);
	reF.submit();
}
</script>
<%@ include file="/WEB-INF/views/top.jsp"%>
<div class="d-flex">
	<%@ include file="/WEB-INF/views/member/mypageSidebar.jsp"%>
	<div class="container" style="text-align: center">
		<div class="row">
			<div class="col-md-12">
				<h2 class="text-center m-4" style="margin: 1em">:::나의 리뷰 목록:::</h2>
				<table class="table table-striped" id="products">
					<thead>
						<tr>
							<th>내용</th>
							<th>추천수</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<!-- ------------------------ -->
						<c:if test="${reviewArr eq null or empty reviewArr}">
							<tr>
								<td colspan="4">작성한 리뷰가 없습니다</td>
							</tr>
						</c:if>

						<c:if test="${reviewArr ne null and not empty reviewArr}">
							<form id="reF" action="review" method="post">
								<input type="hidden" name="ridx">
								
								<c:forEach var="review" items="${reviewArr}" varStatus="status">	
										<tr>
										<td width="60%">
										<div class="mb-3">
											<img style="width: 70px" src="${myctx}/resources/product_images/${review.prod.pimageList[0].pimage}"> 
											<a class="btn btn-default" href="${myctx}/prod/${review.prod.pidx}">${review.prod.pname}</a> 
										</div>
										<div class="mb-2">
											<c:forEach begin="1" end="${review.score}"><img src="${myctx}/resources/Review_image/star.png" width="20"></c:forEach><br>
											<b>${review.rtitle}</b><br>
											${review.rcontent}
										</div>
										<div >
											<c:forEach  var="image" items="${review.boardReviewImageList}">
											<img style="width:100px" src="src=${myctx}/resources/Review_image/${image.rimage}">
											</c:forEach>
										</div>
										</td>
										
										<td>
											${review.rlikenum }
										</td>
										<td>${review.rdate}</td>
										</tr>
									</c:forEach>		
							</form>
						</c:if>
						<!-- ------------------------ -->
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/foot.jsp"%>