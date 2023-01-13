<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/top.jsp"%>
<script src="https://cdn.ckeditor.com/4.17.2/standard/ckeditor.js"></script>
<script>
$(function(){
	
	CKEDITOR.replace('rcontent');
	
	$('#bf').submit(function(){
		if($('#rtitle').val()==''){
			alert('제목을 입력하세요');
			$('#rtitle').focus();
			return false;
		}
		/* if($('#email').val()==''){
			alert('글쓴이를 입력하세요');
			$('#email').focus();
			return false;
		} */
		if(CKEDITOR.instances.rcontent.getData()==''){
			alert('글내용을 입력하세요');
			CKEDITOR.instances.rcontent.focus();
			return false;
		}
				
		return true;
	})
})//$() end-----------------	

const edit = function(){
	
	let qStr = $('#bf').serialize();
	qStr = decodeURIComponent(qStr);
	//alert(qStr);
	
	$.ajax({
		url:'reviewUpdateEnd',
		type:'post',
		data:qStr,
		dataType:'json',
		cache:false,
		success:function(res){
			//alert(res);
			
			if(res>0){
				alert('수정성공');
				history.go(-2);
			}
		},
		error:function(err){
			alert("err:"+err.status);
		}
	})
}


	
</script>
<%
   String ctx = request.getContextPath();
%>
<div align="center" id="bbs" class="col-md-8 offset-md-2 my-4">
   <h1>리뷰 수정</h1>

   <form name="bf" id="bf" role="form" action="reviewUpdateEnd" method="POST">
   <input type="hidden" name="midx" value="${loginUser.midx}">
   <input type="hidden" name="ridx" value="${boardreview.ridx}">  
   <input type="hidden" name="pidx" value="${boardreview.pidx}"> 
    
     
    <table class="table">
       <tr>
          <td style="width:20%"><b>제목</b></td>
          <td style="width:80%">
          <input type="text" name="rtitle" id="rtitle" class="form-control" value="${boardreview.rtitle}">
          </td>
       </tr>
       <tr>
          <td style="width:20%"><b>글쓴이</b></td>
          <td style="width:80%">
          <input type="text" name="email" id="email" class="form-control" readonly value="${boardreview.email}">
          </td>
       </tr>       
       <tr>
          <td style="width:20%"><b>글내용</b></td>
          <td style="width:80%">
          <textarea name="rcontent" id="rcontent" rows="10" cols="50"
                  class="form-control">${boardreview.rcontent}</textarea>
          </td>
       </tr>     
      
      <tr>
         <td colspan="2">
            <button type="button" id="btnWrite" class="btn btn-success" onclick="edit()">글수정</button>           
            <button type="reset" id="btnReset" class="btn btn-warning">다시쓰기</button>
         </td>
      </tr>
   
      </table>
   

</form>       

</div>
<%@ include file="/WEB-INF/views/foot.jsp"%>










