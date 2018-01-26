<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- ///////////////////////////// 로그인시 Forward  /////////////////////////////////////// -->
 <c:if test="${ ! empty user }">
 	<jsp:forward page="main.jsp"/>
 </c:if>
 <!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
<<<<<<< HEAD
	<!-- Facebook Login -->
	<!-- HTTPS required. HTTP will give a 403 forbidden response -->
	<script src="https://sdk.accountkit.com/en_US/sdk.js"></script>
	<script src="https://sdk.accountkit.com/ko_KR/sdk.js"></script>

	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	
	body {
		background-image: url(images\\cropped-1920-1080-819582.jpg);
		background-size: cover;
		background-repeat: no-repeat;
		background-position: center;
		 }
	.row { 
		margin: 100px;
		}
	.jumbotron {
			color: navy;
			background-color: rgba( 160, 220, 220, 0.7 );
        }
    .jumbotron p {
     	font-weight: bold;
     	font-style: italic;
     }   
     .jumbotron h1 {
     	font-stretch: wider;
     }   
	
	</style>
   	
   	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
		//============= 회원원가입 화면이동 =============
		$( function() {
			//==> 추가된부분 : "addUser"  Event 연결
			$("a[href='#' ]:contains('회원가입')").on("click" , function() {
				self.location = "/user/addUser"
			});
		});
		
		//============= 로그인 화면이동 =============
		$( function() {
			//==> 추가된부분 : "addUser"  Event 연결
			$("a[href='#' ]:contains('로 그 인')").on("click" , function() {
				self.location = "/user/login"
			});
		});
		
		//============= listTicket 화면이동 =============
		$( function() {
			$("a[href='#' ]:contains('나들이티켓')").on("click" , function() {
				self.location = "/ticket/listTicket"
			});
		});
		
		$( function() {
			//==> 추가된부분 : "addUser"  Event 연결
			$("a[href='#' ]:contains('종만아')").on("click" , function() {
				self.location = "/trip/listMuseum?pageNo=1"
			});
		});
		
		//============= FaceBook 로그인 =============
		
		window.fbAsyncInit = function() {
			FB.init({
				appId : '1663788730309184',
				xfbml : true,
				version : 'v2.11'
			});
			FB.AppEvents.logPageView();
		};

		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id)) {
				return;
			}
			js = d.createElement(s);
			js.id = id;
			js.src = "https://connect.facebook.net/ko_KR/sdk.js";
//			js.src = "https://connect.facebook.net/en_US/sdk.js";
//			js.src = 'https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.11&appId=1663788730309184';
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));

		FB.getLoginStatus(function(response) {
			statusChangeCallback(response);
		});

		function checkLoginState() {
			FB.getLoginStatus(function(response) {
				statusChangeCallback(response);
			});
		}
		
		FB.login(function(response) {
			  // handle the response
			}, {scope: 'public_profile,email'});
		//============= FaceBook 로그인 =============
	
	</script>	
	
	<!-- Bootstrap core CSS 
    <link href="/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template 
    <link href="css/4-col-portfolio.css" rel="stylesheet">
	-->
	
</head>

