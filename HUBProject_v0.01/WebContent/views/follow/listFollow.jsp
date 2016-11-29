<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>친구 목록</title>
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
		<form action="follow/listAll.do" method="post"
			class="form-inline">
			<select class="ring" name="searchOpt">
				<option value="1">연결고리</option>
				<option value="2">관계</option>
				<option value="3">친구요청</option>
			</select> <input class="span2" type="text" name="searchWord" id="searchs"
				data-source="typeahead" placeholder="검색어를 입력하세요">
			<button class="btn" type="submit">검색</button>
		</form>
	</div>

	<table class="table table-hover table-condensed">
		<thead style="background: #60d7a9; color:white;">
			<tr style="align: center; font-size:14pt;">
				<th width="20" align="center">NO</th>
				<th width="300" align="center">친구ID</th>
				<th width="300" align="center">관계</th>
				<c:if test="${isRequest }">
					<th colspan='2' width="200" align="center">친구요청</th>
				</c:if>
				<th>
			</tr>
		</thead>

		<tbody style="font-size: 14pt;">
			<c:forEach items="${follows }" var="follow" varStatus="status">
				<c:choose>
					<c:when test="${isRequest }">
						<tr>
							<td>${status.count }</td>
							<td>
								<form action="user/detail.do" method="post">
									<button class="btn btn-xs btn-default btn-block" type="submit"
										name="userId" value="${follow.followId }">${follow.followId }</button>
									<input type="hidden" name="listOpt" value="${follow.relation }">
								</form>
							</td>
							<td>
								<c:choose>
									<c:when test="${follow.relation eq 1}">
									내가 도움을 주는 관계							
									</c:when>
									<c:when test="${follow.relation eq 2}">
									내가 도움을 받는 관계
									</c:when>
									<c:otherwise>
									서로 도움을 주는 관계
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</c:when>
			
					<c:otherwise>
						<tr>
							<td>${status.count }</td>
							<td>
								<form action="user/detail.do" method="post">
									<a href="${pageContext.request.contextPath}/user/detail.do"><b>${follow.followId }</b></a>
									<input type="hidden" name="listOpt" value="${follow.relation }">
								</form>
							</td>
							<td>
								<c:choose>
									<c:when test="${follow.relation eq 1}">
									내가 도움을 주는 관계							
									</c:when>
									<c:when test="${follow.relation eq 2}">
									내가 도움을 받는 관계
									</c:when>
									<c:otherwise>
									서로 도움을 주는 관계
									</c:otherwise>
								</c:choose>
							</td>
							
								<c:choose>
									<c:when test="${follow.confirm eq false }">
										<td>
											<form action="${pageContext.request.contextPath}/follow/confirm.do" method="post">
												<button class="btn btn-xs btn-warning" type="submit">수락</button>
												<input type="hidden" name="followId" value="${follow.followId }">
												<input type="hidden" name="userId" value="${follow.userId }">
											</form>
										</td>
										<td>
											<form action="${pageContext.request.contextPath}/follow/remove.do" method="post">
												<button class="btn btn-xs btn-danger" type="submit">거절</button>
												<input type="hidden" name="followId" value="${follow.followId }">
												<input type="hidden" name="userId" value="${follow.userId }">
											</form>
										</td>
									</c:when>
									<c:when test="${follow.confirm eq true }">
										<td>
											<form action="${pageContext.request.contextPath}/follow/remove.do" method="post">
												<button class="btn btn-xs btn-danger" type="submit">삭제</button>
												<input type="hidden" name="followId" value="${follow.followId }">
												<input type="hidden" name="userId" value="${follow.userId }">
											</form>
										</td>
									</c:when>
								
									<c:otherwise>
									<td>
										<%-- <form action="follow/remove.do" method="post">
											<button class="btn btn-xs btn-default btn-block" type="submit">삭제</button>
											<input type="hidden" name="followId" value="${follow.followId }">
											<input type="hidden" name="searchOpt" value="${searchOpt }">
										</form> --%>
									</td>
									</c:otherwise>
								</c:choose>
							</tr>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>