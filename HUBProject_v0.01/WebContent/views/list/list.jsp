<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<title>도움리스트 목록</title>
<%@ include file="/views/layout/common.jsp"%>

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

	<br>
	<div class="input-append pull-right">
		<form action="${pageContext.request.contextPath}/list/list.do" method="get" class="form-inline"
			id="form">
			<table>
				<tr>
					<td><select class="ring" name="listOpt" id="listOpt">
							<option value="1" selected="selected">내가 도움을 줄 수 있는 사용자</option>
							<option value="2">나를 도와줄 수 있는 사용자</option>
							<option value="3">서로 도움을 줄 수 있는 사용자</option>
							<option value="4">업체</option>
					</select></td>
					<td id="connForm" width='50'>
						<input type="text" id="tags" name="searchWord" class="ring"/>
					</td>
					<td></td>
					<td>
						<button class='btn btn-xs btn-default btn-block' type='submit'>검색</button>
					</td>
				</tr>
			</table>
		</form>
	</div>

	<br>
	<table class="table table-hover table-condensed">
		<thead style="background: #60d7a9; color: white;">
			<tr style="align: center; font-size: 14pt;">
				<c:choose>
					<c:when test="${listOpt eq 1 or listOpt eq 3}">
						<th width="20" align="center">NO</th>
						<th width="400" align="center">사용자ID</th>
						<th width="600" align="center">버킷리스트이름</th>
					</c:when>
					<c:when test="${listOpt eq 2}">
						<th width="20" align="center">NO</th>
						<th width="400" align="center">사용자ID</th>
						<th width="600" align="center">연결고리목록</th>
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
								<form action="${pageContext.request.contextPath}/user/detail.do" method="get">
									<button class="btn btn-xs btn-default btn-block" type="submit"
										name="userId" value="${bucketlist.userId }">${bucketlist.userId }</button>
									<input type="hidden" name="searchWord" value="${searchWord }">
								</form>
							</td>
							<td>
								<form action="${pageContext.request.contextPath}/bucketlist/detail.do" method="get">
									<button class="btn btn-xs btn-default btn-block" type="submit"
										name="bucketlistId" value="${bucketlist.bucketlistId }">${bucketlist.title }</button>
									<input type="hidden" name="searchWord" value="${searchWord }">
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
								<form action="${pageContext.request.contextPath}/user/detail.do" method="post">
									<button class="btn btn-xs btn-default btn-block" type="submit"
										name="userId" value="${user.userId }">${user.userId }</button>
									<input type="hidden" name="searchWord" value="${searchWord }">
								</form>
							</td>
							<td>${user.connChains }</td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</tbody>
	</table>
	
	<script type="text/javascript">
		var availableTags = [];
		$(document).ready(function() {
			if ($("#listOpt").val() != null) {
				var listOpt = $("#listOpt").val();
				autoComplete(listOpt);
			};

			$("#listOpt").change(function() {
				var listOpt = $(this).val();
				autoComplete(listOpt);
			});
		
			function list(array) {
				availableTags.length=0;
				for (var i = 0; i < array.length; i++) {
					availableTags.push(array[i]);
				}
			};
		
			function autoComplete(listOpt){
				$.ajax({
					type : 'POST',
					url : '${pageContext.request.contextPath}/list/listAutoComplete.do',
					data : {
						listOpt : listOpt
					},
					success : function(result) {
						result = result.replace(/ /gi, "");
						result = result.replace('[', '');
						result = result.replace(']', '');
						result = result.split(',');
						list(result);
					}
				});
				$("#tags").autocomplete({
					source: availableTags
				});
			}
		});
	</script>
</body>


</html>