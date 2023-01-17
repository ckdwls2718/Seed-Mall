<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/top.jsp"%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />

<style>
.menu{
	position: relative;
	color: black;
	display: inline-block;
	margin: 8px 7px 20px 30px;
	font-weight: 900;
	/*padding: top right bottom left*/
	cursor: pointer;
	}
.menu:hover{ /*클릭 시 적용되는 style 속성*/
	color: #e0e0e0;
	font-weight: 900;
	}
</style>
<div>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h2
					style="text-align: left; margin: 40px 40px 0 0; font-weight: bolder">카테고리
					등록/삭제</h2>
				<br>
				<div id="cg1" class="menu" onclick="show(this)">상위 카테고리</div>
				<div id="cg2" class="menu" onclick="show(this)">하위 카테고리</div>
				<div id="cg3" class="menu" onclick="show(this)">카테고리 설명</div>
				<hr>

				<form name="upCgF" id="upCgF" method="POST"
					enctype="multipart/form-data" action="addUpcategory"
					onsubmit="return Check1()">
					<!-- 파일업로드시: enctype="multipart/form-data"-->
					<table class="table table-condensed table-bordered mt-4">
						<thead class="table-success">
							<tr>
								<th colspan=3>상위 카테고리 등록</th>

							</tr>
						</thead>
						<tbody>
							<tr>
								<td width="20%"><b>상위 카테고리</b></td>
								<td width="80%" colspan=2><input type="text"
									name="upCg_name" id="upCg_name"></td>
							</tr>
							<tr>
								<td colspan="3" class="text-center">
									<button class="btn btn-outline-success">등록</button>
								</td>
							</tr>
						</tbody>
					</table>
				</form>

				<form name="downCgF" id="downCgF" method="POST"
					enctype="multipart/form-data" action="addDowncategory"
					onsubmit="return Check2()">
					<!-- 파일업로드시: enctype="multipart/form-data"-->
					<table class="table table-condensed table-bordered mt-4">
						<thead class="table-success">
							<tr>
								<th colspan=3>하위 카테고리 등록</th>

							</tr>
						</thead>
						<tbody>
							<tr>
								<td width="20%"><b>상위 카테고리</b></td>
								<td width="80%" colspan=2><select name="upCg_code"
									id="upCg_code">
										<option value="">상위 카테고리</option>
										<c:forEach var="up" items="${upCgList}">
											<option value="${up.upCg_code}">${up.upCg_name}</option>
										</c:forEach>
								</select></td>
							</tr>
							<tr>
								<td width="20%"><b>하위 카테고리</b></td>
								<td width="80%" colspan=2><input type="text"
									name="downCg_name" id="downCg_name"></td>
							</tr>
							<tr>
								<td colspan="3" class="text-center">
									<button class="btn btn-outline-success">등록</button>
								</td>
							</tr>

						</tbody>


					</table>
				</form>

				<form name="delCgF" id="delCgF" method="POST"
					enctype="multipart/form-data" action="deleteCategory"
					onsubmit="return Check3()">
					<!-- 파일업로드시: enctype="multipart/form-data"-->
					<table class="table table-condensed table-bordered mt-4">
						<thead class="table-success">
							<tr>
								<th colspan=3>카테고리 삭제 / 상위 카테고리 선택 후 상위 카테고리 삭제 선택시 상위 카테고리 삭제(하위,설명,제품,전부)</th>

							</tr>
						</thead>
						<tbody>
							<tr>
								<td width="20%"><b>카테고리</b></td>
								<td width="80%" colspan=2><select name="upCg_code"
									id="upCg_code1" onchange="selectDownCategory(this.value)">
										<option value="">상위 카테고리</option>
										<c:forEach var="up" items="${upCgList}">
											<option value="${up.upCg_code}">${up.upCg_name}</option>
										</c:forEach>
								</select> <span id="selectDcg"> </span></td>
							</tr>
							<tr>
								<td colspan="3" class="text-center">
									<button class="btn btn-outline-danger">삭제</button>
								</td>
							</tr>
						</tbody>
					</table>
				</form>

				<form name="addCgDF" id="addCgDF" method="POST"
					enctype="multipart/form-data" action="addCgDetail"
					onsubmit="return Check4()">
					<!-- 파일업로드시: enctype="multipart/form-data"-->
					<table class="table table-condensed table-bordered mt-4">
						<thead class="table-success">
							<tr>
								<th colspan=3>카테고리 설명 등록</th>

							</tr>
						</thead>
						<tbody>
							<tr>
								<td width="20%"><b>카테고리</b></td>
								<td width="80%" colspan=2><select name="upCg_code2"
									id="upCg_code2" onchange="selectDownCategory(this.value)">
										<option value="">상위 카테고리</option>
										<c:forEach var="up" items="${upCgList}">
											<option value="${up.upCg_code}">${up.upCg_name}</option>
										</c:forEach>
								</select> <span id="selectDcg1"> </span></td>
							</tr>
							<tr>
								<td width="20%"><b>설명 이름</b></td>
								<td width="80%"><input name="comment_name"
									id="comment_name"></td>
							</tr>
							<tr>
								<td width="20%"><b>설명 내용</b></td>
								<td width="80%"><textarea name="comments" id="comments"
										rows="3" cols="40"></textarea></td>
							</tr>
							<tr>
								<td colspan="3" class="text-center">
									<button class="btn btn-outline-success">등록</button>
								</td>
							</tr>
						</tbody>
					</table>
				</form>

				<form name="delCgDF" id="delCgDF" method="POST"
					enctype="multipart/form-data" action="deleteCgDetail"
					onsubmit="return Check5()">
					<!-- 파일업로드시: enctype="multipart/form-data"-->
					<table class="table table-condensed table-bordered mt-4">
						<thead class="table-success">
							<tr>
								<th colspan=3>카테고리 설명 삭제</th>

							</tr>
						</thead>
						<tbody>
							<tr>
								<td width="20%"><b>카테고리</b></td>
								<td width="80%" colspan=2><select name="upCg_code"
									id="upCg_code3" onchange="selectDownCategory2(this.value)">
										<option value="">상위 카테고리</option>
										<c:forEach var="up" items="${upCgList}">
											<option value="${up.upCg_code}">${up.upCg_name}</option>
										</c:forEach>
								</select> <span id="selectDcg2"></span></td>
							</tr>
							<tr>
								<td width="20%"><b>설명 이름</b></td>
								<td width="80%"><span id="selectCgDetail"></span></td>
							</tr>

							<tr>
								<td colspan="3" class="text-center">
									<button class="btn btn-outline-danger">삭제</button>
								</td>
							</tr>
						</tbody>
					</table>
				</form>

			</div>
		</div>
	</div>
