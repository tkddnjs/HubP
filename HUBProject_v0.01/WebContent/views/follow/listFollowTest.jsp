<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="col-md-3 left_col">
	<div class="left_col scroll-view">
		<div class="navbar nav_title" style="border: 0;">
			<a href="index.html" class="site_title"><i class="fa fa-paw"></i>
				<span> 팔로우</span></a>
		</div>

		<div class="clearfix"></div>


		<!-- /menu profile quick info -->

		<br />

		<!-- sidebar menu -->
		<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
			<div class="menu_section">
				<ul class="nav side-menu" style="font-size: 20px;">


					<li><a><i class="fa fa-history"></i> 요청 대기 <span
							class="fa fa-chevron-down"></span></a>
						<ul class="nav child_menu">
							<li><a style="font-size: 17px;">333</a></li>


							<!-- asdf -->
							<table class="table table-hover table-condensed">
								<thead style="background: #60d7a9; color: white;">
									<tr style="align: center; font-size: 14pt;">
										<th width="50" align="center">NO</th>
										<th width="200" align="center">친구ID</th>
										<th width="200" align="center">관계</th>
										<th width="50dp" align="right">관리</th>
										<th width="50dp"></th>
										<c:if test="${isRequest }">
											<th colspan='2' width="200" align="center">친구요청</th>
										</c:if>
									</tr>
								</thead>

								<tbody style="font-size: 14pt;">
									<c:forEach items="${follows }" var="follow" varStatus="status">
										<c:choose>
											<c:when test="${isRequest }">
												<tr>
													<td>${status.count }</td>
													<td>
														<form action="user/detail.do" method="post">
															<button class="btn btn-xs btn-default btn-block"
																type="submit" name="userId" value="${follow.followId }">${follow.followId }</button>
															<input type="hidden" name="listOpt"
																value="${follow.relation }">
														</form>
													</td>
													<td><c:choose>
															<c:when test="${follow.relation eq 1}">
									내가 도움을 주는 관계							
									</c:when>
															<c:when test="${follow.relation eq 2}">
									내가 도움을 받는 관계
									</c:when>
															<c:otherwise>
									서로 도움을 주는 관계
									</c:otherwise>
														</c:choose></td>
												</tr>
											</c:when>

											<c:otherwise>
												<tr>
													<td>${status.count }</td>
													<td>
														<form action="user/detail.do" method="post">
															<a
																href="${pageContext.request.contextPath}/user/detail.do"><b>${follow.followId }</b></a>
															<input type="hidden" name="listOpt"
																value="${follow.relation }">
														</form>
													</td>
													<td><c:choose>
															<c:when test="${follow.relation eq 1}">
									내가 도움을 주는 관계							
									</c:when>
															<c:when test="${follow.relation eq 2}">
									내가 도움을 받는 관계
									</c:when>
															<c:otherwise>
									서로 도움을 주는 관계
									</c:otherwise>
														</c:choose></td>

													<c:choose>
														<c:when test="${follow.confirm eq false }">
															<td>
																<form
																	action="${pageContext.request.contextPath}/follow/confirm.do"
																	method="post">
																	<button class="btn btn-xs btn-warning" type="submit">수락</button>
																	<input type="hidden" name="followId"
																		value="${follow.followId }"> <input
																		type="hidden" name="userId" value="${follow.userId }">
																</form>
															</td>
															<td>
																<form
																	action="${pageContext.request.contextPath}/follow/remove.do"
																	method="post">
																	<button class="btn btn-xs btn-danger" type="submit">거절</button>
																	<input type="hidden" name="followId"
																		value="${follow.followId }"> <input
																		type="hidden" name="userId" value="${follow.userId }">
																</form>
															</td>
														</c:when>
														<c:when test="${follow.confirm eq true }">
															<td>
																<form
																	action="${pageContext.request.contextPath}/follow/remove.do"
																	method="post">
																	<button class="btn btn-xs btn-danger" type="submit">삭제</button>
																	<input type="hidden" name="followId"
																		value="${follow.followId }"> <input
																		type="hidden" name="userId" value="${follow.userId }">
																</form>
															</td>
														</c:when>

														<c:otherwise>
															<td>
																<%-- <form action="follow/remove.do" method="post">
											<button class="btn btn-xs btn-default btn-block" type="submit">삭제</button>
											<input type="hidden" name="followId" value="${follow.followId }">
											<input type="hidden" name="searchOpt" value="${searchOpt }">
										</form> --%>
															</td>
														</c:otherwise>
													</c:choose>
												</tr>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</tbody>
							</table>
							<!-- asdf -->






						</ul></li>

					<li><a><i class="fa fa-child"></i> 팔로우 <span
							class="fa fa-chevron-down"></span></a>

						<ul class="nav child_menu">
							<li><a style="font-size: 17px;">333</a></li>
						</ul></li>



					<li><a><i class="fa fa-spinner"></i> 모임방 <span
							class="fa fa-chevron-down"></span></a>
						<ul class="nav child_menu">
							<li><a href="general_elements.html">General Elements</a></li>
							<li><a href="media_gallery.html">Media Gallery</a></li>
							<li><a href="typography.html">Typography</a></li>
							<li><a href="icons.html">Icons</a></li>
							<li><a href="glyphicons.html">Glyphicons</a></li>
							<li><a href="widgets.html">Widgets</a></li>
							<li><a href="invoice.html">Invoice</a></li>
							<li><a href="inbox.html">Inbox</a></li>
							<li><a href="calendar.html">Calendar</a></li>



							<li><a style="font-size: 17px;">333 <span
									class="fa fa-chevron-down"></span></a>

								<ul class="nav child_menu">

									<li class="sub_menu"><a href="level2.html">111님의 정보</a></li>

									<li class="sub_menu">
										<tr style="font-size: 15px;">
											<th class="fa fa-plus-square"></th>
											<td><a href="#level2_2">수락</a></td>
											<th class="fa fa-minus-square"></th>
											<td><a href="#level2_2">거절</a></td>

										</tr>

									</li>

								</ul></li>
						</ul></li>

				</ul>
			</div>

		</div>



	</div>
</div>