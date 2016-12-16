<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/views/user/modifyUser.jsp"%>

<div class="col-xs-8">
	<div class="x_panel">
		<div class="x_title">
			<h2>
				<b>${user.userId }님의 정보</b>
			</h2>
			<div class="clearfix"></div>
		</div>
		<div class="x_content">
			<br />
			<div class="form-horizontal form-label-left">
				<div class="form-group">
					<label for="picture"
						class="control-label col-md-2 col-sm-3 col-xs-12">프로필사진</label>
					<div class="col-md-6 col-sm-6 col-xs-8">
						<img width="100%"
							src="${pageContext.request.contextPath}/resources/img/userImg/${user.picture}">
					</div>
				</div>
				<div></div>
				<div class="form-group">
					<label class="control-label col-md-2 col-sm-3 col-xs-12"
						for="email">Email</label>
					<div class="col-md-6 col-sm-6 col-xs-8">
						<label id="email" class="control-label">${user.email }</label>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-2 col-sm-3 col-xs-12">연결고리</label>
					<div class="col-md-6 col-sm-6 col-xs-8" id="connForm">
						<c:forEach items="${user.connChains }" var="connChain">
							<label class="control-label">${connChain }</label>
						</c:forEach>
					</div>
				</div>
				<div class="form-group"></div>
				<div class="form-group">
					<label class="control-label col-md-2 col-sm-3 col-xs-12">자기소개</label>
					<div class="col-md-6 col-sm-6 col-xs-8">
						<textarea readonly="readonly" class="form-control" rows="3"
							name="introduce">${user.introduce }</textarea>
					</div>
				</div>
				<div class="ln_solid"></div>
				<div class="form-group">
					<div
						class="col-md-6 col-sm-6 col-xs-8 col-md-offset-4 col-sm-offset-1 col-xs-offset-4">
						<a class="btn btn-primary"
							href="${pageContext.request.contextPath }/user/remove.do?userId=${user.userId}">탈퇴</a>
						<button type="button" id="modifyUserBtn" class="btn btn-success"
							value="${user.userId}" data-toggle="modal"
							data-target="#modifyUserModal">수정</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script
	src="${pageContext.request.contextPath}/resources/vendors/jquery/dist/jquery.min.js"></script>
<script>
	$("#modifyUserBtn").click(function() {
		var conn = "${user.connChains }";
		conn = conn.replace("[", "");
		conn = conn.replace(/ /gi, "");
		conn = conn.replace("]", "");
		$("#mutags").importTags(conn);
	});
</script>
