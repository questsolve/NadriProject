<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="../resources/helios/assets/css/main.css" />
<script type="text/javascript">


	$( function() {
		$("figure[name='museum']").on("click" , function() {
			self.location = "../trip/listMuseum?pageNo=1&area=local"
		});
	});
	
	$( function() {
		$("figure[name='exhibition']").on("click" , function() {
			self.location = "../trip/listExhibit?pageNo=1&area=local"
		});
	});
	
	$( function() {
		$("figure[name='gallery']").on("click" , function() {
			self.location = "../trip/listGallery?pageNo=1&area=local"
		});
	});
	
	$( function() {
		$("figure[name='experience']").on("click" , function() {
			self.location = "../trip/listExperience?pageNo=1&area=local"
		});
	});
	
	$( function() {
		$("figure[name='tradition']").on("click" , function() {
					
			self.location = "../trip/listTradition?pageNo=1&area=local"
		});
	});
	
	$(function(){
		$("img[name='tradition']").hover(function() {
			$('#myModal').modal();		
		})
	})
	
	


</script>

<!-- 
<style type="text/css">

.sample_image  img {
    -webkit-transform:scale(1);
    -moz-transform:scale(1);
    -ms-transform:scale(1); 
    -o-transform:scale(1);  
    transform:scale(1);
    -webkit-transition:.3s;
    -moz-transition:.3s;
    -ms-transition:.3s;
    -o-transition:.3s;
    transition:.3s;
 	z-index: 1;
}

.sample_image:hover img {
    -webkit-transform:scale(2);
    -moz-transform:scale(2);
    -ms-transform:scale(2);   
    -o-transform:scale(2);
    transform:scale(2);
    position: absolute;
    z-index: 10;
    
}
</style>
 -->
 
<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Raleway:300,700);
@import url(https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css);
figure.snip1384 {
  font-family: 'Raleway', Arial, sans-serif;
  position: relative;
  float: left;
  overflow: hidden;
  margin: 10px 1%;
  min-width: 100px;
  max-width: 160px;
  width: 100%;
  color: #ffffff;
  text-align: left;
  font-size: 16px;
  
}
figure.snip1384 * {
 -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.35s ease;
  transition: all 0.35s ease;
}
figure.snip1384 img {
  max-width: 100%;
  backface-visibility: hidden;
  vertical-align: top;
}
figure.snip1384:after,
figure.snip1384 figcaption {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
}
figure.snip1384:after {
  content: '';
  background-color: rgba(0, 0, 0, 0.65);
  -webkit-transition: all 0.35s ease;
  transition: all 0.35s ease;
  opacity: 0;
}
figure.snip1384 figcaption {
  z-index: 1;
  padding-top: 30%;
  padding-left: 30%;
  align-self: center;
}

figure.snip1384 p {
  font-size: 1em;
  font-weight: 300;
  letter-spacing: 1px;
  opacity: 0;
  top: 10%;
  
}


figure.snip1384:hover img,
figure.snip1384.hover img {
  zoom: 1;
  filter: alpha(opacity=50);
  -webkit-opacity: 0.5;
  opacity: 0.5;
}
figure.snip1384:hover:after,
figure.snip1384.hover:after {
  opacity: 1;
  position: absolute;
  top: 10px;
  bottom: 10px;
  left: 10px;
  right: 10px;
}
figure.snip1384:hover h3,
figure.snip1384.hover h3,
figure.snip1384:hover p,
figure.snip1384.hover p,
figure.snip1384:hover i,
figure.snip1384.hover i {
  -webkit-transform: translate(0px, 0px);
  transform: translate(0px, 0px);
  opacity: 1;
}

#header{
	background-color: #ffffcd;
	background-image: url("/resources/images/tripIcon/tripInfo.jpg");
}

#nav{
	background-image: url("../resources/helios/images/header.jpg");
}

</style>
 
 
</head>
<body class="no-sidebar">

		<div id="page-wrapper">

			<div id="header">
				<div class="inner">
					<header>
						<h1><a href="index.html" id="logo">나들이 정보</a></h1>
					</header>
				</div>
						
				<jsp:include page="/layout/toolbar.jsp" />
			</div>
			
			<section class="carousel">
				<div class="reel" style="overflow: visible; transform: translate(0px, 0px);">
					
					<article class="">
						<a href="#" class="image featured"><img src="../resources/images/tripIcon/museum.JPG" alt=""></a>
						<header>
							<h3><a href="#">박물관</a></h3>
						</header>
						<p>휴식과 배움을 동시에</p>
					</article>

					<article class="">
						<a href="#" class="image featured"><img src="../resources/images/tripIcon/exhibition.JPG" alt=""></a>
						<header>
							<h3><a href="#">전시관</a></h3>
						</header>
						<p>새로운 것을 보고 싶다면</p>
					</article>

					<article class="">
						<a href="#" class="image featured"><img src="../resources/images/tripIcon/gallery.JPG" alt=""></a>
						<header>
							<h3><a href="#">미술관</a></h3>
						</header>
						<p>섬세하고 감각적이라면</p>
					</article>

					<article class="">
						<a href="#" class="image featured"><img src="../resources/images/tripIcon/experience.JPG" alt=""></a>
						<header>
							<h3><a href="#">체험관</a></h3>
						</header>
						<p>보는 게 다 가 아니다</p>
					</article>

					<article class="">
						<a href="#" class="image featured"><img src="../resources/images/tripIcon/tradition.JPG" alt=""></a>
						<header>
							<h3><a href="#">민속마을</a></h3>
						</header>
						<p>그 속에서 살아가리</p>
					</article>

				</div>
				<span class="forward" style="display: block;"></span>
				<span class="backward" style="display: block;"></span>
			</section>
		</div>
		
		<script src="../resources/helios/assets/js/jquery.min.js"></script>
		<script src="../resources/helios/assets/js/jquery.dropotron.min.js"></script>
		<script src="../resources/helios/assets/js/jquery.scrolly.min.js"></script>
		<script src="../resources/helios/assets/js/jquery.onvisible.min.js"></script>
		<script src="../resources/helios/assets/js/skel.min.js"></script>
		<script src="../resources/helios/assets/js/util.js"></script>
		<script src="../resources/helios/assets/js/main.js"></script>
		
</body>

</html>