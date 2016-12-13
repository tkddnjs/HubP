<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- detailBucketlist.jsp & detailUser.jsp import-->

<div class="col-md-12 col-sm-12 col-xs-12">
	<div class="x_panel">
		<div class="x_title">
			<h2>Helper</h2>
			<ul class="nav navbar-right panel_toolbox">
				<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
				</li>

				<li><a class="close-link"><i class="fa fa-close"></i></a></li>
			</ul>
			<div class="clearfix"></div>
		</div>
		<div class="x_content">
			<p class="text-muted font-13 m-b-30">Responsive is an extension
				for DataTables that resolves that problem by optimising the table's
				layout for different screen sizes through the dynamic insertion and
				removal of columns from the table.</p>
			<div>
				<form action="${pageContext.request.contextPath }/list/list.do" method="get" class="listOpt selector">
					<input type="hidden" name="userId" value="${sessionScope.userId }">
					<button type="submit" name="listOpt" value="1">내가</button>
					<button type="submit" name="listOpt" value="2">나를</button>
					<button type="submit" name="listOpt" value="3">서로</button>
				</form>
			</div>
			<table id="datatable-responsive"
				class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">

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
									<td style="text-align: center;">${bucketlist.userId }</td>
									<td style="text-align: center;">${bucketlist.title }</td>
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
									<td style="text-align: center;">${user.userId }</td>
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
