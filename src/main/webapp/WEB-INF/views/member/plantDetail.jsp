<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/top.jsp"%>

<div class="d-flex">
<%@ include file="/WEB-INF/views/member/mypageSidebar.jsp"%>
	<div class="container">
	
<div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel" style="width:50%">
  <div class="carousel-indicators">
  <c:forEach var="image" items="${plant.plantImageList}" varStatus="status">
    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="${status.index}" <c:if test="${status.last eq true}"> class="active" aria-current="true" </c:if> aria-label="Slide ${status.count}"></button>
  </c:forEach>
  </div>
  <div class="carousel-inner">
  	<c:forEach var="image" items="${plant.plantImageList}" varStatus="status">
    <div class="carousel-item <c:if test="${status.last eq true}">active </c:if>" data-bs-interval="10000">
      <img src="${myctx}/resources/plant_images/${image.pimage }" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
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
	
		<div id="plantInfo">
			<input type="text" name="nickname" value="${plant.nickname}"> <button>이름 수정하기</button>
			<h1>${plant.percent}% 자랐음</h1>
			<h1>관리자 멘트 : ${plant.pcomment}</h1>
			<h1>주문 날짜 : ${plant.pdate}</h1>
		</div>
	
	</div>

</div>



<%@ include file="/WEB-INF/views/foot.jsp"%>