<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/top.jsp"%>
<style>
h2 {
	font-size: calc(1.325rem + .9vw);
	margin: 40px 40px 40px 0px;
	font-weight: bolder;
	color: #133337;
}
/* 헤더 start */
.tableHeader {
	display: flex;
	box-sizing: border-box;
	width: 100%;
	height: 38px;
	/* border-top: 1px solid #000; */
	border-bottom: 2px solid #000;
	align-items: center;
	justify-content: center;
	background: #d1e7dd;
}

.contents {
	width: 160px;
	text-align: center;
	margin: 0;
	font-size: 14px;
	font-weight: bold;
}

.title {
	text-align: center;
	flex: 1;
	margin: 0;
	font-size: 14px;
	font-weight: bold;
}
/* 헤더 end */
/* question */
.tBody {
	display: flex;
	box-sizing: border-box;
	width: 100%;
	height: 38px;
	align-items: center;
	justify-content: center;
}

.category {
	width: 160px;
	text-align: center;
	margin: 0;
	font-size: 14px;
	font-weight: bold;
}

.question {
	text-align: left;
	flex: 1;
	margin: 0;
	font-size: 14px;
	font-weight: bold;
}

.a_on {
	display: flex;
	box-sizing: border-box;
	width: 100%;
	height: 50px;
	/* border-top: 1px solid #000; */
	border-bottom: 1px solid silver;
	align-items: center;
	justify-content: center;
}
/* question end */
/* answer start */
.a_off {
	display: flex;
	box-sizing: border-box;
	width: 100%;
	border-bottom: 1px solid silver;
	background: #f5f5f5;
	align-items: center;
}

.a_off.category { /* 답변 */
	width: 160px;
	text-align: center;
	vertical-align: middle;
	margin: 0;
	font-size: 14px;
	font-weight: bold;
}

.a_off.question { /* 내용 */
	flex: 1;
	margin: 0;
	font-size: 14px;
	font-weight: bold;
}
.a_off{
	color: #6e6e6e;
}
/* answer end */
</style>
<script>
	let flag = 0;

	$(document).ready(function() {

		// div hide
		$(".a_off").hide();
		// 접기 버튼 hide
		$("div[class=a_off]").hide();

		//제목 클릭 시
		/*
		$("div[class=a_on]").click(function() {
			var idx = $("#div[class=a_on]").index(this);
			alert(idx)
			$(this).hide();
			console.log(flag);
			if (flag == 0) {
				$("div[class=a_off]:eq(" + idx + ")").show();
				$(".a_on").show();
				flag = 1;
			} else if (flag == 1) {
				$("div[class=a_on]:eq(" + idx + ")").show();
				$(".sp_off").hide();
				$("div[class=a_off]:eq(" + idx + ")").hide();
				flag = 0;
			}
		});
		 */
		$('.a_on').click(function() {
			$(".a_off").hide();
			let idx = $(this).data('ans');
			if (flag == 0) {

				//alert(idx)

				$('#ans' + idx).show();
				flag = 1;
			} else {
				$('#ans' + idx).hide();
				flag = 0;
			}
		})
		// 내용 클릭 시 
		$("div[class=a_off]").click(function() {
			var idx = $("div[class=a_off]").index(this);
			$("div[class=a_on]:eq(" + idx + ")").show();
			$(".a_off").hide();
			$("div[class=a_off]:eq(" + idx + ")").hide();
		});

	});
</script>

