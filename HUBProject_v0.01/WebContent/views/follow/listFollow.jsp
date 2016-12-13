<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<title>HUB:Have U get a Bucketlist?</title>


</head>


<!--follow-->
<div class="col-md-3 left_col" style="background: #8BCBC8;">

	<div class="left_col scroll-view" style="background: #8BCBC8;">
		<div class="navbar nav_title" style="border: 0;">
			<a href="${pageContext.request.contextPath}/follow/listAll.do"
				class="site_title"><i class="fa fa-users"></i> <span>팔로우
					관리</span></a>
		</div>
		<div class="clearfix"></div>
		<!-- /menu profile quick info -->
		<br />

		<!-- sidebar menu -->
		<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
			<div class="menu_section">
				<ul class="nav side-menu" style="font-size: 20px;">

					<!--도움 대기-->
					<li><a><i class="fa fa-history"></i>도움대기 <span
							class="fa fa-chevron-down"></span></a>
							 <!-- <form action="follow/listAll.do" method="post" class="form-inline"> -->

						<ul class="nav child_menu">
							<c:forEach items="${follows }" var="follow" varStatus="status">
								<c:if test="${follow.confirm eq false}">
									<!--for-->
									<li class="sub_menu" style="height: 70px;">
									
									<form action="${pageContext.request.contextPath}/user/detail.do" method="get">
										<input type="hidden" name="myId" value="${sessionScope.userId}">
										<input type="hidden" name="userId" value="${follow.followId }">
										<button class="btn btn-xs btn-default btn-block" style="border:hidden; font-size: 15px; background:none !important;" type="submit">${follow.followId }</button>
									</form>
										<%-- <form action="user/detail.do" method="post">

											<a style="font-size: 15px" name="userId" href="${pageContext.request.contextPath}/user/detail.do?userId=${follow.followId}"
												value="${follow.followId }">${follow.followId }</a>
											
										</form>  --%><span style="display: block; float: left">
											<form
												action="${pageContext.request.contextPath}/follow/confirm.do"
												method="post" style="width: 60px;">
												<button class="fa fa-plus-square"
													style="width: 60px; font-size: 16px; background: none !important; border: none;">수락</button>
												<input type="hidden" name="followId"
													value="${follow.followId }"> <input type="hidden"
													name="userId" value="${follow.userId }">
											</form>
									</span> <span
										style="display: block; margin-right: 50px; float: right;">
											<form
												action="${pageContext.request.contextPath}/follow/remove.do"
												method="post" style="width: 60px;">
												<button class="fa fa-minus-square"
													style="width: 60px; font-size: 16px; background: none !important; border: none;">거절</button>
												<input type="hidden" name="followId"
													value="${follow.followId }"> <input type="hidden"
													name="userId" value="${follow.userId }">
											</form>
									</span>

									</li>
								</c:if>
							</c:forEach>
							<!--end for-->
						</ul> <!-- </form> --></li>
					<!--도움 대기 end-->

					<!--팔로우-->
					<li><a><i class="fa fa-child"></i> 팔로우 <span
							class="fa fa-chevron-down"></span></a>
						<ul class="nav child_menu">

							<!--내가 도움-->
							<li><a style="font-size: 17px;">내가 도움 <span
									class="fa fa-chevron-down"></span></a>
								<ul class="nav child_menu">

									<!--for-->
									<c:forEach items="${follows }" var="follow" varStatus="status">
										<c:if test="${follow.confirm eq true && follow.relation == 1}">
											<li class="sub_menu">
											
												<form action="${pageContext.request.contextPath}/user/detail.do" method="get">
													<input type="hidden" name="myId" value="${sessionScope.userId}">
													<input type="hidden" name="userId" value="${follow.followId }">
													<button class="btn btn-xs btn-default btn-block" style="border:hidden; 
													font-size: 15px; background:none !important;" type="submit">${follow.followId }</button>
												</form>
											
												<%-- <form action="user/detail.do" method="post">
													<a style="font-size: 15px" name="userId"
														value="${follow.followId }">${follow.followId }</a> <input
														type="hidden" name="listOpt" value="${follow.relation }">
												</form> --%>
											</li>
										</c:if>
									</c:forEach>
									<!--end for-->

								</ul></li>

							<!--나를 도움-->
							<li><a style="font-size: 17px;">나를 도움 <span
									class="fa fa-chevron-down"></span></a>
								<ul class="nav child_menu">

									<c:forEach items="${follows }" var="follow" varStatus="status">
										<c:if test="${follow.confirm eq true && follow.relation == 2}">
											<!--for-->
											<li class="sub_menu">
											
												<form action="${pageContext.request.contextPath}/user/detail.do" method="get">
													<input type="hidden" name="myId" value="${sessionScope.userId}">
													<input type="hidden" name="userId" value="${follow.followId }">
													<button class="btn btn-xs btn-default btn-block" style="border:hidden; font-size: 15px; background:none !important;" type="submit">${follow.followId }</button>
												</form>
												<%-- <form action="user/detail.do" method="post">
													<a style="font-size: 15px" name="userId"
														value="${follow.followId }">${follow.followId }</a> <input
														type="hidden" name="listOpt" value="${follow.relation }">
												</form> --%>
											</li>
										</c:if>
									</c:forEach>

								</ul></li>


							<!--서로 도움-->
							<li><a style="font-size: 17px;">서로 도움 <span
									class="fa fa-chevron-down"></span></a>
								<ul class="nav child_menu">

									<c:forEach items="${follows }" var="follow" varStatus="status">
										<c:if
											test="${follow.confirm eq true && follow.relation != 1 && follow.relation != 2}">
											<!--for-->
											<li class="sub_menu">
												<form action="${pageContext.request.contextPath}/user/detail.do" method="get">
													<input type="hidden" name="myId" value="${sessionScope.userId}">
													<input type="hidden" name="userId" value="${follow.followId }">
													<button class="btn btn-xs btn-default btn-block" style="border:hidden; font-size: 15px; background:none !important;" type="submit">${follow.followId }</button>
												</form>
												<%-- <form action="user/detail.do" method="post">
													<a style="font-size: 15px" name="userId"
														value="${follow.followId }">${follow.followId }</a> <input
														type="hidden" name="listOpt" value="${follow.relation }">
												</form> --%>
											</li>
										</c:if>
									</c:forEach>
								</ul></li>

						</ul></li>
					<!-- end 팔로우-->

					<!--모임방-->
					<li><a><i class="fa fa-group"></i> 모임방 <span
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
					<!--end 모임방-->

				</ul>
			</div>
		</div>
		<!-- /sidebar menu -->
	</div>
</div>
<!--end follow-->

</html>