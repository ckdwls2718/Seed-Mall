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

const Like = function(){
	let btn=$(event.currentTarget);
	let btnTxt=$(event.currentTarget).text();
	//alert(btnTxt)
	let qs=$('#bf').serialize();
	/* alert(qs) */
	if(btnTxt=='좋아요'){
	$.ajax({
		url:'reviewLikeNum',
		type:'post',
		data:qs,
		dataType:'json',
		cache:false,
		success:function(res){
			alert(res) 
			if(res>0){
				alert('좋아요');
				btn.text("좋아요 취소");
			}
			//$("#like").hide();
		//	$("#likeC").show();
			
		},
		error:function(err){
			alert("err:"+err.status);
		}
	})
	}else if(btnTxt=='좋아요 취소'){
		LikeC();
	}
}

const LikeC = function(){
	let qs=$('#bf').serialize();
	/* alert(qs) */
	let btn=$(event.currentTarget);
	let btnTxt=$(event.currentTarget).text();
	alert(btnTxt)
	$.ajax({
		url:'reviewLikeNumCancel',
		type:'post',
		data:qs,
		dataType:'json',
		cache:false,
		success:function(res){
			/* alert(res) */;
			if(res>0){
				alert('좋아요 취소');
				btn.text("좋아요");
			}
			//$("#like").show();
			//$("#likeC").hide();
			
		},
		error:function(err){
			alert("err:"+err.status);
		}
	})
}

const changeImage = function(idx){
	let url = $('#thumbnailImage'+idx).attr('src');
	
	//원본이미지 출력을 위한 처리
	url = url.replace('Thumb_','');
	
	//alert(url);
	$('#prodImage>div>img').attr('src',url);
}


</script>
<%-- <style>
	ul.reviewImage li{
		list-style:none;
		float:left;
	}
</style>
<div>
	<ul class="reviewImage">
		<c:forEach var="img" items="${ReviewI}">
		<li><img src="${img.rimage}"></li>
		</c:forEach>
		
	</ul>
</div> --%>
<div class='container d-flex'>
	<div id="leftDetail" class="m-3" style="width: 60%">
		<div id="prodImage" style="width: 100%">
			<div class="m-3">
				<img class="img-fluid" style="width:480px;height:360px"
					src="${myctx}/resources/Review_image/${ReviewI.boardReviewList[0].rimage}">
			</div>
			<div class="row">
			<!-- thumnail -->
			<c:forEach var="pimage" items="${ReviewI.rimageList}">
				<div class="col-xs col-md-2">
					<a onclick="changeImage('${ReviewI.image_ridx}')" class="thumbnail"> <img id="thumbnailImage${ReviewI.image_ridx}" class="img-fluid" style="width:100px; height:100px"
						src="${myctx}/resources/Review_image/Thumb_${ReviewI.rimage}">
					</a>
				</div>
			</c:forEach>
			</div>
		</div>
	</div>
	</div>

<div style="clear:both"></div>
<form name="bf" id="bf" role="form" method="POST" >
   <input type="hidden" name="midx" value="${loginUser.midx}">
   <input type="hidden" name="ridx" value="${Review.ridx}">    
<input type="text" name="rlikenum" value="${Review.rlikenum}">   
   <input type="text" name="oidx" value="${Review.oidx}">
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
      
     <%--  <c:if test="${loginUser.midx eq Review.midx}"> --%>
      <tr>
         <td colspan="2">
             <button type="button" id="like" class="btn btn-success" onclick="Like()">좋아요</button>
             
             <!-- <button type="button" id="likeC" class="btn btn-success" onclick="LikeC()">좋아요 취소</button> -->
            <!-- <button type="button" class="btn btn-danger" onclick="delete1()">리뷰 삭제</button> -->
                       
         </td>
      </tr>
   	  <%-- </c:if> --%>	
      </table>
      
</form>  

<%@ include file="/WEB-INF/views/foot.jsp"%>