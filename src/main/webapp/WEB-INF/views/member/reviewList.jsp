<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
$(function(){
	
})

const reviewDetail = function(ridx){
	$('input[name=ridx]').val(ridx);
	reF.submit();
}
</script>
<%@ include file="/WEB-INF/views/top.jsp"%>
<div class="d-flex">
	<%@ include file="/WEB-INF/views/member/mypageSidebar.jsp"%>
	<div class="container" style="text-align: center; width:1000px;" >
		<div class="row">
			<div class="col-md-12">
				<h2 style="	font-size: calc(1.325rem + .9vw); margin: 70px 0px 40px 0px;font-family: 'Noto Sans KR', sans-serif; font-weight: bold; /* color: #39b559; */text-align: center;">작성한 리뷰</h2>
				<table class="table table" id="products"style="text-align: center;">
					<thead>
						<tr style="background: #0000000d; ">
							<th width="70%">내용</th>
							<th width="10%">추천수</th>
							<th width="20%">작성일</th>
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
												<img style="width:200px" src="${myctx}/resources/Review_image/${image.rimage}">
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
			<div style="width: 230px;"></div>
</div>
<%@ include file="/WEB-INF/views/foot.jsp"%>