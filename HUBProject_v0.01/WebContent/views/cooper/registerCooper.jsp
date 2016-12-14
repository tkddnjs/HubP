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
   			<div class="modal-body">
				<form id="demo-form2" action="${pageContext.request.contextPath}/cooper/register.do" data-parsley-validate class="form-horizontal form-label-left cooperForm" method="post" enctype="multipart/form-data">
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-3 col-xs-12" for="coName">CooperName <span class="required">*</span></label>
						<div class="col-md-2 col-sm-3 col-xs-3">
							<input type="text" id="coName" name="coName" required="required" class="form-control col-md-7 col-xs-12">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-3 col-xs-12" for="lastDay">LastDay <span class="required">*</span></label>
							<div class="col-md-3 col-sm-3 col-xs-3">
								<input type="date" id="lastDay" name="lastDay" required="required" class="form-control col-md-7 col-xs-12">
							</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-3 col-xs-12">ConnChains <span class="required">*</span></label>
						<div class="col-md-6 col-sm-6 col-xs-8">
							<input id="rctags" type="text" name="connChains" required="required" class="tags form-control" />
						</div>
					</div>
					<div class="form-group"></div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-3 col-xs-12" for="coBanner">CooperBanner </label>
						<div class="col-md-2 col-sm-3 col-xs-3">
							<input type="text" id="coBanner" name="coBanner" placeholder="업체 url 입력" class="form-control col-md-7 col-xs-12">
						</div>
					</div>
					<div class="ln_solid"></div>
					<div class="form-group">
						<div class="col-md-6 col-sm-6 col-xs-8 col-md-offset-4 col-sm-offset-4 col-xs-offset-4">
							<button type="reset" class="btn btn-primary">초기화</button>
							<button type="submit" class="btn btn-success">등록</button>
						</div>
					</div>
				</form>
			</div>
  		</div>
	</div>
</div>