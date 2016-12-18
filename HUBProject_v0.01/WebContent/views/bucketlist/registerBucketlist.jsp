<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Modal -->
<div class="modal fade" id="registerBucketlistModal" role="dialog">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">버킷리스트추가</h4>
			</div>
   			<div class="modal-body">
				<form id="registerBucketlistForm" action="${pageContext.request.contextPath}/bucketlist/register.do" class="form-horizontal form-label-left bucketlistForm" method="post" enctype="multipart/form-data">
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-3 col-xs-12" for="title">제목<span>*</span></label>
						<div class="col-md-2 col-sm-3 col-xs-3">
							<input type="text" id="title" name="title" class="form-control col-md-7 col-xs-12">
						</div>
						<p title="titleCheckResult"></p>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-3 col-xs-12" for="lock">잠금</label>
						<div class="col-md-6 col-sm-6 col-xs-8">
							<div style="vertical-align: middle;">
								<input type="radio" id="public" name="lock" value="${true }" checked="checked"><b>공개</b>
								<input type="radio" id="private" name="lock" value="${false }"><b>비공개</b>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-3 col-xs-12" for="goal">목표기간<span>*</span></label>
							<div class="col-md-6 col-sm-6 col-xs-8">
								<input type="text" id="goal" name="goal" placeholder="ex)올해안에, 3년안에..." class="form-control col-md-7 col-xs-12">
								<p title="goalCheckResult"></p>
							</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-3 col-xs-12" for="star">중요도</label>
						<div class="col-md-3 col-sm-3 col-xs-3">
							<input type="hidden" id="star" name="star">
							<div class="starrr changeStar" style="padding-top: 5%;" data-rating="0"></div>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-3 col-xs-12">연결고리<span>*</span></label>
						<div class="col-md-6 col-sm-6 col-xs-8">
							<input id="rbtags" type="text" name="connChains" class="tags form-control" />
						</div>
						<p title="connChainResult"></p>
					</div>
					<div class="form-group"></div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-3 col-xs-12" for="sos">SOS</label>
						<div class="col-md-6 col-sm-6 col-xs-8">
							<textarea class="form-control" rows="3" name="sos" placeholder='도움 받고 싶은 부분을 입력하세요'></textarea>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-3 col-xs-12" for="memo">메모</label>
						<div class="col-md-6 col-sm-6 col-xs-8">
							<textarea class="form-control" rows="12" id="memo" name="memo"></textarea>
						</div>
					</div>
					<div class="ln_solid"></div>
					<div class="form-group">
						<div class="col-md-6 col-sm-6 col-xs-8 col-md-offset-4 col-sm-offset-4 col-xs-offset-4">
							<input type="hidden" name="userId" value="${sessionScope.userId }">
							<button type="submit" class="btn btn-success">등록</button>
							<button type="button" class="btn btn-primary">취소</button>
						</div>
					</div>
				</form>
			</div>
  		</div>
	</div>
</div>