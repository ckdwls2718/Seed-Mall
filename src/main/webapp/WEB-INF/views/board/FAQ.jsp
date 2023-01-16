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
	height: 46px;
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
	font-size: 15px;
	font-weight: bold;
}

.title {
	text-align: center;
	flex: 1;
	margin: 0;
	font-size: 15px;
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
	border-bottom: 1px solid silver;
	align-items: center;
	justify-content: center;
	cursor: pointer;
}
/* question end */
/* answer start */
.a_off {
	display: flex;
	box-sizing: border-box;
	width: 100%;
	border-bottom: 1px solid silver;
	background: #f5f5f5;
	color: #6e6e6e;
	align-items: center;
	cursor: pointer;
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
/* answer end */
.menu{
	position: relative;
	color: #e0e0e0;
	display: inline-block;
	margin: 30px 7px 20px 30px;
	font-weight: 900;
	/*padding: top right bottom left*/
	cursor: pointer;
	}
.clicked_menu{ /*클릭 시 적용되는 style 속성*/
	color: black;
	font-weight: 900;
	}
</style>
<script>
	let flag = 0;

	$(document).ready(function() {
		// div hide
		$(".a_off").hide();
		// 접기 버튼 hide
		$("div[class=a_off]").hide();
		
		//제목 클릭 시
		$('.a_on').click(function(e) {			
			//flag=0;
			$(".a_off").hide();
			let idx = $(this).data('ans');
			
			if (flag == 0) {
				$('#ans' + idx).show();
				//$('#ans' + idx).addClass('show')
			    //flag = 1;
			} else {
				$('#ans' + idx).hide();
				//flag = 0;
			}
			//console.log('flag==='+flag)
		})
		// 내용 클릭 시 
		
		$("div[class=a_off]").click(function() {
			var idx = $("div[class=a_off]").index(this);
			$("div[class=a_on]:eq(" + idx + ")").show();
			$(".a_off").hide();
			$("div[class=a_off]:eq(" + idx + ")").hide();
		});
	});
	//카테고리 분류
	$("a").click(function() {
	    toggleClass(".active-color");
	});
	function getFaq(main_class, i) {
		//alert(i)
		let url = "/seedmall/FAQ";
		if(main_class !== '') url += "/"+main_class+"?index="+i;
		location.href = url;
	};

	$(document).ready(function(){
		
			$('.menu').each(function(index){
				$(this).attr('menu-index', index);
			}).click(function(){
				var index = $(this).attr('menu-index');
				$('.menu[menu-index=' + index + ']').addClass('clicked_menu');
				$('.menu[menu-index!=' + index + ']').removeClass('clicked_menu');
			});
		});
</script>

<div class="container mt-3" style="overflow: auto; width: 1100px;height: auto;">
	<h2 class="text-left" style="padding: 0 20px;">
		<a href="FAQ" style="text-decoration: none; color: #2B7539;">FAQ <span
			style="font-size: 17.5px;"> 자주 묻는 질문</span></a>
	</h2>
	<!-- <hr> -->
	<!-- 카테고리 영역 -->
	<nav class="FAQNavigation" style="width:800px; display:flex;  justify-content:flex-start;">
	<%--<div class="menu <c:if test='${menuIndex eq 0}'>clicked_menu</c:if>" onclick="getFaq">전체보기</div> --%>
		<div class="menu <c:if test='${menuIndex eq 1}'>clicked_menu</c:if>" onclick="getFaq('001',1)">회원정보</div>
		<div class="menu <c:if test='${menuIndex eq 2}'>clicked_menu</c:if>" onclick="getFaq('002',2)">교환/취소(반품)</div>
		<div class="menu <c:if test='${menuIndex eq 3}'>clicked_menu</c:if>" onclick="getFaq('003',3)">배송</div>
		<div class="menu <c:if test='${menuIndex eq 4}'>clicked_menu</c:if>" onclick="getFaq('004',4)">서비스</div>
		<div class="menu <c:if test='${menuIndex eq 5}'>clicked_menu</c:if>" onclick="getFaq('005',5)">주문/결제</div>
		<div class="menu <c:if test='${menuIndex eq 6}'>clicked_menu</c:if>" onclick="getFaq('006',6)">상품확인</div>
	</nav>
	<!-- ---------- -->
	<div class="tableHeader">
		<p class="contents">구분</p>
		<p class="title">제목</p>
	</div>
	<c:forEach var="FAQ" items="${FAQArr}" varStatus="st">
		<div class="a_on" data-ans="${FAQ.fidx}">
			<p class="category">${FAQ.fcategory}</p>
			<p class="question">${FAQ.ftitle}</p>
		</div>
		<!-- 답변이 들어간다 -->
		<div class="a_off" id="ans${FAQ.fidx}">
			<div>
				<p class="category">답변</p>
			</div>
			<div>
				<p class="question">${FAQ.fanswer}</p>
			</div>
		</div>
	</c:forEach>
	<div style="height: 100px"></div>
</div>

<%@ include file="/WEB-INF/views/foot.jsp"%>