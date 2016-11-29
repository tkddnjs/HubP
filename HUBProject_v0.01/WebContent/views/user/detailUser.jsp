<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>사용자 상세</title>
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
			<th width="50" align="center">ID</th>
			<td width="100" align="center">${user.userId }</td>
		</tr>
		<tr>
			<th width="50" align="center">연결고리</th>
			<td width="100" align="center">${user.connChains }</td>
		</tr>
		<tr>
			<th width="50" align="center">자기소개</th>
			<td width="100" align="center">${user.introduce }</td>
		</tr>
	</table>

	<form action="${pageContext.request.contextPath }list/list.do" method="post">
		<div class="input-append pull-right">
			<button class="btn btn-xs btn-default btn-block" type="submit">돌아가기</button>
		</div>
		<input type="hidden" name="listOpt" value="${listOpt }">
		<input type="hidden" name="searchWord" value="${connChain }">
	</form>
	
	<c:if test="${chkFollow }">
		<form action="follow/request.do" method="post">
			<div class="input-append pull-right">
				<button class="btn btn-xs btn-default btn-block" type="submit"
					name="followId" value="${user.userId }">친구요청</button>
				<input type="hidden" name="relation" value="${listOpt }">
				<input type="hidden" name="connChain" value="${connChain }">
			</div>
		</form>
	</c:if>
</body>
</html>