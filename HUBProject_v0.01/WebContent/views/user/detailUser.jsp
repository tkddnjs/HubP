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
						<button type="button" id="modifyUserBtn" class="btn btn-success"
							value="${user.userId}" data-toggle="modal"
							data-target="#modifyUserModal">수정</button>
						<button type="button" id="deleteUserBtn" class="btn btn-primary"
								data-toggle="modal" data-target="#deleteUserModal">탈퇴</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="deleteUserModal" role="dialog" style="margin-top: 20%;">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">회원탈퇴</h4>
			</div>
   			<div class="modal-body" style="text-align: center;">
				<form action="${pageContext.request.contextPath}/user/remove.do" id="deleteUserForm" method="get">
					<h4>탈퇴하시겠습니까?</h4><br>
					<button type="submit" class="btn btn-success" name="userId" value="${user.userId }">탈퇴</button>
					<button type="button" class="btn btn-primary">취소</button>
				</form>
			</div>
  		</div>
	</div>
</div>
