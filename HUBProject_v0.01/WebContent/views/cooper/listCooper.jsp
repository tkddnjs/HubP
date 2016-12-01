<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>

<title> 업체리스트 </title>
<%@ include file="/views/layout/common.jsp" %>

</head>
<body>
	<div class="header" align="right">
		<%@ include file="/views/header/header.jspf"%>
	</div>

	<div>
		<%@ include file="/views/menu.jsp"%>
	</div>
	
	<div class="input-append pull-right">
		<form action="${pageContext.request.contextPath}/cooper/list.do" method="get" class="form-inline">
			<input type="text" name="searchWord" placeholder="연결고리를 입력하세요">
			<input type="hidden" name="listOpt" value=1>
			<button class="btn" type="submit">검색</button>
		</form>
	</div>
	
	<c:if test="${sessionScope.isAdmin }">
		<div class="input-append pull-right">
			<a class="btn btn-xs btn-info btnPlay"
				href="${pageContext.request.contextPath}/cooper/register.do">업체등록</a>
		</div>
	</c:if>
	
	<table class="table table-hover table-condensed">
		<thead style="background: #60d7a9; color: white;">
			<tr style="align: center; font-size: 14pt;">
				<th width="60" align="center">No</th>
				<th width="200" align="center">업체이름</th>
				<th width="500" align="center">업체배너</th>
				<th width="100" align="center"></th>
				<th width="100" align="center"></th>
			</tr>
		</thead>

		<tbody style="font-size: 14pt;">
			<c:forEach items="${coopers }" var="cooper" varStatus="status">
				<tr>
					<td width="60" align="center">${status.count }</td>
					<td width="200" align="center">${cooper.coName }</td>
					<td width="500" align="center">${cooper.coBanner }</td>
					<c:if test="${sessionScope.isAdmin }">
						<td width="100" align="center">
							<form action="${pageContext.request.contextPath}/cooper/modify.do" method="GET">
								<input type="hidden" name="coId" value="${cooper.coId}">
								<button type="submit">수정</button>
							</form>
						</td>
						<td width="100" align="center">
							<form action="${pageContext.request.contextPath}/cooper/remove.do" method="GET">
								<input type="hidden" name="coId" value="${cooper.coId}">
								<button type="submit">삭제</button>
							</form>
						</td>
					</c:if>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>