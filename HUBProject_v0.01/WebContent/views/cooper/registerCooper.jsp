<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Modal -->
<div class="modal fade" id="registerCooperModal" role="dialog">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">업체등록</h4>
			</div>
   			<div class="modal-body" >
				<form id="demo-form2" action="${pageContext.request.contextPath}/cooper/register.do" data-parsley-validate class="form-horizontal form-label-left cooperForm" method="post" enctype="multipart/form-data">
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-3 col-xs-12" for="coName">업체이름 <span>*</span></label>
						<div class="col-md-3 col-sm-3 col-xs-4">
							<input type="text" id="coName" name="coName" class="form-control col-md-7 col-xs-12">
						</div>
						<p title="coNameCheckResult"></p>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-3 col-xs-12" for="lastDay">만료일자 <span>*</span></label>
						<div class="col-md-3 col-sm-3 col-xs-4">
							<input type="date" id="lastDay" name="lastDay" class="form-control col-md-7 col-xs-12">
						</div>
						<p title="lastDayCheckResult"></p>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-3 col-xs-12">연결고리 <span>*</span></label>
						<div class="col-md-6 col-sm-6 col-xs-8">
							<input id="rctags" type="text" name="connChains" class="tags form-control" />
						</div>
						<p title="connChainResult"></p>
					</div>
					<div class="form-group"></div>
					<div class="cursor form-group">
						<label class="control-label col-md-2 col-sm-3 col-xs-12">배너 이미지 </label>
						<span>
			    			<button type="button" class="removeImageBtn" id="removeBtn" style="font-size: 15px; background: none !important; border: none; display: none;"><i class="fa fa-close"></i></button>
			    		</span>
			    		<div class="col-md-6 col-sm-6 col-xs-8">
			        		<input class="image cooperFile" type="file" name="cma_file" id="cma_file" accept="image/*" style="display: none;" />
			        		<img id="cma_image" class="cooperImage" style="width:100%; height:300px;max-width:100%;border:1px solid #000;" src="${pageContext.request.contextPath}/resources/img/cooperImg/default.png">
			        	</div>
			    	</div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-3 col-xs-12" for="coBanner">업체url <span>*</span></label>
						<div class="col-md-6 col-sm-6 col-xs-8">
							<input type="text" id="coBanner" name="coBanner" placeholder="업체 url 입력" class="form-control col-md-7 col-xs-12">
						</div>
						<p title="coBannerResult"></p>
					</div>
					<div class="ln_solid"></div>
					<div class="form-group">
						<div class="col-md-6 col-sm-6 col-xs-8 col-md-offset-4 col-sm-offset-4 col-xs-offset-4">
							<input type="hidden" id="changed" name="changed">
							<button type="submit" class="btn btn-success">등록</button>
							<button type="button" class="btn btn-primary">취소</button>
						</div>
					</div>
				</form>
			</div>
  		</div>
	</div>
</div>
