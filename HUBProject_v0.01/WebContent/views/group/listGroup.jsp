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
	<div>
		<%@ include file="/views/menu.jsp"%>
	</div>

	<div class="input-append pull-right">
		<form action="${pageContext.request.contextPath}/group/list.do" method="get" class="form-inline">
			<select name="listOpt">
				<option value=1>모임방이름</option>
				<option value=2>연결고리</option>
				<option value=3>지역</option>
			</select>
			<input class="span2" type="text" name="searchWord" id="searchWord">
			<button class="btn" type="button">검색</button>
		</form>
	</div>

	<div class="input-append pull-right">
		<form action="${pageContext.request.contextPath}/group/list.do" method="get">
			<input type="hidden" name="listOpt" value=4>
			<button class="btn" type="submit">내 리스트 조회</button>
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
						href="${pageContext.request.contextPath}/group/detail.do?groupId=${group.groupId }">${group.groupName }</a></td>
					<td><a class="btn btn-xs btn-default btn-block"
						href="${pageContext.request.contextPath}/user/detail.do?userId=${group.managerId }">${group.managerId }</a></td>
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
			<a class="btn btn-toolbar" href="/views/registerGroup.jsp">

				<button>모임방등록</button>
			</a>
		</div>
	</div>
	
<script type="text/javascript">
	var availableTags = [];
	$(function() {
		var autocomplete_text = [ "자동완성기능", "Autocomplete", "개발로짜", "국이" ];
		$("#searchs").autocomplete({
			source : autocomplete_text
		});
	})
</script>
</body>
</html>