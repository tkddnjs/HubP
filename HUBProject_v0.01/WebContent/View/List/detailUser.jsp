<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<title>버킷리스트 상세</title>
	<%@ include file="/View/layout/common.jsp" %>

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
		<%@ include file="/View/header/header.jspf"%>
	</div>

	<h1 align="center">HUB : Have U get a BucketList?</h1>

	<table class="table table-hover table-condensed">
		<tr>
			<th width="50" align="center">제목</th>
			<td width="100" align="center">${bucketlist.title }</td>
		</tr>
		<tr>
			<th width="50" align="center">연결고리</th>
			<td width="100" align="center">${bucketlist.connChains }</td>
		</tr>
		<tr>
			<th width="50" align="center">SOS</th>
			<td width="100" align="center">${bucketlist.sos }</td>
		</tr>
		<tr>
			<th width="50" align="center">사용자ID</th>
			<td width="100" align="center">${bucketlist.userId }</td>
		</tr>
	</table>

	<form action="list/list.do" method="post">
		<div class="input-append pull-right">
			<button class="btn btn-xs btn-default btn-block" type="submit">돌아가기</button>
		</div>
		<input type="hidden" name="listOpt" value="${listOpt }">
		<input type="hidden" name="connChain" value="${connChain }">
	</form>
</body>
</html>