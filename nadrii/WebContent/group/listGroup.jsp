<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html lang="ko">
<head>
<title>나들이 :: 모임 게시판</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="../resources/assets/css/main.css?version=1041" />
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script type="text/javascript">
	
function fncGetList(currentPage){
	$("#currentPage").val(currentPage);
	$("form").attr("method" , "POST").attr("action" , "../group/listGroup").submit();
}

function a(){
	var groupNo = $($("input[id='groupNo']")[$(".fit").index(this)]).val();
}

$(function(){
	
	$("#searchKeyword").keypress(function(e){
		if(e.which==13){
			fncGetList();
		}
	})
	
	$("#write").bind("click", function(){
		self.location="../group/addGroup";
	});
	
	$(".fit").on("click", function(){
		
		var groupNo = $($("input[id='groupNo']")[$(".fit").index(this)]).val();
		
		self.location="../group/getGroup?groupNo="+groupNo;
			
	});
	
	$("header h3").on("click", function(){
		
		var groupNo = $($("input[id='groupNo']")[$("header h3").index(this)]).val();
		
		self.location="../group/getGroup?groupNo="+groupNo;
			
	});
	
	$(".author h5").on("click", function(){
	
		var userId = $($("input[id='userId']")[$(".author h5").index(this)]).val();
		
		//self.location="../user/getUserProfile?userId="+userId;
			
	});
	
	$('[data-toggle="popover"]').popover(
			{ html: true,
			 container: 'body',
			 content: '<a href="#none" class="profile" style="color: #656565;" onclick="javascript:clickProfile()">프로필 조회 <span class="glyphicon glyphicon-user"></span></a> <br/><a href="#none" class="message" onclick="javascript:clickMessage()" style="color: #656565;"> 쪽지 보내기 <span class="glyphicon glyphicon-envelope"></span></a>',
			 placement: 'bottom',
			 }
			);	

});

function clickProfile(){
	alert(userId);
}

function clickMessage(){
	window.open("/message/addMessage?recevierId="+userId,"addMessgeView","width=300, height=350,status=no, scrollbars=no, location=no");
}

var userId;

function getIndex(k){
	userId = $($("input[id='userId']")[$(".author h5").index(k)]).val();
}


</script>

</head>
<body>
	<header>
		<jsp:include page="/layout/toolbar.jsp"></jsp:include>
	</header>
	<div id="main">
		<section id="portfolio" class="two">
			<div class="container" style="padding: 10px 10px 10px 10px !important;">
			<section style="position: relative;">
				<form class="search" method="post" action="../group/listGroup">
					<input type="text" name="searchKeyword" value="${! empty search.searchKeyword ? search.searchKeyword : ''}" placeholder="Search"/>
				</form>
			</section>
			<a href="#none" id="write" class="button small write" style="font-size: 13px; position: relative; float:ri; margin-top: -7px; margin-left: 6px;">write</a>
				<div class="row">
					<c:set var="i" value="0" />
					<c:forEach var="group" items="${list}">
						<c:set var="i" value="${ i+1 }" />
						<div class="3u 12u$(mobile)">
							<article class="item">
								<a href="#none" class="image fit">
								<input type="hidden" id="groupNo" value="${group.join.groupNo}">
								<img src="../resources/assets/images/pic02.jpg" alt="" />
								</a>
								<header>

									<h3>
										<a href="#none">${group.title}</a>
									</h3>

									<time class="published" datetime="${group.regDate}">${group.regDate}</time>
									<time class="published" style="position: relative; padding-left: 100px; margin-top: -38px"> view : ${group.viewCount}</time>
									<div>
										<span class="author">
											<img src="../resources/assets/images/avatar.jpg" alt="" />
										</span>
										<a href="#none" class="author">
											<input type="hidden" id="userId" value="${group.join.userId}" style="position: relative;">
											<h5 class="name" data-container="body" data-toggle="popover" onclick="javascript:getIndex(this);">${group.join.userId}</h5>
										</a>
									</div>
								</header>
							</article>
						</div>
					</c:forEach>
				</div>
			</div>
		</section>
	</div>


	<!-- Scripts -->
	<script src="../resources/assets/js/jquery.scrolly.min.js"></script>
	<script src="../resources/assets/js/jquery.scrollzer.min.js"></script>
	<script src="../resources/assets/js/skel.min.js"></script>
	<script src="../resources/assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="../resources/assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="../resources/assets/js/main.js"></script>
	<script src="../resources/assets/js/1main.js"></script>
</body>
</html>