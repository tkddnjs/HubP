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
						<label class="control-label col-md-2 col-sm-3 col-xs-12" for="groupName">GroupName <span class="required">*</span></label>
						<div class="col-md-6 col-sm-6 col-xs-8">
							<input type="text" id="groupName" name="groupName" required="required" class="form-control col-md-7 col-xs-12">
						</div>
					</div>
					<div class="form-group">
						<div>
							<label class="control-label col-md-2 col-sm-3 col-xs-12" for="managerId">ManagerId <span class="required">*</span></label>
							<div class="col-md-6 col-sm-6 col-xs-8">
								<input type="text" id="managerId" name="managerId" required="required" class="form-control col-md-7 col-xs-12">
							</div>
						</div>
					</div>
					<div class="form-group">
						<div>
							<label class="control-label col-md-2 col-sm-3 col-xs-12" for="lastDay">LastDay <span class="required">*</span></label>
							<div class="col-md-6 col-sm-6 col-xs-8">
								<input type="date" id="lastDay" name="lastDay" required="required" class="form-control col-md-7 col-xs-12">
							</div>
						</div>
					</div>
					<div class="form-group">
						<div>
							<label class="control-label col-md-2 col-sm-3 col-xs-12" for="local">Local <span class="required">*</span></label>
							<div class="col-md-6 col-sm-6 col-xs-8">
								<input type="text" id="local" name="local" required="required" class="form-control col-md-7 col-xs-12">
							</div>
						</div>
					</div>
					<div class="form-group">
						<div>
							<label class="control-label col-md-2 col-sm-3 col-xs-12" for="maxPeople">maxPeople <span class="required">*</span></label>
							<div class="col-md-6 col-sm-6 col-xs-8">
								<input type="text" id="maxPeople" name="maxPeople" required="required" class="form-control col-md-7 col-xs-12">
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-3 col-xs-12">ConnChains <span class="required">*</span></label>
						<div class="col-md-6 col-sm-6 col-xs-8">
							<input type="text" id="mgtags" name="connChains" class="tags form-control" />
						</div>
					</div>
					<div class="form-group"></div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-3 col-xs-12" for="introduce">Introduce</label>
						<div class="col-md-6 col-sm-6 col-xs-8">
							<textarea class="form-control" rows="3" id="introduce" name="introduce"></textarea>
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