<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Modal -->
<div class="modal fade" id="modifyGroupModal" role="dialog">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">모임방수정</h4>
			</div>
   			<div class="modal-body">
				<form id="modifyGroupForm" action="${pageContext.request.contextPath}/group/modify.do" class="form-horizontal form-label-left groupForm" method="post" enctype="multipart/form-data">
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-3 col-xs-12" for="groupName">모임 이름 <span class="required">*</span></label>
						<div class="col-md-6 col-sm-6 col-xs-8">
							<input type="text" id="groupName" name="groupName" required="required" class="form-control col-md-7 col-xs-12">
						</div>
					</div>
					<div class="form-group">
						<div>
							<label class="control-label col-md-2 col-sm-3 col-xs-12" for="managerId">모임 개설자 <span class="required">*</span></label>
							<div class="col-md-6 col-sm-6 col-xs-8">
								<input type="text" id="managerId" name="managerId" required="required" class="form-control col-md-7 col-xs-12" readonly>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div>
							<label class="control-label col-md-2 col-sm-3 col-xs-12" for="lastDay">모집 마감일 <span class="required">*</span></label>
							<div class="col-md-6 col-sm-6 col-xs-8">
								<input type="date" id="lastDay" name="lastDay" required="required" class="form-control col-md-7 col-xs-12">
							</div>
						</div>
					</div>
					<div class="form-group">
						<div>
							<label class="control-label col-md-2 col-sm-3 col-xs-12" for="local">지역 <span class="required">*</span></label>
							<div class="col-md-6 col-sm-6 col-xs-8">
								<input type="text" id="local" name="local" required="required" class="form-control col-md-7 col-xs-12">
							</div>
						</div>
					</div>
					<div class="form-group">
						<div>
							<label class="control-label col-md-2 col-sm-3 col-xs-12" for="maxPeople">
								최대 인원 <span><small>(현재인원 : <label id="joinPeople"></label>)</small></span></label>
							<div class="col-md-6 col-sm-6 col-xs-8">
								<input type="text" id="maxPeople" name="maxPeople" required="required" class="form-control col-md-7 col-xs-12">
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-3 col-xs-12">연결고리 <span class="required">*</span></label>
						<div class="col-md-6 col-sm-6 col-xs-8">
							<input type="text" id="mgtags" name="connChains" class="tags form-control" />
						</div>
					</div>
					<div class="form-group"></div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-3 col-xs-12" for="introduce">모임방 소개</label>
						<div class="col-md-6 col-sm-6 col-xs-8">
							<textarea class="form-control" rows="3" id="introduce" name="introduce"></textarea>
						</div>
					</div>
					<div class="ln_solid"></div>
					<div class="form-group">
						<div class="col-md-6 col-sm-6 col-xs-8 col-md-offset-4 col-sm-offset-4 col-xs-offset-4">
							<button type="reset" class="btn btn-primary">초기화</button>
							<input type="hidden" id="groupId" name="groupId">
							<button type="submit" class="btn btn-success">수정</button>
						</div>
					</div>
				</form>
			</div>
  		</div>
	</div>
</div>