</div>

<script>
$(document).ready(function(){
	hideAll();
	$('#upCgF').show();
	$('#delCgF').show();
})
function hideAll(){
	$('#upCgF').hide();
	$('#downCgF').hide();
	$('#delCgF').hide();
	$('#addCgDF').hide();
	$('#delCgDF').hide();
}
function show(menu){
	if($(menu).attr("id") == "cg1"){
		hideAll();
		$('#upCgF').show();
		$('#delCgF').show();
	}
	if($(menu).attr("id") == "cg2"){
		hideAll();
		$('#downCgF').show();
		$('#delCgF').show();
	}
	if($(menu).attr("id") == "cg3"){
		hideAll();
		$('#addCgDF').show();
		$('#delCgDF').show();
	}
}

function Check1() {
    if (!$('#upCg_name').val()) {
        alert('상위 카테고리를 입력하세요');
        $('#upCg_name').focus();
        return false;
    }
    return true;
}//------------------------------

function Check2() {
    if (!$('#upCg_code').val()) {
        alert('상위 카테고리를 선택하세요');
        $('#upCg_code').focus();
        return false;
    }
    if (!$('#downCg_name').val()) {
        alert('하위 카테고리를 입력하세요');
        $('#downCg_name').focus();
        return false;
    }

    return true;
}//------------------------------