<body>


    



	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default">
		
        <div class="container">
        
        	<a class="navbar-brand" href="#">나들이 TEST</a>
			
			<!-- toolBar Button Start //////////////////////// -->
			<div class="navbar-header">
			    <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#target">
			        <span class="sr-only">Toggle navigation</span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			    </button>
			</div>
			<!-- toolBar Button End //////////////////////// -->
			
			<div class="collapse navbar-collapse"  id="target">
	             <ul class="nav navbar-nav navbar-right">
	                 <li><a href="#">회원가입</a></li>
	                 <li><a href="#">로 그 인</a></li>
					 <li><a href="#">
					 		<fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
								Facebook Login						
							</fb:login-button>
						 </a>
					 </li>
	           	</ul>
	       </div>
   		
   		</div>
   	</div>
   	<!-- ToolBar End /////////////////////////////////////-->
   	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
		
		<!-- 다단레이아웃  Start /////////////////////////////////////-->
		<div class="row">
	
		<!--  Main start /////////////////////////////////////-->   		
	 	 	<div class="col-md-9">
				<div class="jumbotron">
		  			<h1>나들이 TEST</h1>
		  			<p>If you got some good emotion for about your memory, that was good memory to you.</p>
		  			<p>But, if you got some bad emotion, that was good experience to you.</p>
				<div class="text-center">
			  			<a class="btn btn-primary btn-lg" href="#" role="button">회원가입</a>
			  			<a class="btn btn-warning btn-lg" href="#" role="button">로 그 인</a>
			  			<a class="btn btn-success btn-lg" href="#" role="button">나들이티켓</a>
			  			<a class="btn btn-warning btn-lg" href="#" role="button">종만아</a>
			  		</div>
			  	
			  	</div>
	        </div>
	 	<!--  Main end /////////////////////////////////////-->   		
	
	
	
			<!--  Menu 구성 Start /////////////////////////////////////-->     	
			<div class="col-md-3">
		        
		       	<!--  회원관리 목록에 제목 -->
				<div class="panel panel-primary">
					<div class="panel-heading">
						<i class="glyphicon glyphicon-heart"></i> 회원관리
         			</div>
         			<!--  회원관리 아이템 -->
					<ul class="list-group">
						 <li class="list-group-item">
						 	<a href="#">개인정보조회</a> <i class="glyphicon glyphicon-ban-circle"></i>
						 </li>
						 <li class="list-group-item">
						 	<a href="#">회원정보조회</a> <i class="glyphicon glyphicon-ban-circle"></i>
						 </li>
					</ul>
		        </div>
               
               
				<div class="panel panel-primary">
					<div class="panel-heading">
							<i class="glyphicon glyphicon-briefcase"></i> 판매상품관리
         			</div>
					<ul class="list-group">
						 <li class="list-group-item">
						 	<a href="#">판매상품등록</a> <i class="glyphicon glyphicon-ban-circle"></i>
						 </li>
						 <li class="list-group-item">
						 	<a href="#">판매상품관리</a> <i class="glyphicon glyphicon-ban-circle"></i>
						 </li>
					</ul>
		        </div>
               
               
				<div class="panel panel-primary">
					<div class="panel-heading">
							<i class="glyphicon glyphicon-shopping-cart"></i> 상품구매
	    			</div>
					<ul class="list-group">
						 <li class="list-group-item"><a href="#">상품검색</a></li>
						  <li class="list-group-item">
						  	<a href="#">구매이력조회</a> <i class="glyphicon glyphicon-ban-circle"></i>
						  </li>
						 <li class="list-group-item">
						 	<a href="#">최근본상품</a> <i class="glyphicon glyphicon-ban-circle"></i>
						 </li>
					</ul>
				</div>
				
			</div>
			<!--  Menu 구성 end /////////////////////////////////////-->   
			<div class="fb-like" 
				 data-share="true" 
				 data-width="450" 
				 data-show-faces="true">
			</div>

		</div>
		<!-- 다단레이아웃  end /////////////////////////////////////-->
		
	</div>
	<!--  화면구성 div end /////////////////////////////////////-->

