<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<title>HUB:Have U get a Bucketlist?</title>

<%@ include file="/views/layout/modalCSSCommon.jsp" %>

</head>

<body class="nav-md">
	<div class="container body">
		<div class="main_container">

			<%@ include file="/views/follow/listFollowTest.jsp"%>

			<%@ include file="/views/header/header.jspf"%>

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

											<!-- tab3-->
											<div role="tabpanel" class="tab-pane fade" id="tab_content3"
												aria-labelledby="profile-tab2">
												<%@ include file="/views/cooper/listCooper.jsp"%>
											</div>
											<!-- end tab3-->
											
											<!-- tab4-->
											<div role="tabpanel" class="tab-pane fade" id="tab_content4"
												aria-labelledby="profile-tab3">
												<%-- <%@ include file="/views/list/list.jsp"%> --%>
											</div>
											<!-- end tab4-->
											

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
	<%@ include file="/views/layout/modalJSCommon.jsp" %>
	<script>
		$("[role='tab']").each(function(){
			$(this).attr("aria-expanded", false);
		});
	
		$("[role='tab']").click(function(){
			alert($(this).attr("aria-expanded"));
		});
	
	</script>
</body>
</html>