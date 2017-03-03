<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>project_main3.html</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css"></link>
	<style>
		.container{
				width: 100%;
		}
		.transition{
			-webkit-transition: all 0.7s ease;
   			   -moz-transition: all 0.7s ease;
   				 -o-transition: all 0.7s ease;
   			    	transition: all 0.7s ease;
		}
		.row{
			width: 100%;
			position: relative;
		}
		.col{
			height: 100%;
			position: absolute;
		}
		.subject{
			position: fixed;
			z-index: 100;
			margin-left: 6%;
			height: 10%;
		}
		.subject-index{
			border:1px solid black;
			border-radius: 5px;
			margin: 0 30px;
			height: 50px;
			top: 170%;
			padding-top: 10px;
			font-weight: 200;
			font-size: 20px;
			text-align: center;
			background-color: rgba(100,100,100,0.1);
		}
		.detail{
			position: fixed;
			top: 35%;
			padding: 0px;
			z-index: 100;
			left: 2%;
		}
		.detail-index{
			width: 100%;
			border:1px solid black;
			border-radius: 3px;
			padding-top: 15px;
			font-weight: 200;
			font-size: 20px;
			text-align: center;
			height: 60px;
			margin-top: 10px;
			background-color: rgba(100,100,100,0.1);
		}

/*///////////////////////////////////////////////////////////////////////////////////////////*/
		
		.box{
			margin: 0 auto;
			margin-left: 28%;
			width: 50%;
			height: 50%;
			margin-top: 25%;
			text-align: center;
		}
		#modalBtn{
			background-color: rgba(0,0,0,0);
			border: none;
    		outline:none;
		}
		.b{
			position: relative;
			border-radius: 5px;
		}
		.title{
			font-size: 40px;
		}
		.sub-title{
			margin: auto;
			font-size: 80px;
			text-align: center;
			left: -50%;
			width: 200%;
			position: absolute;
			opacity: 0;
		}
		a img{
			position: absolute;
			margin-top: 9%;
			left: 38%;
			opacity: 0.9;
			max-height: 40%;
			max-width: 30%;
			min-height: 40%;
			min-width: 30%;
		}
		button img{
			position: absolute;
			margin-top: 43%;
			left: 47%;
		}
		button{
			border:0;
		}
		.enterance_header{
			position: fixed;
			width: 100%;
			height: 90px;
			background-color: rgba(255,255,255,0.5);
			z-index: 103;
			font-family: arial;
		}
		.enterance_box1{
			height: 35%;
			width: 70%;
			padding-left: 0%;
			padding-top: 1%;
			margin-left: 30.4%;
		}
		.enterance_title{
			height: 100%;
			font-weight: 500;
			font-size: 15px;
			color: rgba(100,200,230,1);
			display: inline-block;
		}
		.enterance_title_text{
			display: inline;
			border-bottom:1px solid rgba(91,192,230,0.3);

		}
		.enterance_title_text:hover{
			transition: all 0.4s;
			color: rgba(250,50,50,0.8);
			border-bottom:1px solid rgba(250,10,10,0.3);
			cursor: pointer;
		}
		.enterance_box2{
			height: 40%;
			width: 100%;
			padding-top: 6px; 
			font-size: 17px;
			font-weight: 200;
		}
		.enterance_box_text{
			margin-left: 29.2%;
		}
		.line{
			display: inline-block;
			height: 1px;
		}
		#line1{
			background: -webkit-linear-gradient(left,rgba(0,0,0,0) 0%,rgba(0,0,0,0) 29%,rgba(0,0,0,0.4) 39%, rgba(0,0,0,0.4) 63%,rgba(0,0,0,0) 73%,rgba(0,0,0,0) 100%);
			width: 100%;			
		}
		#title1 .enterance_title_text{
			font-family: arial;
			font-weight: 600;
			font-size: 17px;
			color: black;
			border-bottom: none;
		}
		.enterance_col{
			height: 12%;
			position: absolute;
		}
		.enterance_idClick{
			position: relative;
			background-color: rgba(250,100,100,0.2);
			height: 80%;
			width: 75%;
			margin-left: 91%;

		}
		.enterance_idClick:hover{
			background-color: rgba(250,100,100,0.3);
		}
		.enterance_idClick_contents{
			opacity: 0;
			margin-top: 4%;
			margin-left: 2%;
			margin-right: 3%;
			padding-left: 5px;
		}
		.enterance_escape{
			height: 100%;
		}
		.enterance_escape img{
			height: 50%;
			width: 100%;
			margin-top: 60%;
			opacity: 0.4;
		}
			
		@media (max-width: 1200px){
			.enterance_box{
				margin-left: 30%;
			}
		}

	</style>	
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />
	<div class="subject col-xs-8 col-xs-push-2" >
		<div class="subject-index col-xs-2 col-xs-push-1" id="rowBtn1">Coffee</div>
		<div class="subject-index col-xs-2 col-xs-push-1" id="rowBtn2">Smoothie</div>
		<div class="subject-index col-xs-2 col-xs-push-1" id="rowBtn3">Hurb Tea</div>
	</div>
	<div class="detail col-xs-1">
		<div class="detail-index" id="colBtn1">smoothie1</div>
		<div class="detail-index" id="colBtn2">smoothie2</div>
		<div class="detail-index" id="colBtn3">smoothie3</div>
		<div class="detail-index" id="colBtn4">smoothie4</div>
		<div class="detail-index" id="colBtn5">smoothie5</div>
	</div>


