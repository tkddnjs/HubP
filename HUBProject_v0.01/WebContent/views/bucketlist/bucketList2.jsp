<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<title>HUB</title>

	<%@ include file="/views/layout/modalCSSCommon.jsp" %>
	<%@ include file="/views/layout/modalJSCommon.jsp" %>
	<%@ include file="/views/bucketlist/registerBucketlist.jsp" %>
	<%@ include file="/views/bucketlist/modifyBucketlist.jsp" %>

</head>
<body>
	<div class="header" align="right">
		<%@ include file="/views/header/header.jspf"%>
	</div>

	<div>
		<%@ include file="/views/menu.jsp"%>
		<%@ include file="/views/bucketlist/registerBucketlist.jsp" %>
	</div>

	<div class="input-append pull-right">
		<!-- <a class="btn btn-xs btn-info btnPlay"
			href="${pageContext.request.contextPath}/bucketlist/register.do?userId=${sessionScope.userId }">
			<h5>버킷추가</h5></a>-->
		<button type="button" class="btn btn-xs btn-info btnPlay" data-toggle="modal" data-target="#registerBucketlistModal"><h5>버킷추가</h5></button>
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
				<c:set var="no" value="${status.count }"></c:set>
				<tr>
					<c:choose>
						<c:when test="${bucketlist.lock }">
							<td align="center"><input type="checkbox" name="lock" checked /></td>
						</c:when>
						<c:otherwise>
							<td align="center"><input type="checkbox" name="lock" /></td>
						</c:otherwise>
					</c:choose>

					<td class="ranking" align="center" style="font-size: 14pt;">${no  }</td>

					<td width="400" align="center"><a
						href="${pageContext.request.contextPath}/bucketlist/detail.do?bucketlistId=${bucketlist.bucketlistId}&userId=${sessionScope.userId }">
						<b>${bucketlist.title  }</b></a>
						<button type="button" name="modifyBtn" value="${no  }" class="btn btn-xs btn-info btnPlay" data-toggle="modal" data-target="#modifyBucketlistModal"><h5>버킷수정</h5></button>
					</td>

					<td><p class="goal">${bucketlist.goal  }</p></td>
					<td><p><span class="starRating"><span style="width:${bucketlist.stars }%">${bucketlist.star  }</span></span></p></td>
					<td>${bucketlist.connChains  }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<script>
	$("form").submit(function(){
		var tags = $("#tags").val();
		tags = tags.split(",");
		$("#tags").val(tag);
	});
	</script>
	
	<script type="text/javascript">
	var bucketlists = new Array();
	<c:forEach items="${bucketlists}" var="bucketlist">
		var bucketlist = new Array();
		bucketlist.push("${bucketlist.bucketlistId}");
		bucketlist.push("${bucketlist.title}");
		bucketlist.push("${bucketlist.connChains}");
		bucketlist.push("${bucketlist.goal}");
		bucketlist.push("${bucketlist.star}");
		bucketlist.push("${bucketlist.memo}");
		bucketlist.push("${bucketlist.sos}");
		bucketlist.push("${bucketlist.lock}");
		bucketlist.push("${bucketlist.userId}");
		bucketlists.push(bucketlist);
	</c:forEach>
	
	$("[name=modifyBtn]").click(function(){
		var index = $(this).val() - 1;
		$("#modifyBucketlistModal #bucketlistId").val(bucketlists[index][0]);
		$("#modifyBucketlistModal #title").val(bucketlists[index][1]);
		initConn(bucketlists[index][2]);
		$("#modifyBucketlistModal #goal").val(bucketlists[index][3]);
		$("#modifyBucketlistModal #star").val(bucketlists[index][4]);
    	$("#modifyBucketlistModal #memo").val(bucketlists[index][5]);
		$("#modifyBucketlistModal #sos").val(bucketlists[index][6]);
		var lock = bucketlists[index][7];
		if(lock == 'true'){
			$("#modifyBucketlistModal #private").attr("checked", true);
		} else {
			$("#modifyBucketlistModal #public").attr("checked", true);
		}
    	$("#modifyBucketlistModal #userId").val(bucketlists[index][8]);
	});
	
	function initConn(str){
		var conn = str;
		conn = conn.replace("[","");
		conn = conn.replace(/ /gi,"");
		conn = conn.replace("]","");
		$("#mbtags").importTags(conn);
	};
	
	</script>
	
</body>
</html>