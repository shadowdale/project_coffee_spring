<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Cooffee_Board</title>
	<link href="${pageContext.request.contextPath }/resources/css/bootstrap.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/css/board.css" rel="stylesheet">
	<style type="text/css">
		.content-title {
			margin-top: 10px;
			margin-bottom: 20px;
		}
	</style>
	
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"/>
	<div class="container">
		<div class="row">
			<h2 style="padding-left: 30px; margin-top:0">Coffee Board</h2>
			
			<!-- 동적으로 띄울 Modal 준비 -->

			<!-- 새글 작성 버튼 만들기 -->
			<a href="insertform.do" id="newContentForm" class="btn btn_shape button1" 
			data-stat="<c:choose>
						<c:when test="${empty id }">
							0
						</c:when>
						<c:otherwise>
							1
						</c:otherwise>
			</c:choose>">게시글작성</a><br/>
			<hr>
			<div class="row">
			<c:forEach var="tmp" items="${list }" varStatus="stat">
				<c:if test="${stat.index eq 3 }">
					</div>
					<div class="row">
				</c:if>
				<div class="col-xs-4 col-sm-4 picture1">
					<a href="javascript:modal(${tmp.num })">
						<img class="img-responsive img-thumbnail" src="${pageContext.request.contextPath}/upload/${tmp.imgAddr}">
					</a>
					<h3 class="content-title">
						<a href="javascript:modal(${tmp.num })">${tmp.title }</a>
					</h3>
				</div>
			</c:forEach>
			</div>
		</div>
		
		<div id="imgpop" class="modal modal-center fade">
		   <div class="modal-dialog modal-center modal-size">
		      	<div class="modal-content modal-size">
			      	<button class="close" data-dismiss="modal" id="btn_close">&times;</button>
			      	<div class="row">
			      		<!-- 게시글 이동 버튼  -->
						<div class="modal-move col-xs-1 m-left">
							<a id="move-left" href="" class="glyphicon glyphicon-chevron-left"><span class="sr-only">left</span></a>
						</div>
						<!-- 게시글 컨테이너 -->
				      	<div class="col-xs-10 m-center" style="height: 600px">
							<div class="col-xs-6 center-left">
								<!-- 업로드 사진 위치 -->
								<img id="modalImg" style="width:100%; top:0px;" src=""/>
							</div>
						
							<div class="col-xs-6 center-right">
								<!-- 게시글 제목 -->
								<h3 id="modalTilte"></h3>
								<hr/>
								<!-- 게시글 내용 -->
								<div class="text-left">
									<p id="modalContent"></p>
								</div>
								<hr/>
								<!-- 게시글 덧글 -->
								<div class="modalScoll">
									<div id="modal-comment" class="comment-list">
									<!-- 덧글 리스트 위치 -->
									</div>
								</div>
								<!-- 게시글 덧글 입력 폼 -->
								<div>
									<form id="commentform" action="board/commentinsert.do" method="post">
										<!-- 덧글 작성자 -->
										<input type="hidden" name="writer" id="commentWriter"/>
										<!-- 덧글 그룹 -->
										<input type="hidden" name="ref_group" id="commentRef"/>
										<!-- 덧글 대상 -->
										<input type="hidden" name="target_id" id="commentTarget" />
										<div class="input-group">
											<!-- 덧글 입력 -->
											<input class="form-control input-sm" type="text" name="content" class="inputgruop" id="commentInput"/>			
											<div class="input-group-btn">
												<button class="btn btn-default btn-sm" type="submit">입력</button>
											</div>
										</div>
									</form>
								</div>
							</div>
							<!-- 게시글 수정 삭제 버튼 -->
							<div class="upDeleteBtn" style="magin-top:5px;">
								<button class="btn btn-primary btn-xs" id="contentUpdateBtn">수정</button>
								<button class="btn btn-danger btn-xs" id="contentDeleteBtn">삭제</button>
		      				</div>
		      			</div>
		      			<!-- 게시글 이동 버튼 -->
		      			<div class="modal-move col-xs-1 m-right">
							<a id="move-right" href="" class="glyphicon glyphicon-chevron-right" style="top:-39px"><span class="sr-only">right</span></a>
	      				</div>
		      		</div>
		   		</div>
			</div>
		</div>
	</div>
	<!-- 페이지 이동 버튼  -->
	<div class="row text-center">
		<div class="col-lg-12">
			<ul class="pagination">
			<c:choose>
				<c:when test="${startPageNum ne 1 }">
			   		<li><a href="list.do?pageNum=${startPageNum-1 }&condition=${condition }&keyword=${keyword }">&laquo;</a></li>
				</c:when>
				<c:otherwise>
			   		<li class="disabled"><a href="javascript:">&laquo;</a></li>
				</c:otherwise>
			</c:choose>
			<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
				<c:choose>
					<c:when test="${i eq pageNum }">
						<li class="active"><a href="list.do?pageNum=${i }&condition=${condition }&keyword=${keyword }">${i }</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="list.do?pageNum=${i }&condition=${condition }&keyword=${keyword }">${i }</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:choose>
				<c:when test="${endPageNum lt totalPageCount }">
			  		<li><a href="list.do?pageNum=${endPageNum+1 }&condition=${condition }&keyword=${keyword }">&raquo;</a></li>
				</c:when>
				<c:otherwise>
			  		<li class="disabled"><a href="javascript:">&raquo;</a></li>
				</c:otherwise>
			</c:choose>
			</ul>
		</div>
	</div>
	<br />
	<br />
	<div class="col-xs-6 col-xs-push-3">
		<form action="list.do" method="post" id="keywordForm">
			<div class="input-group">
				<select class="form-control input-group" style="width:30%" name="condition" id="condition"><c:if test=""></c:if>
					<option value="titlecontent" <c:if test="${condition eq 'titlecontent' }">selected</c:if>>제목+내용</option>
					<option value="title" <c:if test="${condition eq 'title' }">selected</c:if>>제목</option>
					<option value="writer" <c:if test="${condition eq 'writer' }">selected</c:if>>작성자</option>
				</select>
				<input class="form-control input-group" style="width:70%" type="text" name="keyword" placeholder="검색어"  value="${keyword }"/>
				<div class="input-group-btn">
					<button class="btn btn-default" type="submit">검색</button>
				</div>
			</div>
		</form>
	</div>
	<footer style="height:50px"></footer>
	
	<script src="${pageContext.request.contextPath }/resources/js/jquery-3.1.1.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
	<script>
	
		$(".upDeleteBtn").hide();
	
		// 검색키워드 저장
		var condition = "${condition}";
		var keyword = "${keyword}";
		
		// 글 자세히보기 이벤트 처리
		function modal(num){
			$.ajax({
				url:"detail.do",
				method:"get",
				dataType:"Json",
				data:{num:num, condition:"${condition}", keyword:"${keyword}"},
				success:function(data){
					// 게시글 제목 출력
					$("#modalTilte").text(data.dto.title);
					// 게시글 내용 출력
					$("#modalContent").text(data.dto.content);
					// 게시글 이미지 출력
					$("#modalImg").attr("src","${pageContext.request.contextPath}/upload/"+data.dto.imgAddr);
					// 이전글 있는지 확인
					if(data.dto.prevNum != 0){ // 있을경우
						$("#move-left").attr("href","javascript:modal("+data.dto.prevNum+")").show();
					} else { // 없을 경우
						$("#move-left").attr("href","javascript:").hide();
					}
					// 다음글 있는지 확인
					if(data.dto.nextNum != 0){ // 있는 경우
						$("#move-right").attr("href","javascript:modal("+data.dto.nextNum+")").show();
					} else { // 없는 경우
						$("#move-right").attr("href","javascript:").hide();
					}
					// 검색키워드를 변수에 저장
					condition = data.dto.condition;
					keyword = data.dto.keyword;
					
					// 게시글 덧글목록 출력 초기화
					$("#modal-comment").find("div").remove();
					// 반복문 돌면서 덧글 출력
					$(data.commentList).each(function(index, item){
						// 덧글 수정시 초기값 저장할 변수
						var commentSave = "";
						// 덧글 작성자
						var $writer = $("<strong/>").text(item.writer);
						var $commentTop = $("<p/>").append($writer);
						// 덧글 내용
						var $content = $("<span/>").text(item.content);
						// 내가 쓴 덧글이라면
						if(item.myCommnet) {
							var $commentUpdateformBtn = $("<a/>")
														.text("수정")
														.addClass("comUpBtn btn btn-default btn-xs")
														.attr("href","javascript:")
														.click(function() { // 클릭 이벤트 등록
															// 수정버튼을 눌렀을 경우
															if($(this).text() == "수정") {
																// 수정전 내용을 변수에 저장
																commentSave = $(this).parent().find("span").text();
																// 버튼을 취소로 변경
																$(this).text("취소");
																// 댓글 내용출력 내용을 삭제
																$(this).parent().find("span").remove();
																// 삭제된 내용출력 위치에 input으로 변경
																$(this).parent().append("<input/>").find("input").val(commentSave); 
																// 수정 확인 버튼 만들기
																$(this).parent().append(
																	$("<a/>")
																	.text("확인")
																	.addClass("btn btn-default btn-xs")
																	.attr("href","javascript:")
																	.addClass("send")
																	.click(function(){ // 수정확인 버튼 이벤트 등록
																		var commentContent = $(this).parent().find("input").val();
																		var commentnum = $(this).parent().attr("commentNum");
																		$.ajax({
									 										url: "commentupdate.do",
									 										method: "post",
									 										data: {num:commentnum, content:commentContent},
									 										success:function(data) {
									 											// 로그인 되었을 경우
									 											if(data.isLoginCheck) {
																					$("div[commentNum="+commentnum+"]")
																					.find(".comUpBtn")
																					.text("수정")
																					$("div[commentNum="+commentnum+"]").find("input").remove()
																					$("div[commentNum="+commentnum+"]").find(".send").remove()
																					$("div[commentNum="+commentnum+"]").append("<span/>").find("span").text(commentContent);
									 											} else { // 로그인 안됬을 경우
									 												$("div[commentNum="+commentnum+"]")
																					.find(".comUpBtn")
																					.text("수정")
																					$("div[commentNum="+commentnum+"]").find("input").remove()
																					$("div[commentNum="+commentnum+"]").find(".send").remove()
									 												$("div[commentNum="+commentnum+"]").append("<span/>").find("span").text(commentSave);
									 												
									 											}
									 										}
									 									})
								 									})
								 								);
															} else if($(this).text() == "취소"){ // 취소버튼을 눌렀을 경우
																$(this).text("수정");
																$(this).parent().find("input").remove();
																$(this).parent().find(".send").remove();
																$(this).parent().append("<span/>").find("span").text(commentSave); 
															}
														});
							// 삭제 버튼 만들기
							var $commentDeleteBtn = $("<a/>").text("삭제").attr("href","javascript:commentDelete("+item.num+")").addClass("btn btn-default btn-xs");
							
						};
						// 생성된 버튼을 덧글에 등록
						$("#modal-comment").append($("<div/>").append($commentTop)
															  .append($commentDeleteBtn)
															  .append($commentUpdateformBtn).append($("<br/>"))
															  .append($content)
															  .attr("commentNum", item.num));
					});
					$("#commentRef").val(num)
					$("#commentTarget").val(data.writer)
					$("#commentWriter").val(data.loginId)
					// 게시글 작성자를 확인해서
					if(data.isWriter) { // 내가 쓴 글이라면
						$(".upDeleteBtn").show();
					} else { // 내가 쓴 글이 아니라면
						$(".upDeleteBtn").hide();
					}
					$("#imgpop").modal("show");
					
					$(".modalScoll").scrollTop(9999999);
				}
			});
			//return false;
		}
		
		// 덧글 달기 이벤트 처리
		$("#commentform").submit(function() {
			var comment = $(this).serialize();
			$.ajax({
				url: "commentinsert.do",
				method: "post",
				dataType: "Json",
				data: comment,
				success:function(data) {
					if(data.isLoginCheck) {
						$("#commentInput").val("");
						var $writer = $("<strong/>").text(data.writer);
						var $commentTop = $("<p/>").append($writer);
						var $content = $("<span/>").text(data.content).addClass("comment-detail");
						var $commentUpdateformBtn = $("<a/>")
						.text("수정")
						.addClass("comUpBtn btn btn-default btn-xs")
						.attr("href","javascript:")
						.click(function() {
							if($(this).text() == "수정") {
								commentSave = $(this).parent().find("span").text();
								$(this).text("취소");
								$(this).parent().find("span").remove();
								$(this).parent().append("<input/>").find("input").val(commentSave); 
								$(this).parent().append(
									$("<a/>")
									.text("확인")
									.addClass("comUpBtn btn btn-default btn-xs")
									.attr("href","javascript:")
									.addClass("send")
									.click(function(){
										var commentContent = $(this).parent().find("input").val();
										var commentnum = $(this).parent().attr("commentNum");
										$.ajax({
	 										url: "commentupdate.do",
	 										method: "post",
	 										data: {num:commentnum, content:commentContent},
	 										success:function(data) {
												$("div[commentNum="+commentnum+"]")
												.find(".comUpBtn")
												.text("수정")
												$("div[commentNum="+commentnum+"]").find("input").remove()
												$("div[commentNum="+commentnum+"]").find(".send").remove()
												$("div[commentNum="+commentnum+"]").append("<span/>").find("span").text(commentContent);
	 										}
	 									})
 									})
 								);
							} else if($(this).text() == "취소"){
								$(this).text("수정");
								$(this).parent().find("input").remove();
								$(this).parent().find(".send").remove();
								$(this).parent().append("<span/>").find("span").text(commentSave); 
							}
						});
						
						
						var $commentDeleteBtn = $("<a/>").text("삭제").attr("href","javascript:commentDelete("+data.num+")").addClass("btn btn-default btn-xs");
						$("#modal-comment").append($("<div/>").append($commentTop)
															  .append($commentDeleteBtn)
															  .append($commentUpdateformBtn).append($("<br/>"))
															  .append($content)
															  .attr("commentNum", data.num));
						
						$(".modalScoll").scrollTop(9999999);
						
					} else {
						loginBoxMove();
						$("#imgpop").modal("hide");
					}
				}
			});
			return false;
		});
		
		// 게시글 삭제
		$("#contentDeleteBtn").click(function() {
			var isDelete=confirm("글을 삭제 하시겠습니까?");
			if(isDelete){
				var ref_group = $("#commentRef").val();
				location.href="delete.do?num="+ref_group;
			}
		})
		
		// 게시글 수정 
		$("#contentUpdateBtn").click(function() {
			var ref_group = $("#commentRef").val();
			location.href="updateform.do?num="+ref_group;
		})
		
		// 로그인 박스 무브 
		function loginBoxMove() {
			$(".enterance_idClick")
			.css("background-color","rgba(250,100,100,0.1)")
			.css("transition","all 0.4s")
			.css("-webkit-transform","translateX(-250px)");
			
			$(".enterance_idClick_contents")
			.css("opacity",0.7)
			.css("transition","all 0.6s");
			
			$(".enterance_escape")
			.css("background-color","rgba(250,100,100,0.2)");
			
			$("div[isHide]").attr("isHide","1")
			alert("로그인이 필요합니다");
			
			$("#signinForm").find("input[name=id]").focus();
		}
		
		// 댓글 삭제
		function commentDelete(num) {
			$.ajax({
				url : "commentdelete.do",
				method : "post",
				data : {num:num},
				success : function(data) {
					if(date.isLoginCheck) {
						$("div[commentNum="+num+"]").remove();
					} else {
						alert("로그인이 필요합니다");
					}
				}
			})
			return false;
		};
	</script>
</body>
</html>