<!-- /////////////////////////////////////////////////////////////////////////////////////// -->



<div class="container">
	<div class="row">
		<div class="col col-xs-8 col-xs-pull-10 a">
					<div class="box" style="text-align:center">
						<div data-type="slide" class="" data-title="coffee">
							<div class="b" style="text-align:center" id="coffeeName1">
									<h3 class="sub-title">Americano</h3>
							</div><h1> </h1>
							<a href="#" class="">
								<img src="${pageContext.request.contextPath }/resources/images/coffee1.png" class="" id="cupImage1">
							</a>
							<h1> </h1>
							<button id="modalBtn1"><img src="${pageContext.request.contextPath }/resources/images/more-info-button.png" width="120" height="35" /></button>
						</div>
					</div>
		</div>
		<div class="col col-xs-8 col-xs-push-2 a">
					<div class="box" style="text-align:center">
						<div data-type="slide" class="" data-title="coffee">
							<div class="b" style="text-align:center" id="coffeeName2">
									<h3 class="sub-title">Plain Yogurt Smoothie</h3>
							</div><h1> </h1>
							<a href="#" class="">
								<img src="${pageContext.request.contextPath }/resources/images/smoothie1.png" class="" id="cupImage2">
							</a>
							<h1> </h1>
							<button id="modalBtn2"><img src="${pageContext.request.contextPath }/resources/images/more-info-button.png" width="120" height="35" /></button>
						</div>
					</div>
		</div>
		<div class="col col-xs-8 col-xs-push-10 a">
					<div class="box" style="text-align:center">
						<div data-type="slide" class="" data-title="coffee">
							<div class="b" style="text-align:center" id="coffeeName3">
									<h3 class="sub-title">Grean Tea</h3>
							</div><h1> </h1>
							<a href="#" class="">
								<img src="${pageContext.request.contextPath }/resources/images/tea1.png" class="" id="cupImage3">
							</a>
							<h1> </h1>
							<button id="modalBtn3"><img src="${pageContext.request.contextPath }/resources/images/more-info-button.png" width="120" height="35" /></button>
						</div>
					</div>
		</div>
	</div>
	<div class="row">
		<div class="col col-xs-8 col-xs-pull-10 a">
					<div class="box" style="text-align:center">
						<div data-type="slide" class="" data-title="coffee">
							<div class="b" style="text-align:center" id="coffeeName4">
									<h3 class="sub-title">Cafe Latte</h3>
							</div><h1> </h1>
							<a href="#" class="">
								<img src="${pageContext.request.contextPath }/resources/images/coffee2.png" class="" id="cupImage4">
							</a>
							<h1> </h1>
							<button id="modalBtn4"><img src="${pageContext.request.contextPath }/resources/images/more-info-button.png" width="120" height="35" /></button>
						</div>
					</div>
		</div>
		<div class="col col-xs-8 col-xs-push-2 a">
					<div class="box" style="text-align:center">
						<div data-type="slide" class="" data-title="coffee">
							<div class="b" style="text-align:center" id="coffeeName5">
									<h3 class="sub-title">Pine Apple Smoothie</h3>
							</div><h1> </h1>
							<a href="#" class="">
								<img src="${pageContext.request.contextPath }/resources/images/smoothie2.png" class="" id="cupImage5">
							</a>
							<h1> </h1>
							<button id="modalBtn5"><img src="${pageContext.request.contextPath }/resources/images/more-info-button.png" width="120" height="35" /></button>
						</div>
					</div>
		</div>
		<div class="col col-xs-8 col-xs-push-10 a">
					<div class="box" style="text-align:center">
						<div data-type="slide" class="" data-title="coffee">
							<div class="b" style="text-align:center" id="coffeeName6">
									<h3 class="sub-title">English Breakfast</h3>
							</div><h1> </h1>
							<a href="#" class="">
								<img src="${pageContext.request.contextPath }/resources/images/tea2.png" class="" id="cupImage6">
							</a>
							<h1> </h1>
							<button id="modalBtn6"><img src="${pageContext.request.contextPath }/resources/images/more-info-button.png" width="120" height="35" /></button>
						</div>
					</div>
		</div>
	</div>
	<div class="row">
		<div class="col col-xs-8 col-xs-pull-10 a">
					<div class="box" style="text-align:center">
						<div data-type="slide" class="" data-title="coffee">
							<div class="b" style="text-align:center" id="coffeeName7">
									<h3 class="sub-title">Caramel Macchiato</h3>
							</div><h1> </h1>
							<a href="#" class="">
								<img src="${pageContext.request.contextPath }/resources/images/coffee3.png" class="" id="cupImage7">
							</a>
							<h1> </h1>
							<button id="modalBtn7"><img src="${pageContext.request.contextPath }/resources/images/more-info-button.png" width="120" height="35" /></button>
						</div>
					</div>
		</div>
		<div class="col col-xs-8 col-xs-push-2 a">
					<div class="box" style="text-align:center">
						<div data-type="slide" class="" data-title="coffee">
							<div class="b" style="text-align:center" id="coffeeName8">
									<h3 class="sub-title">Strawberry Smoothie</h3>
							</div><h1> </h1>
							<a href="#" class="">
								<img src="${pageContext.request.contextPath }/resources/images/smoothie3.png" class="" id="cupImage8">
							</a>
							<h1> </h1>
							<button id="modalBtn8"><img src="${pageContext.request.contextPath }/resources/images/more-info-button.png" width="120" height="35" /></button>
						</div>
					</div>
		</div>
		<div class="col col-xs-8 col-xs-push-10 a">
					<div class="box" style="text-align:center">
						<div data-type="slide" class="" data-title="coffee">
							<div class="b" style="text-align:center" id="coffeeName9">
									<h3 class="sub-title">Earl Gray</h3>
							</div><h1> </h1>
							<a href="#" class="">
								<img src="${pageContext.request.contextPath }/resources/images/tea3.png" class="" id="cupImage9">
							</a>
							<h1> </h1>
							<button id="modalBtn9"><img src="${pageContext.request.contextPath }/resources/images/more-info-button.png" width="120" height="35" /></button>
						</div>
					</div>
		</div>
	</div>
	<div class="row">
		<div class="col col-xs-8 col-xs-pull-10 a">
					<div class="box" style="text-align:center">
						<div data-type="slide" class="" data-title="coffee">
							<div class="b" style="text-align:center" id="coffeeName10">
									<h3 class="sub-title">Cappuccino</h3>
							</div><h1> </h1>
							<a href="#" class="">
								<img src="${pageContext.request.contextPath }/resources/images/coffee4.png" class="" id="cupImage10">
							</a>
							<h1> </h1>
							<button id="modalBtn10"><img src="${pageContext.request.contextPath }/resources/images/more-info-button.png" width="120" height="35" /></button>
						</div>
					</div>
		</div>
		<div class="col col-xs-8 col-xs-push-2 a">
					<div class="box" style="text-align:center">
						<div data-type="slide" class="" data-title="coffee">
							<div class="b" style="text-align:center" id="coffeeName11">
									<h3 class="sub-title">Dark Chocolate Smoothie</h3>
							</div><h1> </h1>
							<a href="#" class="">
								<img src="${pageContext.request.contextPath }/resources/images/smoothie4.png" class="" id="cupImage11">
							</a>
							<h1> </h1>
							<button id="modalBtn11"><img src="${pageContext.request.contextPath }/resources/images/more-info-button.png" width="120" height="35" /></button>
						</div>
					</div>
		</div>
		<div class="col col-xs-8 col-xs-push-10 a">
					<div class="box" style="text-align:center">
						<div data-type="slide" class="" data-title="coffee">
							<div class="b" style="text-align:center" id="coffeeName12">
									<h3 class="sub-title">Chamomile</h3>
							</div><h1> </h1>
							<a href="#" class="">
								<img src="${pageContext.request.contextPath }/resources/images/tea4.png" class="" id="cupImage12">
							</a>
							<h1> </h1>
							<button id="modalBtn12"><img src="${pageContext.request.contextPath }/resources/images/more-info-button.png" width="120" height="35" /></button>
						</div>
					</div>
		</div>
	</div>
	<div class="row">
		<div class="col col-xs-8 col-xs-pull-10 a">
					<div class="box" style="text-align:center">
						<div data-type="slide" class="" data-title="coffee">
							<div class="b" style="text-align:center" id="coffeeName13">
									<h3 class="sub-title">Cafe Mocha</h3>
							</div><h1> </h1>
							<a href="#" class="">
								<img src="${pageContext.request.contextPath }/resources/images/coffee5.png" class="" id="cupImage13">
							</a>
							<h1> </h1>
							<button id="modalBtn13"><img src="${pageContext.request.contextPath }/resources/images/more-info-button.png" width="120" height="35" /></button>
						</div>
					</div>
		</div>
		<div class="col col-xs-8 col-xs-push-2 a">
					<div class="box" style="text-align:center">
						<div data-type="slide" class="" data-title="coffee">
							<div class="b" style="text-align:center" id="coffeeName14">
									<h3 class="sub-title">Blueberry Smoothie</h3>
							</div><h1> </h1>
							<a href="#" class="">
								<img src="${pageContext.request.contextPath }/resources/images/smoothie5.png" class="" id="cupImage14">
							</a>
							<h1> </h1>
							<button id="modalBtn14"><img src="${pageContext.request.contextPath }/resources/images/more-info-button.png" width="120" height="35" /></button>
						</div>
					</div>
		</div>
		<div class="col col-xs-8 col-xs-push-10 a">
					<div class="box" style="text-align:center">
						<div data-type="slide" class="" data-title="coffee">
							<div class="b" style="text-align:center" id="coffeeName15">
									<h3 class="sub-title">Pepper Mint</h3>
							</div><h1> </h1>
							<a href="#" class="">
								<img src="${pageContext.request.contextPath }/resources/images/tea5.png" class="" id="cupImage15">
							</a>
							<h1> </h1>
							<button id="modalBtn15"><img src="${pageContext.request.contextPath }/resources/images/more-info-button.png" width="120" height="35" /></button>
						</div>
					</div>
		</div>
	</div>
