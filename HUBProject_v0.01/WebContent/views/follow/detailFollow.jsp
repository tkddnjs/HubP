<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div>
	<div class="row">
		<div class="col-md-12 col-sm-12 col-xs-12">
			<div class="x_panel">
				<div class="x_title">
					<h2>${user.userId }님의프로필& 주고받은 쪽지</h2>
					<ul class="nav navbar-right panel_toolbox">
						<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
						<li><a class="close-link"><i class="fa fa-close"></i></a></li>
					</ul>
					<div class="clearfix"></div>
				</div>

				<div class="x_content">
					<!--profile-->
					<div class="col-md-3 col-sm-3 col-xs-12 profile_left">
						<div id="crop-avatar">
							<!-- Current Avatar -->
							<img class="img-responsive avatar-view"
								src="${pageContext.request.contextPath}/resources/img/userImg/${user.picture}"
								alt="avatar" title="Change the avatar">
						</div>
						<h3 class="name">${user.userId }</h3>
						<div style="border: 1px solid #fdae84"></div>
						<div class="flex">
							<span><h4>연결고리</h4></span>
							<p>${user.connChains }</p>
						</div>
						<div style="border: 1px solid #fdae84"></div>
						<h4>자기소개</h4>
						<p>${user.introduce }</p>
						<div style="border: 1px solid #fdae84; margin-bottom: 10px"></div>
						<form
							action="${pageContext.request.contextPath }/follow/remove.do"
							method="post">
							<input type="hidden" name="userId"
								value="${sessionScope.userId }">
							<button class="btn btn-xs btn-danger" type="submit"
								name="followId" value="${user.userId }">Unfollow</button>
						</form>
					</div>
					<!--end frofile-->

					<!-- post -->
					<div class="col-md-9 col-sm-9 col-xs-12">
						<div class="" role="tabpanel" data-example-id="togglable-tabs">
							<ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist"
								style="background-color: #ecc7c0;">
								<li role="presentation" class="active"><a
									href="#tab_PostAllOne" id="fpost-tab1" role="tab"
									data-toggle="tab" aria-controls="home" aria-expanded="true">전체쪽지</a></li>
								<li role="presentation" class=""><a href="#tab_PostSendOne"
									role="tab" id="fpost-tab2" data-toggle="tab"
									aria-controls="profile" aria-expanded="false">보낸쪽지</a></li>
								<li role="presentation" class=""><a
									href="#tab_PostRecieveOne" role="tab" id="fpost-tab3"
									data-toggle="tab" aria-controls="profile" aria-expanded="false">받은쪽지</a></li>
							</ul>

							<form action="${pageContext.request.contextPath }/post/remove.do" method="post" id="removePostInDF">
								<button style="float: right;" class="btn btn-xs btn-default" type="submit" id="removePost">삭제</button>
								<!-- end tab Area -->
								<div id="myTabContent" class="tab-content">
									<!--tab1 -->
									<div role="tabpanel" class="tab-pane fade active in"
										id="tab_PostAllOne" aria-labelledby="fpost-tab1">
										<table
											class="table table-striped table-bordered dt-responsive nowrap followPostTable"
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
														<td style="width: 50px; text-align: center;">
															<input type="checkbox" name="checks" value="${post.postId }">
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
									<!--end tab1 -->

									<!--tab2 -->
									<div role="tabpanel" class="tab-pane fade" id="tab_PostSendOne"
										aria-labelledby="fpost-tab2">
										<table
											class="table table-striped table-bordered dt-responsive nowrap followPostTable"
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
													<c:if test="${post.senderId eq user.userId }">
														<tr>
															<td style="width: 100px; text-align: center;">${post.senderId }</td>
															<td style="width: 100px; text-align: center;">${post.receiverId }</td>
															<td style="width: 500px;">${post.content }</td>
															<td style="width: 150px; text-align: center;">${post.sendTime }</td>
															<td style="width: 50px; text-align: center;">
																<input type="checkbox" name="checks" value="${post.postId }">
															</td>
														</tr>
													</c:if>
												</c:forEach>
											</tbody>
										</table>
									</div>
									<!--end tab2 -->

									<!--tab3 -->
									<div role="tabpanel" class="tab-pane fade"
										id="tab_PostRecieveOne" aria-labelledby="fpost-tab3">
										<table
											class="table table-striped table-bordered dt-responsive nowrap followPostTable"
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
													<c:if test="${post.receiverId eq user.userId }">
														<tr>
															<td style="width: 100px; text-align: center;">${post.senderId }</td>
															<td style="width: 100px; text-align: center;">${post.receiverId }</td>
															<td style="width: 500px;">${post.content }</td>
															<td style="width: 150px; text-align: center;">${post.sendTime }</td>
															<td style="width: 50px; text-align: center;">
																<input type="checkbox" name="checks" value="${post.postId }">
															</td>
														</tr>
													</c:if>
												</c:forEach>
											</tbody>
										</table>
									</div>
									<!--end tab3 -->
									<input type="hidden" name="followId" value="${user.userId }">
									<input type="hidden" name="userId" value="${sessionScope.userId }">
									<input type="hidden" name="listOpt">
								</div>
							</form>
							<!-- end tab Area -->

						</div>
					</div>
					<!--end post -->
				</div>
			</div>
		</div>
	</div>
</div>