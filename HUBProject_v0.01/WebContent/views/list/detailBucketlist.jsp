<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div class="modal fade" id="detailBucketlistModal" role="dialog">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">

	<table class="table table-hover table-condensed">
		<tr>
			<th width="50" align="center">제목</th>
			<td width="100" align="center">${bucketlist.title }</td>
		</tr>
		<tr>
			<th width="50" align="center">연결고리</th>
			<td width="100" align="center">${bucketlist.connChains }</td>
		</tr>
		<tr>
			<th width="50" align="center">SOS</th>
			<td width="100" align="center">${bucketlist.sos }</td>
		</tr>
		<tr>
			<th width="50" align="center">사용자ID</th>
			<td width="100" align="center">${bucketlist.userId }</td>
		</tr>
	</table>

	<form action="${pageContext.request.contextPath}/list/list.do" method="post">
		<input type="hidden" name="listOpt" value="${sessionScope.listOpt }">
		<input type="hidden" name="connChain" value="${searchWord }">
	</form>
	
<!-- 	<form action="${pageContext.request.contextPath}/follow/request.do" method="post">
		<div class="input-append pull-right">
			<button class="btn btn-xs btn-default btn-block" type="submit">팔로우신청</button>
			<input type="hidden" name="userId" value="${sessionScope.userId }">
			<input type="hidden" name="followId" value="${bucketlist.userId }">
			<input type="hidden" name="relation" value="${listOpt }">
		</div>
	</form> -->
	
	<div class="input-append pull-right">
		<button class="btn btn-xs btn-default btn-block" id="requestButton" type="button">팔로우요청</button>
	</div>
	</div>
	</div>
	</div>
	
	<script>
		var userId = "${sessionScope.userId}";
		var followId = "${bucketlist.userId}";
		var relation = ${sessionScope.listOpt};
		
		$("#requestButton").click(function (){
			$.ajax({
				type : 'POST',
				url : '${pageContext.request.contextPath}/follow/request.do',
				data : {
					userId : userId,
					followId : followId,
					relation : relation
				},
				success : 
					alert("팔로우를 요쳥했습니다.");
			});
		});
	</script>
