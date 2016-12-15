<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/views/post/sendPost.jsp"%>

<!-- Modal -->
<div class="modal fade" id="detailUserModal" role="dialog">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">회원상세</h4>
			</div>
			<div class="modal-body">
				<div class="form-horizontal form-label-left groupForm">
					<div id="crop-avatar">
						<img class="img-responsive avatar-view" id="picture" alt="Avatar" title="Change the avatar">
					</div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-3 col-xs-12" for="userId">ID </label>
						<div class="col-md-6 col-sm-6 col-xs-8">
							<label class="form-control col-md-7 col-xs-12" id="userId"></label>
							<input id="followId" type="hidden">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-3 col-xs-12">연결고리 </label>
						<div class="col-md-6 col-sm-6 col-xs-8">
							<label id="dutags" class="tags form-control"></label>
						</div>
					</div>
					<div class="form-group"></div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-3 col-xs-12" for="introduce">자기소개</label>
						<div class="col-md-6 col-sm-6 col-xs-8">
							<label id="introduce" class="form-control"></label>
						</div>
					</div>
					<div class="ln_solid"></div>
					<div class="form-group" align="right">
						<button class="btn btn-xs btn-default btn-block" type="button" id="requestButton"
								style="border: hidden; background: #ecc7c0; font-size: 14px; width: 100px;">팔로우요청</button>
						<button class="btn btn-xs btn-default btn-block sendPostBtn" type="button" data-toggle="modal" data-target="#sendPostModal"
								style="border: hidden; background: #ecc7c0; font-size: 14px; width: 100px;">쪽지전송</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
