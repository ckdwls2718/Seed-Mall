<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
function setThumbnail(event) {
    for (var image of event.target.files) {
      var reader = new FileReader();

      reader.onload = function(event) {
        var img = document.createElement("img");
        img.setAttribute("src", event.target.result);
        img.setAttribute("width", "45%");
        img.setAttribute("height", "45%");
        //document.querySelector("div#image_container").appendChild(img);
        $('#image_container').html(img);
      };

      console.log(image);
      reader.readAsDataURL(image);
    }
  }

</script>
<%@ include file="/WEB-INF/views/top.jsp"%>

<div class="d-flex">
<%@ include file="/WEB-INF/views/admin/adminPageSidebar.jsp"%>
<div class="container">
<form action="plantManagementUpdate" method="post" enctype="multipart/form-data">
<input type="hidden" name="plant_idx" value="${plant.plant_idx}">
	<table class="table">
		<tr>
			<th colspan="3">구매자 정보</th>
		</tr>
		<tr>
			<th>이름</th>
			<th>이메일</th>
			<th>식물이름</th>
			<th>구매일자</th>
		</tr>
		<tr>
			<td>${plant.mname}</td>
			<td>${plant.email}</td>
			<td>${plant.nickname}</td>
			<td>${plant.pdate}</td>
		</tr>
	</table>
	<table class="table">
		<tr>
			<th>종류</th>
			<th>수정 전</th>
			<th>수정 후</th>
		</tr>
		<tr>		
			<td>멘트</td>
			<td>${plant.pcomment }</td>
			<td><input type="text" name="pcomment" value="" required></td>
		</tr>
		<tr>		
			<td>퍼센트</td>
			<td>${plant.percent}%</td>
			<td><input type="number" name="percent" value="" required></td>
		</tr>
		<tr>		
			<td>이미지</td>
			<td><img src="${myctx}/resources/plant_images/${plant.plantImage}" width="300px" ></td>
			<td><input type="file" name="plantImage" onchange="setThumbnail(event)" required><div id="image_container" ></div></td>
		</tr>
	
	</table>
	<div class="m-3 text-center">
	<button class="btn btn-outline-success">수정하기</button>
	<button class="btn btn-outline-info" type="reset">다시 쓰기</button>
	</div>
</form>
<hr color="green">
<div class="text-center">
<h2>식물 기록</h2>
<div id="carouselExampleDark" class="carousel slide" data-bs-ride="carousel" style="width:50%">
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