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
			<table id="cooperTable1" class="table table-striped table-bordered dt-responsive nowrap cooperTable" cellspacing="0" width="100%">
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
			<table id="cooperTable2" class="table table-striped table-bordered dt-responsive nowrap cooperTable" cellspacing="0" width="100%">
				<thead>
					<tr>
						<th style="width: 50px; text-align: center;">업체이름</th>
						<th style="width: 80px; text-align: center;">등록일자</th>
						<th style="width: 80px; text-align: center;">만료일자</th>
						<th style="width: 100px; text-align: center;">연결고리</th>
						<th style="width: 100px; text-align: center;">업체url</th>
						<th style="width: 400px; text-align: center;">배너이미지</th>
						<th style="width: 50px; text-align: center;"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${coopers }" var="cooper" varStatus="status">
						<tr>
							<td style="text-align: center; vertical-align: middle;">${cooper.coName }</td>
							<td style="text-align: center; vertical-align: middle;">${cooper.startDay }</td>
							<td style="text-align: center; vertical-align: middle;">${cooper.lastDay }</td>
							<td style="text-align: center; vertical-align: middle;">${cooper.connChains }</td>
							<td style="text-align: center; vertical-align: middle;">${cooper.coBanner }</td>
							<td style="text-align: left;">
								<img src="${pageContext.request.contextPath}/resources/img/cooperImg/${cooper.image }" width="100%" height="100px"/>
							</td>
							<td style="text-align: center; vertical-align: middle;">
								<form action="${pageContext.request.contextPath}/cooper/remove.do" method="GET">
									<button class="fa fa-edit" type="button" value="${status.count }" data-toggle="modal" name="modifyCooperBtn" data-target="#modifyCooperModal"
										style="font-size: 20px; background: none !important; border: none;"></button>
									<button class="fa fa-trash-o" style="font-size: 20px; background: none !important; border: none;"
											name="coId" value="${cooper.coId }" type="submit"></button>
								</form>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<!-- 업체 등록 -->
					<div class="panel">
						<a id="registerCooperBtn" data-toggle="modal" data-target="#registerCooperModal">
							<h1 align="center">
								<i class="fa fa-plus-circle"></i>
							</h1>
						</a>
					</div>
			<!-- /업체 등록 -->
		
		</c:if>
		<!-- 업체 목록  바디 -->
	</div>
	<!-- 업체 목록 -->
</div>