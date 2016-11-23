<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title> 친구 등록 처리 </title>
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

	<h3 align="center"> 친구를 삭제했습니다. </h3>

	<form action="follow/listRelation.do" method="post">
		<div class="input-append pull-right">
			<button class="btn btn-xs btn-default btn-block" type="submit">확인</button>
		</div>
		<input type="hidden" name="userId" value="${userId }">
		<input type="hidden" name="searchOpt" value="${searchOpt }">
		<input type="hidden" name="connChain" value="${connChain }">
	</form>
	
</body>
</html>