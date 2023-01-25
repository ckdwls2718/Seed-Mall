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
</script>
<style>
	td{
		vertical-align: middle;
	}
</style>
<%@ include file="/WEB-INF/views/top.jsp"%>
<div class="d-flex">
	<%@ include file="/WEB-INF/views/member/mypageSidebar.jsp"%>
	<div class="container" style="width: 1100px; margin:auto; margin-top:0;">
		
			<div class="col-md-12">
				<h2 style="	font-size: calc(1.325rem + .9vw); margin: 70px 0px 40px 0px;font-family: 'Noto Sans KR', sans-serif; font-weight: bold; /* color: #39b559; */text-align: center;">내가 쓴 문의글</h2>
				<table class="table table-striped" id="products"style="text-align: center;">
					<thead >
						<tr>
							<th style="width:10%">상태</th>
							<th style="width:25%">상품</th>
							<th style="width:50%">제목</th>
							<th style="width:15%">작성일</th>
						</tr>
					</thead>
					<tbody>
						<!-- ------------------------ -->
						<c:if test="${qArr eq null or empty qArr}">
							<tr>
								<td colspan="4">문의한 내용이 없습니다</td>
							</tr>
						</c:if>

						<c:if test="${qArr ne null and not empty qArr}">
							<form id="odF" action="order" method="post">
								<input type="hidden" name="oidx">
								<div class="accordion accordion-flush" id="accordionFlushExample">
								<c:forEach var="qna" items="${qArr}" varStatus="status">
										
										<tr>
										<td>
											<c:if test="${qna.isCom ne 'Y'}">미답변</c:if>
											<c:if test="${qna.isCom eq 'Y'}">답변완료</c:if>
										</td>
										<td><a href="${myctx}/prod/${qna.product.pidx}">
											<img style="width: 100px; margin: auto" class="img-fluid"
											src="${myctx}/resources/product_images/${qna.product.pimageList[0].pimage}">
											</a>
										</td>
										
										<td width="60%">
										${qna.qcontent }
										</td>
										<td>${qna.qdate}</td>
										<td><button type="button" onclick="deleteQna('${qna.qidx}')">삭제</button></td>
										</tr>
										<c:if test="${qna.isCom eq 'Y'}">
										<c:forEach var="reply" items="${qna.qna_ReList}">
											<tr>
												<td><img src="${myctx}/resources/img/answer.png"></td>
												<td colspan="2">${reply.re_qcontent}</td>
												<td colspan="2">${reply.re_qdate}</td>
											</tr>
										</c:forEach>
										</c:if>
										

								</c:forEach>
								</div>
							</form>
						</c:if>
						<!-- ------------------------ -->
					</tbody>
				</table>
			
		</div>
	</div>
		<div style="width:230px;"></div>
</div>
<%@ include file="/WEB-INF/views/foot.jsp"%>