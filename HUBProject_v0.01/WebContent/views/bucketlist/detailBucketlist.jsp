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
			<th width="50" align="center">제목</th>
			<td width="100" align="center">${bucketlist.title }</td>
		</tr>
		<tr>
			<th width="50" align="center">목표기간</th>
			<td width="100" align="center">${bucketlist.goal }</td>
		</tr>
		<tr>
			<th width="50" align="center">중요도</th>
			<td width="100" align="center">${bucketlist.star }</td>
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
			<th width="50" align="center">메모</th>
			<td width="100" align="center">${bucketlist.memo }</td>
		</tr>
	</table>

	<p style="">
		<a class="btn btn-xs btn-default"
		 href="${pageContext.request.contextPath}/bucketlist/modify.do?bucketlistId=${bucketlist.bucketlistId}">수정</a>
		<a class="btn btn-xs btn-default"
		 href="${pageContext.request.contextPath}/bucketlist/remove.do?bucketlistId=${bucketlist.bucketlistId}">삭제</a>
		<a class="btn btn-xs btn-default"
		 href="${pageContext.request.contextPath}/bucketlist/list.do">돌아가기</a>
	</p>
	
</body>
</html>