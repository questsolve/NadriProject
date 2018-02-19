<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="UTF-8">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  	
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<!-- tabs -->
	 	  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	  
	  <link rel="stylesheet" href="/resources/helios/assets/css/main.css" />
	  
	<!-- Scripts 
			<script src="/resources/helios/assets/js/jquery.min.js"></script>-->
			<script src="/resources/helios/assets/js/jquery.dropotron.min.js"></script>
			<script src="/resources/helios/assets/js/jquery.scrolly.min.js"></script>
			<script src="/resources/helios/assets/js/jquery.onvisible.min.js"></script>
			<script src="/resources/helios/assets/js/skel.min.js"></script>
			<script src="/resources/helios/assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="/resources/helios/assets/js/ie/respond.min.js"></script><![endif]-->
		    <script src="/resources/helios/assets/js/main.js"></script>
   
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		// 생일
		 $( function() {
			    $( ".datepicker" ).datepicker();
			  } );
		 
		 
//		 function addUserPlus(){		 
//			 var check01 = $("#check01").val;
//			 var checkboxValues = [];
//			    $("input[name='fruits']:checked").each(function(i) {
//			        checkboxValues.push($(this).val());
//			    });
//			 var allData = {"check01": check01, "checkArray": checkboxValues};
			 
//			 var data = "userName=" +$("#userName").val();
//			 if($("userName").val() == ''){
//		   			alert("당신 이름이 맞습니까?");
///		   			$("#userName").focus();
////		   			return;
////		   		}
//			 if(confirm("추가정보를 입력하시겠습니까?")){
//				 $.ajax({
//					 data : allData,
//					 url : "/user/addUserPlus",
//					 type : "POST",
////				     contentType : "application; charset=UTF-8",
//					 success : function(data){
//						 if(result.msg != "success"){
//							 alert("다시한번 확인해 주세요.");
//							 window.opener.location.reload();
//							 return;
//						 }
//						 if(result.msg == "success"){
//							 alert("추가정보 입력되었습니다.");
//							 window.opener.location.reload();
//							 self.close();
//							 locatuin.href="/user/main";
//						 }						 
//					 }
//				 })
//				 }
//			 }
		 
		 function addUserPlus(){
//			 var data = "userName=" +$("#userName").val();
//			 if($("userName").val() == ''){
//		   			alert("당신 이름이 맞습니까?");
//		   			$("#userName").focus();
//		   			return;
//		   		}
			
			var radio = $("input:radio[name='gender']:checked").val();   // checked 없으면 체크한 값이 안나옴...
			console.log("radiobutton : " + radio)
			var birth = $("input[name='birth']").val();
			console.log("생년월일 확인 : " + birth)
			var name = $("input[name='userName']").val();
			console.log("사용자 이름 : " + name)
			var phone = $("hidden[name='phone']").val();
			console.log("핸드폰번호 : " + phone)
			var img = $("hidden[name='profiIeimageFile']").val();
			console.log("프로필 사진 : " + img)
			
			var value = "";	
			if( $("input:text[name='phone2']").val() != ""  &&  $("input:text[name='phone3']").val() != "") {
				var value = $("option:selected").val() + "-" 
									+ $("input[name='phone2']").val() + "-" 
									+ $("input[name='phone3']").val();
			}

			$("input:hidden[name='phone']").val( value );
			
			$("form").attr("method" , "POST").attr("action" , "/user/updateUser").submit();
			
			 }
		 function checkPwd(){
		      var password = $("#password").val();
		      var password2 = $("#password2").val();
		      
		      if(password == password2 ){
		         $("#password2").css("background-color", "#B0F6AC");
		         return;
		      }
		      
		      if(password != password2 ){
		         $(".signupbtn").prop("disabled", true);
		         $(".signupbtn").css("background-color", "#aaaaaa");
		         $("#password2").css("background-color", "#FFCECE");
		         return;
		      }
		     }
		 
		 $(function() {
	            $("#imgInput").on('change', function(){
	                readURL(this);
	            });
	        })
		 
		 function readURL(input) {
			 
			    if (input.files && input.files[0]) {
			        var reader = new FileReader();
			 
			        reader.onload = function (e) {
			            $('#image_section').attr('src', e.target.result);
			        }
			 
			        reader.readAsDataURL(input.files[0]);
			    }
			}
			 
			$("#imgInput").change(function(){
			    readURL(this);
			});
		 
		
		//	버튼 말풍선
		 $(document).ready(function(){
		     $('[data-toggle="popover"]').popover(); 
		 });
		
		
		// ===== '추가' 버튼 처리 =====
		$(function() {
	            $("button.btn.btn-info.cancelbtn").on('click', function(){
	            	fncUpdateUser();
	            })
	        });
		 
	</script>		
    	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
            border:none;
        }
        
        .container-fluid {
  padding-right: 15px;
  padding-left: 15px;
  margin-right: auto;
  margin-left: auto;
  
  
}

	.updatebtn01{
		font-size:24px;
		margin-top:-6px;
	}
	
	.cancel{
		margin-left:40px;
	}
	
	.cancel01{
		font-size:24px;
		margin-top:-6px;
	}
    
    .groupbtn{
    	padding:50px 0 70px 0;
    }
    
    @media screen and (max-width:736px){
    	.groupbtn .updatebtn{width:70px; height:70px;}
    	.updatebtn01{font-size:20px}
    	.groupbtn .cancel{width:70px; height:70px;}
    	.cancel01{font-size:20px;}
    	.container{padding:35px;}
    }
    </style>
 
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<div id="header">
					
					<div class="inner">
						<header>
							<h1><a href="/index.jsp" id="logo">N A D R I I</a></h1>
						</header>
					</div>
					
					<jsp:include page="/layout/toolbar.jsp" />

				</div>
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="bg-primary text-center" style="background:#f0f4f4; border-bottom: 2px solid #ddd; font-size:30px; padding-bottom: 30px; color:#656565;">정 보 수 정</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" action="addUserPlus" style="padding-top:50px;">
		
		  <div class="form-group">
          <label for="password" class="col-sm-offset-1 col-sm-3 control-label" style="color:#68A4C4">비밀번호</label>
          <div class="col-sm-4">
            <input type="password" class="form-control password" id="password" name="password" placeholder="비밀번호" style="border-radius: 25px;">
          </div>
          <div id="htmlId"></div>
        </div>
        
        <div class="form-group">
          <label for="password2" class="col-sm-offset-1 col-sm-3 control-label" style="color:#68A4C4">비밀번호 확인</label>
          <div class="col-sm-4">
            <input type="password" class="form-control" id="password2" name="password2" placeholder="비밀번호 확인" oninput="checkPwd();" style="border-radius: 25px;">
          </div>
        </div>
		  
		  
		  <div class="form-group">
		    <label for="birth" class="col-sm-offset-1 col-sm-3 control-label">생 년 월 일</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control datepicker" id="birth" name="birth" placeholder="생 년 월 일" style="border-radius: 25px;">
		      <span id = "chkMsg"></span>
		    </div>
		
		  </div>
		  <!--  
		  <form action="/addUserPlus" class="form-group">
		    <label for="children" class="col-sm-offset-1 col-sm-3 control-label">자녀 유 무</label>
		    <div class="col-sm-4">
		   	  <input type="hidden" id="check01" value="abcd">
		      <label><input type="checkbox" name="fruits" value="있음">있음</label>
			  <label><input type="checkbox" name="fruits" value="없음">없음</label>
		    </div>
		  </form>
		  -->
		  <div class="form-group">
		    <label for="children" class="col-sm-offset-1 col-sm-3 control-label">자녀수</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="children" name="children" placeholder="자녀수" style="border-radius: 25px;">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="gender" class="col-sm-offset-1 col-sm-3 control-label">성 별</label>
		    <div class="col-sm-4">
		      <input type="hidden" id="check02" value="abcd">
		      <label style="padding-right: 60px"><input type="radio" name="gender" value="남"style="margin-right: 5px;">남</label>
			  <label><input type="radio" name="gender" value="여" style="margin-right: 5px;">여</label>
		    </div>
		   </div>
		  
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">이름</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userName" name="userName" placeholder="회원이름" style="border-radius: 25px;">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">휴대전화번호</label>
		     <div class="col-sm-2">
		      <select class="form-control" name="phone1" id="phone1" style="border-radius: 25px;">
				  	<option value="010" >010</option>
					<option value="011" >011</option>
					<option value="016" >016</option>
					<option value="018" >018</option>
					<option value="019" >019</option>
				</select>
		    </div>
		    <div class="col-sm-2">
		      <input type="text" class="form-control" id="phone2" name="phone2" placeholder="번호" style="border-radius: 25px;">
		    </div>
		    <div class="col-sm-2">
		      <input type="text" class="form-control" id="phone3" name="phone3" placeholder="번호" style="border-radius: 25px;">
		    </div>
		    <input type="hidden" name="phone"/>
		  </div>
		  
		  <div class="form-group">
		  	<label for="profiIeimageFile" class="col-sm-offset-1 col-sm-3 control-label">프로필 사진</label>
			  <div class="col-sm-2">
				  <form id="form" runat="server">
				    <input type="file" id="imgInput"/>
				    <img id="image_section" src="#" alt="your image" style="border:1px solid #ddd; margin-top:5px" />
				    <input type="hidden" name="profiIeimageFile"/>
				</form>
		     </div>
		   </div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center groupbtn">
		      <button type="button" class="btn btn-info cancelbtn icon circled updatebtn" data-toggle="popover"
		      data-trigger="hover"data-placement="bottom" data-content="이름, 핸드폰번호 다시 확인!" ><div class="updatebtn01">수 정</div></button>
			  <a class="btn btn-primary btn icon circled cancel" href="#" role="button"><div class="cancel01">취&nbsp;소</div></a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->

	<!-- 메인 script-->
		
		
</body>

</html>