function Check3() {
    if (!$('#upCg_code1').val()) {
        alert('상위 카테고리를 선택하세요');
        $('#upCg_code1').focus();
        return false;
    }
    if (!$('#downCg_code').val()) {
        alert('하위 카테고리를 입력하세요');
        $('#downCg_code').focus();
        return false;
    }

    return true;
}//------------------------------

function Check4() {
    if (!$('#upCg_code2').val()) {
        alert('상위 카테고리를 선택하세요');
        $('#upCg_code2').focus();
        return false;
    }
    if (!$('#downCg_code1').val()) {
        alert('하위 카테고리를 입력하세요');
        $('#downCg_code1').focus();
        return false;
    }
    if (!$('#comment_name').val()) {
        alert('설명 이름을 입력하세요');
        $('#comment_name').focus();
        return false;
    }
    if (!$('#comments').val()) {
        alert('설명 내용을 입력하세요');
        $('#comments').focus();
        return false;
    }

    return true;
}//------------------------------

function Check5() {
    if (!$('#upCg_code3').val()) {
        alert('상위 카테고리를 선택하세요');
        $('#upCg_code3').focus();
        return false;
    }
    if (!$('#downCg_code2').val()) {
        alert('하위 카테고리를 입력하세요');
        $('#downCg_code2').focus();
        return false;
    }
    if (!$('#comment_name1').val()) {
        alert('설명 이름을 입력하세요');
        $('#comment_name1').focus();
        return false;
    }

    return true;
}//------------------------------

function selectDownCategory(upCode) {
    var n = 0;
    if (!$.isNumeric($('#upCg_code1').val())) {
        n = 1;
    }
    $.ajax({
        type : 'get',
        url : 'getDownCategory?upCg_code=' + upCode,
        dataType : 'json',
        cache : false
    }).done(
            function(res) {
                if (n == 0) {
                let str = '<select name="downCg_code" id="downCg_code">';
                str += '<option value="">하위 카테고리</option>';
                $.each(res, function(i, item) {
                    str += '<option value="'+item.downCg_code+'">'
                            + item.downCg_name + '</option>';
                });
                    str += '<option value="'+0+'">'
                    + '상위 카테고리 삭제' + '</option>';
                    str += '</select>';
                    $('#selectDcg').html(str);
                }else{
                    let str = '<select name="downCg_code" id="downCg_code1">';
                    str += '<option value="">하위 카테고리</option>';
                    $.each(res, function(i, item) {
                        str += '<option value="'+item.downCg_code+'">'
                                + item.downCg_name + '</option>';
                    });
                        str += '<option value="'+0+'">'
                        + '상위 카테고리 삭제' + '</option>';
                        str += '</select>';
                        $('#selectDcg1').html(str);
                }
            }).fail(function(err) {
        alert('err');
    })

}//----------------------------

function selectDownCategory2(upCode) {
    $
            .ajax({
                type : 'get',
                url : 'getDownCategory?upCg_code=' + upCode,
                dataType : 'json',
                cache : false
            })
            .done(
                    function(res) {
                        let str = '<select name="downCg_code" id="downCg_code2" onchange="selectCgDetail(this.value)">';
                        str += '<option value="">하위 카테고리</option>';
                        $.each(res, function(i, item) {
                            str += '<option value="'+item.downCg_code+'">'
                                    + item.downCg_name + '</option>';
                        });

                        str += '</select>';
                        $('#selectDcg2').html(str);
                    }).fail(function(err) {
                alert('err');
            })

}//----------------------------

function selectCgDetail(downCode) {
    $.ajax({
        type : 'get',
        url : 'getCgDetail?downCg_code=' + downCode,
        dataType : 'json',
        cache : false
    }).done(
            function(res) {
                let str = '<select name="comment_name" id="comment_name1">';
                str += '<option value="">하위 카테고리</option>';
                $.each(res, function(i, item) {
                    str += '<option value="'+item.comment_name+'">'
                            + item.comment_name + '</option>';
                });

                str += '</select>';
                $('#selectCgDetail').html(str);
            }).fail(function(err) {
        alert('err');
    })

}//----------------------------

</script>


<%@ include file="/WEB-INF/views/foot.jsp"%>
