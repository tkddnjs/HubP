<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>쪽지 목록</title>
<%@ include file="/views/layout/common.jsp"%>
<style type="text/css">
html, body {
	overflow: hidden;
}

body {
	padding: 5px;
}

h1 {
	font-weight: bold;
	color: #A0B0DB;
	size: 50px;
}

.header {
	font-size: 15px;
}
</style>

<script type="text/javascript">
	function windowOpen() {
		window.open("/views/Post/sendPost.jsp", "subPopup",
				"width=600px,height=600px");
	}
</script>

</head>
<body>
	<div class="header" align="right">
		<%@ include file="/views/header/header.jspf"%>
	</div>

	<h1 align="center">HUB : Have U get a BucketList?</h1>


	<form action="post/remove.do" method="get" class="form-inline">
		<div class="input-append pull-right">
			<button type="submit">삭제</button>
		</div>
		<table class="table table-hover table-condensed table-striped">
			<thead style="background: #60d7a9;">
				<tr style="align: center;">
					<th>선택</th>
					<th>보낸사람</th>
					<th>받은사람</th>
					<th>일시</th>
					<th>내용</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${posts }" var="post" varStatus="status">
					<tr>
						<td><label class="checkbox"> <input type="checkbox"
								name="checks" value="${post.postId }">
						</label></td>
						<td>${post.senderId }</td>
						<td>${post.receiverId }</td>
						<td>${post.transDT }</td>
						<td><span class="spanTitle">${post.content }</span></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</form>

	<form action="post/send.do" method="get">
		<div class="input-append pull-right">
			<button type="submit">쪽지전송</button>
		</div>
	</form>
</body>
</html>
