<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script>
	const detailPlant = function(pidx) {
		$('input[name=pidx]').val(pidx);
		pdF.submit();
	}
</script>
<%@ include file="/WEB-INF/views/top.jsp"%>

<div class="d-flex">
	<%@ include file="/WEB-INF/views/admin/adminPageSidebar.jsp"%>

<main class="container m-3" style="width:70%">
	<div class="row"><h2>${stateStr}</h2> <p>검색된 식물 : ${page.totalCount}건</p></div>
	<div>
		<form>
		<input type="hidden" name="findState" value="${page.findState}">
		<div class="form-row">
			<div class="col-8">
			<input class="form-control" type="text" name="findKeyword" placeholder="주문자 이메일을 입력해주세요" value="${page.findKeyword}">
			</div>
			<div class="col-2">
			<button class="btn btn-info">검색</button>
			</div>
			<div class="col-2">
			<select class="form-control" name="findType" style="width:150px" onchange="submit()">
				<option value="1" <c:if test="${page.findType eq 1}">selected</c:if>>최신순</option>
				<option value="2" <c:if test="${page.findType eq 2}">selected</c:if>>오래된순</option>
				<option value="3" <c:if test="${page.findType eq 3}">selected</c:if>>성장률 높은순</option>
				<option value="4" <c:if test="${page.findType eq 4}">selected</c:if>>성장률 낮은순</option>
			</select>
			</div>
		</div>
		</form>
	</div>
  <div class="album py-5 bg-light">
    <div class="container">
    	
      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
      <c:if test="${plantArr eq null or empty plantArr}">
      <p class="lead text-muted">식물이 없습니다</p>
      </c:if>
      
      <c:if test="${plantArr ne null and not empty plantArr}">
      
      <c:forEach var="plant" items="${plantArr}">
        <div class="col">
          <div class="card shadow-sm">
            <img src="${myctx}/resources/plant_images/${plant.plantImage}">
            <div class="card-body">
              <h4 class="cart-text">${plant.nickname}</h4><small class="text-muted"><b>${plant.percent}%</b></small>
              <p class="card-text">${plant.pcomment}</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button class="btn btn-sm btn-outline-secondary" type="button" onclick="detailPlant('${plant.plant_idx}')">상세보기</button>
                </div>
                <small class="text-muted">${plant.pdate}</small>
              </div>
            </div>
          </div>
        </div>
        </c:forEach>
         
        </c:if>
		<!-- --------------------- -->
      </div>
    </div>
  </div>
    <div class="mt-2">
	 ${pageNavi}
	</div>

</main>

</div>
<form id="pdF" action="plantManagementDetail" method="post">
	<input type="hidden" name="pidx" id="pidx">
</form>

<%@ include file="/WEB-INF/views/foot.jsp"%>