<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/top.jsp"%>
<style>
	a.thumbnail>img:hover{
		border:10px solid silver;
	}
</style>
<script>
/* $.(function(){
	
})//---window */

const changeImage = function(idx){
	let url = $('#thumbnailImage'+idx).attr('src');
	//alert(url);
	$('#prodImage>div>img').attr('src',url);
}

const changePrice = function(qty){
	
	
	let price = qty*70000;
	//alert(price);
	
	$('#priceSum').html(price);
}
</script>

<div class='container d-flex'>
	<div id="leftDetail" class="m-3" style="width: 60%">
		<div id="prodImage" style="width: 100%">
			<div class="m-3">
				<img class="img-fluid" style="width:480px;height:360px"
					src="https://cdn.crowdpic.net/list-thumb/thumb_l_4291713E6EC8D22461618B2107D30880.jpg">
			</div>
			<!-- thumnail -->
			<div class="row">
				<div class="col-xs col-md-2">
					<a href="#" onclick="changeImage(1)" class="thumbnail"> <img id="thumbnailImage1" class="img-fluid" style="width:100px; height:100px"
						src="https://cdn.crowdpic.net/list-thumb/thumb_l_4291713E6EC8D22461618B2107D30880.jpg">
					</a>
				</div>
				<div class="col-xs col-md-2">
					<a href="#" onclick="changeImage(2)" class="thumbnail"> <img id="thumbnailImage2" class="img-fluid" style="width:100px; height:100px"
						src="https://cloudfront-ap-northeast-1.images.arcpublishing.com/chosun/UEHMTNLTLU2GPM5REEDSORFZXQ.jpg">
					</a>
				</div>
				<div class="col-xs col-md-2">
					<a href="#" onclick="changeImage(3)" class="thumbnail"> <img id="thumbnailImage3" class="img-fluid" style="width:100px; height:100px"
						src="https://cdnweb01.wikitree.co.kr/webdata/editor/202004/07/img_20200407162305_1f42c686.webp">
					</a>
				</div>
				<div class="col-xs col-md-2">
					<a href="#" onclick="changeImage(4)" class="thumbnail"> <img id="thumbnailImage4" class="img-fluid" style="width:100px; height:100px"
						src="https://blog.kakaocdn.net/dn/tEMUl/btrDc6957nj/NwJoDw0EOapJNDSNRNZK8K/img.jpg">
					</a>
				</div>
				<div class="col-xs col-md-2">
					<a href="#" onclick="changeImage(5)" class="thumbnail"> <img id="thumbnailImage5" class="img-fluid" style="width:100px; height:100px"
						src="https://www.shutterstock.com/ko/blog/wp-content/uploads/sites/17/2019/03/91.jpg">
					</a>
				</div>
			</div>
		</div>
	</div>
	<div id="rightDetail" class="m-3" style="width: 40%">
		<!--right information-->
		<div id="prodName">
			<h2>식물이름</h2>
		</div>
		<div class="starBox">
			<!-- <span><img src="/app/layout/web/images/icon_rating.png"></span> -->
			<span class="point">0.0 </span><span>후기 0</span>
		</div>
		<br>
		<div class="discountBox">
			<div class="bt20">
				<h1 id="price"><fmt:formatNumber value="70000" pattern="###,###,### 원" /></h1>
			</div>
		</div>
		<table class="table">
			<tbody>
				<tr>
					<th>배송비</th>
					<td>4,000원 (기본배송비 적용)</td>
				</tr>
				<tr>
					<th>재고수량</th>
					<td>1 개</td>
				</tr>
			</tbody>
		</table>
		<div id="optionSetList">
			<input type="number" value="1" min="1" max="99" onchange="changePrice(this.value)">
		</div>
		<div class="text-right">
			<div>주문금액</div>
			<div id="total">
				<span id="priceSum"> 70,000 </span> <span>원</span>
			</div>
		</div>
		<div class="halfFullButton">
			<div class="halfCell text-center">
				<button class="btn btn-outline-success btn-lg" type="button">주문하기</button>
			</div>
		</div>
	</div>
	<!--right-->
</div>


<%@ include file="/WEB-INF/views/foot.jsp"%>