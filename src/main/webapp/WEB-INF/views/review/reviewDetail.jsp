<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/top.jsp"%>

<script>
const edit = function(){
	bf.action="reviewUpdate";
	bf.submit();
	
}

const delete1 = function(){
	// input 태그의 name이 ridx인 값을 가져온다.
	let ridx = $('input[name=ridx]').val();
	
	//쿼리 스트링 생성
	let qStr = 'ridx='+ridx;
	
	$.ajax({
		url:'reviewDelete',
		type:'post',
		data:qStr,
		dataType:'json',
		cache:false,
		success:function(res){
			//alert(res);
			if(res>0){
				alert('삭제성공');
				history.back();
			}
		},
		error:function(err){
			alert('err:'+err.status);
		}
		
	})
}


</script>
<form name="bf" id="bf" role="form" method="POST" >
   <input type="hidden" name="midx" value="${loginUser.midx}">
   <input type="hidden" name="ridx" value="${Review.ridx}">     
    <table class="table">
       <tr>
          <td style="width:20%"><b>제목</b></td>
          <td style="width:80%">
           ${Review.rtitle }
          </td>
       </tr>
       <tr>
          <td style="width:20%"><b>글쓴이</b></td>
          <td style="width:80%">
          ${Review.email}
          </td>
       </tr>       
       <tr>
          <td style="width:20%"><b>글내용</b></td>
          <td style="width:80%">
          ${Review.rcontent} 
          </td>
       </tr>     
      
      <c:if test="${loginUser.midx eq Review.midx}">
      <tr>
         <td colspan="2">
         
<!--             <button type="button" class="btn btn-success" onclick="edit()">리뷰 수정</button> -->
            <button type="button" class="btn btn-danger" onclick="delete1()">리뷰 삭제</button>
                       
         </td>
      </tr>
   	  </c:if>	
      </table>
</form>  

<%@ include file="/WEB-INF/views/foot.jsp"%>