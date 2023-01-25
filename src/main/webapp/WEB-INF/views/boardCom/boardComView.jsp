<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/top.jsp"%>

<script>
const edit = function(){
	bf.action="update";
	bf.submit();
	
}

const delete1 = function(){
	bf.action="delete";
	alert('삭제되었습니다');
	bf.submit();
}


</script>
<div class="container mt-3" >
<form name="bf" id="bf" role="form" method="POST" >
   <input type="hidden" name="midx" value="${loginUser.midx}">
   <input type="hidden" name="cidx" value="${boardCom.cidx}">      
    <table class="table">
       <tr>
          <td style="width:10%"><b>제목</b></td>
          <td style="width:40%">
           ${boardCom.ctitle }
          </td>
       </tr>
       <tr>
          <td style="width:20%"><b>작성자</b></td>
          <td style="width:80%">
          ${boardCom.email}
          </td>
       </tr>       
       <tr style="min-height: 300px">
          <td style="width:20%"><b>글내용</b></td>
          <td style="width:80%">
          ${boardCom.ccontent} 
          </td>
       </tr>     
      
      <c:if test="${loginUser.midx eq boardCom.midx}">
      <tr>
         <td colspan="3" class="text-center">  
            <button type="button" type="button" class="btn btn-success" onclick="edit()">글수정</button>
            <button type="button" type="button" class="btn btn-danger" onclick="delete1()">글삭제</button>                   
         </td>
      </tr>
   	  </c:if>

   	  	
      </table>
</form>  
</div>
<%@ include file="/WEB-INF/views/foot.jsp"%>