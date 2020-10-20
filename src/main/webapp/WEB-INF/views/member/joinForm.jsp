<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css" />">
<!--웹폰트 -->
<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css" />">
<title>会員加入</title>
<style>
body, html {
	margin: 0;
	padding: 0;
	height: 100%;
}

.bgimg {
	border: 0;
	padding: 0;
	background-image: url('/image/backimg.jpg');
	min-height: 100%;
	background-size: cover;
}
</style>


<script>
//가입폼 확인
function formCheck() {
	var id = document.getElementById('id');
	var pw = document.getElementById('password');
	var name = document.getElementById('name');
	
	if (id.value.length < 3 || id.value.length > 10) {
		alert("IDは3~10文字で入力してください。");
		id.focus();
		id.select();
		return false;
	}
	if (pw.value.length < 3 || pw.value.length > 10) {
		alert("パスワードは3~10文字で入力してください");
		pw.focus();
		pw.select();
		return false;
	}
	
	if (name.value == '') {
		alert("名前を入力してください。");
		name.focus();
		name.select();
		return false;
	}
	return true;
}


</script>
</head>

<body>
<div class="bgimg">
		<nav class="navbar navbar-default">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">JEONGMUA</a>
			</div>
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="#">メーン</a></li>
					<li><a href="board/boardList">掲示板</a></li>

				</ul>

				<ul class="nav navbar-nav navbar-right">
					<c:if test="${sessionScope.loginId == null}">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false"> 接続<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="member/loginForm">ログイン</a></li>
								<li><a href="member/joinForm">会員加入</a></li>
							</ul></li>
					</c:if>
				</ul>




			
			</div>
		</nav>

	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px; background-color: rgba(0, 0, 0, 0.05);">
				<form id="joinform" action="join" method="post"
					onsubmit="return formCheck();">
					<h2 style="text-align: center;"><strong>会員加入</strong></h2>
					<div class="form-group">
						<input type="text" name="member_id" id="id" maxlength="10"
							placeholder="ID" class="form-control" value="${member.id}">
					</div>
					<div class="form-group">
						<input type="password" name="member_pw" id="password"
							placeholder="パスワード入力" class="form-control"
							value="${member.password}">
					</div>
					<div class="form-group">
						<input type="text" name="member_nm" id="name" placeholder="名前"
							class="form-control" value="${member.name}">
					</div>
				
				
					
					<input type="submit" class="btn btn-primary form-control"
						value="会員加入"> 
				
				</form>
			</div>
		</div>
		<div class="col-lg-4"></div>
	</div>
	

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src=<c:url value="/js/bootstrap.js" />></script>
	</div>
</body>
</html>