<<<<<<< HEAD
=======
=======
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style></style>
   	
   	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
		//============= 회원원가입 화면이동 =============
		$( function() {
			//==> 추가된부분 : "addUser"  Event 연결
			$("a[href='#' ]:contains('회원가입')").on("click" , function() {
				self.location = "/user/addUser"
			});
		});
		
		//============= 로그인 화면이동 =============
		$( function() {
			//==> 추가된부분 : "addUser"  Event 연결
			$("a[href='#' ]:contains('로 그 인')").on("click" , function() {
				self.location = "/user/login"
			});
		});
		
		$( function() {
			$("a[href='#' ]:contains('상품검색')").on("click" , function() {
				self.location = "../product/listProduct?menu=search"
			});
		});
		
		$( function() {
			$("a[href='#' ]:contains('박물관')").on("click" , function() {
				self.location = "../trip/listMuseum?pageNo=1"
			});
		});
		
		$( function() {
			$("a[href='#' ]:contains('전시관')").on("click" , function() {
				self.location = "../trip/listExhibit?pageNo=1"
			});
		});
		
		$( function() {
			$("a[href='#' ]:contains('미술관')").on("click" , function() {
				self.location = "../trip/listGallery?pageNo=1"
			});
		});
		
		$( function() {
			$("a[href='#' ]:contains('체험관')").on("click" , function() {
				self.location = "../trip/listExperience?pageNo=1"
			});
		});
		
		$( function() {
			$("a[href='#' ]:contains('민속마을')").on("click" , function() {
				self.location = "../trip/listTradition?pageNo=1"
			});
		});
	</script>	
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default">
		
        <div class="container">
        
        	<a class="navbar-brand" href="#">Model2 MVC Shop</a>
			
			<!-- toolBar Button Start //////////////////////// -->
			<div class="navbar-header">
			    <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#target">
			        <span class="sr-only">Toggle navigation</span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			    </button>
			</div>
			<!-- toolBar Button End //////////////////////// -->
			
			<div class="collapse navbar-collapse"  id="target">
	             <ul class="nav navbar-nav navbar-right">
	                 <li><a href="#">상품검색</a></li>
	                 <li><a href="#">회원가입</a></li>
	                 <li><a href="#">로 그 인</a></li>
	                 <li><a href="#">박물관</a></li>
	                 <li><a href="#">전시관</a></li>
	                 <li><a href="#">미술관</a></li>
	                 <li><a href="#">체험관</a></li>
	                 <li><a href="#">민속마을</a></li>
	           	</ul>
	       </div>
   		
   		</div>
   	</div>
   	<!-- ToolBar End /////////////////////////////////////-->
   	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
		
		<!-- 다단레이아웃  Start /////////////////////////////////////-->
		<div class="row">
	
			
	 	 	<!--  Main start /////////////////////////////////////-->   		
	 	 	<div class="col-md-12">
				<div class="jumbotron">
			  		<h1>Model2 MVC Shop</h1>
			  		<p>로그인 후 사용가능...</p>
			  		<p>로그인 전 검색만 가능합니다.</p>
			  		<p>회원가입 하세요.</p>
			  		
			  		<div class="text-center">
			  			<a class="btn btn-warning btn-lg" href="#" role="button">회원가입</a>
			  			<a class="btn btn-success btn-lg" href="#" role="button">로 그 인</a>
			  		</div>
			  	
			  	</div>
			  	<div class="container">
		<div class="col-md-12"  style="padding:0">
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
		      <!-- Indicators -->
		      <ol class="carousel-indicators">
		        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		        <li data-target="#myCarousel" data-slide-to="1"></li>
		        <li data-target="#myCarousel" data-slide-to="2"></li>
		      </ol>
		      <div class="carousel-inner" role="listbox">
		        <div class="item active">
		          <img class="first-slide" src="../images/uploadFiles/AHlbAAAAtBqyWAAA.jpg" alt="First slide" width="300" height="200">
		          <div class="container">
		            <div class="carousel-caption">
		              <h1 align="right">Example headline.</h1>
		               
		              <p align="right"><a class="btn btn-lg btn-primary" href="#" role="button">구매하러 가기</a></p>
		            </div>
		          </div>
		        </div>
		        <div class="item">	
		          <img class="second-slide" src="../images/uploadFiles/AHlbAAAAtDPSiQAA.jpg" alt="Second slide" width="300" height="200">
		          <div class="container">
		            <div class="carousel-caption">
		              <h1 align="right">Another example headline.</h1>
		              <p align="right"><a class="btn btn-lg btn-primary" href="#" role="button">구매하러 가기</a></p>
		            </div>
		          </div>
		        </div>
		        <div class="item">
		          <img class="third-slide" src="../images/uploadFiles/AHlbAAAAvWs@GwAA.jpg" alt="Third slide" width="300" height="200">
		          <div class="container">
		            <div class="carousel-caption">
		              <h1 align="right">One more for good measure.</h1>
		              <p align="right"><a class="btn btn-lg btn-primary" href="#" role="button">구매하러 가기</a></p>
		            </div>
		          </div>
		        </div>
		      </div>
		      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
		        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		        <span class="sr-only">Previous</span>
		      </a>
		      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
		        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		        <span class="sr-only">Next</span>
		      </a>
		    </div>
		
		</div>
	</div>
<!-- Container end -->	
			  	
	        </div>
	   	 	<!--  Main end /////////////////////////////////////-->   		
	 	 	
		</div>
		<!-- 다단레이아웃  end /////////////////////////////////////-->
		
	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
		
	
>>>>>>> refs/remotes/origin/master
</body>
>>>>>>> refs/remotes/origin/master

</html>