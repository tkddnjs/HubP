<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/View/layout/common.jsp" %>
<style type="text/css">
body {
	padding: 50px;
}

h1 {
	text-align: center;
	font-weight: bold;
	color: #A0B0DB;
}
</style>
</head>
<body>
	<h1 align="center">HUB : Have U get a BucketList??</h1>

	<div class="table table-hover table-condensed">
	<thead style="background: #60d7a9; color:white;">	
		<div class="row">
			<div class="col-md-12">
				<br>
				<ul class="tab">
					<li><a href="bucketlist/list.do" >버킷리스트</a></li>
					<!-- /HUBProject_v0.01/listBucketlist.do -->
					
					<li><a href="list/list.do">도움리스트</a></li>
					
					<li><a href="cooper/list.do" >업체</a></li>
						
					<li><a href="group/list.do" >모임방</a></li>
										
					<form class="navbar-search pull-right">
						<input type="text" class="search-query" placeholder="검색">
						<button class="btn" type="button">검색</button>
						<button class="btn" type="button">선택사항</button>
					</form>
				</ul>

			</div>
		</div>
		</thead>
	</div>
</body>
</html>