<div class="container mt-3" style="overflow: auto; height: auto;">
	<h2 class="text-left" style="padding: 0 20px;">
		<a href="FAQ" style="text-decoration: none; color: #2B7539;">FAQ <span
			style="font-size: 18px;"> 자주 묻는 질문</span></a>
	</h2>
	<!-- 검색 기능 추가??? -->



	<!-- 카테고리 영역 -->

	<!-- ---------- -->
	<div class="tableHeader">
		<p class="contents">구분</p>
		<p class="title">제목</p>
	</div>
	<!-- ---------- -->

	<div class="a_on" data-ans="0">
		<p class="category">로그인/정보</p>
		<p class="question">회원 가입은 어떻게 하나요?</p>
	</div>
	<!-- 답변이 들어간다 -->
	<div class="a_off" id="ans0">
		<span>
			<p class="category">답변</p>
		</span> <span>
			<p class="question">
				<br> ■ 일반가입 <br> <br> 홈페이지 상단의 회원가입 선택 > 회원 정보 입력 및
				약관 동의 후 가입이 가능합니다. <br> <br>
			</p>
		</span>
	</div>
	<!-- ---------- -->
	<div class="a_on" data-ans="1">
		<p class="category">로그인/정보</p>
		<p class="question">아이디(이메일)와 비밀번호가 기억나지 않아요.</p>
	</div>
	<div class="a_off" id="ans1">
		<span>
			<p class="category">답변</p>
		</span> <span>
			<p class="question">
				<br> ■ 이메일로 찾기 <br> <br> 회원 정보에 등록된 본인의 이메일 주소를
				인증하는 방법입니다. <br> <br>
			</p>
		</span>
	</div>
	<!-- ---------- -->
	<div class="a_on" data-ans="2">
		<p class="category">로그인/정보</p>
		<p class="question">회원 정보 수정은 어디서 하나요?</p>
	</div>
	<div class="a_off" id="ans2">
		<span>
			<p class="category">답변</p>
		</span> <span>
			<p class="question">
				<br> 회원 정보 수정은 아래 경로로 직접 변경 가능합니다. <br> <br> ■ 회원 정보
				수정 <br> <br> 마이페이지>회원정보 변경 <br> ※원활한 주문 및 배송을 위해 회원
				정보를 정확하게 기재해 주세요. <br> <br>
			</p>
		</span>
	</div>
	<!--  -->

	<div class="a_on" data-ans="3">
		<p class="category">로그인/정보</p>
		<p class="question">이메일 및 비밀번호를 변경할 수 있나요?</p>
	</div>
	<div class="a_off" id="ans3">
		<span>
			<p class="category">답변</p>
		</span> <span>
			<p class="question">
				<br> 로그인시 사용되는 아이디(이메일)은 변경이 불가능하며 비밀번호는 변경이 가능합니다. <br> <br>
				■ 비밀번호 변경 하는법 <br> <br> 마이페이지>회원정보 변경 <br> <br>
				※탈퇴 후 재가입을 하더라도 동일한 이메일은 사용할 수 없습니다. ※탈퇴 시 이메일을 제외한 모든 개인 정보는 삭제
				됩니다. <br> <br>
			</p>
		</span>
	</div>

	<div class="a_on" data-ans="4">
		<p class="category">탈퇴/정보</p>
		<p class="question">회원 탈퇴는 어떻게 진행할 수 있나요?</p>
	</div>
	<div class="a_off" id="ans4">
		<span>
			<p class="category">답변</p>
		</span> <span>
			<p class="question">
				<br> 회원 탈퇴는 PC 웹페이지를 통해 고객님께서 직접 진행해 주셔야 합니다. <br> <br>
				■ 비밀번호 변경 하는법 <br> <br> 마이페이지>회원 탈퇴 <br> <br>
				[유의사항] <br> 1) 회원 탈퇴는 PC 웹페이지를 통해 가능 <br> 2) 회원 탈퇴 시점으로 부터
				다음 날 고객의 개인정보는 모두 삭제 처리됨 <br> 3) 탈퇴와 동시에 보유하고 있던 포인트는 소멸됨 <br>
				4) 주문 이력이 있는 고객님의 정보는 회원 탈퇴 이후에도 <br> &nbsp;&nbsp;&nbsp;[전자 상거래
				등에서의 소비자 보호에 관한 법률] 에서 정한 일정기간 보존됨 <br> 5) 고객 개인정보로 인해 고객센터를 통한
				대리 탈퇴 불가 <br> <br>
			</p>
		</span>
	</div>


	<div class="a_on" data-ans="5">
		<p class="category">교환/반품(환불)</p>
		<p class="question">상품을 받았는데 교환하고 싶어요</p>
	</div>
	<div class="a_off" id="ans5">
		<span>
			<p class="category">답변</p>
		</span> <span>
			<p class="question">
				<br> 교환은 배송완료 후 7일 이내일 경우에만 주문/배송 조회에서 접수 가능합니다. <br> <br>
				■ 교환 요청 하는법 <br> <br> 마이페이지>주문 내역 조회>교환 요청 <br>
				1) 반품할 상품의 교환을 선택 해주세요. <br> 2) 반품 방법을 선택해 주세요 <br>
				&nbsp;&nbsp;&nbsp;직접 발송: 상품을 받은 택배사와 같은 택배사로 반품 예약해야 합니다. <br> &nbsp;&nbsp;&nbsp;회수 요청:
				택배기사가 요청한 회수지로 평일 기준 1일~3일 이내 방문합니다. <br> 3) 환불 배송비를
				선결제해야 합니다. <br> &nbsp;&nbsp;&nbsp;신용카드 또는 가상 계좌 결제만 가능합니다. <br> 4)
				받은 상품은 그대로 포장해서 반품해 주셔야 합니다. <br> <br>
			</p>
		</span>
	</div>

	<div class="a_on" data-ans="6">
		<p class="category">교환/반품(환불)</p>
		<p class="question">취소/반품(환불) 비용은 무료인가요?</p>
	</div>
	<div class="a_off" id="ans6">
		<span>
			<p class="category">답변</p>
		</span> <span>
			<p class="question">
				<br> 반품 배송비는 회원님 부담으로 결제해야 교환(환불) 접수가 정상적으로 완료됩니다. <br> <br>
				※ 도서산간지역의 경우 반품 배송비 추가 비용이 발생합니다. <br> ※ 배송비를 제품과 같이 동봉하면 안됩니다.
				<br> ※ 계약된 택배사가 아닌 다른 택배사 이용 시 초과운임이 발생 할 수 있습니다. <br> <br>
			</p>
		</span>
	</div>
	
	<div class="a_on" data-ans="7">
		<p class="category">교환/반품(환불)</p>
		<p class="question">반송장 입력, 수정은 어떻게 하나요?</p>
	</div>
	<div class="a_off" id="ans7">
		<span>
			<p class="category">답변</p>
		</span> <span>
			<p class="question">
				<br>
				마이페이지>주문/배송 조회에서 교환(환불) 요청한 상품에 반송장 입력해 주셔야 빠른 처리가 가능합니다.
				<br>
				<br>
				■ 반송장 입력하기
				<br>
				마이 페이지>주문/배송 조회
				<br>
				반송장 입력을 눌러 반품을 보낸 택배 업체와 송장 번호, 반품 날짜를 등록할 수 있습니다.
				<br>
				<br>
				■ 반송장 수정하기
				<br>
				마이 페이지>주문/배송 조회
				<br>
				반송장 수정을 선택 후 택배 업체,송장 번호, 날짜를 변경 하면 완료됩니다.
				<br>
				<br>
				※ 교환(환불) 요청 다음 날부터 9일 이내 입력을 하지 않거나 상품이 반품 주소지에 도착하지 않는 경우 반품은 취소되고 주문 상태는 구매 확정으로 변경됩니다.
				<br>
				<br>
			</p>
		</span>
	</div>
	
		<div class="a_on" data-ans="8">
		<p class="category">교환/반품(환불)</p>
		<p class="question">반품 접수는 어떻게 하나요?</p>
	</div>
	<div class="a_off" id="ans8">
		<span>
			<p class="category">답변</p>
		</span> <span>
			<p class="question">
				<br>
				교환(환불) 접수 시 선택했던 방법으로 반품 접수해 주세요.
				<br>
				<br>
				■ 회수 요청
				<br>
				자동회수 서비스로 택배기사가 요청한 회수지로 평일 기준 1일 ~ 3일 이내 방문합니다.
				<br>
				※ 방문 전 택배 기사분이 연락 후 방문 예정이며, 비대면으로 상품을 전달할 때는 반품 상자를 구분할 수 있도록 표시 후 회수 장소에 보관해 주세요.
				<br>
				<br>
				■ 직접 발송
				<br>
				상품을 받은 택배사와 같은 택배사로 반품 예약해 주세요.
				<br>
				상품 회수 후 반송장 정보를 입력해 주셔야 합니다.
				<br>
				<br>
				※ 계약된 택배사가 아닌 다른 택배사 이용 시 추가 비용 발생할 수 있습니다.
				<br>
				※ 반품 상자에 배송비를 동봉하면 안됩니다.
				<br>
				<br>
			</p>
		</span>
	</div>
	
			<div class="a_on" data-ans="9">
		<p class="category">교환/반품(환불)</p>
		<p class="question">실제 카드 취소나 금액은 언제 입금되나요?</p>
	</div>
	<div class="a_off" id="ans9">
		<span>
			<p class="category">답변</p>
		</span> <span>
			<p class="question">
				<br>
				결제했던 수단으로 환불되고 각 결제 수단마다 기간이 다릅니다.
				<br>
				아래 결제수단별 환불 기간을 확인해 주세요.
				<br>
				<br>
				■ 카드
				<br>
				환불 완료 후 평일 기준 1일 ~ 3일 이내 취소됩니다.
				<br>
				해외 비자 카드의 경우 부분 취소가 가능하지 않습니다.
				<br>
				<br>
				■ 가상 계좌
				<br>
				환불 완료 후 평일 기준 1일 ~ 2일 이내 입금됩니다.
				<br>
				정상 계좌 확인을 위해 인증 후 환불 신청이 가능합니다.
				<br>
				<br>
				■ 휴대전화 소액결제
				<br>
				휴대전화 결제 수수료를 포함해 휴대전화 결제 내역이 취소됩니다.
				<br>
				결제월과 환불월이 다르거나 부분 취소 시 계좌로 환불됩니다.
				<br>
				<br>
			</p>
		</span>
	</div>
	
				<div class="a_on" data-ans="10">
		<p class="category">교환/반품(환불)</p>
		<p class="question">상품은 보냈는데 언제 환불되나요?</p>
	</div>
	<div class="a_off" id="ans10">
		<span>
			<p class="category">답변</p>
		</span> <span>
			<p class="question">
				<br>
				환불 진행 과정은 아래 내용 참고해 주세요.
				<br>
				<br>
				■ 환불 진행 과정
				<br>
				상품 회수>반품 도착>검수 진행>환불 진행
				<br>
				<br>
				※상품 회수 후 반품 도착까지 평일 기준 1일 ~ 2일 소요됩니다.
				<br>
				※검수 기간은 평일 기준 1일 ~ 3일 소요됩니다.
				<br>
				※ 환불 완료되었어도 결제한 수단으로 환불까지 기간이 소요됩니다.
				<br>
				<br>
			</p>
		</span>
	</div>
	
					<div class="a_on" data-ans="11">
		<p class="category">교환/반품(환불)</p>
		<p class="question">주문을 취소(옵션변경)하고 싶어요.</p>
	</div>
	<div class="a_off" id="ans11">
		<span>
			<p class="category">답변</p>
		</span> <span>
			<p class="question">
				<br>
				주문 후 입금 확인 단계라면 마이페이지>주문/배송 조회에서 주문을 취소할 수 있습니다.
				<br>
				신청 즉시 주문 취소됩니다.
				<br>
				<br>
				입금하지 않은 주문의 옵션 변경을 원하는 경우 주문 취소 후 재주문해 주세요.
				<br>
				<br>
				※ 입금예정 상태로 재고를 보류해두는 것을 반복할 경우, 안내 없이 쇼핑몰 이용이 영구 제한될 수 있습니다. 
				<br>
				※ 가상 계좌 결제는 2일이내 입금하지 않을 경우 주문은 자동으로 취소됩니다.
				<br>
				※ 개봉 후 제품의 가치가 현저히 감소하는 경우 반품이 가능하지 않습니다.
				<br>
				※ 회원님의 사유로 교환 진행중인 상품이 품절된 경우, 반품비가 발생될 수 있고 이를 제욓한 결제 금액이 환불 처리됩니다.
				<br>
			</p>
		</span>
	</div>
	
						<div class="a_on" data-ans="12">
		<p class="category">교환/반품(환불)</p>
		<p class="question">교환(환불)이 어려운 경우가 있나요?</p>
	</div>
	<div class="a_off" id="ans12">
		<span>
			<p class="category">답변</p>
		</span> <span>
			<p class="question">
				<br>
				아래 사유에 해당 되는 경우 교환(환불)이 가능하지 않습니다.
				<br>
				<br>
				※제품 훼손 시 반품이 가능하지 않으니 받았던 상태 그대로 이중으로 포장해 주세요.
				<br>
				※제품에 사용 흔적, 오염, 케이스(포장) 손상 등의 경우 반품이 가능하지 않습니다.
				<br>
				<br>
				※ 입금예정 상태로 재고를 보류해두는 것을 반복할 경우, 안내 없이 쇼핑몰 이용이 영구 제한될 수 있습니다. 
				<br>
				※ 가상 계좌 결제는 2일이내 입금하지 않을 경우 주문은 자동으로 취소됩니다.
				<br>
				※ 출고 처리 중 부터는 주소(옵션)변경 및 취소가 가능하지 않아 상품 받아본 후 교환 또는 환불로 신청해 주셔야 합니다.  
				<br>
				<br>
			</p>
		</span>
	</div>
	
							<div class="a_on" data-ans="13">
		<p class="category">기타</p>
		<p class="question">택배사 연락처를 알고 싶어요.</p>
	</div>
	<div class="a_off" id="ans13">
		<span>
			<p class="category">답변</p>
		</span> <span>
			<p class="question">
				<br>
				택배사 고객센터 번호는 아래를 확인해 주세요. 
				<br>
				<br>
				CJ대한통운 : 1588-1255
				<br>
				롯데 : 1588-2121
				<br>
				로젠 : 1588-9988
				<br>
				우체국 : 1588-1300
				<br>
				한진 : 1588-0011
				<br>
				GTX로지스 : 1588-0588				
				<br>
				경동 : 080-873-2178
				<br>
				대신 : 043-255-3211
				<br>
				<br>
			</p>
		</span>
	</div>
	
	
							<div class="a_on" data-ans="14">
		<p class="category">기타</p>
		<p class="question">배송 사고(파손, 상품&구성품 누락, 분실)는 어떻게 처리 해야 하나요?</p>
	</div>
	<div class="a_off" id="ans14">
		<span>
			<p class="category">답변</p>
		</span> <span>
			<p class="question">
				<br>
				배송 사고는 상황에 따라 처리 방법이 다릅니다.
				<br>
				아래 내용을 확인해 주세요.
				<br>
				<br>
				■ 상품 파손
				<br>
				택배 박스, 제품 포장재 등을 받은 상태 그대로 보관 후 1:1문의로 사진과 함께 접수해 주세요.
				<br>
				※상태 그대로를 보관 하지 않으면 파손 사고 접수 시 확인이 가능하지 않습니다.
				<br>
				<br>
				■ 상품&구성품 누락				
				<br>
				브랜드 및 상품에 따라 출고지가 다르기 때문에 여러 개 상품을 주문한 경우에는 각각 배송이 됩니다.
				<br>
				1) 주문내역조회에서 배송 진행 상황을 확인해 주세요.
				<br>
				2) 배송조회에서도 배송완료로 확인 되고 상품이 따로 배송 되지 않았다면 고객센터로 문의해 주세요.
				<br>
				<br>
				■ 상품 분실
				<br>
				분실했다는 택배사 연락을 받았다면 해당 문자를 캡쳐 후 1:1문의로 사진과 함께 접수해 주세요.
				<br>
				<br>
			</p>
		</span>
	</div>
							<div class="a_on" data-ans="15">
		<p class="category">기타</p>
		<p class="question">배송 완료로 표시되는데 아직 상품을 받지 못했어요.</p>
	</div>
	<div class="a_off" id="ans15">
		<span>
			<p class="category">답변</p>
		</span> <span>
			<p class="question">
				<br>
				배송 상황에 따라 배송완료로 확인될 수 있습니다.
				<br>
				아래 내용을 확인해 주세요.
				<br>
				<br>
				■ 배송 기사가 상품을 아직 보유하고 있는 경우
				<br>
				보유여부는 택배사 또는 배송기사분에게 확인해 주세요.
				<br>
				<br>
				■ 경비실, 문 앞, 택배 보관함 등에 위탁 장소에 배송하는 경우
				<br>
				다시 한번 상품이 있는지 확인해 주세요.
				<br>
				<br>
				■ 배송 완료로 먼저 처리 후 현재 배송 중일 경우			
				<br>
				배송중으로 배송기사분에게 확인해 주세요.
				<br>
				<br>
				위에 내용으로 확인 안되는 경우 고객센터로 문의해 주세요.
				<br>
				<br>
			</p>
		</span>
	</div>
	
								<div class="a_on" data-ans="16">
		<p class="category">기타</p>
		<p class="question">송장 흐름 확인이 안되고 있어요.</p>
	</div>
	<div class="a_off" id="ans16">
		<span>
			<p class="category">답변</p>
		</span> <span>
			<p class="question">
				<br>
				배송 상태 또는 배송 지연으로 송장 흐름이 늦게 확인될 수 있습니다.
				<br>
				아래 내용을 확인해 주세요.
				<br>
				<br>
				■ 출고 완료 후 평일 기준 1일 이내
				<br>
				상품이 택배사로 전달 되고 평일 기준 1일 뒤에 송장 흐름이 확인됩니다.
				<br>
				<br>
				■ 택배사 지연
				<br>
				택배사 물량이 많은 경우 송장 흐름 확인이 평일 기준 2일 ~ 3일 정도 소요될 수 있습니다.
				<br>
				<br>
			</p>
		</span>
	</div>
	
									<div class="a_on" data-ans="16">
		<p class="category">배송 일반</p>
		<p class="question">배송 조회는 어떻게 하나요?</p>
	</div>
	<div class="a_off" id="ans16">
		<span>
			<p class="category">답변</p>
		</span> <span>
			<p class="question">
				<br>
				배송조회 메뉴에서 배송진행 상황을 확인할 수 있습니다.
				<br>
				■ 배송조회 경로
				<br>
				마이페이지>배송중/픽업대기>배송조회
				<br>
				<br>
				※ 출고 후 송장 조회까지는 평일 기준 1일 소요됩니다.
				<br>
				※ 출고 처리중 (상품 포장 및 확인하는)단계부터는 주소(옵션)변경 및 취소가 가능하지 않습니다.
				<br>
				<br>
			</p>
		</span>
	</div>
	
										<div class="a_on" data-ans="17">
		<p class="category">배송 일반</p>
		<p class="question">자주 사용하는 배송지를 등록할 수 있나요?</p>
	</div>
	<div class="a_off" id="ans17">
		<span>
			<p class="category">답변</p>
		</span> <span>
			<p class="question">
				<br>
				마이 페이지>배송지 관리 또는 주문서 작성시 배송지 관리에서 배송 주소를 등록/수정/삭제할 수 있습니다. 
				<br>
				<br>
				■ 배송지 관리 경로
				<br>
				마이페이지>회원정보 변경>배송지 관리
				<br>
				<br>
				※ 신규 배송지를 등록하더라도 기본배송지로 설정 되지않으며, 기본 배송지로 설정을 원할 경우 기본배송지 설정을 별도로 해주셔야 합니다.
				<br>
				※ 주소지는 행정안전부의[도로명 조회 사이트]에서 검색되는 주소를 기반으로 합니다.
				<br>
				※ 띄어쓰기, 오타 여부 및 검색을 통해 실제 있는 주소인지 확인해 주세요.
				<br>
				※ 주소가 등록되어 있지 않거나 건물명이 다른 경우 도로명주소 도움센터에 등록(변경)요청해 주세요.
				<br>
				※ 도로명 주소가 있지 않은 주소지는 등록이 가능하지 않습니다.
				<br>
				<br>
				* 도로명 조회 사이트에 등록되어 있으나 건물명이 검색되지 않을 경우 1:1문의로 주소지와 함께 요청해 주세요.
				<br>
				<br>
			</p>
		</span>
	</div>
	
											<div class="a_on" data-ans="18">
		<p class="category">고객센터</p>
		<p class="question">시드몰 고객센터는 어떻게 이용하나요?</p>
	</div>
	<div class="a_off" id="ans18">
		<span>
			<p class="category">답변</p>
		</span> <span>
			<p class="question">
				<br>
				고객센터 이용 관련 안내드립니다.
				<br>
				■ 고객센터 운영 시간 안내
				<br>
				- 평일 : 오전 9시 ~ 오후 6시 
				<br>
				- 토, 일, 공휴일 : 휴무
				<br>
				<br>
				■ 고객센터 번호 안내
				<br>
				- 전화 : 1111-1111 
				<br>
				- 1:1문의 : 마이페이지>고객센터>1:1 문의 
				<br>
				<br>
				* 1:1문의는 주말 및 공휴일에도 문의 가능하며 고객센터 운영시간 내에 담당자가 확인하여 순차적으로 답변드리고 있습니다.
				<br>
				<br>
			</p>
		</span>
	</div>
	
</div>





<%@ include file="/WEB-INF/views/foot.jsp"%>