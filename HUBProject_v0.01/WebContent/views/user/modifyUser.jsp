<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.img-cooper img {
	whdth: 100%;
	height: 300px;
}

.image {
	width: auto;
	height: auto;
	max-width: 100px;
	max-height: 100px;
}

.cursor {
	cursor: pointer;
}

.insert {
	margin-right: 0;
	margin-left: 0;
}

.insert-image {
	display: inline-block;
	margin-left: 3em;
}

.img-cooper {
	margin-right: 0;
	margin-left: 0;
}
</style>

<!-- Modal -->
<div class="modal fade" id="modifyUserModal" role="dialog">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">회원수정</h4>
			</div>
   			<div class="modal-body">
				<form id="modifyUserForm" action="${pageContext.request.contextPath}/user/modify.do" data-parsley-validate class="form-horizontal form-label-left" method="post" enctype="multipart/form-data">
					<div class="form-group">
						<div class="img-cooper cooper cursor" style="width: 50%; float:right;">
							<label for="user_file"
								class="control-label col-md-4 col-sm-3 col-xs-3">프로필 사진</label>
							<div class="col-md-6 col-sm-6 col-xs-8">
								<img id="user_image" style="width: 100%; height: 300px; max-width: 100%; border: 1px solid #000;"
									src="${pageContext.request.contextPath}/resources/img/userImg/${user.picture }">
								<input type="file" name="image" class="image" id="user_file" accept="image/*" style="display: none;" value="${pageContext.request.contextPath}/resources/img/userImg/${user.picture }"/>
								<button type="button" class="removeBtn" style="display: none;">X</button>
							</div>
						</div>
						<div>
							<div style="height: 40px;">
								<label class="control-label col-md-2 col-sm-3 col-xs-3" for="userId">ID <span class="required">*</span></label>
								<div class="col-md-4 col-sm-3 col-xs-3">
									<input type="text" id="userId" name="userId" readonly="readonly" value="${user.userId }"
										required="required" class="form-control col-md-7 col-xs-12">
								</div>
							</div>
							<div style="height: 40px;">
								<label class="control-label col-md-2 col-sm-3 col-xs-3"
									for="password">비밀번호 <span class="required">*</span></label>
								<div class="col-md-4 col-sm-3 col-xs-3">
									<input type="password" id="pw" name="pw" required="required"
										class="form-control col-md-7 col-xs-12">
								</div>
							</div>
							<div style="height: 40px;">
								<label class="control-label col-md-2 col-sm-3 col-xs-3" for="password_check">비밀번호 확인 <span class="required">*</span></label>
								<div class="col-md-4 col-sm-3 col-xs-3">
									<input type="password" id="pw_check"
										class="form-control col-md-7 col-xs-12">
								</div>
							</div>
							<div style="height: 40px;">
								<label class="control-label col-md-2 col-sm-3 col-xs-3"
									for="email">Email<span class="required">*</span></label>
								<div class="col-md-4 col-sm-4 col-xs-5">
									<input id="email" class="form-control col-md-7 col-xs-12" value="${user.email }" type="text" name="email">
								</div>
							</div>
							<div style="height: 105px;">
								<label class="control-label col-md-2 col-sm-3 col-xs-12">연결고리<span
									class="required">*</span></label>
								<div class="col-md-4 col-sm-6 col-xs-8">
									<input id="mutags" type="text" name="connChains" class="tags form-control"/>
								</div>
							</div>
							<div style="margin-bottom: 10px" >
								<label class="control-label col-md-2 col-sm-3 col-xs-12">자기소개</label>
								<div class="col-md-4 col-sm-6 col-xs-8">
									<textarea class="form-control" rows="3" name="introduce"
										placeholder='자기 소개 입력'>${user.introduce }</textarea>
								</div>
							</div>
						</div>
					</div>
					<div class="ln_solid"></div>
					<div class="form-group">
						<div class="col-md-7 col-sm-6 col-xs-8 col-md-offset-3 col-sm-offset-3 col-xs-offset-3" align="center">
							<input type="hidden" id="changed" name="changed">
							<button type="reset" class="btn btn-primary">Cancel</button>
							<button type="submit" class="btn btn-success">Submit</button>
						</div>
					</div>
				</form>
			</div>
  		</div>
	</div>
</div>
<script src="${pageContext.request.contextPath}/resources/vendors/jquery/dist/jquery.min.js"></script>
<!-- /jQuery Tags Input -->
<script type="text/javascript">
	var defaultImgURL = '${pageContext.request.contextPath}/resources/img/userImg/default.png';
	var changed = 'no';
	/* 이미지 업로드 미리보기 */
	function getThumbnailPrivew(html, $target) {
		if (html.files && html.files[0]) {
			var reader = new FileReader();
			reader.onload = function (e) {
				$target.attr('src', e.target.result);
				$('#removeBtn').show();
			}
        	reader.readAsDataURL(html.files[0]);
    	}
	}

	$('#user_image').on('click', function() {
		$('#user_file').click();
	});

	$('#addImageBtn').on('click', function() {
		$('#user_file').click();
	});

	$('#user_file').on('change', function(e) {
		changed = 'yes';
		getThumbnailPrivew(this, $('#user_image'));
	});
                            
	$('#registerUserModal .removeBtn').on('click', function() {
		$('#user_image').attr('src', defaultImgURL);
		$(this).hide();
	});
	
	$("#modifyUserForm").submit(function() {
		var tags = $("#mutags").val();
		tags = tags.split(",");
		$("#mutags").val(tags);
		alert(changed);
		$(this).find("#changed").val(changed);
	});
</script>