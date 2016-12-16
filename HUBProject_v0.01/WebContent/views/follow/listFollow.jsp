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
<script src="${pageContext.request.contextPath}/resources/vendors/jquery/dist/jquery.min.js"></script>
<script>
	var userId = '${sessionScope.userId}';
	var follows = new Array();
	$(document).ready(function() {
		
		function ajaxFollow() {
			return $.ajax({
				type : 'GET',
				url : '${pageContext.request.contextPath}/follow/listAll.do',
				data : {
					userId : userId
				},
				success : function(result) {
					result = result.replace(/ /gi, "");
					result = result.replace("[", "");
					result = result.replace("]", "");
					result = result.split(',');
					listFollow(result);
				}
			});
		}

		$.when(ajaxFollow()).done(function(){
			appendConfirm($("#requestedFollow"));
			appendFollow($("#giveHelp"), 1);
			appendFollow($("#receiveHelp"), 2);
			appendFollow($("#bothHelp"), 3);
			appendFollow($("#groupFollow"), 4);
			$(".sendPostBtn").click(function (){
				var followId = $(this).val();
				$("#sendPostModal #receiverId").val(followId);
			});
		});
	});
	
	function listFollow(array) {
		for (var i = 0; i < array.length; i++) {
			array[i] = array[i].replace("(", "");
			array[i] = array[i].replace(")", "");
			array[i] = array[i].split("/");
			follows.push(array[i]);
		};
	};
	
	function appendConfirm(selector){
		for(var i = 0; i < follows.length; i++){
			if(follows[i][3] == 'false'){
				selector.append(
					'<li class="sub_menu" style="height: 70px;">'
					+'<form action="${pageContext.request.contextPath}/user/detail.do" method="get">'
					+	'<input type="hidden" name="myId" value="' + follows[i] + '">'
					+	'<input type="hidden" name="userId" value="' + follows[i][1] + '">'
					+	'<button class="btn btn-xs btn-default btn-block" type="submit"'
					+	'style="border: hidden; font-size: 15px; background: none !important;">' + follows[i][1] + '</button>'
					+'</form>'
					+'<form action="${pageContext.request.contextPath}/follow/confirm.do" method="post" style="display: block; float: left; width: 60px;">'
					+		'<input type="hidden" name="followId" value="' + follows[i][1] + '">'
					+		'<input type="hidden" name="userId" value="' + follows[i][0] + '">'
					+		'<button type="submit" class="fa fa-plus-square" style="width: 60px; font-size: 16px; background: none !important; border: none;">수락</button>'
					+'</form>'
					+'<form action="${pageContext.request.contextPath}/follow/remove.do" method="post" style="display: block; margin-right: 50px; float: right; width: 60px;">'
					+		'<input type="hidden" name="followId" value="' + follows[i][1] + '">'
					+		'<input type="hidden" name="userId" value="' + follows[i][0] + '">'
					+		'<button type="submit" class="fa fa-minus-square" style="width: 60px; font-size: 16px; background: none !important; border: none;">거절</button>'
					+'</form>'
					+'</li>'
				);
			};
		};
	};
	
	function appendFollow(selector, opt){
		for(var i=0; i<follows.length; i++){
			if(follows[i][3] == 'true' && follows[i][2] == opt){
				selector.append(
					'<li class="sub_menu">'
					+'<button type="button" data-toggle="modal" data-target="#sendPostModal" class="fa fa-envelope-o sendPostBtn" value="' + follows[i][1] + '"'
					+'style="border: hidden; background:none !important; width:30px; float:right">'
					+'</button>'
					+'	<form action="${pageContext.request.contextPath}/user/detail.do" method="get">'
					+'		<input type="hidden" name="myId" value="' + userId + '"> '
					+'		<input type="hidden" name="userId" value="' + follows[i][1] + '">'
					+'		<button class="btn btn-xs btn-default btn-block" type="submit"'
					+'		 style="border: hidden; font-size: 15px; background: none !important; width:50px; float:left">' + follows[i][1] + '</button>'
					+'	</form>'
					+'</li>'
				);
			}
		}
	}
	
	$(".sendPostBtn").click( function() {
		var followId = $(this).val();
		$("#sendPostModal #receiverId").val(followId);
		$("#sendPostModal #sendPostBtn").val(followId);
		
	});
	
	
</script>
