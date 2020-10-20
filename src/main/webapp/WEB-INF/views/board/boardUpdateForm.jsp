<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css" />">
<title>内容を変える</title>
</head>
<body>
<div class="container">
		<div class="row">
		
<form action="/board/boardUpdate" method="post">
		<input type="hidden" name="board_no" value="${map.BOARD_NO }">
			<table class="table table-striped" style="text-align; border 1px solid #dddddd;">
				<thead>
					<tr>
						<th colspan="2" style="background-color:#eeeeee; text-align:center;">掲示板リスト</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" name="board_title"  class="form-control" maxlength="50" value="${map.BOARD_TITLE }"></td>
					</tr>
					<tr>
						<td><textarea name="board_context" class="form-control"maxlength="2048" style="resize:none; height:350px;">${map.BOARD_CONTEXT }</textarea></td>
					</tr>
				</tbody>
				
			</table>
			<input type="submit" class="btn btn-primary pull-right" value="修正する">
			</form>
			
		</div>
	</div>
</body>
</html>