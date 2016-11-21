<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모임방 목록</title>
<link href="resources/css/bootstrap-theme.min.css" rel="stylesheet">
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/bootstrap-ko.css" rel="stylsheet">
<link href="resources/css/bootstrap-ko.min.css" rel="stylsheet">
<link href="resources/css/bootstrap-responsive.css" rel="stylsheet">
<link href="resources/css/bootstrap-responsive.min.css" rel="stylsheet">
<link href="resources/css/bootstrap.css" rel="stylsheet">

<script type="text/javascript">
	$(function() {
		var autocomplete_text = [ "자동완성기능", "Autocomplete", "개발로짜", "국이" ];
		$("#searchs").autocomplete({
			source : autocomplete_text
		});
	})
</script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>

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
		<%@ include file="header/header.jspf"%>
	</div>

	<h1 align="center">HUB : Have U get a BucketList?</h1>

	<div class="input-append pull-right">
		<form action="searchGroup.do" method="post" class="form-inline">
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
				<th>작성자</th>
				<th>마감일</th>
				<th>지역</th>
				<th>연결고리</th>
			</tr>
		</thead>

		<tbody>
			<tr>
				<td class="ranking">1</td>
				<td><a class="btn btn-xs btn-default btn-block"
					href="searchGroup.do?groupId=${groupId }">미니공연 밴드원 함께하실분!!</a></td>
				<td><a class="btn btn-xs btn-default btn-block"
					href="searchFriend.do?userId=${userId }">IU</a></td>
				<td>2016.10.10</td>
				<td>서울</td>
				<td>#공연</td>
			</tr>

			<tr>
				<td class="ranking">2</td>
				<td><a class="btn btn-xs btn-default btn-block"
					href="searchGroup.do?groupId=${groupId }">리듬체조강습</a></td>
				<td><a class="btn btn-xs btn-default btn-block" href="#">SON</a></td>
				<td>2016.10.10</td>
				<td>경기</td>
				<td>#리듬체조</td>
			</tr>

			<tr>
				<td class="ranking">3</td>
				<td><a class="btn btn-xs btn-default btn-block" href="#">속초
						투어</a></td>
				<td><a class="btn btn-xs btn-default btn-block" href="#">HELL</a></td>
				<td>마감</td>
				<td>인천</td>
				<td>#투어</td>
			</tr>

			<tr>
				<td class="ranking">4</td>
				<td><a class="btn btn-xs btn-default btn-block" href="#">JAVA강의
						개설</a></td>
				<td><a class="btn btn-xs btn-default btn-block"
					href="searchFriend.do?userId=${userId }">KOSTA</a></td>
				<td>2016.10.10</td>
				<td>서울</td>
				<td>#JAVA</td>
			</tr>
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
			<a class="btn btn-toolbar" href="registerGroupForm.jsp">

				<button>글쓰기</button>
			</a>
		</div>
	</div>
</body>
</html>