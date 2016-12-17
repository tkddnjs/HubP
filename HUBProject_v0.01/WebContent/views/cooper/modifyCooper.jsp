<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
.img-cooper img {
	whdth: 100%;
	height: 300px;
}
.image {
    width: auto; height: auto;
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
.insert-image{
	display: inline-block;
	margin-left: 3em;
}
.img-cooper {
	margin-right: 0;
	margin-left: 0;
}
.form-group {
	width: 80%;
}
</style>

<!-- Modal -->
<div class="modal fade" id="modifyCooperModal" role="dialog">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">업체수정</h4>
			</div>
   			<div class="modal-body">
				<form id="demo-form2" action="${pageContext.request.contextPath}/cooper/modify.do" data-parsley-validate class="form-horizontal form-label-left cooperForm modify" method="post" enctype="multipart/form-data">
					<div class="img-cooper cooper cursor" align="center" style="width: 50%">
			    		<span>사진 업로드
			    		<button type="button" class="removeImageBtn" id="removeBtn" style="display: none;">X</button>
			    		</span>
			        	<input class="image cooperFile" type="file" name="cmb_file" id="cmb_file" accept="image/*" capture="camera" style="display: none;" />
			        	<img id="cmb_image" class="cooperImage" style="width:100%; height:300px;max-width:100%;border:1px solid #000;" src="${pageContext.request.contextPath}/resources/img/cooperImg/default.png">
			    	</div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-3 col-xs-12" for="coName">CooperName <span class="required">*</span></label>
						<div class="col-md-2 col-sm-3 col-xs-3">
							<input type="text" id="coName" name="coName" required="required" class="form-control col-md-7 col-xs-12">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-3 col-xs-12" for="lastDay">LastDay <span class="required">*</span></label>
							<div class="col-md-3 col-sm-3 col-xs-4">
								<input type="date" id="lastDay" name="lastDay" required="required" class="form-control col-md-7 col-xs-12">
							</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-3 col-xs-12">ConnChains <span class="required">*</span></label>
						<div class="col-md-6 col-sm-6 col-xs-8">
							<input type="text" id="mctags" name="connChains" class="tags form-control" />
						</div>
					</div>
					<div class="form-group"></div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-3 col-xs-12" for="coBanner">CooperBanner </label>
						<div class="col-md-2 col-sm-3 col-xs-5">
							<input type="text" id="coBanner" name="coBanner" class="form-control col-md-7 col-xs-12">
						</div>
					</div>
					
<!-- 					<div class="form-group">
						<label class="control-label col-md-2 col-sm-3 col-xs-12" for="picture">Picture</label>
						<div class="col-md-6 col-sm-6 col-xs-8">
							<button type="button" id="pictureBtn" class="btn btn-primary">사진입력</button>
							<input type="file" name="image" data-role="magic-overlay" data-target="#pictureBtn" data-edit="insertImage"/>
							<img width="10%" height="10%" src="${pageContext.request.contextPath}/resources/img/userImg/${user.picture}">
						</div>
					</div> -->
					<div class="ln_solid"></div>
					<div class="form-group">
						<div class="col-md-6 col-sm-6 col-xs-8 col-md-offset-4 col-sm-offset-4 col-xs-offset-4">
							<button type="reset" class="btn btn-primary">초기화</button>
							<input type="hidden" id="coId" name="coId">
							<input type="hidden" id="changed" name="changed">
							<button type="submit" class="btn btn-success">수정</button>
						</div>
					</div>
				</form>
			</div>
  		</div>
	</div>
</div>