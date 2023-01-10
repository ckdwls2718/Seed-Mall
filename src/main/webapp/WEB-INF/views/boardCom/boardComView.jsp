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
	bf.submit();
}
</script>
<form name="bf" id="bf" role="form" method="POST" >
   <input type="hidden" name="midx" value="44">
   <input type="hidden" name="cidx" value="${boardCom.cidx}">
   <!--세션에 저장된 회원번  -->
   <!-- 원본글쓰기mode는 write, 답변글쓰기 mode는 rewrite로 감  -->       
    <table class="table">
       <tr>
          <td style="width:20%"><b>제목</b></td>
          <td style="width:80%">
          글제목: ${boardCom.ctitle }
          </td>
       </tr>
       <tr>
          <td style="width:20%"><b>글쓴이</b></td>
          <td style="width:80%">
          <input type="text" name="email" id="email" class="form-control" readonly>
          </td>
       </tr>       
       <tr>
          <td style="width:20%"><b>글내용</b></td>
          <td style="width:80%">
          ${boardCom.ccontent}
          </td>
       </tr>     
      <!-- <tr>
         <td style="width: 20%"><b>첨부파일</b></td>
         <td style="width: 80%">
         <input type="file" name="mfilename"
            id="filename" class="form-control"></td>
      </tr> -->
      <tr>
         <td colspan="2">
            <button type="button" type="button" onclick="edit()">글수정</button>
            <button type="button" type="button" onclick="delete1()">글삭제</button>
         </td>
      </tr>
   
      </table>
</form>  

<%@ include file="/WEB-INF/views/foot.jsp"%>