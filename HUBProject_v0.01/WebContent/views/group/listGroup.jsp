<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>모임방 목록</title>
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
</style>
</head>
<body>
	<div class="header" align="right">
		<%@ include file="/views/header/header.jspf"%>
	</div>

	<h1 align="center">HUB : Have U get a BucketList?</h1>

	<div class="input-append pull-right">
		<form action="group/search.do" method="post" class="form-inline">
			<select class="ring" name="ring">
				<option>연결고리</option>
				<option>내가</option>
				<option>너를</option>
				<option>서로</option>
				<option>업체</option>
			</select> <input class="span2" type="text" name="search" value="#"
				id="searchs" data-source="typeahead">
			<button class="btn" type="button">검색</button>

		</form>
	</div>

	<table class="table table-hover table-condensed">
		<!-- <colgroup>
			<col width="80" align="center">
			<col width="*">
			<col width="70">
		</colgroup> -->

		<thead style="background: #60d7a9;">
			<tr style="align: center;">
				<th>NO</th>
				<th>제목</th>
				<th>개설자</th>
				<th>마감일</th>
				<th>지역</th>
				<th>연결고리</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach items="${groups }" var="group" varStatus="status">
				<tr>
					<td class="ranking">${status.count }</td>
					<td><a class="btn btn-xs btn-default btn-block"
						href="group/detail.do?groupId=${group.groupId }">${group.groupName }</a></td>
					<td><a class="btn btn-xs btn-default btn-block"
						href="user/detail.do?userId=${group.managerId }">${group.managerId }</a></td>
					<td>${group.lastDay }</td>
					<td>${group.local }</td>
					<td>
						${group.connChains }
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<div>
		<div class="pagination" align="center">
			<ul>
				<li><a href="#">Prev</a></li>
				<li><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#">6</a></li>
				<li><a href="#">7</a></li>
				<li><a href="#">8</a></li>
				<li><a href="#">9</a></li>
				<li><a href="#">10</a></li>
				<li><a href="#">Next</a></li>
			</ul>
		</div>

		<div class="pull-right">
			<a class="btn btn-toolbar" href="/views/registerGroupForm.jsp">

				<button>글쓰기</button>
			</a>
		</div>
	</div>
	
	<script type="text/javascript">
	$(function() {
		var autocomplete_text = [ "자동완성기능", "Autocomplete", "개발로짜", "국이" ];
		$("#searchs").autocomplete({
			source : autocomplete_text
		});
	})
</script>
</body>
</html>