<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!-- Modal -->
<div class="modal fade" id="modifyUserModal" role="dialog">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">회원수정</h4>
			</div>
   			<div class="modal-body">
				<form id="demo-form2" action="${pageContext.request.contextPath}/user/modify.do" data-parsley-validate class="form-horizontal form-label-left" method="post" enctype="multipart/form-data">
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-3 col-xs-12" for="userId">ID <span class="required">*</span></label>
						<div class="col-md-2 col-sm-3 col-xs-3">
							<input type="text" id="userId" name="userId" readonly="readonly" required="required" value="${user.userId}" class="form-control col-md-7 col-xs-12">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-3 col-xs-12" for="pw">PW <span class="required">*</span></label>
							<div class="col-md-2 col-sm-3 col-xs-3">
								<input type="password" id="pw" name="pw" required="required" class="form-control col-md-7 col-xs-12">
							</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-3 col-xs-12" for="pwCheck">PW Check <span class="required">*</span></label>
							<div class="col-md-2 col-sm-3 col-xs-3">
								<input type="password" id="pwCheck" name="pwCheck" required="required" class="form-control col-md-7 col-xs-12">
							</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-3 col-xs-12" for="email">Email </label>
						<div class="col-md-2 col-sm-3 col-xs-3">
							<input type="text" id="email" name="email" value="${user.email }" class="form-control col-md-7 col-xs-12">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-3 col-xs-12">ConnChains <span class="required">*</span></label>
						<div class="col-md-6 col-sm-6 col-xs-8">
							<input id="mutags" type="text" name="connChains" class="tags form-control" />
						</div>
					</div>
					<div class="form-group"></div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-3 col-xs-12" for="picture">Picture</label>
						<div class="col-md-6 col-sm-6 col-xs-8">
							<button type="button" id="pictureBtn" class="btn btn-primary">사진입력</button>
							<input type="file" name="image" data-role="magic-overlay" data-target="#pictureBtn" data-edit="insertImage"/>
							<img width="10%" height="10%" src="${pageContext.request.contextPath}/resources/img/userImg/${user.picture}">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-3 col-xs-12" for="introduce">Introduce</label>
						<div class="col-md-6 col-sm-6 col-xs-8">
							<textarea class="form-control" rows="3" name="introduce">${user.introduce }</textarea>
						</div>
					</div>
					<div class="ln_solid"></div>
					<div class="form-group">
						<div class="col-md-6 col-sm-6 col-xs-8 col-md-offset-4 col-sm-offset-4 col-xs-offset-4">
							<button type="reset" class="btn btn-primary">초기화</button>
							<button type="submit" class="btn btn-success">수정</button>
						</div>
					</div>
				</form>
			</div>
  		</div>
	</div>
</div>

<script>
	$("form").submit(function() {
		var tags = $("#mutags").val();
		tags = tags.split(",");
		$("#mutags").val(tag);
	});
</script>