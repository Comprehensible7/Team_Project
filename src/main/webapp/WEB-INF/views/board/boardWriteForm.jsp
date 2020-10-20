<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css" />">
<title>物書き</title>
<style type="text/css">
.invisible{
clear: none;
border: 0px none;
float: none;
background-color:#ffffff;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<form action="/board/boardWrite" method="post" enctype="multipart/form-data">
				<table class="table table-striped" style="">
					<thead>
						<tr>
							<th colspan="2"
								style="background-color: #eeeeee; text-align: center;">掲示板リスト</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" name="board_title" id="title"
								class="form-control" maxlength="50"></td>
						</tr>
						<tr>
							<td><textarea name="board_context" id="contents"
									class="form-control" maxlength="2048"
									style="resize: none; height: 350px;"></textarea></td>
						</tr>
					</tbody>

				</table>
				<input type="file" name="upload" size="30"class="invisible" > <input
					type="submit" class="btn btn-primary pull-right" value="物書き">
			</form>

		</div>
	</div>

</body>
</html>