</div>


<!-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->



<div id="myModal" class="modal fade"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button class="close" data-dismiss="modal">&times;</button>
				
			</div>
			<div class="modal-body">
				<div class="row1">
					<div class="col-xs-4">
						<img src="" style="width:150px; height:150px" id="modalCupImage">
			    	</div>
			    	<div class="col-xs-8">
						<div class="row1">
							<h4 align="left" id="explain"></h4>
						</div>
						<div class="row1">
							<table class="table table-hover" align="center">
					            <thead>
					            	<tr>
					            		<th colspan="5" align="left">제품 영양정보 (12oz 기준)</th>
					            	</tr>
					                <tr>
					                    <th>Calories</th>
					                    <th>Fat</th>
					                    <th>Protein</th>
					                    <th>Sodium</th>
					                    <th>Suggr</th>
					                    <th>Caffeine</th>
					                </tr>
					            </thead>
					            <tbody>
					                <tr align="center" id="contentElement">
					                    <td></td>
					                    <td></td>
					                    <td></td>
					                    <td></td>
					                    <td></td>
					                    <td></td>
					                </tr>
					            </tbody>
					        </table>
						</div>
			    	</div>
				</div>
			</div>
			<div class="modal-footer">
				<button class="btn btn-success"  data-dismiss="modal">확인</button>
			</div>
		</div>
	</div>
