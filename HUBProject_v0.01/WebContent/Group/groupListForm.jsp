<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모임방 목록</title>
<link href="/HUBProject_v0.01/resources/css/bootstrap-theme.min.css" rel="stylesheet">
<link href="/HUBProject_v0.01/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/bootstrap-ko.min.css" rel="stylsheet">
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
		<%@ include file="/header/header.jspf"%>
	</div>
	<div class="input-append pull-right">
		<a class="btn btn-xs btn-info btnPlay" href="Bucketlist/registerBucketlist.jsp"><h5>버킷추가</h5></a>
	</div>

	<div class="input-append pull-right">
		<form action="group/list.do" method="get" class="form-inline">
			<select class="ring" name="listOpt">
				<option value=1>모임방이름</option>
				<option value=2>연결고리</option>
				<option value=3>지역</option>
			</select>
			<input class="span2" type="text" name="searchWord" value="#" id="searchs" data-source="typeahead">
			<button class="btn" type="submit">검색</button>
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
					href="group/detail.do?groupId=${groupId }">미니공연 밴드원 함께하실분!!</a></td>
				<td><a class="btn btn-xs btn-default btn-block"
					href="follow/searchFriend.do?userId=${userId }">IU</a></td>
				<td>2016.10.10</td>
				<td>서울</td>
				<td>#공연</td>
			</tr>

			<tr>
				<td class="ranking">2</td>
				<td><a class="btn btn-xs btn-default btn-block"
					href="group/detail.do?groupId=${groupId }">리듬체조강습</a></td>
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
					href="#">KOSTA</a></td>
				<td>2016.10.10</td>
				<td>서울</td>
				<td>#JAVA</td>
			</tr>
		</tbody>		
	</table>
	
</body>
</html>











































