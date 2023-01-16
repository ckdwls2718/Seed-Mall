<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/top.jsp"%>
<script>
const showRe = function(qidx){
	$('#reply'+qidx).show(1000);
}

const reply = function(qidx){
	let rcontent = $('#reContent'+qidx).val();
	
	$('input[name=qidx]').val(qidx);
	$('#re_qcontent').val(rcontent);
	
	
	let qStr = decodeURIComponent($('#reF').serialize());
	
	$.ajax({
		url:'${myctx}/admin/QNA',
		type:'post',
		data:qStr,
		dataType:'json',
		cache:false,
		success:function(res){
			//alert(res);
			if(res>0){
				location.reload();
			}
		},
		error:function(err){
			alert('err:'+err.status);
		}
	})
}

const deleteRe = function(re_qidx){
	$.ajax({
		url:'${myctx}/admin/QNA/del',
		type:'post',
		data:'re_qidx='+re_qidx,
		dataType:'json',
		cache:false,
		success:function(res){
			//alert(res);
			if(res>0){
				location.reload();
			}
		},
		error:function(err){
			alert('err:'+err.status);
		}
	})
}

</script>
<div class="d-flex">
<%@ include file="/WEB-INF/views/admin/adminPageSidebar.jsp"%>
<div class="container">
	<div class="row">
			<div class="col-md-12">
				<h2 class="text-center m-4" style="margin: 1em">:::나의 QNA 목록:::</h2>
				<table class="table" id="products">
					<thead>
						<tr>
							<th>상태</th>
							<th>상품</th>
							<th colspan="2">문의내용</th>
						</tr>
					</thead>
					<tbody>
						<!-- ------------------------ -->
						<c:if test="${qArr eq null or empty qArr}">
							<tr>
								<td colspan="4">문의 내역이 없습니다</td>
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
										
										<td width="60%" >
										<div style="width:100%; background-color:#494e5270">
											<div style="background-color: #494e5270;">
												<div style="display:inline-block ;width:70%">
													${qna.email} <br>
													${qna.product.pname}
													<div style="display:inline-block ;font-size: 0.7rem">
													 ${qna.qdate}
													</div>
												</div> 
												
											</div>
											${qna.qcontent}
										</div>
										
										
										</td>
										
										<td><button type="button" onclick="showRe('${qna.qidx}')">▼</button></td>
										</tr>
										<c:if test="${qna.isCom eq 'Y'}">
										<c:forEach var="reply" items="${qna.qna_ReList}">
										<tr>
											<td>└답변</td>
											<td colspan="2">
											<div style="width:100%; background-color:#494e5270">
												<div style="background-color: #494e5270;">
													<div style="display:inline-block ;width:70%">
														관리자 <br>
														<div style="display:inline-block ;font-size: 0.7rem">
														 ${reply.re_qdate}
														</div>
													</div> 
													
												</div>
												${reply.re_qcontent}
											</div>
										</td>
										<td><button type="button" onclick="deleteRe('${reply.re_qidx}')">삭제</button></td>
										</tr>
										</c:forEach>
										</c:if>
										<tr id="reply${qna.qidx}" style="display: none">
											<td colspan="3">
											<textarea rows="3" cols="10" id="reContent${qna.qidx}" class="form-control"></textarea>
											</td>
											<td>
												<button type="button" onclick="reply('${qna.qidx}')">답변완료</button>
											</td>

										</tr>
										
								
								</c:forEach>
								</div>
							</form>
						</c:if>
						<!-- ------------------------ -->
					</tbody>
				</table>
			</div>
		</div>
		<div id="pageNavi">
				${pageNavi}
		</div>
</div>

</div>
<form id="reF">
	<input type="hidden" name="qidx">
	<input type="hidden" name="midx" value="${loginUser.midx}">
	<textarea rows="3" cols="10" name="re_qcontent" id="re_qcontent" style=display:none></textarea>
</form>
<%@ include file="/WEB-INF/views/foot.jsp"%>