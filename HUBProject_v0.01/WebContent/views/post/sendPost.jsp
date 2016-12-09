<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
	.ui-autocomplete{
		z-index: 99999;
	}
</style>

<!-- Modal -->
<div class="modal fade" id="sendPostModal" role="dialog">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">쪽지전송</h4>
			</div>
   			<div class="modal-body">
				<form id="demo-form2" action="${pageContext.request.contextPath}/post/send.do" data-parsley-validate class="form-horizontal form-label-left" method="post">
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-3 col-xs-12" for="senderId">Sender </label>
						<div class="col-md-2 col-sm-3 col-xs-3" style="float: left;">
							<input type="text" id="senderId" name="senderId" value="${sessionScope.userId }" readonly="readonly" required="required" class="form-control col-md-7 col-xs-12">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-3 col-xs-12">Introduce</label>
						<div class="col-md-6 col-sm-6 col-xs-8">
							<textarea name="content" class="form-control" rows="3" placeholder="쪽지내용입력"></textarea>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-3 col-xs-12" for="receiverId">Receiver <span class="required">*</span></label>
						<div class="col-md-3 col-sm-4 col-xs-5">
							<input type="text" id="receiverId" name="receiverId" class="form-control col-md-7 col-xs-12">
						</div>
					</div>
					<div class="ln_solid"></div>
					<div class="form-group">
						<div class="col-md-6 col-sm-6 col-xs-8 col-md-offset-4 col-sm-offset-4 col-xs-offset-4">
							<button type="reset" class="btn btn-primary">초기화</button>
							<button type="submit" class="btn btn-success">전송</button>
						</div>
					</div>
				</form>
			</div>
  		</div>
	</div>
</div>

<script>
	var follows = [];
	var userId = '${sessionScope.userId}';
	$(document).ready(function (){
		$.ajax({
			type : 'POST',
			url : '${pageContext.request.contextPath}/follow/autoComplete.do',
			data : {
				userId : userId
			},
			success : function(result) {
				result = result.replace(/ /gi, "");
				result = result.replace("[", "");
				result = result.replace("]", "");
				result = result.split(',');
				list(result);
			}
		});
	});
	
	function list(array){
		follows.length = 0;
		for (var i=0; i<array.length; i++){
			follows.push(array[i]);
		}
	};
	
	$("#receiverId").autocomplete({
		source : follows
	})
</script>