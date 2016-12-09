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
		$(".bucketlistForm").submit(function(){
			var tags = $(this).find(".tags").val();
			tags = tags.split(",");
			$(this).find(".tags").val(tags);
			
			var star = $(this).find(".changeStar").attr("data-rating");
			$(this).find("#star").val(star);	
			
		});
	</script>
	
	<script>
		$("#modifyBucketlistForm").submit(function(){
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
			$(".changeStar").starrr("setRating", 0)
		});

		$("[name=modifyBtn]").click(function(){
			var index = $(this).val() - 1;
			$("#modifyBucketlistModal #bucketlistId").val(bucketlists[index][0]);
			$("#modifyBucketlistModal #title").val(bucketlists[index][1]);
			initConn(bucketlists[index][2]);
			$("#modifyBucketlistModal #goal").val(bucketlists[index][3]);
			initStar(bucketlists[index][4]);
			$("#modifyBucketlistModal #progress").val(bucketlists[index][5]).trigger("change");
	    	$("#modifyBucketlistModal #memo").val(bucketlists[index][6]);
			$("#modifyBucketlistModal #sos").val(bucketlists[index][7]);
			var lock = bucketlists[index][8];
			if(lock == 'true'){
				$('#modifyBucketlistModal #private').attr("checked", true);
			} else {
				$("#modifyBucketlistModal #public").attr("checked", true);
			}
	    	$("#modifyBucketlistModal #userId").val(bucketlists[index][9]);
		});

		function initConn(str){
			var conn = str;
			conn = conn.replace("[","");
			conn = conn.replace(/ /gi,"");
			conn = conn.replace("]","");
			$(".tags").each(function(){
				$(this).importTags(conn);
			});
		};

		function initStar(str){
			$(".changeStar").each(function(){
				$(this).starrr();
				$(this).starrr('setRating', str);
				$(this).attr("data-rating", str);
				$(this).on('starrr:change', function(e, value){
					$(this).attr("data-rating", value);
				});
				$("[name='star']").val(str);
			});
		}
	</script>
</body>
</html>