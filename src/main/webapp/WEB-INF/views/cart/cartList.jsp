<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/top.jsp"%>

<script>

$(function(){
	
	$('input:checkbox').prop('checked',false);
	
	
})
const edit = function(cidx){
	// ajax 요청으로 수정 요청 보내기
	let pqty = $('#pqty'+cidx).val();
	
	//0개로 수정 시 막기
	if(pqty == 0){
		alert('0개로는 수정할 수 없습니다');
		location.reload();
		return;
	}
	
	//alert(cidx +'/'+pqty);
	
	let url = "cartEdit"
	$.ajax({
		url:url,
		type:'post',
		dataType:'json',
		data:'cart_idx='+cidx+'&pqty='+pqty,
		cache:false,
		success:function(res){
			//alert(res);
			if(res.result>0){
				location.reload();
			} else {
				alert('수정에 실패하였습니다');
			}
		},
		error:function(err){
			alert("err : "+err.status);
		}
	}) 
}

const remove = function(cidx){
	// ajax 요청으로 삭제 요청 보내기
	
	let url = "cartDel"
		$.ajax({
			url:url,
			type:'post',
			dataType:'json',
			data:'cart_idx='+cidx,
			cache:false,
			success:function(res){
				//alert(res);
				if(res.result>0){
					location.reload();
				} else {
					alert('삭제에 실패하였습니다');
				}
			},
			error:function(err){
				alert("err : "+err.status);
			}
		}) 
}

const chageTotal = function(cidx){
	
	//체크박스 체크여부
	let isCheck = $('#cidx'+cidx).is(':checked');
	
	//체크된 상품의 총 가격	
	let total = Number($("#total"+cidx).text().replace(/[,원]/g, ""));
	
	//선택한 가격
	let selectTotal = Number($("#selectPrice").text().replace(/[,원]/g, ""));
	
	if(isCheck){
		selectTotal += total;
	} else{
		selectTotal -= total;
	}
	
	$("#selectPrice").html(selectTotal.toLocaleString('ko-KR')+" 원");
}

const submitCheck = function(){
	let sum = $('input:checkbox[name=cidx]:checked').length;
	let checkPqty = 1;
	$('input:checkbox[name=cidx]:checked').each(function(){
		let cidx = $(this).val();
		let pQty = $('#checkPqty'+cidx).text();
		if(pQty<=0) {
			checkPqty = 0;
			alert('장바구니 상품 중 품절된 상품이 있습니다.');
			return false;
		}
	})
	
	if(checkPqty == 0) return false;
	
	if(sum>0){
		return true;
	} 
	
	alert('상품을 선택해주세요');
	return false;
	
}

</script>

<div class="container" style="text-align: center">
	<div class="row">
		<div class="col-md-12">
			<h2 class="text-center m-4" style="margin: 1em">:::장바구니 목록:::</h2>
			<form action="${myctx}/user/cartOrder" method="post" onsubmit="return submitCheck()">
			<table class="table table-striped" id="products">
				<thead>
					<tr>
						<th>상품번호</th>
						<th>카테고리</th>
						<th data-sort="string">상품명</th>
						<th>이미지</th>
						<th data-sort="string">가 격</th>
						<th>수 량</th>
						<th>총 가격</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
					<!-- ------------------------ -->
					<c:if test="${cartArr eq null or empty cartArr}">
						<tr>
							<td colspan="8">
								장바구니에 담긴 상품이 없습니다<br>
								<a href="${myctx}/prod" class="btn btn-info">쇼핑하러가기</a>
							</td>
						</tr>
					</c:if>
					
					<c:if test="${cartArr ne null and not empty cartArr}">
						<c:forEach var="cart" items="${cartArr}" varStatus="status">
							<div id="checkPqty${cart.cart_idx}" style="display: none;">${cart.product.pqty}</div>
							<tr>
								<td>
									<c:if test="${cart.product.pqty <= 0}">품절</c:if>
									<c:if test="${cart.product.pqty > 0}">
									<input type="checkbox" id="cidx${cart.cart_idx}" name="cidx" value="${cart.cart_idx}" onclick="chageTotal('${cart.cart_idx}')"> ${cart.product.pidx}
									</c:if>
								</td>
								<td>${cart.product.upCg_name}>${cart.product.downCg_name}</td>
								<td>${cart.product.pname}</td>
								
								<td width="15%"><a href="#" target="_blank"> 
								<img src="${myctx}/resources/product_images/${cart.product.pimageList[0].pimage}"
									style="width: 90%; margin: auto" class="img-fluid"></a>
								</td>
								
								<td><del>
										정 가:
										<fmt:formatNumber value="${cart.product.price}" pattern="###,###" />
										원
									</del> <br> <b class="text-primary">판매가 : <fmt:formatNumber
											value="${cart.product.psaleprice}" pattern="###,###" /> 원
								</b><br> <span class="badge bg-danger">${cart.product.percent}
										%할인</span></td>
								<td width="10%"><input type="number" id="pqty${cart.cart_idx}" class="form-control mb-2" style="margin:auto" value="${cart.pqty}" style="width:40%"> 
									<button class="btn btn-outline-success btn-sm" type="button" onclick="edit('${cart.cart_idx}')" style="width:50%">수정</button>
									</td>
								<td><span id="total${cart.cart_idx}"><fmt:formatNumber value="${cart.ctotalprice}" pattern="###,###,### 원"/></span></td>
								<td><button class="btn btn-outline-danger" type="button" onclick="remove('${cart.cart_idx}')">삭제</button></td>
							</tr>
						</c:forEach>
					</c:if>
					<!-- ------------------------ -->
				</tbody>
			</table>
			<div class="text-right" style="text-align: right" id="cartTotalPrice">
				선택한 상품 가격 : <span id="selectPrice">0원</span><br>
				장바구니 총 가격 : <fmt:formatNumber value="${cartTotalPrice}" pattern="###,###,### 원"/><br>
				<input type="checkbox" id="growCheck" name="growCheck" value="Y"><label for="growCheck">키워주세요</label>
				<button class="m-3 btn btn-outline-info btn-lg">주문하기</button>
			</div>
			
			</form>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/foot.jsp"%>