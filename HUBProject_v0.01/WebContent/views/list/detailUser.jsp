<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%@ include file="/views/post/sendPost.jsp"%>
<!-- modal -->
<!--profile-->

<div class="modal fade" id="detailUserModal" role="dialog">
	<div class="modal-dialog modal-lg">
		<div class="modal-content" style="height: 500px; margin-top: 100px;">

			<div align="center" style="height: 50%;">
				<div style="width: 70%; margin-top: 30px;">

					<div id="crop-avatar">
						<!-- Current avatar -->
						<img class="img-responsive avatar-view" id="picture"
							src="${pageContext.request.contextPath}/resources/img/userImg/${user.picture}"
							alt="Avatar" title="Change the avatar">
					</div>

					<h3 class="name" id="userId"></h3>
					<div style="border: 1px solid #fdae84; width:50%"></div>
					<div class="flex">
						<span><h4>연결고리</h4></span>
						<p class="tags" id="mgtags" name="connChains">${user.connChains }</p>
					</div>
					<div style="border: 1px solid #fdae84; width:50%"></div>
					<h4>Introduce</h4>
					<input id="introduce" value="" readonly></intput>
				</div>
			</div>

			<div align="right">
				<form action="${pageContext.request.contextPath}/follow/request.do" method="post">
						<button class="btn btn-xs btn-default btn-block" type="submit"
						style="border:hidden; background:#ecc7c0; font-size:14px; width:100px;">팔로우신청</button>
						<input type="hidden" name="userId"  value="${sessionScope.userId }">
						<input type="hidden" name="followId" id="userId" value="${user.userId }">
						<input type="hidden" name="relation" id="listOpt" value="${listOpt }">
				</form>
					<button class="btn btn-xs btn-default btn-block" type="button" data-toggle="modal" data-target="#sendPostModal"
						style="border:hidden; background:#ecc7c0; font-size:14px; width:100px;">쪽지전송</button>
				
			</div>
			<!--end frofile-->
		</div>
	</div>
</div>


