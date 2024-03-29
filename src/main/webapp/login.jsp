<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" isErrorPage="true" %>
<% pageContext.setAttribute("ctx",request.getContextPath());%>
<% System.out.println(request.getContextPath()); %>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<!-- custom-theme -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //custom-theme -->
<!-- <script type="text/javascript" src="js/register.js"></script> -->
<!-- Google fonts -->
<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese" rel="stylesheet">
<link href="http://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&amp;subset=latin-ext" rel="stylesheet">
<!-- Google fonts -->

<!-- css files -->
<link href="${ctx}/css/style.css" type="text/css" rel="stylesheet" media="all">
<!-- //css files -->

<link rel="stylesheet" href="${ctx}/css/font-awesome.css"> <!-- Font-Awesome-Icons-CSS -->

<link href="${ctx}/css/popup-box.css" rel="stylesheet" type="text/css" media="all" /> <!-- popup box css -->

</head>
<!-- body starts -->
<body onload="PopUpMsg()">

<!-- section -->
<section class="register">
	<div class="header">
		<div class="logo">
			<a href="#">餐厅管理系统</a>
		</div>
	<div class="social">
			<li><a href="#"><span class="fa fa-facebook"></span></a></li>
			<li><a href="#"><span class="fa fa-twitter"></span></a></li>
			<!-- <li><a href="#"><span class="fa fa-linkedin"></span></a></li>
			<li><a href="#"><span class="fa fa-google-plus"></span></a></li> -->
	</div>
		<div class="clear"></div>
	</div>
	<div class="tlinks">Collect from <a href="http://www.cssmoban.com/"  title="网站模板">网站模板</a></div>
	<div class="register-full">
		<div class="register-left">
			<div class="register">
				<p>今日公告</p>
				<h1>今天也是平安无事的一天呢</h1>
				<!-- <h2>Aenean in est pretium</h2> -->
				<p>大概</p>
				<div class="content3">
					<ul>
						<!-- <li><a class="" href="#"> New Project</a></li> -->
						<li><a class="book popup-with-zoom-anim button-isi zoomIn animated" href="#small-dialog"> Login here?</a></li>
						<li><a class="book popup-with-zoom-anim button-isi zoomIn animated" href="#small-dialog2"> Register here?</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="register-right">

			<!-- <div class="register-in">
				<a class="book popup-with-zoom-anim button-isi zoomIn animated" data-wow-delay=".5s" href="#small-dialog2">register here 》</a>
			</div>
			<div class="register-in middle">
				<a class="book popup-with-zoom-anim button-isi zoomIn animated" data-wow-delay=".5s" href="#small-dialog">常用网址1 》</a>
			</div>
			<div class="register-in">
				<a class="book popup-with-zoom-anim button-isi zoomIn animated" data-wow-delay=".5s" href="#small-dialog1">常用网址2 》</a>
			</div> -->

			<div class="register-in">
				<a class="" href="#">常用网址1 》</a>
			</div>
			<div class="register-in middle">
				<a class="" href="#">常用网址2 》</a>
			</div>
			<div class="register-in">
				<a class="" href="#">常用网址3 》</a>
			</div>
			<div class="clear"> </div>
		</div>
	<div class="clear"> </div>
	</div>
	<!-- copyright -->
	<p class="agile-copyright">Copyright &copy; 2018.Company name All rights reserved.More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>
	<!-- //copyright -->
</section>
<!-- //section -->



<!-- login form popup-->
<div class="pop-up"> 
	<div id="small-dialog" class="mfp-hide book-form">

		<div class="login-form login-form-left"> 
			<div class="agile-row">
				<h3>Login to your site</h3>
				<span class="fa fa-lock"></span>
				<div class="clear"></div>
				<div class="login-agileits-top"> 	
					<form action="${ctx}/login"  method="post">
						<input type="text" class="name" name="username" Placeholder="Username" required=""/>
						<input type="password" class="password" name="password" Placeholder="Password" required=""/>
						<input type="submit" name="login" value="Login"> 
					</form> 	
				</div> 
<%--				<div class="login-agileits-bottom"> --%>
<%--					<h6><a href="#">Forgot password?</a></h6>--%>
<%--				</div> --%>
			</div>  
		</div> 
		
	</div>  
</div>
<!-- //login form popup-->

<!-- subscribe form popup-->
<!-- <div class="pop-up"> 
	<div id="small-dialog1" class="mfp-hide book-form">

		<div class="login-form login-form-left"> 
			<div class="agile-row">
				<h3>Be the first to hear</h3>
				<p>Sign up to get notified about latest offers, news and events. Stay tuned!</p>
				<div class="clear"></div>
				<div class="login-agileits-top"> 	
					<form action="#" method="post"> 
						<input type="text" class="name" name="name" Placeholder="Full Name" required=""/>
						<input type="email" class="email" name="email" Placeholder="Email" required=""/>
						<input type="submit" value="Get Notified"> 
					</form> 	
				</div>
			</div>  
		</div> 
		
	</div>  
</div> -->
<!-- //subscribe form popup-->

<!-- register form popup-->
<div class="pop-up"> 
	<div id="small-dialog2" class="mfp-hide book-form">
	
		<div class="login-form login-form-left"> 
			<div class="agile-row">
				<h3>注册</h3>
				<div class="login-agileits-top"> 	
					<form action="${ctx}/register" name="form"  method="post">
						<input type="text"  class="email" name="Email" id="Email" Placeholder="Email" required=""/>
						<input type="text"  class="phone" name="Phone" id="Phone" Placeholder="Phone" />
						<input type="text"  class="name" name="customerName" id="customerName" Placeholder="Name" />		<!-- <input type="password" class="password" name="spassword1" id="sPassword1" Placeholder="Password" required=""/>	 -->
						<input type="password"  class="password" name="customerPassword1" id="customerPassword1" Placeholder="Password" />
						<input type="password"  class="password" name="customerPassword2" id="customerPassword2" Placeholder="Comfirm Password" />
<%--						<select name="sSuper" id="sSuper">--%>
<%--					         <option class="black" Selected value="1">管理员</option>--%>
<%--					         <option class="black" value="2">普通用户</option>--%>
<%--				       </select>--%>
						<div class="login-check">
							<label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i> </i> I Accept to the <a href="#">Terms &amp; Conditions</a></label>
						</div>
						
						<input type="submit" value="Register" onclick="return check();"> 
					</form> 	
				</div>
			</div>
		</div>
		
	</div>
</div>
<!-- //register form js-->
<script type="text/javascript" src="js/register.js"></script>
<!-- //register form popup-->

<!-- js -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<!-- //js -->

<!--popup-js-->
<script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
 <script>
	$(document).ready(function() {


	$('.popup-with-zoom-anim').magnificPopup({
		type: 'inline',
		fixedContentPos: false,
		fixedBgPos: true,
		overflowY: 'auto',
		closeBtnInside: true,
		preloader: false,
		midClick: true,
		removalDelay: 300,
		mainClass: 'my-mfp-zoom-in'
	});

	});
</script>
<!--//popup-js-->
<!-- test -->
<script>
	function PopUpMsg(requestScope){
		console.log(requestScope);
	}
</script>


</body>	
<!-- //body ends -->
</html>