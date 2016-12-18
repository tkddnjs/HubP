<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Welcome HUB : Have U get a BucketList?</title>

<%@ include file="/views/layout/commonCSS.jsp"%>
<%@ include file="/views/user/registerUser.jsp"%>

<style>
.mainBody {
	top: 30%;
}
</style>

</head>
<body style="background-size:100%; background-image: url(${pageContext.request.contextPath}/resources/img/mainPicture.jpg);">
	<div class="login_wrapper"
		style="margin: 18% 0 0 66%; height: 400px; border: 2px solid #cf9c36; color: #cf9c36; background: rgba(245, 234, 212, 0.3);">
		<div class="animate form login_form" style="margin-top: 15%;">
			<section class="login_content" style="width: 250px; float: center;">
				<form action="${pageContext.request.contextPath}/user/login.do"
					method="post">
					<h1>HUB LogIn</h1>
					<div>
						<input id="userId" name="userId" class="form-control" type="text"
							value="" placeholder="Login ID">
					</div>
					<div>
						<input id="password" name="pw" class="form-control"
							type="password" value="" placeholder="Password">
					</div>
					<div style="margin-left: 20px;">
						<button type="submit" class="btn btn-default submit">로그인</button>
						<button type="button" class="btn btn-default submit"
							data-toggle="modal" data-target="#registerUserModal">회원가입</button>
					</div>
					<div class="clearfix"></div>
				</form>
			</section>
		</div>
	</div>
	
<script src="${pageContext.request.contextPath}/resources/vendors/jquery/dist/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendors/moment/min/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendors/bootstrap-wysiwyg/js/bootstrap-wysiwyg.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendors/jquery.hotkeys/jquery.hotkeys.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendors/google-code-prettify/src/prettify.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendors/jquery.tagsinput/src/jquery.tagsinput.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" type="text/javascript"></script>	

<!-- Custom Script -->
<script>
	var connChains = [];
	$(document).ready(function (){
		$.ajax({
			type : 'POST',
			url : '${pageContext.request.contextPath}/list/listAutoComplete.do',
			data : {
				listOpt : 2
			},
			success : function(result) {
				result = result.replace(/ /gi, "");
				result = result.replace("[", "");
				result = result.replace("]", "");
				result = result.split(',');
				list(result, connChains);
			}
		});
	});
	
	function list(array, result){
		result.length = 0;
		for (var i=0; i<array.length; i++){
			result.push(array[i]);
		}
	};
</script>
<!-- /Custom Script -->
<!-- jQuery Tags Input -->
<script>
	function onAddTag(tag) {
		alert("Added a tag: " + tag);
	}

	function onRemoveTag(tag) {
		alert("Removed a tag: " + tag);
	}

	function onChangeTag(input, tag) {
		alert("Changed a tag: " + tag);
	}

	$(document).ready(function() {
		$(".tags").tagsInput({
			width: 'auto',
			autocomplete_url: connChains
		});
	});
	
</script>
<!-- /jQuery Tags Input -->

<script type="text/javascript">
	var defaultImgURL = '${pageContext.request.contextPath}/resources/img/userImg/default.png';
	var changed="no"
	/* 이미지 업로드 미리보기 */
	function getThumbnailPrivew(html, $target) {
		if (html.files && html.files[0]) {
			var reader = new FileReader();
			reader.onload = function (e) {
				$target.attr('src', e.target.result);
				$('#removeBtn').show();
			}
        	reader.readAsDataURL(html.files[0]);
    	}
	}

	$('#user_image').on('click', function() {
		$('#user_file').click();
	});

	$('#addImageBtn').on('click', function() {
		$('#user_file').click();
	});

	$('#user_file').on('change', function(e) {
		changed="yes"
		getThumbnailPrivew(this, $('#user_image'));
	});
                            
	$('#registerUserModal .removeBtn').on('click', function() {
		$('#user_image').attr('src', defaultImgURL);
		$(this).hide();
	});
	
	$("#registerUserForm").submit(function() {
		var tags = $("#rutags").val();
		tags = tags.split(",");
		$("#rutags").val(tags);
		$(this).find("#changed").val(changed);
	});
	
	$('#registerUserModal .btn-primary').on('click', function() {
		$("[id$=Result]").each(function(){
			$(this).html("");
		});
		$(this).closest(".modal.fade").find(".close").click();
	});
</script>

<!-- Validation -->
<script>
	$("#userId").keyup(function() {
		var id = $(this).val();
		if($(this).val().length >= 5){
			$.ajax({
				type: 'POST',
				url: '${pageContext.request.contextPath}/user/checkId.do',
				data: {
						userId: id
				},
				success: function(result){
					if($.trim(result)=="OK"){
						$("#idCheckResult").html("사용가능합니다.")
						$("#idCheckResult").attr('style', 'color: blue;');
					} else {
						$("#idCheckResult").html("중복된 ID입니다.")
						$("#idCheckResult").attr('style', 'color: red;');
					}
				}
			});
		}else{
			$("#idCheckResult").html("ID는 5자 이상입니다.")
			$("#idCheckResult").attr('style', 'color: red;');
		}
	});
	
	$("#pw").keyup(function() {
		$("#pwResult").html("");
	});
	
	$("#pwCheck").keyup(function() {
		if($(this).val() == $("#pw").val()){
			$("#pwCheckResult").html("비밀번호가 일치합니다.");
			$("#pwCheckResult").attr('style', 'color: blue;');
		}else{
			$("#pwCheckResult").html("비밀번호가 일치하지 않습니다.");
			$("#pwCheckResult").attr('style', 'color: red;');
		}
	});
	
	$("#email").keyup(function() {
		if(!$(this).val().match(/.+@.+\.+/g)){
            $("#emailCheckResult").html("잘못된 형식입니다. (예)example@domain.com");
            $("#emailCheckResult").attr('style', 'color:red');
        } else {
        	$("#emailCheckResult").html("올바른 형식입니다.");
            $("#emailCheckResult").attr('style', 'color:blue');
        }
	});
	
	$("#rutags").closest("div").click(function() {
		$("#connChainResult").html("");
	});
	
	$("#registerUserForm").submit(function(){
		var error = 0;
		if($("#registerUserForm #userId").val()==""){
			$("#registerUserForm #idCheckResult").html("필수입력사항입니다.")
			$("#registerUserForm #idCheckResult").attr('style', 'color: red;');
			error += 1;
		}
		
		if($("#registerUserForm #pw").val()==""){
			$("#registerUserForm #pwResult").html("필수입력사항입니다.");
			$("#registerUserForm #pwResult").attr('style', 'color: red;');
			error += 1;
		}
		
		if($("#registerUserForm #pwCheck").val()==""){
			$("#registerUserForm #pwCheckResult").html("필수입력사항입니다.");
			$("#registerUserForm #pwCheckResult").attr('style', 'color: red;');
			error += 1;
		}
		
		if($("#registerUserForm #email").val()==""){
			$("#registerUserForm #emailCheckResult").html("필수입력사항입니다.");
            $("#registerUserForm #emailCheckResult").attr('style', 'color:red');
            error += 1;
		}
		
		if($("#registerUserForm #rutags").val()==""){
			$("#registerUserForm #connChainResult").html("필수입력사항입니다.");
            $("#registerUserForm #connChainResult").attr('style', 'color:red');
            error += 1;
		}

		if (error > 0) {
			return false;
		}
	});
</script>
<!-- Validation -->

</body>
</html>
