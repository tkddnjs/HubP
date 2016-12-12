<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="/views/group/registerGroup.jsp"%>
<%@ include file="/views/group/modifyGroup.jsp"%>

<div class="col-xs-12">
	<!-- 모임방 목록 -->
	<div class="x_panel">
		<!-- 모임방 목록 헤드 -->
		<div class="x_title">
			<h2>
				<i class="fa fa-bitbucket"></i>모임방
			</h2>
			<ul class="nav navbar-right panel_toolbox">
				<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
				<li><a class="close-link"><i class="fa fa-close"></i></a></li>
			</ul>
			<div class="clearfix"></div>
		</div>
		<!-- /모임방 목록 헤드 -->

		<!-- 모임방 목록 바디 -->
		<div class="x_content">
			<div class="accordion" id="accordion3" role="tablist"
				aria-multiselectable="true">
				<!--1st item-->
				<c:forEach items="${groups }" var="group" varStatus="status">
					<c:set var="no" value="${status.count  }"></c:set>
						<div class="panel">
							<a class="panel-heading " role="tab" id="headingOne1"
								data-toggle="collapse" data-parent="#accordion3"
								href="#collapseOne${no  }" aria-expanded="true"
								aria-controls="collapseOne">
								<h3 class="panel-title">${group.groupName }</h3>
							</a>

							<div id="collapseOne${no  }" class="panel-collapse collapse"
								role="tabpanel" aria-labelledby="headingOne">
								<div class="panel-body">
									<table class="table table-striped"
										style="width: 70%; height: 100px; margin: 20px 10px 0 140px; gravity: center; font-size: 16px">
										<tr>
											<th>관리자ID</th>
											<td>${group.managerId }</td>
										</tr>
										<tr>
											<th>모임만료일</th>
											<td>${group.lastDay }</td>
										</tr>
										<tr>
											<th>지역</th>
											<td>${group.local }</td>
										</tr>
										<tr>
											<th>인원</th>
											<td>${fn:length(group.joinPeople) } / ${group.maxPeople }</td>
										</tr>
									</table>
								</div>
								<div style="margin: 20px 10px 0 10%; gravity: center;">
									<table>
										<tr>
											<th>
												<h2><strong>소개</strong></h2>
											</th>
										</tr>
										<tr>
											<td>${group.introduce }</td>
										</tr>
									</table>
								</div>
								
								<!-- 내가 속한 모임방의 경우 -->
								<c:if test="${listOpt eq 4}">
									<div class="panel">
										<!-- 모임방 탈퇴 -->
										<form action="${pageContext.request.contextPath }/group/exit.do" method="get">
											<button type="submit" id="exitBtn" name="groupId" value="${group.groupId }">
												탈퇴
											</button>
										</form>
										<!-- /모임방 탈퇴 -->
										<!-- 모임방 수정 -->
										<div class="panel">
											<button name="modifyGroupBtn" data-toggle="modal"
												data-target="#modifyGroupModal" value="${no }">
												수정
											</button>
										</div>
										<!-- /모임방 수정 -->
										<!-- 모임방 삭제 -->
										<form action="${pageContext.request.contextPath }/group/remove.do" method="get">
											<button type="submit" id="removeBtn" name="groupId" value="${group.groupId }">
												삭제
											</button>
										</form>
										<!-- /모임방 삭제 -->
									</div>
									
								</c:if>
								
								<c:if test="${listOpt eq 1 || listOpt eq 2 || listopt eq 3}">
									<!-- 모임방 참여 -->
									<div class="panel">
										<form action="${pageContext.request.contextPath }/group/join.do" method="get">
											<button type="submit" id="joinBtn" name="groupId" value="${group.groupId }">
												참여
											</button>
										</form>
									</div>
									<!-- /모임방 참여 -->
								</c:if>
							</div>
						</div>
				</c:forEach>
				<!-- 모임방 개설 -->
				<div class="panel">
					<a id="registerBtn" data-toggle="modal"
						data-target="#registerGroupModal">
						<h1 align="center">
							<i class="fa fa-plus-circle"></i>
						</h1>
					</a>
				</div>
				<!-- /모임방 개설 -->
			</div>
			<!-- end of accordion -->
		</div>
		<!-- /모임방 목록 바디 -->
	</div>
</div>

<script src="${pageContext.request.contextPath}/resources/vendors/jquery/dist/jquery.min.js"></script>
<script>
	$(".groupForm").submit(function() {
		// 연결고리 값 domain type으로 변경
		var tags = $(this).find(".tags").val();
		tags = tags.split(",");
		$(this).find(".tags").val(tags);

		var introduce = $(this).find("[name='introduce']").val();
		introduce = introduce.replace(/\n/gi, " ");
		$(this).find("[name='introduce']").val(introduce);
	});
</script>

<script type="text/javascript">
	var groups = new Array();
	<c:forEach items="${groups}" var="group">
		var group = new Array();
		group.push("${group.groupId}");
		group.push("${group.groupName}");
		group.push("${group.managerId}");
		group.push("${group.lastDay}");
		group.push("${group.connChains}");
		group.push("${group.introduce}");
		group.push("${group.local}");
		group.push("${group.joinPeople}");
		group.push("${group.maxPeople}");
		groups.push(group);
	</c:forEach>

	// 초기화
	$("#registerBtn").click(function() {
		$(".tags").each(function(){
			$(this).importTags("");
		});
	});

	$("[name=modifyGroupBtn]").click(function() {
		var index = $(this).val() - 1;
		$("#modifyGroupModal #groupId").val(coopers[index][0]);
		$("#modifyGroupModal #groupName").val(coopers[index][1]);
		$("#modifyGroupModal #managerId").val(coopers[index][2]);
		$("#modifyGroupModal #lastDay").val(coopers[index][3]);
		initConn(coopers[index][4]);
		$("#modifyGroupModal #introduce").val(coopers[index][5]);
		$("#modifyGroupModal #local").val(coopers[index][6]);
		$("#modifyGroupModal #joinPeople").val(coopers[index][7]);
		var joinPeople = cooper[index][7].replace("[","");
		joinPeople = joinPeople.replace("]","");
		joinPeople = joinPeople.replace(/ /gi,"");
		joinPeople = joinPeople.split(",");
		joinPeople = joinPeople.length;
		$("#modifyGroupModal #joinPeopleNo").val(joinPeople);
		$("#modifyGroupModal #maxPeople").val(coopers[index][8]);
	});

	function initConn(str) {
		var conn = str;
		conn = conn.replace("[", "");
		conn = conn.replace(/ /gi, "");
		conn = conn.replace("]", "");
		$(".tags").each(function() {
			$(this).importTags(conn);
		});
	};

</script>
