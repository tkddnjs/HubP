<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="col-xs-12">
	<!-- 쪽지 목록 -->
	<div class="x_panel">
		<!-- 쪽지 목록 헤드 -->
		<div class="x_title">
			<h2></h2>
			<ul class="nav navbar-right panel_toolbox">
				<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
				<li><a class="close-link"><i class="fa fa-close"></i></a></li>
			</ul>
			<div class="clearfix"></div>
		</div>
		<!-- /쪽지 목록 헤드 -->
		<div class="x_content" style="margin-top: -48px">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="" role="tabpanel" data-example-id="togglable-tabs">
					<ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist"
						style="background-color: #ecc7c0;">
						<li role="presentation" class="active"><a href="#tapPostAll"
							id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">전체쪽지</a></li>
						<li role="presentation" class=""><a href="#tabPostSend"
							role="tab" id="profile-tab" data-toggle="tab"
							aria-expanded="false">보낸쪽지</a></li>
						<li role="presentation" class=""><a href="#tabPostRecieve"
							role="tab" id="profile-tab2" data-toggle="tab"
							aria-expanded="false">받은쪽지</a></li>
					</ul>
					<div id="myTabContent" class="tab-content">
						<!-- 전체쪽지 -->
						<div role="tabpanel" class="tab-pane fade active in"
							id="tapPostAll" aria-labelledby="profile-tab1">

							<table id="datatable"
								class="table table-striped table-bordered dt-responsive nowrap"
								cellspacing="0" width="100%">
								<thead>
									<tr>
										<th style="text-align: center; width: 100px;">보낸 사람</th>
										<th style="text-align: center; width: 100px;">받는 사람</th>
										<th style="text-align: center; width: 500px;">내용</th>
										<th style="text-align: center; width: 150px;">보낸 시간</th>
										<th style="text-align: center; width: 50px;">삭제</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${posts }" var="post" varStatus="status">
										<tr>
											<td style="width: 100px; text-align: center;">${post.senderId }</td>
											<td style="width: 100px; text-align: center;">${post.receiverId }</td>
											<td style="width: 500px;">${post.content }</td>
											<td style="width: 150px; text-align: center;">${post.sendTime }</td>
											<td style="width: 50px; text-align: center;"></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>

						<div role="tabpanel" class="tab-pane fade" id="tabPostSend"
							aria-labelledby="profile-tab1">

							<table id="datatable1"
								class="table table-striped table-bordered dt-responsive nowrap"
								cellspacing="0" width="100%">
								<thead>
									<tr>
										<th style="text-align: center; width: 100px;">보낸 사람</th>
										<th style="text-align: center; width: 100px;">받는 사람</th>
										<th style="text-align: center; width: 500px;">내용</th>
										<th style="text-align: center; width: 150px;">보낸 시간</th>
										<th style="text-align: center; width: 50px;">삭제</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${posts }" var="post" varStatus="status">
										<c:if test="${post.senderId eq sessionScope.userId }">
											<tr>
												<td style="width: 100px; text-align: center;">${post.senderId }</td>
												<td style="width: 100px; text-align: center;">${post.receiverId }</td>
												<td style="width: 500px;">${post.content }</td>
												<td style="width: 150px; text-align: center;">${post.sendTime }</td>
												<td style="width: 50px; text-align: center;"></td>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>

						<div role="tabpanel" class="tab-pane fade" id="tabPostRecieve"
							aria-labelledby="profile-tab1">

							<table id="datatable2"
								class="table table-striped table-bordered dt-responsive nowrap"
								cellspacing="0" width="100%">
								<thead>
									<tr>
										<th style="text-align: center; width: 100px;">보낸 사람</th>
										<th style="text-align: center; width: 100px;">받는 사람</th>
										<th style="text-align: center; width: 500px;">내용</th>
										<th style="text-align: center; width: 150px;">보낸 시간</th>
										<th style="text-align: center; width: 50px;">삭제</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${posts }" var="post" varStatus="status">
										<c:if test="${post.receiverId eq sessionScope.userId }">
											<tr>
												<td style="width: 100px; text-align: center;">${post.senderId }</td>
												<td style="width: 100px; text-align: center;">${post.receiverId }</td>
												<td style="width: 500px;">${post.content }</td>
												<td style="width: 150px; text-align: center;">${post.sendTime }</td>
												<td style="width: 50px; text-align: center;"></td>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
</div>