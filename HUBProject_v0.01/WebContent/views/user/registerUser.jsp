<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Modal -->
<div class="modal fade" id="registerUserModal" role="dialog"
	style="height: 120%;">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">회원가입</h4>
			</div>
			<div class="modal-body">
				<form id="registerUserForm"
					action="${pageContext.request.contextPath}/user/register.do"
					class="form-horizontal form-label-left" method="post"
					enctype="multipart/form-data">
					<div class="cursor form-group">
						<label class="control-label col-md-2 col-sm-3 col-xs-12">프로필
							사진</label> <span>
							<button type="button" class="removeBtn" id="removeBtn"
								style="font-size: 15px; background: none !important; border: none; display: none;">
								<i class="fa fa-close"></i>
							</button>
						</span>
						<div class="col-md-6 col-sm-6 col-xs-8">
							<input type="file" name="image" class="image" id="user_file"
								accept="image/*" style="display: none;"
								value="${pageContext.request.contextPath}/resources/img/userImg/default.png" />
							<img id="user_image"
								style="width: 100%; height: 300px; max-width: 100%; border: 1px solid #000;"
								src="${pageContext.request.contextPath}/resources/img/userImg/default.png">
						</div>
					</div>
					<div class="form-group">
						<div class="form-group">
							<label class="control-label col-md-2 col-sm-3 col-xs-3"
								for="userId"> ID <span>*</span>
							</label>
							<div class="col-md-4 col-sm-3 col-xs-3">
								<input type="text" id="userId" name="userId"
									class="form-control col-md-1 col-xs-12">
							</div>
							<p id="idCheckResult"></p>
						</div>
						<div class="form-group">
							<label class="control-label col-md-2 col-sm-3 col-xs-3"
								for="password">비밀번호 <span>*</span></label>
							<div class="col-md-4 col-sm-3 col-xs-3">
								<input type="password" id="pw" name="pw"
									class="form-control col-md-7 col-xs-12">
							</div>
							<p id="pwResult"></p>
						</div>
						<div class="form-group">
							<label class="control-label col-md-2 col-sm-3 col-xs-3"
								for="password_check">비밀번호 확인 <span>*</span></label>
							<div class="col-md-4 col-sm-3 col-xs-3">
								<input type="password" id="pwCheck"
									class="form-control col-md-7 col-xs-12">
							</div>
							<p id="pwCheckResult"></p>
						</div>
						<div class="form-group">
							<label class="control-label col-md-2 col-sm-3 col-xs-3"
								for="email">Email<span>*</span></label>
							<div class="col-md-4 col-sm-4 col-xs-5">
								<input id="email" class="form-control col-md-7 col-xs-12"
									type="text" name="email">
							</div>
							<p id="emailCheckResult"></p>
						</div>
						<div class="form-group">
							<label class="control-label col-md-2 col-sm-3 col-xs-12">연결고리<span>*</span></label>
							<div class="col-md-4 col-sm-6 col-xs-8">
								<input id="rutags" type="text" name="connChains"
									class="tags form-control" />
							</div>
							<p id="connChainResult"></p>
						</div>
						<div class="form-group" style="margin-bottom: 10px">
							<label class="control-label col-md-2 col-sm-3 col-xs-12">자기소개</label>
							<div class="col-md-4 col-sm-6 col-xs-8">
								<textarea class="form-control" rows="3" name="introduce"
									placeholder='자기 소개 입력'></textarea>
							</div>
						</div>
					</div>

					<div class="ln_solid"></div>
					<div class="form-group">
						<div align="center">
							<input type="hidden" id="changed" name="changed">
							<button type="submit" class="btn btn-success">가입</button>
							<button type="reset" class="btn btn-primary">취소</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
