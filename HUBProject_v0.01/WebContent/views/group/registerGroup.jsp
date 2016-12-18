<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Modal -->
<div class="modal fade" id="registerGroupModal" role="dialog">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">모임방등록</h4>
			</div>
   			<div class="modal-body">
				<form id="registerGroupForm" action="${pageContext.request.contextPath}/group/register.do" class="form-horizontal form-label-left groupForm" method="post" enctype="multipart/form-data">
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-3 col-xs-12" for="groupName">모임방 이름 <span>*</span></label>
						<div class="col-md-6 col-sm-6 col-xs-8">
							<input type="text" id="groupName" name="groupName" class="form-control col-md-7 col-xs-12">
						</div>
						<p title="groupNameResult"></p>
					</div>
					<div class="form-group">
						<div>
							<label class="control-label col-md-2 col-sm-3 col-xs-12" for="managerId">모임 개설자 </label>
							<div class="col-md-6 col-sm-6 col-xs-8">
								<input type="text" id="managerId" name="managerId" class="form-control col-md-7 col-xs-12" value="${sessionScope.userId }" readonly>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div>
							<label class="control-label col-md-2 col-sm-3 col-xs-12" for="lastDay">모집 마감일 <span>*</span></label>
							<div class="col-md-6 col-sm-6 col-xs-8">
								<input type="date" id="lastDay" name="lastDay" class="form-control col-md-7 col-xs-12">
							</div>
							<p title="lastDayResult"></p>
						</div>
					</div>
					<div class="form-group">
						<div>
							<label class="control-label col-md-2 col-sm-3 col-xs-12" for="local">지역 <span>*</span></label>
							<div class="col-md-6 col-sm-6 col-xs-8">
								<input type="text" id="local" name="local" class="form-control col-md-7 col-xs-12">
							</div>
						</div>
						<p title="localResult"></p>
					</div>
					<div class="form-group">
						<div>
							<label class="control-label col-md-2 col-sm-3 col-xs-12" for="maxPeople">최대인원 <span>*</span></label>
							<div class="col-md-6 col-sm-6 col-xs-8">
								<input type="number" id="maxPeople" name="maxPeople" class="form-control col-md-7 col-xs-12">
							</div>
						</div>
						<p title="maxPeopleResult"></p>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-3 col-xs-12">연결고리 <span>*</span></label>
						<div class="col-md-6 col-sm-6 col-xs-8">
							<input type="text" id="mgtags" name="connChains" class="tags form-control" />
						</div>
						<p title="connChainResult"></p>
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
							<button type="submit" class="btn btn-success">등록</button>
							<button type="reset" class="btn btn-primary">취소</button>
						</div>
					</div>
				</form>
			</div>
  		</div>
	</div>
</div>