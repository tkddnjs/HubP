<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/views/cooper/registerCooper.jsp"%>
<%@ include file="/views/cooper/modifyCooper.jsp"%>

<div class="col-xs-12">
	<!-- 업체 목록 -->
	<div class="x_panel">
		<!-- 업체 목록 헤드 -->
		<div class="x_title">
			<h2>
				<i class="fa fa-copyright"></i>업체목록
			</h2>
			<ul class="nav navbar-right panel_toolbox">
				<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
				<li><a class="close-link"><i class="fa fa-close"></i></a></li>
			</ul>
			<div class="clearfix"></div>
		</div>
		<!-- /업체 목록 헤드 -->

		<!-- 업체 목록 바디 -->
		<!----------- Image accordion slider only css ------------>
		<c:if test="${!sessionScope.isAdmin }">
			<table id="datatable3" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
				<thead>
					<tr>
						<th style="width: 800px; text-align: center;">업체</th>
						<th hidden="true"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${coopers }" var="cooper" varStatus="status">
						<tr>
							<td style="text-align: left;">
								<a href="http://${cooper.coBanner }">
									<img src="${pageContext.request.contextPath}/resources/img/cooperImg/${cooper.image }" width="100%" height="100px"/>
								</a>
							</td>
							<td hidden="true">${cooper.connChains }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>
		<c:if test="${sessionScope.isAdmin}">
			<div class="x_content">
				<div class="accordion" id="accordion1" role="tablist" aria-multiselectable="true">
					<!--1st item-->
					<c:forEach items="${coopers }" var="cooper" varStatus="status">
						<c:set var="no" value="${status.count  }"></c:set>
						<div class="panel">
							<ul class="nav navbar-right panel_toolbox" style="padding-top: 13px">
								<li>
									<button class="fa fa-edit" value="${no }" data-toggle="modal" name="modifyCooperBtn" data-target="#modifyCooperModal"
										style="font-size: 20px; background: none !important; border: none;"></button>
								</li>
								<li>
									<form action="${pageContext.request.contextPath}/cooper/remove.do" method="GET">
										<button class="fa fa-trash-o" style="font-size: 20px; background: none !important; border: none;"
												name="cooperId" value="${cooper.coId }" type="submit"></button>
									</form>
								</li>
							</ul>
							<a class="panel-heading " role="tab" id="headingOne1"
								data-toggle="collapse" data-parent="#accordion1"
								href="#collapseOne${no  }" aria-expanded="true"
								aria-controls="collapseOne">
								<h3 class="panel-title">${cooper.coName }</h3>
							</a>
							<div id="collapseOne${no  }"
								class="panel-collapse collapse" role="tabpanel"
								aria-labelledby="headingOne">
								<div class="panel-body">
									<table class="table table-striped"
										style="width: 70%; height: 100px; margin: 20px 10px 0 140px; gravity: center; font-size: 16px">
										<tr>
											<th>등록일자</th>
											<td>${cooper.startDay }</td>
										</tr>
										<tr>
											<th>만료일자</th>
											<td>${cooper.lastDay }</td>
										</tr>
										<tr>
											<th>업체배너</th>
											<td><a>${cooper.coBanner }</a></td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</c:forEach>
					<!-- 업체 등록 -->
					<div class="panel">
						<a id="registerCooperBtn" data-toggle="modal" data-target="#registerCooperModal">
							<h1 align="center">
								<i class="fa fa-plus-circle"></i>
							</h1>
						</a>
					</div>
					<!-- /업체 등록 -->
			</div>
		</div>
		</c:if>
		<!-- 업체 목록  바디 -->
	</div>
	<!-- 업체 목록 -->
</div>
<script src="${pageContext.request.contextPath}/resources/vendors/jquery/dist/jquery.min.js"></script>

<!-- 업체 데이터 send -->
<script>
	$(".cooperForm").submit(function() {
		// 연결고리 값 domain type으로 변경
		var tags = $(this).find(".tags").val();
		tags = tags.split(",");
		$(this).find(".tags").val(tags);
	});

</script>
<!-- /업체 데이터 send -->

<!-- 업체 데이터 receive -->
<script>
	var coopers = new Array();
	<c:forEach items="${coopers }" var="cooper">
		var cooper = new Array();
		cooper.push("${cooper.coId }");
		cooper.push("${cooper.coName }");
		cooper.push("${cooper.startDay }");
		cooper.push("${cooper.lastDay }");
		cooper.push("${cooper.connChains }");
		cooper.push("${cooper.coBanner }");
		cooper.push("${cooper.image }");
		coopers.push(cooper);
	</c:forEach>
	
	$("#registerCooperBtn").click(function(){
		$(".tags").each(function(){
			$(this).importTags("");
		});
	});
	
	$("[name=modifyCooperBtn]").click(function() {
		var index = $(this).val() - 1;
		$("#modifyCooperModal #coId").val(coopers[index][0]);
		$("#modifyCooperModal #coName").val(coopers[index][1]);
		$("#modifyCooperModal #startDay").val(coopers[index][2]);
		$("#modifyCooperModal #lastDay").val(coopers[index][3]);
		initConn(coopers[index][4]);
		$("#modifyCooperModal #coBanner").val(coopers[index][5]);
		$("#modifyCooperModal #cmb_image").attr('src', '${pageContext.request.contextPath}/resources/img/cooperImg/'+coopers[index][6]);
	});
</script>
<!-- /업체 데이터 receive -->
