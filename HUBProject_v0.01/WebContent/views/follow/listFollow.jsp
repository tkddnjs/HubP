<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/views/post/sendPost.jsp"%>

<!--follow-->
<div class="col-md-3 left_col" style="background: #8BCBC8;">
	<div class="left_col scroll-view" style="background: #8BCBC8;">
		<div class="navbar nav_title" style="border: 0;">
			<p class="site_title"><i class="fa fa-users"></i> <span>팔로우 관리</span></p>
		</div>
		<div class="clearfix"></div>
		<!-- /menu profile quick info -->
		<br />

		<!-- sidebar menu -->
		<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
			<div class="menu_section">
				<ul class="nav side-menu" style="font-size: 20px;">

					<!--도움 대기-->
					<li>
						<a>
							<i class="fa fa-history"></i>도움대기 <span class="fa fa-chevron-down"></span>
						</a>

						<ul class="nav child_menu" id="requestedFollow">
						</ul>
					</li>

					<!--팔로우-->
					<li>
						<a>
							<i class="fa fa-child"></i> 팔로우 <span class="fa fa-chevron-down"></span>
						</a>
						
						<ul class="nav child_menu" id="alreadyFollow">

							<!--내가 도움-->
							<li>
								<a style="font-size: 17px;">내가 도움 <span class="fa fa-chevron-down"></span></a>
								<ul class="nav child_menu" id="giveHelp">
								</ul>
							</li>

							<!--나를 도움-->
							<li>
								<a style="font-size: 17px;">나를 도움 <span class="fa fa-chevron-down"></span></a>
								<ul class="nav child_menu" id="receiveHelp">
								</ul>
							</li>

							<!--서로 도움-->
							<li>
								<a style="font-size: 17px;">서로 도움 <span class="fa fa-chevron-down"></span></a>
								<ul class="nav child_menu" id="bothHelp">
								</ul>
							</li>
						</ul>
					</li>
					<!-- end 팔로우-->

					<!--모임방-->
					<li><a><i class="fa fa-group"></i> 모임방 <span class="fa fa-chevron-down"></span></a>
						<ul class="nav child_menu" id="groupFollow">
						</ul>
					</li>
					<!--end 모임방-->

				</ul>
			</div>
		</div>
		<!-- /sidebar menu -->
	</div>
</div>
<!--end follow-->
