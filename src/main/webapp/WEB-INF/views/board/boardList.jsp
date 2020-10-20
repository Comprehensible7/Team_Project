<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css" />">
<title>掲示板リスト</title>
<script type="text/javascript">
	function boardWriteForm() {
		location.href = "/board/boardWriteForm";
	}

	function searchBoard() {
		var searchType = document.getElementById("searchType").value;
		var searchText = document.getElementById("searchText").value;

		document.getElementById("type").value = searchType;
		document.getElementById("text").value = searchText;

		document.getElementById("searchForm").submit();
	}
</script>
<style>
a, a:hover {
	color: #000000;
	text-decoration: none;
}

form {
	margin: 0 auto;
	width: 250px;
}

.navigator {
	margin: 0 auto;
	width: 250px;
}

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




				<ul class="nav navbar-nav navbar-right">
					<c:if test="${sessionScope.loginId != null}">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false"><c:if
									test="${sessionScope.loginId != null}">
								${sessionScope.loginName}${sessionScope.loginId}さん
							</c:if> <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="member/logout">ログアウト</a></li>

							</ul></li>
					</c:if>
				</ul>
			</div>
		</nav>
		<div class="container">
			<div class="row">
				<table class="table table-striped" style="">
					<thead style="text-align: center;">
						<tr>
							<th style="background-color: #eeeeee; text-align: center;">番号</th>
							<th style="background-color: #eeeeee; text-align: center;">タイトル</th>
							<th style="background-color: #eeeeee; text-align: center;">作成者</th>
							<th style="background-color: #eeeeee; text-align: center;">アクセス数</th>
							<th style="background-color: #eeeeee; text-align: center;">登録日</th>
						</tr>
					</thead>
					<tbody style="text-align: center;">
						<tr>
							<!-- 반복 시작 -->
							<c:forEach items="${list }" var="data" varStatus="status">
								<tr>
									<td>${status.count }</td>
									<td><a href="/board/boardRead?board_no=${data.BOARD_NO }">${data.BOARD_TITLE }</a>
									</td>
									<td>${data.MEMBER_NM }</td>
									<td>${data.BOARD_INDATE }</td>
									<td>${data.BOARD_HITS }</td>
								</tr>
							</c:forEach>
						</tr>
					</tbody>
				</table>
				<!-- <p>
	◁ ◁ ◀ 1 2 3 4 5 ▶ ▷ ▷
	</p> -->
				<input type="button" class="btn btn-primary pull-right" value="物書き"
					onClick="location.href='boardWriteForm';">
			</div>
		</div>
		<br>
		<div class="text-center">
			<select id="searchType">
				<option value="title">タイトル</option>
				<option value="name">書き手</option>
			</select> <input type="text" id="searchText"> <input type="button"
				value="検索" onclick="searchBoard()">

			<form action="/board/boardList" method="get" id="searchForm">

				<input type="hidden" name="searchType" id="type"> <input
					type="hidden" name="searchText" id="text">
			</form>
		</div>
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="js/bootstrap.js"></script>
	</div>
</body>
</html>