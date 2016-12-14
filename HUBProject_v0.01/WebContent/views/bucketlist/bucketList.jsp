<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<title>HUB:Have U get a Bucketlist?</title>

<%@ include file="/views/layout/commonCSS.jsp" %>

</head>

<body class="nav-md">
	<div class="container body">
		<div class="main_container">

			<%@ include file="/views/header/header.jspf"%>
			<%@ include file="/views/follow/listFollow.jsp"%>

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
									<div class="" role="tabpanel" data-example-id="togglable-tabs" >

										<ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist" style="background-color:#fdae84;">
											<li role="presentation" class="">
												<a href="${pageContext.request.contextPath }/bucketlist/list.do" id="profile-tab1">Bucketlist</a></li>
											<li role="presentation" class="">
												<a href='${pageContext.request.contextPath }/list/list.do?listOpt=1&userId=${sessionScope.userId}' id="profile-tab2">Helper </a></li>
											<li role="presentation" class="">
												<a href="${pageContext.request.contextPath }/cooper/list.do?listOpt=0" id="profile-tab3">Cooper </a></li>
											<li role="presentation" class="">
												<a href="${pageContext.request.contextPath }/group/list.do?listOpt=0" id="profile-tab4">Group </a></li>
										</ul>

										<div id="myTabContent" class="tab-content">

											<!-- tab1-->
											<div role="tabpanel" class="tab-pane fade"
												id="tab_content1" aria-labelledby="profile-tab1">
												<%@ include file="/views/bucketlist/listElement.jsp"%>
											</div>
											<!-- end tab1-->

											<!-- tab2-->
											<div role="tabpanel" class="tab-pane fade" id="tab_content2"
												aria-labelledby="profile-tab2">
												<%@ include file="/views/list/list.jsp"%>
											</div>
											<!-- end tab2-->

											<!-- tab3-->
											<div role="tabpanel" class="tab-pane fade" id="tab_content3"
												aria-labelledby="profile-tab3">
												<%@ include file="/views/cooper/listCooper.jsp"%>
											</div>
											<!-- end tab3-->
											
											<!-- tab4-->
											<div role="tabpanel" class="tab-pane fade" id="tab_content4"
												aria-labelledby="profile-tab4">
												<%@ include file="/views/group/listGroup.jsp"%>
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
			
			<!-- footer content -->
        <footer>
          <div class="pull-right">
            HUB - Have U get a Bucketlist 2016 by <a href="https://.com">For Man</a>
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
		</div>
	</div>
	<%@ include file="/views/layout/commonJS.jsp" %>
</body>
</html>