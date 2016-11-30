<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<title>버킷리스트 상세</title>
	<%@ include file="/views/layout/common.jsp" %>

<style type="text/css">
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

.ranking {
	text-align: center;
	font-size: 10pt;
}

.spanTitle {
	width: 2%;
	text-align: center;
	font-size: 18px;
	font-weight: bold;
	color: #A0B0DB;
}

.goal {
	font-size: 12pt;
	color: gray;
	margin-left: 5px;
}

.imgbucket {
	width: 80px;
	height: 80px;
	margin-right: 10px;
}

.btnPlay {
	margin-top: 40%
}
</style>

</head>
<body>
	<div class="header" align="right">
		<%@ include file="/views/header/header.jspf"%>
	</div>

	<h1 align="center">HUB : Have U get a BucketList?</h1>

	<table class="table table-hover table-condensed">
		<tr>
			<th width="50" align="center">사진</th>
			<td width="100" align="center">${user.picture }</td>
		</tr>
		<tr>
			<th width="50" align="center">ID</th>
			<td width="100" align="center">${user.userId }</td>
		</tr>
		<tr>
			<th width="50" align="center">연결고리</th>
			<td width="100" align="center">${user.connChains }</td>
		</tr>
		<tr>
			<th width="50" align="center">소개</th>
			<td width="100" align="center">${user.introduce }</td>
		</tr>
	</table>

	<form action="${pageContext.request.contextPath}/list/list.do" method="post">
		<div class="input-append pull-right">
			<button class="btn btn-xs btn-default btn-block" type="submit">돌아가기</button>
		</div>
		<input type="hidden" name="listOpt" value="${listOpt }">
		<input type="hidden" name="connChain" value="${searchWord }">
	</form>
	
	<form action="${pageContext.request.contextPath}/follow/request.do" method="post">
		<div class="input-append pull-right">
			<button class="btn btn-xs btn-default btn-block" type="submit">팔로우신청</button>
			<input type="hidden" name="userId" value="${sessionScope.userId }">
			<input type="hidden" name="followId" value="${user.userId }">
			<input type="hidden" name="relation" value="${listOpt }">
		</div>
	</form>
	
</body>
</html>