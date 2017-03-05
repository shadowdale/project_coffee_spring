<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>글 등록</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />

<style>
		.help-block{
			display: none;
		}
		.container{
			
		}
		.picture{
			height:300px;
			border:1px solid black;
			background-color:rgba(250,250,250,0.3);
		}
		.pic-label{
			width:100%;
		}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
	
	<!-- ------------------------------------------------------- -->
		<header style="height:95px;"></header>
		<div class="container">
			<div class="row col-xs-6 col-xs-push-3">
				<h3>새 글 페이지 입니다.</h3>
				<form action="insert.do" method="post" enctype="multipart/form-data">
					<input type="hidden" name="writer" value="${id }" />
					<div class="form-group">
						<div id="holder" class="picture col col-xs-12"></div>
						<label class="control-label pic-label" for="pic">사진</label>
						<input class="form-control" type="file" id="pic" name="file"/>
					</div>
					<div class="form-group">
						<label class="control-label" for="title">제목</label>
						<input class="form-control" type="text" id="title" name="title" value=""/>
					</div>
					<div class="form-group">
						<label class="control-label" for="content">설명</label>
						<textarea class="form-control" id="content" name="content"></textarea>
					</div>
					<button type="submit">등록</button>
				</form>
			</div>
		</div>

<script src="${pageContext.request.contextPath }/resources/js/jquery-3.1.1.js"></script>
	<script>
		var upload = document.getElementById('pic'),
		    holder = document.getElementById('holder');

		upload.onchange = function (e) {
		  e.preventDefault();
		
		  var file = upload.files[0],
		      reader = new FileReader();
		  reader.onload = function (event) {
		    var img = new Image();
		    img.src = event.target.result;
		    // note: no onload required since we've got the dataurl...I think! :)
		    
		    img.width = 300;
		    img.height = 300;
		    holder.innerHTML = '';
		    holder.appendChild(img);
		  };
		  reader.readAsDataURL(file);
		
		  return false;
		};
	</script>

</body>
</html>