<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script>
const updateNick = function(){
	let qStr = $('#plantF').serialize();
	//alert(qStr);
	
	$.ajax({
		type:'post',
		url:'updateNick',
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
			alert('err:'+err.status);
		}
	})
}
</script>
<%@ include file="/WEB-INF/views/top.jsp"%>

<div class="d-flex">
<%@ include file="/WEB-INF/views/member/mypageSidebar.jsp"%>
	<div class="container">
		<div id="plantInfo">
		<form id="plantF" method="post">
		<input type="hidden" name="plant_idx" value="${plant.plant_idx}">
		<table class="table">
			<tr>
				<th colspan="3">내 식물 정보</th>
			</tr>
			<tr>
				<td>이름</td>
				<td>${plant.nickname}</td>
				<td><input class="form-control" type="text" name="nickname" placeholder="수정할 이름을 입력하세요" required></td>
				<td><button type="button" onclick="updateNick()">수정</button></td>
			</tr>
			<tr>
				<td>성장률</td>
				<td>${plant.percent}% 자랐음</td>
			</tr>
			<tr>
				<td>관리자의 한마디</td>
				<td>${plant.pcomment}</td>
			</tr>
			<tr>
				<td>주문 날짜</td>
				<td>${plant.pdate}</td>
			</tr>
		</table>
		</form>
		</div>
		<hr style="color: green;" size="10">
		<div id="image_history" class="text-center">
		<h1>식물 히스토리</h1>
		<div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel" style="width:50%;margin:auto">
  <div class="carousel-indicators">
  <c:forEach var="image" items="${plant.plantImageList}" varStatus="status">
    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="${status.index}" <c:if test="${status.last eq true}"> class="active" aria-current="true" </c:if> aria-label="Slide ${status.count}"></button>
  </c:forEach>
  </div>
  <div class="carousel-inner">
  	<c:forEach var="image" items="${plant.plantImageList}" varStatus="status">
    <div class="carousel-item <c:if test="${status.last eq true}">active </c:if>" data-bs-interval="10000">
      <img src="${myctx}/resources/plant_images/${image.pimage }" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block" style="top:0;right:0;left:60%;padding-top:0; color:black;">
        <h5>${image.piDate}</h5>
      </div>
    </div>
    </c:forEach>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>

</div>
	</div>

</div>



<%@ include file="/WEB-INF/views/foot.jsp"%>