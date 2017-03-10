<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1"/>
	<title>레시피</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/jquery-ui.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/remodal.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/remodal-default-theme.css">
	<style>
		body{
			background-image: linear-gradient(to bottom, rgba(0,200,0,0.1), rgba(0,0,0,0))
		}
		.menuContainer{
		padding-top: 140px;
		}
		.menuBox{
			width: 100%;
			margin: 0 auto;
			text-align: center;
		}
		.menuBox > div{
			padding: 0;
		}
		.droppable{
			border-radius: 10px;
			height: 150px;
			background: url(${pageContext.request.contextPath }/resources/images/espresso.png) no-repeat center top;
			background-color: rgba(255,0,0,0.1);
			background-size: contain;
		}
		#addSelectMenu{
			height: 70px;
			text-align: center;
		}
		.pickMenu{
			width: 70px;
			display: inline-block;
		}
		img{
			max-width: 100%;
		}
		@media (min-width: 533px) and (max-width: 768px){
			.container{
				width: 533px;
			}
		}
		@media (min-width: 768px){
			.droppable{
			height: 220px;
		}

	</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"/>
	
	<!-- draggable -->
	<div class="container menuContainer">
		<div id="drawMenu" class="row menuBox">
			<!-- 메뉴가 나올 위치 -->
		</div>
	</div>

	<!-- 선택된 메뉴를 표시-->
	<div id="addSelectMenu"></div>

	<!-- droppable -->
	<div id="basket" class="container">			
		<div id="main" data-menu="main" class="ui-widget-header bg-danger droppable">
		</div>
	</div>
	
	<!-- 확인버튼 -->
	<div class="container">
		<button id="sendBtn" class="btn btn-default btn-block">확인</button>
	</div>

	<!-- remodal -->
	<div data-remodal-id="modal" id="remodal">
		<button data-remodal-action="close" class="remodal-close"></button>
		<h3></h3>
		<img src=""/>
		<br><br>
		<button data-remodal-action="confirm" class="remodal-confirm">OK</button>
	</div>
	<footer style="height:50px"></footer>

	<script src="${pageContext.request.contextPath }/resources/js/jquery-3.1.1.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/jquery-ui.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/remodal.js"></script>
	<script>

		// window의 height 사이즈를 저장
		var bodyHeight = $(window).height();
		// body의 heigth를 윈도우의 크기만큼 지정
		$("body").css("height", bodyHeight);

		// 윈도우 사이즈가 변경될때 실행
		$(window).resize(function(){
			bodyHeight = $(window).height()
			$("body").css("height", bodyHeight);
		})

		// 재료 리스트
		var menuListArr = [
			{name:"milk", url:"${pageContext.request.contextPath }/resources/images/Milk.png"},
			{name:"water", url:"${pageContext.request.contextPath }/resources/images/Water.png"},
			{name:"foam", url:"${pageContext.request.contextPath }/resources/images/Milk_Foam.png"},
			{name:"con", url:"${pageContext.request.contextPath }/resources/images/Whipped_Cream.png"}
		];
		// 소스 리스트
		var sauseList = [
			{name:"cho", url:"${pageContext.request.contextPath }/resources/images/Chocolate.png"},
			{name:"va", url:"${pageContext.request.contextPath }/resources/images/Vanila.png"},
			{name:"ca", url:"${pageContext.request.contextPath }/resources/images/Caramel.png"}
		];
		//재료 리스트 담을 배열 
		var menuMemory = [];
		// 소스 리스트 담을 배열
		var sauseMemoy = [];

		// 선택된 재료 담을 배열
		var selectMenu = [];

		// 재료 담은 횟수 카운트
		var count = 0;

		// 페이지가 로딩될 실행
		loadMenu();

		// 메뉴 추가
		function loadMenu(sel){
			// 호출되는 시점에 카운트 횟수가 0이라면 실행
			if(count == 0){
				// 메뉴 복사
				$(menuListArr).each(function(index, item){
					menuMemory.push(item) ;
				})
				menuMake(menuMemory);
				event();
			}else if(count == 1){
				// 선택된 메뉴 삭제
				checkMenu(sel);
					if(sel == "water"){
						checkMenu("milk");
						checkMenu("foam");
					}
					if(sel == "foam" || sel=="milk"){
						checkMenu("water")
					}
				// 배열만큼 해당 요소 만들기
				menuMake(menuMemory)
				event();
			}else if(count == 2){
				$(sauseList).each(function(index, item){
					sauseMemoy.push(item) ;
				})
				menuMake(sauseMemoy);
				event()
			}else if(count == 3){
				modalEvnt();
			}
		};

		// 요소 만들기
		function menuMake(sel){
			$(sel).each(function(index, item){
				console.log(index);
				console.log(item);
				// 배열의 이름 정보 저장
				var menuName = item.name;
				// 배열을 url 정보 저장
				var menuUrl = item.url;
				// 이미지 출력 요소 만들기
				var $img = $("<img/>")
				.addClass("item") 					// 클래스 추가
				.attr("data-ingredient", menuName) 	// name추가
				.attr("src", menuUrl) 				// url 추가
				
				// 이미지가 담길 요소 만들기	
				$("<div/>")
				.addClass("col-xs-6 col-sm-4 col-md-3 col-lg-3") //클래스 추가
				.append($img)
				.appendTo("#drawMenu")	// 요소에 추가
			})
		}

		// 그릇 만들기
		function basket(){
			$("<div/>")
			.addClass("ui-widget-header bg-danger droppable") //클래스 추가
			.attr("data-menu", "main")
			.attr("id", "main")
			.appendTo("#basket")
		}

		//배열에서 선택된 메뉴 제거하는 함수
		function checkMenu(sel){
			for(var i = menuMemory.length-1; i>=0; i--){
				var tmp = menuMemory[i];
				if( tmp.name == sel){
					menuMemory.splice(i,1);
				}
			}
		}


		// 모달 이벤트
		function modalEvnt(){
			var result="e";
			// 선택된 메뉴가 없을경우
			if(count == 0){
				var name = menu[result]
				// modal에 출력
				$("#remodal > h3").text(name.name);
				$("#remodal > img").attr("src",name.url)
				$('[data-remodal-id=modal]').remodal().open();
			// 선택된 메뉴가 있을경우
			}else{
				for(var i=0; i<selectMenu.length; i++){
					var result = result +"_"+ selectMenu[i]
				}
				var name = menu[result]
			}
			// modal에 출력
			$("#remodal > h3").text(name.name);
			$("#remodal > img").attr("src", name.url)
			$('[data-remodal-id=modal]').remodal().open();
		};

		// 모달 확인 버튼 눌렀을때
		$("[data-remodal-action='confirm']").click(function(){
			count = 0;
			$("#drawMenu").children().remove();
			$("#basket").children().remove();
			$("#addSelectMenu").children().remove();
			menuMemory.splice(0,10);
			sauseList.splice(0,10);
			selectMenu.splice(0,10);
			loadMenu();
			basket();

		})

		// 확인 버튼을 눌럿을때 
		$("#sendBtn").click(function(){
			modalEvnt();
		});

		// 드래그 이벤트 등록
		function event(){
			$(function(){
				// 드래그 이벤트 발생
				$(".item").draggable({
					start: function(event,ui) {
						$(this).draggable( "option", "revert", true );
					}
				});
				dropEvent();
			});
		}

		
		// 드롭 이벤트
		function dropEvent(){
			$("#main").droppable({
				drop: function( event, ui ) {
					// 움직인 메뉴의 data-ingredient 값을 저장
					var dropID = ui.draggable.attr("data-ingredient");
					// 움직인 메뉴의 data-menu 값을 저장
					var dropTitle = ui.draggable.attr("data-meun");

					// 움직인 객체를 움직이지 않게 하기
					ui.draggable.draggable( "option", "revert", false );
					// 담을 객체의 위치값을 저장
					var droppableOffset = $(this).offset();
					// 움직인 객체가 위치할 곳을 변수에 담기
					var x = droppableOffset.left + 30;
					var y = droppableOffset.top + 30;
					// 움직인 객체의 위치를 지정
					ui.draggable.offset({ top: y, left: x });
					// 움직인 메뉴의 정보를 변수에 저장
					var addMenu = ui.draggable.attr("data-ingredient");
					// 움직인 메뉴의 정보를 오브젝트에 저장
					// selectMenu[count] = addMenu;
					selectMenu.push(addMenu);
					// 움직인 메뉴를 보이지 않게 하기
					$("[data-ingredient="+dropID+"]").addClass("hideMenu");
					// 요소 삭제
					$("#drawMenu").children().remove()
					$("#basket").children().remove()

					count ++;

					pickMenu(addMenu);
					loadMenu(addMenu);
					basket();
				}
			});
		};

		// 메뉴가 선택될때 선택된 메뉴를 보여줄 함수
		function pickMenu(sel){
			// 카운트가 1또는 2일경우 실행
			if(count == 1 || count == 2){
				for(var i = menuListArr.length-1; i>=0; i--){
					var tmp = menuListArr[i];
					if(tmp.name == sel){
						// img 요소 만들준비
						var $img = $("<img/>").attr("src",tmp.url);

						// div요소 추가
						$("<div/>")
						.addClass("pickMenu")		// 클래스 추가
						.append($img)				// img요소 추가
						.appendTo("#addSelectMenu");
					}
				}
			}
		}

		var menu = {
			e:{name:"에스프레소", url:"${pageContext.request.contextPath }/resources/images/Espresso.jpg"},

			e_milk:{name:"카페라떼", url:"${pageContext.request.contextPath }/resources/images/caffe-latte.jpg"},
			e_water:{name:"아메리카노", url:"${pageContext.request.contextPath }/resources/images/Caffe-Americano.jpg"},
			e_foam:{name:"에스프레소 마끼아또", url:"${pageContext.request.contextPath }/resources/images/espresso-macchiato.jpg"},
			e_con:{name:"에스프레소 콘빠냐",url:"${pageContext.request.contextPath }/resources/images/Con-panna.jpg"},

			e_milk_foam:{name:"카푸치노", url:"${pageContext.request.contextPath }/resources/images/Cappuccino.jpg"},
			e_milk_con:{name:"존재하지 않는 메뉴입니다.", url:"${pageContext.request.contextPath }/resources/images/empty.jpg"},
			
			e_water_con:{name:"비엔나", url:"${pageContext.request.contextPath }/resources/images/Einspanner-Coffee.jpg"},

			e_con_milk:{name:"존재하지 않는 메뉴입니다.", url:"${pageContext.request.contextPath }/resources/images/empty.jpg"},
			e_con_water:{name:"비엔나", url:"${pageContext.request.contextPath }/resources/images/Einspanner-Coffee.jpg"},
			e_con_foam:{name:"존재하지 않는 메뉴입니다.", url:"${pageContext.request.contextPath }/resources/images/empty.jpg"},
			
			e_foam_milk:{name:"카푸치노", url:"${pageContext.request.contextPath }/resources/images/Cappuccino.jpg"},
			e_foam_con:{name:"존재하지 않는 메뉴입니다.", url:"${pageContext.request.contextPath }/resources/images/empty.jpg"},

			e_milk_foam_cho:{name:"카페모카", url:"${pageContext.request.contextPath }/resources/images/Cafe-Mocha.jpg"},
			e_milk_foam_ca:{name:"캬라멜마끼아또", url:"${pageContext.request.contextPath }/resources/images/Caramel-Macchiato.jpg"},
			e_milk_foam_va:{name:"바닐라라떼", url:"${pageContext.request.contextPath }/resources/images/Vanillalatte.jpg"},

			e_milk_con_cho:{name:"카페모카", url:"${pageContext.request.contextPath }/resources/images/Cafe-Mocha.jpg"},
			e_milk_con_ca:{name:"캬라멜마끼아또", url:"${pageContext.request.contextPath }/resources/images/Caramel-Macchiato.jpg"},
			e_milk_con_va:{name:"바닐라라떼", url:"${pageContext.request.contextPath }/resources/images/Vanillalatte.jpg"},

			e_foam_milk_cho:{name:"카페모카", url:"${pageContext.request.contextPath }/resources/images/Cafe-Mocha.jpg"},
			e_foam_milk_ca:{name:"캬라멜마끼아또", url:"${pageContext.request.contextPath }/resources/images/Caramel-Macchiato.jpg"},
			e_foam_milk_va:{name:"바닐라라떼", url:"${pageContext.request.contextPath }/resources/images/Vanillalatte.jpg"},

			e_foam_con_va:{name:"존재하지 않는 메뉴입니다.", url:"${pageContext.request.contextPath }/resources/images/empty.jpg"},
			e_foam_con_ca:{name:"존재하지 않는 메뉴입니다.", url:"${pageContext.request.contextPath }/resources/images/empty.jpg"},
			e_foam_con_cho:{name:"존재하지 않는 메뉴입니다.", url:"${pageContext.request.contextPath }/resources/images/empty.jpg"},

			e_con_milk_cho:{name:"카페모카", url:"${pageContext.request.contextPath }/resources/images/Cafe-Mocha.jpg"},
			e_con_milk_va:{name:"바닐라라떼", url:"${pageContext.request.contextPath }/resources/images/Einspanner-Coffee.jpg"},
			e_con_milk_ca:{name:"캬라멜마끼아또", url:"${pageContext.request.contextPath }/resources/images/Caramel-Macchiato.jpg"},

			e_water_con_cho:{name:"비엔나", url:"${pageContext.request.contextPath }/resources/images/Einspanner-Coffee.jpg"},
			e_water_con_ca:{name:"비엔나", url:"${pageContext.request.contextPath }/resources/images/Einspanner-Coffee.jpg"},
			e_water_con_va:{name:"비엔나", url:"${pageContext.request.contextPath }/resources/images/Einspanner-Coffee.jpg"},
			
			e_con_water_ca:{name:"비엔나", url:"${pageContext.request.contextPath }/resources/images/Einspanner-Coffee.jpg"},
			e_con_water_cho:{name:"비엔나", url:"${pageContext.request.contextPath }/resources/images/Einspanner-Coffee.jpg"},
			e_con_water_va:{name:"비엔나", url:"${pageContext.request.contextPath }/resources/images/Einspanner-Coffee.jpg"},

			e_con_foam_ca:{name:"캬라멜마끼아또", url:"${pageContext.request.contextPath }/resources/images/Caramel-Macchiato.jpg"},
			e_con_foam_va:{name:"바닐라라떼", url:"${pageContext.request.contextPath }/resources/images/Vanillalatte.jpg"},
			e_con_foam_cho:{name:"카페모카", url:"${pageContext.request.contextPath }/resources/images/Cafe-Mocha.jpg"}
		}
	</script>
</body>
</html>