<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- detailBucketlist.jsp & detailUser.jsp import-->
<%@ include file="/views/list/detailUser.jsp"%>
<%@ include file="/views/list/detailBucketlist.jsp"%>


<div class="col-md-12 col-sm-12 col-xs-12">
	<div class="x_panel">
		<div class="x_title">
			<h2>
				<form action="${pageContext.request.contextPath }/list/list.do"
					method="get" class="listOpt selector">
					<input type="hidden" name="userId" value="${sessionScope.userId }">
					<button type="submit" name="listOpt" value="1"
						style="border: hidden; background: #ecc7c0; font-size: 15px; font-weight: 800; width: 80px; height: 30px;">내가</button>
					<button type="submit" name="listOpt" value="2"
						style="border: hidden; background: #ecc7c0; font-size: 15px; font-weight: 800; width: 80px; height: 30px;">나를</button>
					<button type="submit" name="listOpt" value="3"
						style="border: hidden; background: #ecc7c0; font-size: 15px; font-weight: 800; width: 80px; height: 30px;">서로</button>
				</form>
			</h2>
			<ul class="nav navbar-right panel_toolbox">
				<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
				</li>

				<li><a class="close-link"><i class="fa fa-close"></i></a></li>
			</ul>
			<div class="clearfix"></div>
		</div>
		<div class="x_content">
			<p class="text-muted font-13 m-b-30" style="margin-top: -15px;">'내가'
				: 내가 도울 수 있는 사람들을 보여줍니다</p>
			<p class="text-muted font-13 m-b-30" style="margin-top: -15px;">'나를'
				: 나를 도울 수 있는 사람들을 보여줍니다</p>
			<p class="text-muted font-13 m-b-30" style="margin-top: -15px;">'서로'
				: 서로 돕고 도울 수 있는 사람들을 보여줍니다</p>
			<%-- <div style="margin-top:-30px;" align="center">
				<form action="${pageContext.request.contextPath }/list/list.do" method="get" class="listOpt selector">
					<input type="hidden" name="userId" value="${sessionScope.userId }">
					<button type="submit" name="listOpt" value="1" style="border:hidden; background:#ecc7c0; font-size:15px; width:80px;">내가</button>
					<button type="submit" name="listOpt" value="2" style="border:hidden; background:#ecc7c0; font-size:15px; width:80px;">나를</button>
					<button type="submit" name="listOpt" value="3" style="border:hidden; background:#ecc7c0; font-size:15px; width:80px;">서로</button>
				</form>
			</div> --%>
			<table id="datatable-responsive"
				class="table table-striped table-bordered dt-responsive nowrap"
				cellspacing="0" width="100%">

				<c:choose>
					<c:when test="${listOpt eq 1 || listOpt eq 3}">
						<thead>
							<tr>
								<th style="width: 250px; text-align: center;">ID</th>
								<th style="width: 600px; text-align: center;">버킷리스트</th>
								<th style="width: 400px; text-align: center;">연결고리</th>
								<th style="width: 400px; text-align: center;">SOS</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${bucketlists }" var="bucketlist">
								<tr>
									<td style="text-align: center;">
										<button id="detailUserBtn" value="${bucketlist.userId }"
											data-toggle="modal" name="detailUserBtn"
											data-target="#detailUserModal"
											style="font-size: 15px; background: none !important; border: none;">${bucketlist.userId }</button>
									</td>

									<td style="text-align: center;"><a>
											<button value="${bucketlist.bucketlistId }"
												data-toggle="modal" name="modifyBtn"
												data-target="#detailBucketlistModal"
												style="font-size: 15px; background: none !important; border: none;">${bucketlist.title }</button>
									</a></td>


									<td style="text-align: center;">${bucketlist.connChains }</td>
									<td>${bucketlist.sos }</td>
								</tr>
							</c:forEach>
						</tbody>
					</c:when>

					<c:when test="${listOpt eq 2}">
						<thead>
							<tr>
								<th style="width: 250px; text-align: center;">ID</th>
								<th style="width: 700px; text-align: center;">연결고리</th>
								<th style="width: 700px; text-align: center;">자기소개</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${users }" var="user">
								<tr>
									<td style="text-align: center;">
										<button value="${user.userId }" data-toggle="modal"
											name="modifyBtn" data-target="#detailBucketlistModal"
											style="font-size: 15px; background: none !important; border: none;">${user.userId }</button>
									</td>
									<td style="text-align: center;">${user.connChains }</td>
									<td>${user.introduce }</td>
								</tr>
							</c:forEach>
						</tbody>
					</c:when>
				</c:choose>
			</table>
		</div>
	</div>
</div>
<!-- end tab2-->



<script type="text/javascript">
	var bucketlists = new Array();
	<c:forEach items="${bucketlists}" var="bucketlist">
	var bucketlist = new Array();
	bucketlist.push("${bucketlist.bucketlistId}");
	bucketlist.push("${bucketlist.title}");
	bucketlist.push("${bucketlist.connChains}");
	bucketlist.push("${bucketlist.goal}");
	bucketlist.push("${bucketlist.star}");
	bucketlist.push("${bucketlist.progress}");
	bucketlist.push("${bucketlist.memo}");
	bucketlist.push("${bucketlist.sos}");
	bucketlist.push("${bucketlist.lock}");
	bucketlist.push("${bucketlist.userId}");
	bucketlists.push(bucketlist);
	</c:forEach>

	var user = new Array();
	<c:forEach items="${users}" var="user">
	user.push("${user.userId}");
	user.push("${user.picture}");
	user.push("${user.connChains}");
	user.push("${user.introduce}");
	users.push(user);
	</c:forEach>

	var listOpt = $(this).find("[name='listOpt']").val();

	$("#detailUserBtn").click(function() {
		var index = $(this).val() - 1;
		$("#detailUserModal #picture").attr('src', '${pageContext.request.contextPath}/resources/img/userImg/${user.picture}');
		$("#detailUserModal #userId").html(users[index][0]);
		initConn(users[index][2]);
		$("#detailUserModal #intoduce").val(users[index][3]);
		$("#detailUserModal #introduce").val(listOpt);
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
