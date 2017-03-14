<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title></title>
	<link href="${pageContext.request.contextPath }/resources/css/bootstrap.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/css/board.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath }/resources/js/jquery-3.1.1.js"></script>
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
        .eventItem{
        	text-align: center;
        }
        .eventImg{
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
           		<h3>진행중인 이벤트</h3>
      			<div class="eventItem">
      				<ul>
      				<c:forEach items="${list }" var="tmp" begin="0" end="2">
      					<li>
      						<div class="eventImg">
      							<a href="${tmp.event_url }">
      								<img src="${pageContext.request.contextPath}/upload/${tmp.img_name }"/>
      							</a>
      						</div>
      						<div class="eventItem">
      							<h5>${tmp.title }</h5>
      							<p>${tmp.event_date }</p>
      						<c:if test="${not empty admin }">
      							<a class="btn btn-default btn-xs" href="${pageContext.request.contextPath }/admin/event-updateform.do?num=${tmp.num }">수정</a>
      							<input type="checkbox" name="end_event" id="end_event" value="${tmp.num }"/>			
      						</c:if>
      						</div>
      					</li>
      				</c:forEach>
      				</ul>
      			</div>
           </div>
        </section>
        <div class="img-holder" data-image="${pageContext.request.contextPath }/resources/images/basm.jpg" data-cover-ratio="0.75" data-width="1600" data-height="800"></div>
        <section>
			<div class="event_list">
				<h3>진행중인 이벤트</h3>
      			<div class="eventItem">
      				<ul>
      				<c:forEach items="${list }" var="tmp" begin="3" end="5">
      					<li>
      						<div class="eventImg">
      							<a href="${tmp.event_url }">
      								<img src="${pageContext.request.contextPath}/upload/${tmp.img_name }"/>
      							</a>
      						</div>
      						<div class="eventItem">
      							<h5>${tmp.title }</h5>
      							<p>${tmp.event_date }</p>
      						<c:if test="${not empty admin }">
      							<a class="btn btn-default btn-xs" href="${pageContext.request.contextPath }/admin/event-updateform.do?num=${tmp.num }">수정</a>
      							<input type="checkbox" name="end_event" id="end_event" value="${tmp.num }"/>			
      						</c:if>
      						</div>
      					</li>
      				</c:forEach>
           			</ul>
				</div>
           </div>
        </section>

        <div class="img-holder" data-image="${pageContext.request.contextPath }/resources/images/bate.jpg"></div>

        <section>
           <div class="event_list">
           		<h3>진행중인 이벤트</h3>
      			<div class="eventItem">
      				<ul>
      				<c:forEach items="${list }" var="tmp" begin="6" end="8">
      					<li>
      						<div class="eventImg">
      							<a href="${tmp.event_url }">
      								<img src="${pageContext.request.contextPath}/upload/${tmp.img_name }"/>
      							</a>
      						</div>
      						<div class="eventItem">
      							<h5>${tmp.title }</h5>
      							<p>${tmp.event_date }</p>
      						<c:if test="${not empty admin }">
      							<a class="btn btn-default btn-xs" href="${pageContext.request.contextPath }/admin/event-updateform.do?num=${tmp.num }">수정</a>
      							<input type="checkbox" name="end_event" id="end_event" value="${tmp.num }"/>			
      						</c:if>
      						</div>
      					</li>
      				</c:forEach>
           			</ul>
				</div>
           </div>
        </section>
    </div>
    <script src="${pageContext.request.contextPath }/resources/js/jquery-3.1.1.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jquery.imageScroll.js"></script>
	<script>
        $(".img-holder").imageScroll({
            container: $('.right-col')
        });
    </script>
</body>
</html>