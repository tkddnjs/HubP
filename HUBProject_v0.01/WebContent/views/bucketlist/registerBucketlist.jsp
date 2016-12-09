<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
	.ui-autocomplete{
		z-index: 99999;
	}
</style>

<!-- Modal -->
<div class="modal fade" id="registerBucketlistModal" role="dialog">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">버킷리스트추가</h4>
			</div>
   			<div class="modal-body">
				<form id="registerBucketlistForm" action="${pageContext.request.contextPath}/bucketlist/register.do" data-parsley-validate class="form-horizontal form-label-left" method="post" enctype="multipart/form-data">
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-3 col-xs-12" for="title">Title <span class="required">*</span></label>
						<div class="col-md-2 col-sm-3 col-xs-3">
							<input type="text" id="title" name="title" required="required" class="form-control col-md-7 col-xs-12">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-3 col-xs-12" for="lock">Lock</label>
						<div class="col-md-6 col-sm-6 col-xs-8">
							<div style="vertical-align: middle;">
								<input type="radio" id="public" name="lock" value="${true }"><b>공개</b>
								<input type="radio" id="private" name="lock" value="${false }"><b>비공개</b>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-3 col-xs-12" for="goal">Goal <span class="required">*</span></label>
							<div class="col-md-2 col-sm-3 col-xs-3">
								<input type="text" id="goal" name="goal" placeholder="목표기간을 입력하세요(ex. 올해안에, 3년안에...)" required="required" class="form-control col-md-7 col-xs-12">
							</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-3 col-xs-12" for="star">Star　</label>
						<div class="col-md-3 col-sm-3 col-xs-3">
							<input type="hidden" id="star" name="star">
							<div class="starrr changeStar" style="padding-top: 5%;" data-rating="0"></div>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-3 col-xs-12">ConnChains <span class="required">*</span></label>
						<div class="col-md-6 col-sm-6 col-xs-8">
							<input id="rbtags" type="text" name="connChains" class="tags form-control" />
						</div>
					</div>
					<div class="form-group"></div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-3 col-xs-12" for="sos">SOS</label>
						<div class="col-md-6 col-sm-6 col-xs-8">
							<textarea class="form-control" rows="3" name="sos" placeholder='도움 받고 싶은 부분을 입력하세요'></textarea>
						</div>
					</div>
					<div class="ln_solid"></div>
					<div class="form-group">
						<div class="col-md-6 col-sm-6 col-xs-8 col-md-offset-4 col-sm-offset-4 col-xs-offset-4">
							<button type="reset" class="btn btn-primary">초기화</button>
							<input type="hidden" name="userId" value="${sessionScope.userId }">
							<button type="submit" class="btn btn-success">등록</button>
						</div>
					</div>
				</form>
			</div>
  		</div>
	</div>
</div>