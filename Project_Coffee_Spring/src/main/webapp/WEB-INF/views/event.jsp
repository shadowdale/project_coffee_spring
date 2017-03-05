<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>이벤트</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css"></link>
	<script src="${pageContext.request.contextPath }/resources/js/jquery-3.1.1.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/jquery.imageScroll.js"></script>
	<style>
        body {
        	 margin: 0;
        	 padding: 0;
        }
        section {
        	 padding: 5%; 
        	 margin: 0 auto;
        }
        .left-col { 
        	float: left; 
        	position: relative; 
        	z-index: 1; 
        	width: 10%; 
        	min-height: 1000px; 
        	background-color: #666; 
        }
        .right-col { 
        	overflow: hidden; 
        }
        li{
        	display: inline-block;
        }
        dd{
        	text-align: center;
        }
        dt{
        	padding: 20px;
        }
        img{
        	width: 300px;
        }

		html,body{
			height: 100%;
		}
    </style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"/>
    <div class="right-col">
        <div class="img-holder" data-image="${pageContext.request.contextPath }/resources/images/baco.jpg" data-width="1600" data-height="800" data-extra-height="0"></div>

        <section>
           <div class="event_list">
           		<dl>
           			<dt><h3>진행중인 이벤트</h3><br></dt>
           			<dd>
           				<ul>
           					<li>
           						<dl>
           							<dt><a href="http://www.istarbucks.co.kr/whats_new/campaign_view.do?pro_seq=1222&menu_cd="><img src="http://www.istarbucks.co.kr/upload/promotion/WEB_THUM_FILE20161020194325900.jpg"/></a></dt>
           							<dd>
           								<h5>마법과 같은 크리스마스 프로모션이 <br> 시작됩니다!</h5>
           								<p>2016-10-21 ~ 2016-11-3</p>
           							</dd>
           						</dl>
           					</li>

           					<li>
           						<dl>
           							<dt><a href="http://www.istarbucks.co.kr/whats_new/campaign_view.do?pro_seq=1223&menu_cd="><img src="http://www.istarbucks.co.kr/upload/promotion/WEB_THUM_FILE20161017113250695.jpg"/></a></dt>
           							<dd>
           								<h5>마이 스타벅스 리워드 5주년 <br>기념 케익 구매 이벤트</h5>
           								<p>2016-10-19 ~ 2016-10-26</p>
           							</dd>
           						</dl>
           					</li>

           					<li>
           						<dl>
           							<dt><a href="http://www.istarbucks.co.kr/whats_new/campaign_view.do?pro_seq=1224&menu_cd="><img src="http://www.istarbucks.co.kr/upload/promotion/WEB_THUM_FILE20161017132201217.jpg"/></a></dt>
           							<dd>
           								<h5>라임 패션 티 보너스 스타 <br> 이벤트</h5>
           								<p>2016-10-19 ~ 2016-10-27</p>
           							</dd>
           						</dl>
           					</li>
           				</ul>
           			</dd>
           		</dl>
           </div>
        </section>

        <div class="img-holder" data-image="${pageContext.request.contextPath }/resources/images/basm.jpg" data-cover-ratio="0.75" data-width="1600" data-height="800"></div>

        <section>
           <div class="event_list">
           		<dl>
           			<dt><h3>진행중인 이벤트</h3><br></dt>
           			<dd>
           				<ul>
           					<li>
           						<dl>
           							<dt><a href="http://www.smoothieking.co.kr/event/event_view.do?articleNo=180&eventType=1"><img src="${pageContext.request.contextPath }/resources/images/ev_sm1.png"/></a></dt>
           							<dd>
           								<h5>우리땅에서 자란 우리스무디 구매시</h5><br>
           								<h4>사이즈업!</h4>
           								<p>2016-10-21 ~ 2016-11-3</p>
           							</dd>
           						</dl>
           					</li>

           					<li>
           						<dl>
           							<dt><a href="http://www.smoothieking.co.kr/event/event_view.do?articleNo=184&eventType=1"><img src="${pageContext.request.contextPath }/resources/images/ev_sm3.png"/></a></dt>
           							<dd>
           								<h5>스무디킹이 만들다 라떼, 티</h5><br>
           								<h4>착해지다!</h4>
           								<p>2016-10-07 ~ 2017-02-28</p>
           							</dd>
           						</dl>
           					</li>

           					<li>
           						<dl>
           							<dt><a href="http://www.smoothieking.co.kr/event/event_view.do?articleNo=185&eventType=1"><img src="${pageContext.request.contextPath }/resources/images/ev_sm2.png"/></a></dt>
           							<dd>
           								<h5>킹커피 착해지다!</h5><br>
           								<h4>2,000원</h4>
           								<p>2016-10-19 ~ 2017-02-28</p>
           							</dd>
           						</dl>
           					</li>
           				</ul>
           			</dd>
           		</dl>
           </div>
        </section>

        <div class="img-holder" data-image="${pageContext.request.contextPath }/resources/images/bate.jpg"></div>

        <section>
           <div class="event_list">
           		<dl>
           			<dt><h3>진행중인 이벤트</h3><br></dt>
           			<dd>
           				<ul>
           					<li>
           						<dl>
           							<dt><a href="http://www.ogada.co.kr/sub/board.php?mn=event&fn=notice&md=v&bn=board_25&zest_bn=board_25&seq=24&field=&keyword=&page=1"><img src="${pageContext.request.contextPath }/resources/images/ev_te1.png"/></a></dt>
           							<dd>
           								<h5>스파클링 블렌딩티 출시기념</h5><br>
           								<h4>'1+1 이벤트'</h4>
           								<p>2016-10-21 ~ 2016-11-3</p>
           							</dd>
           						</dl>
           					</li>

           					<li>
           						<dl>
           							<dt><a href="http://www.ogada.co.kr/sub/board.php?mn=event&fn=notice&md=v&bn=board_25&zest_bn=board_25&seq=21&field=&keyword=&page=2"><img src="${pageContext.request.contextPath }/resources/images/ev_te2.png"/></a></dt>
           							<dd>
           								<h5>'오가다<c:out value="&" />오쉐이크' 티몬</h5><br>
           								<h4>할인 딜 판매</h4>
           								<p>2016-10-19 ~ 2016-10-26</p>
           							</dd>
           						</dl>
           					</li>

           					<li>
           						<dl>
           							<dt><a href="http://www.ogada.co.kr/sub/board.php?mn=event&fn=notice&md=v&bn=board_25&zest_bn=board_25&seq=17&field=&keyword=&page=2"><img src="${pageContext.request.contextPath }/resources/images/ev_te3.png"/></a></dt>
           							<dd>
           								<h5>둘이라서 더 즐거운 오가다</h5><br>
           								<h4>세트메뉴 출시</h4>
           								<p>2016-10-19 ~ 2017-01-10</p>
           							</dd>
           						</dl>
           					</li>
           				</ul>
           			</dd>
           		</dl>
           </div>
        </section>
    </div>

<script src="${pageContext.request.contextPath }/resources/js/jquery.imageScroll.js"></script>
<script>
        $(".img-holder").imageScroll({
//            image: null,
//            imageAttribute: 'image',
            container: $('.right-col')
//            speed: 0.2,
//            coverRatio: 0.75,
//            holderClass: 'imageHolder',
//            holderMinHeight: 200,
//            extraHeight: 0,
//            mediaWidth: 1600,
//            mediaHeight: 900,
//            parallax: true,
//            touch: false
        });
    </script>
</body>
</html>