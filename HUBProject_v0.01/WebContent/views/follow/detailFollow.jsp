<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<title>HUB:Have U get a Bucketlist?</title>

<%@ include file="/views/layout/commonCSS.jsp"%>

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
									<div class="" role="tabpanel" data-example-id="togglable-tabs">

										<ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist" style="background-color:#fdae84;">
											<li role="presentation" class="">
												<a href="${pageContext.request.contextPath }/bucketlist/list.do" id="profile-tab1">Bucketlist</a></li>
											<li role="presentation" class="">
												<a href="${pageContext.request.contextPath }/list/list.do?listOpt=0" id="profile-tab2">Helper </a></li>
											<li role="presentation" class="">
												<a href="${pageContext.request.contextPath }/cooper/list.do?listOpt=0" id="profile-tab3">Cooper </a></li>
											<li role="presentation" class="">
												<a href="${pageContext.request.contextPath }/group/list.do?listOpt=0" id="profile-tab4">Group </a></li>
										</ul>





										<div>
											<div class="row">
												<div class="col-md-12 col-sm-12 col-xs-12">
													<div class="x_panel">
														<div class="x_title">
															<h2>Profile & Post</h2>
															<ul class="nav navbar-right panel_toolbox">
																<li><a class="collapse-link"><i
																		class="fa fa-chevron-up"></i></a></li>

																<li><a class="close-link"><i
																		class="fa fa-close"></i></a></li>
															</ul>
															<div class="clearfix"></div>
														</div>
														<div class="x_content">





															<!--profile-->

															<div class="col-md-3 col-sm-3 col-xs-12 profile_left">

																<div id="crop-avatar">
																	<!-- Current avatar -->
																	<img class="img-responsive avatar-view"
																		src="${pageContext.request.contextPath}/resources/img/userImg/${user.picture}"
																		alt="Avatar" title="Change the avatar">
																</div>

																<h3 class="name">${user.userId }</h3>
																<div style="border: 1px solid #fdae84"></div>
																<div class="flex">
																	<span><h4>연결고리</h4></span>
																	<p>${user.connChains }</p>
																</div>
																<div style="border: 1px solid #fdae84"></div>
																<h4>Introduce</h4>
																<p>${user.introduce }</p>

															</div>

															<!--end frofile-->



															<div class="col-md-9 col-sm-9 col-xs-12">

																<div class="" role="tabpanel"
																	data-example-id="togglable-tabs">
																	<ul id="myTab" class="nav nav-tabs bar_tabs"
																		role="tablist" style="background-color: #ecc7c0;">
																		<li role="presentation" class="active"><a
																			href="#tab" id="home-tab" role="tab"
																			data-toggle="tab" aria-expanded="true">전체쪽지</a></li>
																		<li role="presentation" class=""><a
																			href="#content2" role="tab" id="profile-tab"
																			data-toggle="tab" aria-expanded="false">보낸쪽지</a></li>
																		<li role="presentation" class=""><a
																			href="#tab_content3" role="tab" id="profile-tab2"
																			data-toggle="tab" aria-expanded="false">받은쪽지</a></li>
																	</ul>


																	<div class="x_content">
																		<p class="text-muted font-13 m-b-30">Responsive is
																			an extension for DataTables that resolves that
																			problem by optimising the table's layout for
																			different screen sizes through the dynamic insertion
																			and removal of columns from the table.</p>
																		<table id="datatable-responsive"
																			class="table table-striped table-bordered dt-responsive nowrap"
																			cellspacing="0" width="100%">
																			<thead>
																				<tr>
																					<th style="width: 100px; text-align: center;">보낸
																						사람</th>
																					<th style="width: 500px; text-align: center;">내용</th>
																					<th style="width: 100px; text-align: center;">보낸
																						시간</th>
																					<th style="width: 50px; text-align: center;">삭제</th>
																				</tr>
																			</thead>
																			<tbody>
																				<tr>
																					<td>Musimbi</td>
																					<td>hi</td>
																					<td>2016-12-12 11:13</td>
																					<td></td>
																				</tr>
																				<tr>
																					<td>dbsgustlr</td>
																					<td>Responsive is an extension for DataTables
																						that resolves that problem by optimising the
																						table's layout for different screen sizes through
																						the dynamic insertion and removal of columns from
																						the table.</td>
																					<td>2016-12-12 11:14</td>
																					<td></td>
																				</tr>
																				<tr>
																					<td>Musimbi</td>
																					<td>Responsive is an extension for DataTables
																						that resolves that problem by optimising the
																						table's layout for different screen sizes through
																						the dynamic insertion and removal of columns from
																						the table.</td>
																					<td>2016-12-12 11:15</td>
																					<td></td>
																				</tr>
																				<tr>
																					<td>dbsgustlr</td>
																					<td>Responsive is an extension for DataTables
																						that resolves that problem by optimising the
																						table's layout for different screen sizes through
																						the dynamic insertion and removal of columns from
																						the table.</td>
																					<td>2016-12-12 11:16</td>
																					<td></td>
																				</tr>
																				<tr>
																					<td>Musimbi</td>
																					<td>Responsive is an extension for DataTables
																						that resolves that problem by optimising the
																						table's layout for different screen sizes through
																						the dynamic insertion and removal of columns from
																						the table.</td>
																					<td>2016-12-12 11:15</td>
																					<td></td>
																				</tr>
																				<tr>
																					<td>dbsgustlr</td>
																					<td>Responsive is an extension for DataTables
																						that resolves that problem by optimising the
																						table's layout for different screen sizes through
																						the dynamic insertion and removal of columns from
																						the table.</td>
																					<td>2016-12-12 11:16</td>
																					<td></td>
																				</tr>
																				<tr>
																					<td>Musimbi</td>
																					<td>Responsive is an extension for DataTables
																						that resolves that problem by optimising the
																						table's layout for different screen sizes through
																						the dynamic insertion and removal of columns from
																						the table.</td>
																					<td>2016-12-12 11:15</td>
																					<td></td>
																				</tr>
																				<tr>
																					<td>dbsgustlr</td>
																					<td>Responsive is an extension for DataTables
																						that resolves that problem by optimising the
																						table's layout for different screen sizes through
																						the dynamic insertion and removal of columns from
																						the table.</td>
																					<td>2016-12-12 11:16</td>
																					<td></td>
																				</tr>
																				<tr>
																					<td>Musimbi</td>
																					<td>Responsive is an extension for DataTables
																						that resolves that problem by optimising the
																						table's layout for different screen sizes through
																						the dynamic insertion and removal of columns from
																						the table.</td>
																					<td>2016-12-12 11:15</td>
																					<td></td>
																				</tr>
																				<tr>
																					<td>dbsgustlr</td>
																					<td>Responsive is an extension for DataTables
																						that resolves that problem by optimising the
																						table's layout for different screen sizes through
																						the dynamic insertion and removal of columns from
																						the table.</td>
																					<td>2016-12-12 11:16</td>
																					<td></td>
																				</tr>
																				<tr>
																					<td>Musimbi</td>
																					<td>Responsive is an extension for DataTables
																						that resolves that problem by optimising the
																						table's layout for different screen sizes through
																						the dynamic insertion and removal of columns from
																						the table.</td>
																					<td>2016-12-12 11:15</td>
																					<td></td>
																				</tr>
																				<tr>
																					<td>dbsgustlr</td>
																					<td>Responsive is an extension for DataTables
																						that resolves that problem by optimising the
																						table's layout for different screen sizes through
																						the dynamic insertion and removal of columns from
																						the table.</td>
																					<td>2016-12-12 11:16</td>
																					<td></td>
																				</tr>
																				<tr>
																					<td>Musimbi</td>
																					<td>Responsive is an extension for DataTables
																						that resolves that problem by optimising the
																						table's layout for different screen sizes through
																						the dynamic insertion and removal of columns from
																						the table.</td>
																					<td>2016-12-12 11:15</td>
																					<td></td>
																				</tr>
																				<tr>
																					<td>dbsgustlr</td>
																					<td>Responsive is an extension for DataTables
																						that resolves that problem by optimising the
																						table's layout for different screen sizes through
																						the dynamic insertion and removal of columns from
																						the table.</td>
																					<td>2016-12-12 11:16</td>
																					<td></td>
																				</tr>

																			</tbody>
																		</table>

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
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- footer content -->
			<footer>
				<div class="pull-right">
					HUB - Have U get a Bucketlist 2016 by <a href="https://.com">For
						Man</a>
				</div>
				<div class="clearfix"></div>
			</footer>
			<!-- /footer content -->


		</div>
	</div>
	<%@ include file="/views/layout/commonJS.jsp"%>

	<script>
		$(".bucketlistForm").submit(function() {
			var tags = $(this).find(".tags").val();
			tags = tags.split(",");
			$(this).find(".tags").val(tags);

			var star = $(this).find(".changeStar").attr("data-rating");
			$(this).find("#star").val(star);
		});
	</script>

	<script>
		$("#modifyBucketlistForm").submit(function() {
			var memo = $(this).find("[name='memo']").val();
			memo = memo.replace(/\n/gi, " ");
			$(this).find("[name='memo']").val(memo);
		});
	</script>

	<script type="text/javascript">
		var bucketlists = new Array();
		<c:forEach items="${bucketlists}" var="bucketlist">
		var bucketlist = new Array();
		bucketlist.push("${bucketlist.bucketlistId}");
		bucketlist.push("${bucketlist.title}");
		bucketlist.push("${bucketlist.connChains}");
		bucketlist.push("${bucketlist.goal}");
		bucketlist.push("${bucketlist.star}");
		bucketlist.push("${bucketlist.progress}");
		bucketlist.push("${bucketlist.memo}");
		bucketlist.push("${bucketlist.sos}");
		bucketlist.push("${bucketlist.lock}");
		bucketlist.push("${bucketlist.userId}");
		bucketlists.push(bucketlist);
		</c:forEach>

		$("#registerBtn").click(function() {
			$(".tags").importTags("");
			$(".changeStar").starrr();
			$(".changeStar").starrr('setRating', 0);
			$(".changeStar").attr("data-rating", 0);
			$(".changeStar").on('starrr:change', function(e, value) {
				$(this).attr("data-rating", value);
			});
		});

		$("[name=modifyBtn]")
				.click(
						function() {
							var index = $(this).val() - 1;
							$("#modifyBucketlistModal #bucketlistId").val(
									bucketlists[index][0]);
							$("#modifyBucketlistModal #title").val(
									bucketlists[index][1]);
							initConn(bucketlists[index][2]);
							$("#modifyBucketlistModal #goal").val(
									bucketlists[index][3]);
							initStar(bucketlists[index][4]);
							$("#modifyBucketlistModal #progress").val(
									bucketlists[index][5]).trigger("change");
							$("#modifyBucketlistModal #memo").val(
									bucketlists[index][6]);
							$("#modifyBucketlistModal #sos").val(
									bucketlists[index][7]);
							var lock = bucketlists[index][8];
							if (lock == 'true') {
								$('#modifyBucketlistModal #private').attr(
										"checked", true);
							} else {
								$("#modifyBucketlistModal #public").attr(
										"checked", true);
							}
							$("#modifyBucketlistModal #userId").val(
									bucketlists[index][9]);
						});

		function initConn(str) {
			var conn = str;
			conn = conn.replace("[", "");
			conn = conn.replace(/ /gi, "");
			conn = conn.replace("]", "");
			$(".tags").each(function() {
				$(this).importTags(conn);
			});
		};

		function initStar(str) {
			$(".changeStar").each(function() {
				$(this).starrr();
				$(this).starrr('setRating', str);
				$(this).attr("data-rating", str);
				$(this).on('starrr:change', function(e, value) {
					$(this).attr("data-rating", value);
				});
				$("[name='star']").val(str);
			});
		}
	</script>
</body>
</html>