<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<%@ include file="/WEB-INF/views/top.jsp"%>
<div class="container" style="height: 1500px; overflow: y:hidden;">
	<h1 class="text-center mt-5 mb-5">주문 명세서</h1>
	<form id="prodF" action="${myctx}" method="post">
		<table class="table">
			<tr>
				<td width="20%" class="m1">주문번호</td>
				<td width="80%" class="m2">${orderDesc.desc_oidx}</td>
			</tr>
			<tr>
				<td width="20%" class="m1">총 결제금액</td>
				<td width="80%" class="m2">${orderDesc.desc_oTotalPrice}</td>
			</tr>
			<tr>
				<td width="20%" class="m1">지불형태</td>
				<td width="80%" class="m2">${orderDesc.payStr}</td>
			</tr>
			<tr>
				<td width="20%" class="m1">받는분</td>
				<td width="80%" class="m2">${orderMember.omname}</td>
			</tr>
			<tr>
				<td width="20%" class="m1">연락처</td>
				<td width="80%" class="m2">${orderMember.omhp1} - ${orderMember.omhp2} - ${orderMember.omhp3}</td>
			</tr>
			<tr>
				<td width="20%" class="m1">우편번호</td>
				<td width="80%" class="m2">${orderMember.ompost}</td>
			</tr>
			<tr>
				<td width="20" class="m1">주소</td>
				<td width="80%" class="m2">${orderMember.omaddr1}, ${orderMember.omaddr2}
				</td>
			</tr>
			<tr>
				<td width="20%" class="m1">배송 요청사항</td>
				<td width="80%" class="m3">${orderDesc.ocomment}</td>
			</tr>
		</table>
		<div class="text-center">
			<button class="btn btn-success">홈으로</button>
		</div>
	</form>
</div>
<%@ include file="/WEB-INF/views/foot.jsp"%>