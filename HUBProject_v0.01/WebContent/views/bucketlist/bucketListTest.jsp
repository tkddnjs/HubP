<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 -->
<title>HUB:Have U get a Bucketlist?</title>
<%@ include file="/views/layout/commonTest.jsp"%>
</head>


<body class="nav-md">
	<div class="container body">
		<div class="main_container">

			<%@ include file="/views/follow/listFollowTest.jsp"%>

			<%@ include file="/views/header/headerTest.jspf"%>

			<!-- page content -->
			<div class="right_col" role="main">
				<div class="">
					<div class="page-title">
						<div class="clearfix">
							<div
								class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
							</div>
						</div>
					</div>
					<div class=""></div>
					<div class="clearfix">
						<div class="col-xs-12">
							<div class="">
								<div class="x_content">

									<!--tab-->
									<div class="" role="tabpanel" data-example-id="togglable-tabs">

										<ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
											<li role="presentation" class="active"><a
												href="#tab_content1" id="home-tab" role="tab"
												data-toggle="tab" aria-expanded="true">Bucketlist</a></li>
											<li role="presentation" class=""><a href="#tab_content2"
												role="tab" id="profile-tab" data-toggle="tab"
												aria-expanded="false">Helper </a></li>
											<li role="presentation" class=""><a href="#tab_content3"
												role="tab" id="profile-tab2" data-toggle="tab"
												aria-expanded="false">Cooper </a></li>
											<li role="presentation" class=""><a href="#tab_content4"
												role="tab" id="profile-tab3" data-toggle="tab"
												aria-expanded="false">Group </a></li>
										</ul>

										<div id="myTabContent" class="tab-content">

											<!-- tab1-->
											<div role="tabpanel" class="tab-pane fade active in"
												id="tab_content1" aria-labelledby="home-tab">
												<%@ include file="/views/bucketlist/listElement.jsp"%>

											</div>
											<!-- end tab1-->

											<!-- tab2-->
											<div role="tabpanel" class="tab-pane fade" id="tab_content2"
												aria-labelledby="profile-tab">
												<%-- <%@ include file="/views/list/list.jsp"%> --%>
											</div>
											<!-- end tab2-->

										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/views/layout/commonFooter.jsp"%>
</body>
</html>