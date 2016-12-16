<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.post {
	z-index: 99999;
}
</style>

<!-- Modal -->
<div class="modal fade" id="sendPostModal" role="dialog" data-backdrop="static">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">쪽지전송</h4>
			</div>
			
			<div class="modal-body">
			<div class="form-horizontal form-label-left bucketlistForm">
				<div class="form-group">
					<label class="control-label col-md-2 col-sm-3 col-xs-12"
						for="senderId">보내는사람</label>
					<div class="col-md-2 col-sm-3 col-xs-3" style="float: left;">
						<input type="text" id="senderId" name="senderId"
							value="${sessionScope.userId }" required="required"
							class="form-control col-md-7 col-xs-12" readonly>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-2 col-sm-3 col-xs-12">쪽지내용</label>
					<div class="col-md-6 col-sm-6 col-xs-8">
						<textarea name="content" required="required" class="form-control"
							rows="3" placeholder="쪽지내용입력"></textarea>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-2 col-sm-3 col-xs-12"
						for="receiverId">받는사람<span class="required">*</span></label>
					<div class="col-md-3 col-sm-4 col-xs-5">
						<input type="text" id="receiverId" required="required"
							name="receiverId" class="form-control col-md-7 col-xs-12"
							readonly>
					</div>
				</div>
				<div class="ln_solid"></div>
				<div class="form-group">
					<div class="col-md-6 col-sm-6 col-xs-8 col-md-offset-4 col-sm-offset-4 col-xs-offset-4">
						<button type="button" id="sendPostBtn" class="btn btn-success">전송</button>
					</div>
				</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script src="${pageContext.request.contextPath}/resources/vendors/jquery/dist/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" type="text/javascript"></script>

<script>
	$("#sendPostBtn").click(function() {
		var senderId = '${sessionScope.userId}';
		var receiverId = $(this).val();
		var content = $(this).closest("#sendPostModal").find('[name="content"]').val();
		$.ajax({
			type : 'POST',
			url : '${pageContext.request.contextPath}/post/send.do',
			data : {
				senderId : senderId,
				receiverId : receiverId,
				content : content
			},
			success : function() {
				alert("메세지를 전송했습니다.");
			}
		});
		$(this).closest("#sendPostModal").find(".close").click();
	});
</script>