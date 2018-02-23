<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
<title>나들이 티켓 상세조회</title>

<meta charset="UTF-8">


<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	
	<!--[if lte IE 8]><script src="/resources/helios/assets/js/ie/html5shiv.js"></script><![endif]-->
	<link rel="stylesheet" href="/resources/helios/assets/css/main.css" />
	<!--[if lte IE 8]><link rel="stylesheet" href="/resources/helios/assets/css/ie8.css" /><![endif]-->
	
	<!-- Scripts -->
	<script src="/resources/helios/assets/js/jquery.min.js"></script>
	<script src="/resources/helios/assets/js/jquery.dropotron.min.js"></script>
	<script src="/resources/helios/assets/js/jquery.scrolly.min.js"></script>
	<script src="/resources/helios/assets/js/jquery.onvisible.min.js"></script> 
	<script src="/resources/helios/assets/js/skel.min.js"></script>
	<script src="/resources/helios/assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="/resources/helios/assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="/resources/helios/assets/js/main.js"></script>
	
	
	<!-- DatePicker -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	
	<script type="text/javascript">
	

// ========== '예매하기 / 장바구니 담기' Event 연결 ==========
$(function(){
	$("a[href='#']:contains('예매하기')").bind("click", function(event){
		event.preventDefault();
		fncAddBooking();
	})
});

//========== ''취 소' Event 연결 ==========
$(function(){
	$("a[href='#']:contains('취 소')").bind("click", function(){
		self.location = "/ticket/listTicket"
	})
});


// ========== "DatePicker" Event 연결  ==========
	
$(function() {
	$("#datepicker").datepicker({
		dateFormat: "yymmdd",
		changeMonth: true,
		changeYear: true,
		dayNamesMin: ["월", "화", "수", "목", "금", "토", "일"],
		monthNamesShort: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
		showMonthAfterYear: true,
		
		minDate: '${ detailIntro.eventstartdate }',
		maxDate: '${ detailIntro.eventenddate }', 
	
		onSelect: function(){
			var bookingDate = $.datepicker.formatDate("yy년 mm월 dd일", $(this).datepicker('getDate'));
  			$('input[name="bookingDate"]').val(bookingDate);
		}
	})
});


function fncAddBooking() {
	var bookingDate = $('input[name="bookingDate"]').val();
	
	if (bookingDate == null || bookingDate.length < 1) {
		alert("예매일자를 선택해 주세요");
		return;
	}
	
	
	$("form")
	.attr("method", "POST")
	.attr("action", "/ticket/addBooking")
	.submit();
}
	</script>
</head>

<body class="no-sidebar">
	<div id="page-wrapper">
	
		<!-- Header -->
		<div id="header">

			<div class="inner">
				<header>
					<h1><a href="/index.jsp" id="logo">N A D R I I</a></h1>
				</header>
			</div>
					
				<jsp:include page="/layout/toolbar.jsp" />

		</div>

<form action="navigation">			
		<!-- Main -->
		<div class="wrapper style1">
		
		<input type="hidden" name="usetimefestival" value="${ detailIntro.usetimefestival }">
		<input type="hidden" name="title" value="${ tourTicket.title }">
		<input type="hidden" name="originimgurl" value="${ detailImage.originimgurl }">
		<input type="hidden" name="contentid" value="${ detailIntro.contentid }">
		<input type="hidden" name="contenttypeid" value="${ detailIntro.contenttypeid }">
		
			<div class="container">
				<article id="main" class="special">
					
					<header>
						<h2>
							${ tourTicket.title }
						</h2>
						<p>
							관람등급 : ${ detailIntro.agelimit }
						</p>
					</header>
					
					<a href="#" class="image featured">
