<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/JavaScript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() { // 자동 실행
		$('#btnToLogin').on('click', function() {
			location.href = '/members/toLogin.do';
		});
	});
	</script>
</head>
<body>
	<header class="py-4" style="background-color: #ef9578;">
		<div class="container px-4 px-lg-5 my-5"
			style="background-color: #ef9578;">
			<div id="carouselExampleIndicators" class="carousel slide"
				data-bs-ride="carousel" data-width="500" data-ratio="3/4"
				data-max-width="80%" style='margin: 0px auto; width: 40%;'>
				<div class="carousel-indicators">
					<button type="button" data-bs-target="#carouselExampleIndicators"
						data-bs-slide-to="0" class="active" aria-current="true"
						aria-label="Slide 1"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators"
						data-bs-slide-to="1" aria-label="Slide 2"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators"
						data-bs-slide-to="2" aria-label="Slide 3"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators"
						data-bs-slide-to="3" aria-label="Slide 4"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators"
						data-bs-slide-to="4" aria-label="Slide 5"></button>
				</div>
				<div class="carousel-inner" style='height: 300px'></div>
				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>

		</div>
	</header>
	<section class="py-5">
		<DIV class="container">
			<H1 style="text-align: center; font-size: 30px;">메인메뉴</H1>

			<DIV style="text-align: center; margin: 50px auto;">
				로그인해줘로그인해줘로그인해줘로그인해줘로그인해줘로그인해줘로그인해줘로그인해줘</DIV>

			<DIV style="text-align: center; margin: 50px auto;">
				<button type='button' id='btnToLogin' class="btn btn-success">로그인하러가기</button>
			</DIV>

		</DIV>
	</section>
</body>
</html>