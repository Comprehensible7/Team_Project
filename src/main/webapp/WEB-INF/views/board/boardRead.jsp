<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>掲示文</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css" />">
<script type="text/javascript">
	function boardDelete(){
		var board_no = document.getElementById("board_no").value;
		location.href = "/board/boardDelete?board_no="+board_no;
	}

	function boardUpdateForm(){
		var board_no = document.getElementById("board_no").value;
		location.href = "/board/boardUpdateForm?board_no="+board_no;
	}
</script>

</head>
<body>

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

				<thead>
					<tr>
						<th colspan="3"
							style="background-color: #eeeeee; text-align: center;">リスト</th>
					</tr>
				</thead>
				<tbody>
					
					<tr>
						<th style="width: 100px;">名前</th>
						<td style="width: 600px;">${map.MEMBER_NM }</td>
					</tr>
					<tr>
						<th style="width: 100px;">作成日</th>
						<td colspan="2">${map.BOARD_INDATE }</td>
					</tr>
					<tr>
						<th>アクセス数</th>
						<td>${map.BOARD_HITS }</td>
					</tr>
					<tr>
						<th>タイトル</th>
						<td colspan="2">${map.BOARD_TITLE }</td>
					</tr>
					<tr>
						<th>内容</th>
						<td colspan="2" style="min-height: 400px; text-align: left;"><pre>${map.BOARD_CONTEXT }</pre></td>
					</tr>
					<tr>
						<th>ファイル添付</th>
						<td>
							<!-- 첨부된 파일이 있는 경우, 해당 파일을 다운로드 할 수 있는 링크 제공 --> <a
							href="/board/download?board_no=${map.BOARD_NO }">${map.ORIGINALFILE }</a>

						</td>
					</tr>
				</tbody>

</table>
			
			</div>	
			<div id="navigator">
				<c:if test="${sessionScope.loginId == map.MEMBER_ID}">
					<input type="hidden" id="board_no" value="${map.BOARD_NO }">
					<input type="button" value="修正" onclick="boardUpdateForm()">
					<input type="button" value="削除" onclick="boardDelete()">
				</c:if>
				</div>
				</div>
				
</body>
</html>