<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
	<!-- javascript -->
	<!--<script src="/resources/js/jquery.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>-->
	
	<!-- css -->
	<link href="/resources/css/bootstrap.min.css" rel="stylesheet" />
	<link href="/resources/css/jcarousel.css" rel="stylesheet" />
	<link href="/resources/css/flexslider.css" rel="stylesheet" />
	<link href="/resources/css/style.css" rel="stylesheet" />
	
	<!-- Theme skin -->
	<link href="/resources/skins/default.css" rel="stylesheet" />
	<script type="text/javascript">
	
	
	$( function() {
		$("a[href='#' ]:contains('나들이 정보')").on("click" , function() {
			self.location = "../trip/getTheme"
		});
	});
	
	$( function() {
		console.log("세션 정보 : ${session}")
		
		$("a[href='#' ]:contains('나들이 티켓')").bind("click" , function() {
			self.location = "../ticket/listTicket"
		});
		
	});
	
	</script>
	
</head>
<body>
	<header>
		<div class="navbar navbar-default navbar-static-top">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
	                    <span class="icon-bar"></span>
	                    <span class="icon-bar"></span>
	                    <span class="icon-bar"></span>
	                 </button>
					<a class="navbar-brand" href="../index.jsp"><span>Na</span>drii</a>						
				</div>
				<div class="navbar-collapse collapse ">
					<ul class="nav navbar-nav">
						<li class="active"><a href="../index.jsp">Home</a></li>
						<li><a href="#">나들이 정보</a></li>
						<li><a href="/comm/listComm">나만의 나들이</a></li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle " data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">나들이 플래너 <b class=" icon-angle-down"></b></a>
							<ul class="dropdown-menu">
								<li><a href="/planner/listPlanner">플래너 게시판</a></li>
								<li><a href="/planner/addPlannerView.jsp">플래너 작성</a></li>
							</ul>
						</li>
						<li><a href="#">나들이 티켓</a></li>
						<li><a href="/group/listGroup">나들이모임</a></li>
						<c:if test="${empty session}">
							<li><a href="/user/loginView.jsp">Login</a></li>
							<li><a href="/user/addUserView.jsp">Join</a></li>
						</c:if>
						<c:if test="${!empty session}">
							<li><a href="/user/getUser">MyPage</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</header>
</body>
</html>