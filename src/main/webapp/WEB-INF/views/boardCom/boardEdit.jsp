<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/top.jsp"%>
<script src="https://cdn.ckeditor.com/4.17.2/standard/ckeditor.js"></script>
<script>
$(function(){
	
	CKEDITOR.replace('content');
	
	$('#bf').submit(function(){
		if($('#ctitle').val()==''){
			alert('제목을 입력하세요');
			$('#ctitle').focus();
			return false;
		}
		/* if($('#email').val()==''){
			alert('글쓴이를 입력하세요');
			$('#email').focus();
			return false;
		} */
		if(CKEDITOR.instances.content.getData()==''){
			alert('글내용을 입력하세요');
			CKEDITOR.instances.content.focus();
			return false;
		}
				
		return true;
	})
})//$() end-----------------	

const edit = function(){
	alert('수정되었습니다');
}


	
</script>
<%
   String ctx = request.getContextPath();
%>
<div align="center" id="bbs" class="col-md-8 offset-md-2 my-4">
   <h1>글 수정</h1>

   <form name="bf" id="bf" role="form" action="updateEnd" method="POST">
   <input type="hidden" name="midx" value="${loginUser.midx}">
   <input type="hidden" name="cidx" value="${board.cidx}">
   <!--세션에 저장된 회원번  -->
   <!-- 원본글쓰기mode는 write, 답변글쓰기 mode는 rewrite로 감  -->       
    <table class="table">
       <tr>
          <td style="width:20%"><b>제목</b></td>
          <td style="width:80%">
          <input type="text" name="ctitle" id="ctitle" class="form-control" value="${board.ctitle}">
          </td>
       </tr>
       <tr>
          <td style="width:20%"><b>글쓴이</b></td>
          <td style="width:80%">
          <input type="text" name="email" id="email" class="form-control" readonly value="${board.email}">
          </td>
       </tr>       
       <tr>
          <td style="width:20%"><b>글내용</b></td>
          <td style="width:80%">
          <textarea name="ccontent" id="ccontent" rows="10" cols="50"
                  class="form-control">${board.ccontent}</textarea>
          </td>
       </tr>     
      
      <tr>
         <td colspan="2">
            <button type="submit" id="btnWrite" class="btn btn-success" onclick="edit()">글수정</button>           
            <button type="reset" id="btnReset" class="btn btn-warning">다시쓰기</button>
         </td>
      </tr>
   
      </table>
   

</form>       

</div>
<%@ include file="/WEB-INF/views/foot.jsp"%>










