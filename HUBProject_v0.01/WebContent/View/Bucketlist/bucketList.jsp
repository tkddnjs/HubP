<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

	<title>HUB</title>
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

/* Star Rating */
.starRating,
.starRating span{
    display:inline-block;
    height:14px;
    background:transparent url(${pageContext.request.contextPath}/resources/img/icoFiveStar.gif) no-repeat;
    overflow:hidden;
}
.starRating{
    width:79px;
    vertical-align:middle;
}
.starRating span{
    font-size:0;
    line-height:0;
    vertical-align:top;
    text-indent:-100px;
    *text-indent:0;
    background-position:0 -14px;
}

</style>
</head>
<body>
	<div class="header" align="right">
		<%@ include file="/View/header/header.jspf"%>
	</div>

	<div>
		<%@ include file="/View/menu.jsp"%>
	</div>

	<div class="input-append pull-right">
		<a class="btn btn-xs btn-info btnPlay"
			href="${pageContext.request.contextPath}/bucketlist/register.do">
			<h5>버킷추가</h5></a>
	</div>

	<table class="table table-hover table-condensed">
		<thead style="background: #60d7a9; color: white;">
			<tr style="align: center; font-size: 14pt;">
				<th width="60" align="center">잠금</th>
				<th width="50" align="center">No</th>
				<th width="400" align="center">버킷리스트</th>
				<th width="150" align="center">목표일</th>
				<th width="150" align="center">중요도</th>
				<th width="150" align="center">연결고리</th>
			</tr>
		</thead>

		<tbody style="font-size: 14pt;">
			<c:forEach items="${bucketlists }" var="bucketlist"
				varStatus="status">
				<tr>
					<c:choose>
						<c:when test="${bucketlist.lock }">
							<td align="center"><input type="checkbox" name="lock"
								checked /></td>
						</c:when>
						<c:otherwise>
							<td align="center"><input type="checkbox" name="lock" /></td>
						</c:otherwise>
					</c:choose>

					<td class="ranking" align="center" style="font-size: 14pt;">${status.count  }</td>

					<td width="400" align="center"><a
						href="${pageContext.request.contextPath}/bucketlist/detail.do?bucketlistId=${bucketlist.bucketlistId}">
						<b>${bucketlist.title  }</b></a>
					</td>

					<td><p class="goal">${bucketlist.goal  }</p></td>
					<td><p><span class="starRating"><span style="width:${bucketlist.stars }%">${bucketlist.star  }</span></span></p></td>
					<td>${bucketlist.connChains  }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>