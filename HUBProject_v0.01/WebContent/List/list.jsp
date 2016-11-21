<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도움리스트 목록</title>

<link href="/HUBProject_v0.01/resources/css/bootstrap-theme.min.css" rel="stylesheet">
<link href="/HUBProject_v0.01/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/HUBProject_v0.01/resources/css/bootstrap-ko.min.css" rel="stylsheet">
<link href="/HUBProject_v0.01/resources/css/bootstrap-responsive.min.css" rel="stylsheet">

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var availableTags;
		if ($("#listOpt").val() != null) {
			var listOpt = $("#listOpt").val();
			$.ajax({
				type : 'POST',
				url : '/HUBProject_v0.01/listAutoComplete.do',
				data : {
					listOpt : listOpt
				},
				success : function(result) {
					result = result.replace('[', '');
					result = result.replace(']', '');
					result = result.replace(' ','');
					availableTags = result.split(',');
					$("#tags").html("");
					list(availableTags);
				}
			});
		};
		
		$("#listOpt").change(function() {
			var listOpt = $(this).val();
			$.ajax({
				type : 'POST',
				url : '/HUBProject_v0.01/listAutoComplete.do',
				data : {
					listOpt : listOpt
				},
				success : function(result) {
					result = result.replace('[', '');
					result = result.replace(']', '');
					result = result.replace(' ','');
					availableTags = result.split(',');
					$("#tags").html("");
					list(availableTags);
				}
			});
		});
	});
	
	function list(array) {
		for (var i = 0; i < array.length; i++) {
			$("#tags").append(
					"<option value='" + array[i] + "'>" + array[i] + "</option>");
		}
	};
</script>

<script src="/HUBProject_v0.01/resources/js/bootstrap.min.js" type="text/javascript"></script>

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
	<div>
		<%@ include file="/menu.jsp"%>
	</div>

	<br>
		<div class="input-append pull-right">
		<form action="/HUBProject_v0.01/list.do" method="post"
			class="form-inline" id="form">
			<table>
				<tr>
					<td><select class="ring" name="listOpt" id="listOpt">
							<option value="1" selected="selected">내가 도움을 줄 수 있는 사용자</option>
							<option value="2">나를 도와줄 수 있는 사용자</option>
							<option value="3">서로 도움을 줄 수 있는 사용자</option>
							<option value="4">업체</option>
					</select></td>
					<td width='50'><select class="ring" id="tags" name="connChain">

					</select></td>
					<td></td>
					<td>
						<button class='btn btn-xs btn-default btn-block' type='submit'>검색</button>
					</td>
				</tr>
			</table>
		</form>	</div>

	<br>
	<table class="table table-hover table-condensed">
		<thead style="background: #60d7a9; color: white;">
			<tr style="align: center; font-size: 14pt;">
				<th width="20" align="center">NO</th>
				<c:choose>
					<c:when test="${listOpt eq 1 or listOpt eq 3}">
						<th width="400" align="center">사용자ID</th>
						<th width="600" align="center">버킷리스트이름</th>
					</c:when>
					<c:when test="${listOpt eq 2}">
						<th width="400" align="center">사용자ID</th>
						<th width="600" align="center">연결고리목록</th>
					</c:when>
					<c:when test="${listOpt eq 4}">
						<th width="400" align="center">업체이름</th>
						<th width="600" align="center">사이트</th>
					</c:when>
				</c:choose>
			</tr>
		</thead>

		<tbody>
			<c:choose>
				<c:when test="${listOpt eq 1 or listOpt eq 3}">
					<c:forEach items="${bucketlists }" var="bucketlist"
						varStatus="status">
						<tr>
							<td>${status.count }</td>
							<td>
								<form action="/HUBProject_v0.01/userDetail.do" method="post">
									<button class="btn btn-xs btn-default btn-block" type="submit"
										name="userId" value="${bucketlist.userId }">${bucketlist.userId }</button>
									<input type="hidden" name="listOpt" value="${listOpt }">
									<input type="hidden" name="connChain" value="${connChain }">
								</form>
							</td>
							<td>
								<form action="/HUBProject_v0.01/bucketlistDetail.do"
									method="post">
									<button class="btn btn-xs btn-default btn-block" type="submit"
										name="bucketlistId" value="${bucketlist.bucketlistId }">${bucketlist.title }</button>
									<input type="hidden" name="listOpt" value="${listOpt }">
									<input type="hidden" name="connChain" value="${connChain }">
								</form>
							</td>
						</tr>
					</c:forEach>

				</c:when>
				<c:when test="${listOpt eq 2}">
					<c:forEach items="${users }" var="user" varStatus="status">
						<tr>
							<td>${status.count }</td>
							<td>
								<form action="/HUBProject_v0.01/userDetail.do" method="post">
									<button class="btn btn-xs btn-default btn-block" type="submit"
										name="userId" value="${user.userId }">${user.userId }</button>
									<input type="hidden" name="listOpt" value="${listOpt }">
									<input type="hidden" name="connChain" value="${connChain }">
								</form>
							</td>
							<td>${user.connChains }</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<c:forEach items="${coopers }" var="cooper" varStatus="status">
						<tr>
							<td>${status.count }</td>
							<td>${cooper.coName }</td>
							<td><a href="resources/img/${cooper.Banner }"></a></td>
						</tr>
					</c:forEach>

				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</body>
</html>