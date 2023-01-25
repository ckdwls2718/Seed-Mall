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

const boardLike = function(){
	let cidx = ${boardCom.cidx};
	
	$.ajax({
		url:'${myctx}/user/boardCom/like',
		type:'post',
		data:'cidx='+cidx,
		dataType:'json',
		cache:false,
		success:function(res){
			if(res>0){
				$('#likebtn').attr("disabled", true);
			}
		},
		error:function(err){
			if(err.status==200){
				alert('로그인 후 이용해주세요');
				location.href='${myctx}/login';
				return;
			}
			alert('err:'+err.status);
		}
		
	})
}
const deleteRe = function(re_cidx){
	$.ajax({
		url:'${myctx}/user/boardReDel',
		type:'post',
		data:'re_cidx='+re_cidx,
		dataType:'json',
		cache:false,
		success:function(res){
			if(res>0){
				location.reload();
			}
		},
		error:function(err){
			if(err.status==200){
				alert('로그인 후 이용해주세요');
				location.href='${myctx}/login';
				return;
			}
			alert('err:'+err.status);
		}
		
	})
}
</script>

<style>
td{
	vertical-align: middle;
}
</style>
<div class="container mt-3" >
<form name="bf" id="bf" role="form" method="POST" >
   <input type="hidden" name="midx" value="${loginUser.midx}">
   <input type="hidden" name="cidx" value="${boardCom.cidx}">      
    <table class="table">
       <tr>
          <td style="width:10%"><b>제목</b></td>
          <td style="width:40%" colspan="2">
           ${boardCom.ctitle }
          </td>
       </tr>
       <tr>
          <td style="width:20%"><b>작성자</b></td>
          <td style="width:80%" colspan="2">
          ${boardCom.email}
          </td>
       </tr>       
       <tr >
          <td style="width:20%"><b>추천수</b></td>
          <td style="width:70%" >
           	${boardCom.clikenum}
          </td>
          <td><button class="btn btn-outline-danger" id="likebtn" type="button" onclick="boardLike()">좋아요</button></td>
       </tr>
       <tr >
          <td style="width:20%"><b>조회수</b></td>
          <td style="width:80%" colspan="2">
           	${boardCom.creadnum}
          </td>
       </tr>

      </table>
      <div class="row" style="min-height: 300px">${boardCom.ccontent}</div>
      <c:if test="${loginUser.midx eq boardCom.midx}">
      <div class="text-center m-3">
      		<button type="button" type="button" class="btn btn-success" onclick="edit()">글수정</button>
            <button type="button" type="button" class="btn btn-danger" onclick="delete1()">글삭제</button>
            </div>
      </c:if>
      
</form>
</div>
<div class="container">
<hr size="10">
<c:if test="${loginUser ne null }">
<div>
<form action="${myctx}/user/boardRe" method="post">
	<input type="hidden" name="cidx" value="${boardCom.cidx}">
	<input type="hidden" name="midx" value="${loginUser.midx}">
	<textarea class="form-control" name="re_ccontent" rows="3" cols="10" style="width:80%" required></textarea>
	<button class="btn btn-info btn-lg m-3">등록</button>
</form>
</div>
<hr>
</c:if>
<table class="table">
	<c:forEach var="reply" items="${boardCom.comReArr}">
	<tr>
		<td>
		<div> 
		
			${reply.email} <small>${reply.re_cdate}</small>
			<c:if test="${loginUser.midx eq reply.midx }">
				<a class="btn btn-danger btn-sm" onclick="deleteRe('${reply.re_cidx}')">x</a>
			</c:if>
		</div>
		<div>
		 <b>${reply.re_ccontent}</b> 
		</div>
		</td>
	</tr>
	</c:forEach>
</table>
</div>
<%@ include file="/WEB-INF/views/foot.jsp"%>