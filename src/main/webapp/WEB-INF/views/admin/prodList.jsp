<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/top.jsp"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<link href="${myctx}/css/styles.css" rel="stylesheet" />
	
	<div class="container" style="text-align:center">
		
		<div class="row">
        <div class="col-md-12">
           <h1 class="text-center m-4" style="margin:1em">::Product List [Admin Page]:::</h1>
           
           <table class="table table-striped" id="products">
              <thead>
                 <tr>
                    <th>상품번호</th>
                    <th>카테고리</th>
                    <th data-sort="string">상품명</th>
                    <th>이미지</th>
                    <th data-sort="string">가    격</th>
                    <th>수정|삭제</th>
                 </tr>
              </thead>
              <tbody>
              <!-- ------------------------ -->
              <c:if test="${prodArr eq null or empty prodArr}">
              	<tr>
              		<td colspan="6">등록된 상품이 없습니다</td>
              	</tr>
             </c:if>
             <c:if test="${prodArr ne null and not empty prodArr}">
             	<c:forEach var="prod" items="${prodArr}">
                 <tr>   
                    <td>${prod.pnum}</td>
                    <td>
                    ${prod.upCg_name}>${prod.downCg_name}
                    </td>
                    <td>${prod.pname}</td>
                    <td width="15%">
                    <a href="a" target="_blank">
                   	<img src="../resources/product_images/${prod.pimage1}"
                   	 style="width:90%;margin:auto" class="img-fluid">
                    </a>
                    </td>
                    <td>
                    <del>정  가: 
                    <fmt:formatNumber value="${prod.price}" pattern="###,###"/>
                    원</del> 
                    <br>
                    <b class="text-primary">판매가 :
                    <fmt:formatNumber value="${prod.saleprice}" pattern="###,###"/>
                    원</b><br>
                    <span class="badge badge-danger">${prod.percent} %할인</span>
                    </td>
                    <td>
                    <a href="javascript:edit('${prod.pnum}')">수정</a>|
                    <a href="#" onclick="remove('${prod.pnum}')">삭제</a>
                    </td>
                 </tr>
                 </c:forEach>
              </c:if>                   
            <!-- ------------------------ -->                 
              </tbody>
              
           </table>
        </div>
      </div>
		
	</div>

<%@ include file="/WEB-INF/views/foot.jsp"%>