</div>
	<script src="${pageContext.request.contextPath }/resources/js/jquery-3.1.1.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/jquery.touchSwipe.js"></script>
	<script>
	var tXnum=0;
	var tYnum=0;
	var temptX;
	var temptY;
	var winHeight = window.innerHeight;
	var winwidth = window.innerWidth;
	var scrollNum;
	var timeoutId;
	var iconX=2;
	var iconY=1;
	var iniX;
	var iniY;
	var text1;
	var i=0;
	var j=0;
	var sentence = '';
	var location1 =2;
	var element1 = ["${pageContext.request.contextPath }/resources/images/coffee1.png","깔끔하고 상큼함이 특징인 시원한 아이스 커피","10","0.1","1g","0g","0g","150mg"];
	var element2 =["${pageContext.request.contextPath }/resources/images/smoothie1.png","순수한 요거트의 농후한 맛이 그대로 느껴지는 요거트스무디","250","5g","8g","206mg","33g","0mg"];
	var element3 =["${pageContext.request.contextPath }/resources/images/tea1.png","풍부한 향과 신선하고활기찬맛이 일품인 녹차","6","0g","1g","0mg","0.06g","27mg"];
	var element4 =["${pageContext.request.contextPath }/resources/images/coffee2.png"," 바닐라 시럽과 우유, 그리고 그 위에 얹어진 에스프레소 샷과 달콤한 카라멜 드리즐의 조화","200","4.5g","8g","100mg","22g","75mg"];
	var element5 =["${pageContext.request.contextPath }/resources/images/smoothie2.png","파인애플의 달콤, 새콤한 맛이 느껴지는 스무디","195","0g","19g","29mg","63g","0mg"];
	var element6 =["${pageContext.request.contextPath }/resources/images/tea2.png","깊고 진한 향과 풍미를 느낄 수있는 홍차","5.5","0g","0mg","0.01g","20mg"];
	var element7 =["${pageContext.request.contextPath }/resources/images/coffee3.png","벨벳 같은 우유 거품과 에스프레소 샷의 절묘한 조화!","110","3g","6g","70mg","8g","75mg"];
	var element8 =["${pageContext.request.contextPath }/resources/images/smoothie3.png","비타민이 풍부한 스트로베리의 상큼한 맛을 위한 스무디","169","0.2g","7g","59mg","18.5g","0mg"];
	var element9 =["${pageContext.request.contextPath }/resources/images/tea3.png","홍차의 풍부함과 베르가못의 산뜻함이 조화를 이루는 차","5.3","0g","0g","0g","0.03g","18mg"];
	var element10 =["${pageContext.request.contextPath }/resources/images/coffee4.png","모카시럽과 스팀밀크에 휘핑크림이 토핑된 에스프레소","290","9g","10g","105mg","25g","95mg"];
	var element11 =["${pageContext.request.contextPath }/resources/images/smoothie4.png","진한 다크초코의 달콤한 맛과 단백질 보충을 위한 스무디","189","1g","6g","98mg","20g","0mg"];
	var element12 =["${pageContext.request.contextPath }/resources/images/tea4.png","은은한 사과향과 안정감을 주는 향기와 부드러운 맛","300","5g","6g","110mg","36g","15mg"];
	var element13 =["${pageContext.request.contextPath }/resources/images/coffee5.png","강렬한 첫 맛, 풍부한 바디감, 깔끔한 뒷 맛이 특징인 커피의 심장","3","0g","0g","0mg","3mg","66mg"];
	var element14 =["${pageContext.request.contextPath }/resources/images/smoothie5.png"," 풍부한 베리 맛을 느낄 수 있는 단백질 보충 스무디","190","0g","19g","63mg","25.9","0mg"];
	var element15 =["${pageContext.request.contextPath }/resources/images/tea5.png","톡쏘는 멘톨향이 상쾌함과 기분전환에 도움을주는 허브차","5","0","0g","0mg","0g","0mg"];




	$(".row").css("height",winHeight);

	$(window).resize(function(){
		winHeight = window.innerHeight;
		winwidth = window.innerWidth;
		$(".row").css("height",winHeight);
	});
	move();
	textChange();
	function textChange(){
		if(iconX==1){
			$("#colBtn1").text("Americano").css("padding-top","15px");
			$("#colBtn2").text("Cafe Latte").css("padding-top","15px");
			$("#colBtn3").text("Caramel Macchiato").css("padding-top","2px");
			$("#colBtn4").text("Cappuccino").css("padding-top","15px");
			$("#colBtn5").text("Cafe Mocha").css("padding-top","15px");
		}
		if(iconX==2){
			$("#colBtn1").text("Plain Yogurt").css("padding-top","15px");
			$("#colBtn2").text("Pine Apple").css("padding-top","15px");
			$("#colBtn3").text("Strawberry").css("padding-top","15px");
			$("#colBtn4").text("Dark Chocolate").css("padding-top","15px");
			$("#colBtn5").text("Blueberry");
		}
		if(iconX==3){
			$("#colBtn1").text("Grean Tea").css("padding-top","15px");
			$("#colBtn2").text("English Breakfast").css("padding-top","2px");
			$("#colBtn3").text("Earl Gray").css("padding-top","15px");
			$("#colBtn4").text("Chamomile").css("padding-top","15px");
			$("#colBtn5").text("Pepper Mint").css("padding-top","15px");
		}
	};

	function location1Detect(){
		if(iconX==1&&iconY==1){location1=1;}
		if(iconX==2&&iconY==1){location1=2;}
		if(iconX==3&&iconY==1){location1=3;}
		if(iconX==1&&iconY==2){location1=4;}
		if(iconX==2&&iconY==2){location1=5;}
		if(iconX==3&&iconY==2){location1=6;}
		if(iconX==1&&iconY==3){location1=7;}
		if(iconX==2&&iconY==3){location1=8;}
		if(iconX==3&&iconY==3){location1=9;}
		if(iconX==1&&iconY==4){location1=10;}
		if(iconX==2&&iconY==4){location1=11;}
		if(iconX==3&&iconY==4){location1=12;}
		if(iconX==1&&iconY==5){location1=13;}
		if(iconX==2&&iconY==5){location1=14;}
		if(iconX==3&&iconY==5){location1=15;}
		return location1;
	};
	$("#rowBtn1").click(function(){
		tXnum=winwidth*8/12;
		iconX=1;
		move();
		textChange();
	});
	$("#rowBtn2").click(function(){
		tXnum=2;
		iconX=2;
		move();
		textChange();
	});
	$("#rowBtn3").click(function(){
		tXnum=-winwidth*8/12;
		iconX=3;
		move();
		textChange();
	});
	$("#colBtn1").click(function(){
		tYnum=0;
		iconY=1;
		move();
	});
	$("#colBtn2").click(function(){
		tYnum=winHeight;
		iconY=2;
		move();
	});
	$("#colBtn3").click(function(){
		tYnum=winHeight*2;
		iconY=3;
		move();
	});
	$("#colBtn4").click(function(){
		tYnum=winHeight*3;
		iconY=4;
		move();
	});
	$("#colBtn5").click(function(){
		tYnum=winHeight*4;
		iconY=5;
		move();
	});

	function move(){
		location1Detect();
		sentence="";


		$(".container")
		.addClass("transition")
		.one("transitionend", function(){
			$(this).removeClass("transition");
		});
		$(".container")
		.css("-webkit-transform","translateX("+tXnum+"px) translateY(-"+tYnum+"px)");

		var c1 = parseInt(Math.random()*50+130);
		var c2 = parseInt(Math.random()*100+20);
		var c3 = parseInt(Math.random()*100+20);
		if(iconX==1){
			$("body")
			.css("background","linear-gradient(to bottom,rgba("+c1+","+c2+","+c3+",0.2), rgba("+parseInt(c1*1.5)+","+parseInt(c2*1.5)+","+parseInt(c3*1.5)+",0.1))")
			.css("transition","all 1s");
		}
		if(iconX==2){
			$("body")
			.css("background","linear-gradient(to bottom,rgba("+c2+","+c3+","+c1+",0.2), rgba("+parseInt(c2*1.5)+","+parseInt(c3*1.5)+","+parseInt(c1*1.5)+",0.1))")
			.css("transition","all 1s");
		}
		if(iconX==3){
			$("body")
			.css("background","linear-gradient(to bottom,rgba("+c3+","+c1+","+c2+",0.2), rgba("+parseInt(c3*1.5)+","+parseInt(c1*1.5)+","+parseInt(c2*1.5)+",0.1))")
			.css("transition","all 1s");
		}

		$(".subject-index").css("border-color","rgba(0,0,0,0.4)").css("color","rgba(0,0,0,0.4)");
		$(".detail-index").css("border-color","rgba(0,0,0,0.4)").css("color","rgba(0,0,0,0.4)");
		$(".subject-index:nth-child("+iconX+")").css("border-color","black").css("color","rgba(0,0,0,1)");
		$(".detail-index:nth-child("+iconY+")").css("border-color","black").css("color","rgba(0,0,0,1)");

		if(temptX!=tXnum||temptY!=tYnum){
		text1 = $(".a h3").eq(location1-"1").contents().text().split("");
				$(".a h3").eq(location1-"1").text("").css("opacity",0);
		
			setTimeout(function(){
				$(".a h3").css("opacity",0);
				$(".a h3").eq(location1-"1").css("opacity",1).css("transition","all 1.4s");
				i=parseInt(text1.length/2)-1;
				j=parseInt(text1.length/2);
				var intervalId1 = setInterval(function(){
					sentence =text1[i] + sentence;
					$(".a h3").eq(location1-"1").text(sentence);
					i--;
					if(i<0){clearInterval(intervalId1);}
				},70);
				var intervalId2 = setInterval(function(){
					sentence = sentence + text1[j];
					$(".a h3").eq(location1-"1").text(sentence);
					j++;
					if(j>=text1.length){clearInterval(intervalId2);}
					console.log("Sdfds");
				},71);
			},400);
		}

	};
	function move2(){
		$(".container")
		.css("-webkit-transform","translateX("+tXnum+"px) translateY(-"+tYnum+"px)");
	};
	
	$(".col").swipe({
		swipeStatus:function(e,phase,direction,distance){
			if(phase=="start"){
				temptX=tXnum;
				temptY=tYnum;
				iniX=iconX;
				iniY=iconY;
			}else if(phase=="move"){
				if(direction=="left"){
					tXnum = temptX - distance;
				}else if(direction=="right"){
					tXnum = temptX + distance;
				}else if(direction=="down"){
					tYnum = temptY - distance;
				}else if(direction=="up"){
					tYnum = temptY + distance;
				}
				move2();
			}else if(phase=="end"){
				if(direction=="left"){
					tXnum = temptX - winwidth*8/12;
					tYnum=temptY;
					iconX += 1
				}else if(direction=="right"){
					tXnum = temptX + winwidth*8/12;
					tYnum=temptY;
					iconX -= 1
				}else if(direction=="down"){
					tYnum = temptY - winHeight;
					tXnum=temptX;
					iconY -= 1
				}else if(direction=="up"){
					tYnum = temptY + winHeight;
					tXnum=temptX;
					iconY += 1
				}
				if (tXnum<-winwidth*9/12||tXnum>winwidth*9/12||tYnum<0||tYnum>winHeight*4.5) {
					tXnum=temptX;
					tYnum=temptY;
					iconX=iniX;
					iconY=iniY;
				}

				move();
				textChange();
			}else if(phase=="cancel"){
				tXnum = temptX;
				tYnum = temptY;
				move();
			}
		}
	});	
	
	$('html, body').css({'overflow': 'hidden', 'height': '100%'});

	$('#element').on('scroll touchmove mousewheel', function(e) {
	   e.preventDefault();
	   e.stopPropagation(); 
	   return false;
	});

	$("#modalBtn1").click(function(){
		$("#modalCupImage").attr("src",element1[0]);
		$("#explain").text(element1[1]);
		$("#contentElement > td").each(function(index){
			$(this).text(element1[index+2]);
			});
		$("#myModal").modal("show");
	});
	$("#modalBtn2").click(function(){
		$("#modalCupImage").attr("src",element2[0]);
		$("#explain").text(element2[1]);
		$("#contentElement > td").each(function(index){
			$(this).text(element2[index+2]);
		});
		$("#myModal").modal("show");
	});
	$("#modalBtn3").click(function(){
		$("#modalCupImage").attr("src",element3[0]);
		$("#explain").text(element3[1]);
		$("#contentElement > td").each(function(index){
			$(this).text(element3[index+2]);
		});
		$("#myModal").modal("show");
	});
	$("#modalBtn4").click(function(){
		$("#modalCupImage").attr("src",element4[0]);
		$("#explain").text(element4[1]);
		$("#contentElement > td").each(function(index){
			$(this).text(element4[index+2]);
		});
		$("#myModal").modal("show");
	});
	$("#modalBtn5").click(function(){
		$("#modalCupImage").attr("src",element5[0]);
		$("#explain").text(element5[1]);
		$("#contentElement > td").each(function(index){
			$(this).text(element5[index+2]);
		});
		$("#myModal").modal("show");
	});
	$("#modalBtn6").click(function(){
		$("#modalCupImage").attr("src",element6[0]);
		$("#explain").text(element6[1]);
		$("#contentElement > td").each(function(index){
			$(this).text(element6[index+2]);
		});
		$("#myModal").modal("show");
	});
	$("#modalBtn7").click(function(){
		$("#modalCupImage").attr("src",element7[0]);
		$("#explain").text(element7[1]);
		$("#contentElement > td").each(function(index){
			$(this).text(element7[index+2]);
		});
		$("#myModal").modal("show");
	});
	$("#modalBtn8").click(function(){
		$("#modalCupImage").attr("src",element8[0]);
		$("#explain").text(element8[1]);
		$("#contentElement > td").each(function(index){
			$(this).text(element8[index+2]);
		});
		$("#myModal").modal("show");
	});
	$("#modalBtn9").click(function(){
		$("#modalCupImage").attr("src",element9[0]);
		$("#explain").text(element9[1]);
		$("#contentElement > td").each(function(index){
			$(this).text(element9[index+2]);
		});
		$("#myModal").modal("show");
	});
	$("#modalBtn10").click(function(){
		$("#modalCupImage").attr("src",element10[0]);
		$("#explain").text(element10[1]);
		$("#contentElement > td").each(function(index){
			$(this).text(element10[index+2]);
		});
		$("#myModal").modal("show");
	});
	$("#modalBtn11").click(function(){
		$("#modalCupImage").attr("src",element11[0]);
		$("#explain").text(element11[1]);
		$("#contentElement > td").each(function(index){
			$(this).text(element11[index+2]);
		});
		$("#myModal").modal("show");
	});
	$("#modalBtn12").click(function(){
		$("#modalCupImage").attr("src",element12[0]);
		$("#explain").text(element12[1]);
		$("#contentElement > td").each(function(index){
			$(this).text(element12[index+2]);
		});
		$("#myModal").modal("show");
	});
	$("#modalBtn13").click(function(){
		$("#modalCupImage").attr("src",element13[0]);
		$("#explain").text(element13[1]);
		$("#contentElement > td").each(function(index){
			$(this).text(element13[index+2]);
		});
		$("#myModal").modal("show");
	});
	$("#modalBtn14").click(function(){
		$("#modalCupImage").attr("src",element14[0]);
		$("#explain").text(element14[1]);
		$("#contentElement > td").each(function(index){
			$(this).text(element14[index+2]);
		});
		$("#myModal").modal("show");
	});
	$("#modalBtn15").click(function(){
		$("#modalCupImage").attr("src",element15[0]);
		$("#explain").text(element15[1]);
		$("#contentElement > td").each(function(index){
			$(this).text(element15[index+2]);
		});
		$("#myModal").modal("show");
	});

	$("body").on("mousedown",function(){
		$(this).css("opacity",0.85).css("transition","opacity 0.1s");
	});
	$("body").on("mouseup",function(){
		$(this).css("opacity",1);
	});
	</script>
	
	
</body>
</html>