<%-- 						<img src="${ detailImage.originimgurl }" alt="" style="height: 642.83px;"/> --%>
						<img src="${ detailImage.originimgurl }" alt="" />
					</a>
					
				</article>
			</div>		
					
					
					
			<!-- Footer -->
			<div class="container">	
				<div class="row">

					<section class="4u 12u(mobile)">
							<header>
								<h2 class="icon fa-info circled"><span class="label">info</span></h2>&nbsp;&nbsp;&nbsp;&nbsp;행사정보
							</header>
							<ul class="divided">
								<li>
									<article class="tweet">
										기 간 : ${ detailIntro.playtime }
										<span class="timestamp"></span>
									</article>
								</li>
								<li>
									<article class="tweet">
										장 소 : ${ detailIntro.eventplace }
										<span class="timestamp"></span>
									</article>
								</li>
								<li>
									<article class="tweet">
										축제등급 : ${ detailIntro.festivalgrade }
										<span class="timestamp"></span>
									</article>
								</li>
								<li>
									<article class="tweet">
										행사장 위치 : ${ detailIntro.placeinfo }
										<span class="timestamp"></span>
									</article>
								</li>
								<li>
									<article class="tweet">
										관람 소요시간 : ${ detailIntro.spendtimefestival }
										<span class="timestamp"></span>
									</article>
								</li>
							</ul>
					</section>
								
					<section class="4u 12u(mobile)">
							<header>
								<h2 class="icon fa-diamond circled"><span class="label">info</span></h2>&nbsp;&nbsp;&nbsp;&nbsp;주관사정보
							</header>
							<ul class="divided">
								<li>
									<article class="tweet">
										부대행사 : ${ detailIntro.subevent }
										<span class="timestamp"></span>
									</article>
								</li>
								<li>
									<article class="tweet">
										홈페이지 : ${ detailIntro.eventhomepage }
										<span class="timestamp"></span>
									</article>
								</li>
								<li>
									<article class="tweet">
										1. 주관사 : ${ detailIntro.sponsor1 } : ${ detailIntro.sponsor1tel }
										<span class="timestamp"></span>
									</article>
								</li>
								<li>
									<article class="tweet">
										2. 주관사 :  ${ detailIntro.sponsor2 } : ${ detailIntro.sponsor2tel }
										<span class="timestamp"></span>
									</article>
								</li>
							</ul>
					</section>		
					
					<section class="4u 12u(mobile)">
							<header>
								<h2 class="icon fa-ticket circled"><span class="label">info</span></h2>&nbsp;&nbsp;&nbsp;&nbsp;요금정보
							</header>
							<ul class="divided">
								<li>
									<article class="tweet">
										할인정보 : ${ detailIntro.discountinfofestival }
										<span class="timestamp"></span>
									</article>
								</li>
								<li>
									<article class="tweet">
										이용요금 : ${ detailIntro.usetimefestival }
										<span class="timestamp"></span>
									</article>
								</li>
							</ul>
					</section>			

				</div><!-- row end -->
			</div><!-- container end -->
				
			<hr />
		
			<div class="container">	
				<div class="row">
					<article class="4u 12u(mobile) special">
						<header>
							<h3>
							<c:if test="${ detailIntro.usetimefestival ne '무료' }">
								<div id="datepicker">
								</div>
									<input type="hidden" name="bookingDate" />
							</c:if>	
							</h3>
						</header>
					</article>
					<article class="4u 12u(mobile) special">
						<header>
							<h3>
								<a href="#" class="button 12u">
									<c:if test="${ detailIntro.usetimefestival ne '무료' }">
										예매하기 / 장바구니 담기
									</c:if>
									<c:if test="${ detailIntro.usetimefestival eq '무료' }">
	  									무료입장가능
									</c:if>
								</a>
							</h3>
						</header>	
					</article>
					<article class="4u 12u(mobile) special">
						<header>
							<h3>
								<a href="#" class="button 12u">
	  								취 소
								</a>
							</h3>
						</header>
					</article>
				</div>
			</div>

		</div>
</form>

		<jsp:include page="/layout/footer.jsp" />

	</div>

	

</body>


</html>