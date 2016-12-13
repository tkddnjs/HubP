<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap -->
<link href="${pageContext.request.contextPath}/resources/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Font Awesome -->
<link href="${pageContext.request.contextPath}/resources/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<!-- NProgress -->
<link href="${pageContext.request.contextPath}/resources/vendors/nprogress/nprogress.css" rel="stylesheet">
<!-- iCheck -->
<link href="${pageContext.request.contextPath}/resources/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
<!-- bootstrap-wysiwyg -->
<link href="${pageContext.request.contextPath}/resources/vendors/google-code-prettify/bin/prettify.min.css" rel="stylesheet">
<!-- Select2 -->
<link href="${pageContext.request.contextPath}/resources/vendors/select2/dist/css/select2.min.css" rel="stylesheet">
<!-- Switchery -->
<link href="${pageContext.request.contextPath}/resources/vendors/switchery/dist/switchery.min.css" rel="stylesheet">
<!-- starrr -->
<link href="${pageContext.request.contextPath}/resources/vendors/starrr/dist/starrr.css" rel="stylesheet">
<!-- bootstrap-daterangepicker -->
<link href="${pageContext.request.contextPath}/resources/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- Custom Theme Style -->
<link href="${pageContext.request.contextPath}/resources/css/custom.min.css" rel="stylesheet">

<style>
	.ui-autocomplete{
		z-index: 99999;
	}
</style>

<!-- Modal -->
<div class="modal fade" id="registerUserModal" role="dialog">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">회원가입</h4>
			</div>
   			<div class="modal-body">
				<form id="demo-form2" action="${pageContext.request.contextPath}/user/register.do" data-parsley-validate class="form-horizontal form-label-left" method="post" enctype="multipart/form-data">
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-3 col-xs-12" for="userId">ID <span class="required">*</span></label>
						<div class="col-md-2 col-sm-3 col-xs-3">
							<input type="text" id="userId" name="userId" required="required" class="form-control col-md-7 col-xs-12">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-3 col-xs-12" for="password">비밀번호 <span class="required">*</span></label>
							<div class="col-md-2 col-sm-3 col-xs-3">
								<input type="password" id="pw" name="pw" required="required" class="form-control col-md-7 col-xs-12">
							</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-3 col-xs-12" for="password_check">비밀번호 확인 <span class="required">*</span></label>
						<div class="col-md-2 col-sm-3 col-xs-3">
							<input type="password" id="pw_check" class="form-control col-md-7 col-xs-12">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-3 col-xs-12" for="email">이메일<span class="required">*</span></label>
						<div class="col-md-3 col-sm-4 col-xs-5">
							<input id="email" class="form-control col-md-7 col-xs-12" type="text" name="email">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-3 col-xs-12">연결고리<span class="required">*</span></label>
						<div class="col-md-6 col-sm-6 col-xs-8">
							<input id="tags" type="text" name="connChains" class="tags form-control" value="사진, 컴퓨터, etc.." />
						</div>
					</div>
					<div class="form-group"></div>
					<div class="form-group">
						<label for="picture" class="control-label col-md-2 col-sm-3 col-xs-12">Picture</label>
						<div class="col-md-6 col-sm-6 col-xs-8">
							<button type="button" id="pictureBtn" class="btn btn-primary">프로필 사진</button>
							<input type="file" name="image" data-role="magic-overlay" data-target="#pictureBtn" data-edit="insertImage" />
						</div>
					</div>  
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-3 col-xs-12">자기소개</label>
						<div class="col-md-6 col-sm-6 col-xs-8">
							<textarea class="form-control" rows="3" name="introduce" placeholder='자기 소개 입력'></textarea>
						</div>
					</div>
					<div class="ln_solid"></div>
					<div class="form-group">
						<div class="col-md-6 col-sm-6 col-xs-8 col-md-offset-4 col-sm-offset-4 col-xs-offset-4">
							<button type="reset" class="btn btn-primary">Cancel</button>
							<button type="submit" class="btn btn-success">Submit</button>
						</div>
					</div>
				</form>
			</div>
  		</div>
	</div>
</div>

<!-- jQuery -->
<script src="${pageContext.request.contextPath}/resources/vendors/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="${pageContext.request.contextPath}/resources/vendors/bootstrap/dist/js/bootstrap.min.js"></script>

<!-- bootstrap-daterangepicker -->
<script src="${pageContext.request.contextPath}/resources/vendors/moment/min/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
<!-- bootstrap-wysiwyg -->
<script src="${pageContext.request.contextPath}/resources/vendors/bootstrap-wysiwyg/js/bootstrap-wysiwyg.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendors/jquery.hotkeys/jquery.hotkeys.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendors/google-code-prettify/src/prettify.js"></script>
<!-- jQuery Tags Input -->
<script src="${pageContext.request.contextPath}/resources/vendors/jquery.tagsinput/src/jquery.tagsinput.js"></script>

<!-- Select2 -->
<script src="${pageContext.request.contextPath}/resources/vendors/select2/dist/js/select2.full.min.js"></script>
<!-- Parsley -->
<script src="${pageContext.request.contextPath}/resources/vendors/parsleyjs/dist/parsley.min.js"></script>
<!-- Autosize -->
<script src="${pageContext.request.contextPath}/resources/vendors/autosize/dist/autosize.min.js"></script>

<!-- Custom Theme Scripts -->
<script src="${pageContext.request.contextPath}/resources/js/custom.min.js"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" type="text/javascript"></script>

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
				list(result);
			}
		});
	});
	
	function list(array){
		connChains.length = 0;
		for (var i=0; i<array.length; i++){
			connChains.push(array[i]);
		}
	};
	</script>


<!-- bootstrap-daterangepicker -->
<script>
	$(document).ready(function() {
		$('#birthday').daterangepicker({
			singleDatePicker: true,
	  		calender_style: "picker_4"
		}, function(start, end, label) {
	  		console.log(start.toISOString(), end.toISOString(), label);
		});
	});
</script>
<!-- /bootstrap-daterangepicker -->

<!-- bootstrap-wysiwyg -->
<script>
	$(document).ready(function() {
		function initToolbarBootstrapBindings() {
			var fonts = ['Serif', 'Sans', 'Arial', 'Arial Black', 'Courier',
						'Courier New', 'Comic Sans MS', 'Helvetica', 'Impact', 'Lucida Grande', 'Lucida Sans', 'Tahoma', 'Times',
						'Times New Roman', 'Verdana'],
			fontTarget = $('[title=Font]').siblings('.dropdown-menu');
		  	$.each(fonts, function(idx, fontName) {
		  		fontTarget.append($('<li><a data-edit="fontName ' + fontName + '" style="font-family:\'' + fontName + '\'">' + fontName + '</a></li>'));
		  	});
			$('a[title]').tooltip({
				container: 'body'
			});
			$('.dropdown-menu input').click(function() {
				return false;
			})
			.change(function() {
				$(this).parent('.dropdown-menu').siblings('.dropdown-toggle').dropdown('toggle');
			})
			.keydown('esc', function() {
				this.value = '';
				$(this).change();
			});

			$('[data-role=magic-overlay]').each(function() {
				var overlay = $(this),
				target = $(overlay.data('target'));
				overlay.css('opacity', 0).css('position', 'absolute').offset(target.offset()).width(target.outerWidth()).height(target.outerHeight());
			});

			if ("onwebkitspeechchange" in document.createElement("input")) {
				var editorOffset = $('#editor').offset();
				$('.voiceBtn').css('position', 'absolute').offset({
					top: editorOffset.top,
					left: editorOffset.left + $('#editor').innerWidth() - 35
				});
			} else {
				$('.voiceBtn').hide();
			}
		}

		function showErrorAlert(reason, detail) {
			var msg = '';
			if (reason === 'unsupported-file-type') {
				msg = "Unsupported format " + detail;
			} else {
				console.log("error uploading file", reason, detail);
			}
			$('<div class="alert"> <button type="button" class="close" data-dismiss="alert">&times;</button>' +
			'<strong>File upload error</strong> ' + msg + ' </div>').prependTo('#alerts');
		}

		initToolbarBootstrapBindings();

		$('#editor').wysiwyg({
			fileUploadError: showErrorAlert
		});

		window.prettyPrint;
		prettyPrint();
	});
</script>
<!-- /bootstrap-wysiwyg -->

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
		$('#tags').tagsInput({
			width: 'auto',
			autocomplete_url: connChains
		});
	});
</script>
<!-- /jQuery Tags Input -->

<!-- Parsley -->
<script>
	$(document).ready(function() {
		$.listen('parsley:field:validate', function() {
			validateFront();
		});
		$('#demo-form .btn').on('click', function() {
			$('#demo-form').parsley().validate();
			validateFront();
		});
		var validateFront = function() {
			if (true === $('#demo-form').parsley().isValid()) {
				$('.bs-callout-info').removeClass('hidden');
				$('.bs-callout-warning').addClass('hidden');
			} else {
				$('.bs-callout-info').addClass('hidden');
				$('.bs-callout-warning').removeClass('hidden');
			}
		};
	});

	$(document).ready(function() {
		$.listen('parsley:field:validate', function() {
			validateFront();
		});
		$('#demo-form2 .btn').on('click', function() {
			$('#demo-form2').parsley().validate();
			validateFront();
		});
		var validateFront = function() {
			if (true === $('#demo-form2').parsley().isValid()) {
				$('.bs-callout-info').removeClass('hidden');
				$('.bs-callout-warning').addClass('hidden');
			} else {
				$('.bs-callout-info').addClass('hidden');
				$('.bs-callout-warning').removeClass('hidden');
			}
		};
	});

	try {
		hljs.initHighlightingOnLoad();
	} catch (err) {}
</script>
<!-- /Parsley -->

<!-- Autosize -->
<script>
	$(document).ready(function() {
		autosize($('.resizable_textarea'));
	});
</script>
<!-- /Autosize -->


	<script>
	$(document).ready(function a(){
		$("button").click(function () {
			$('<input type="text" size="10" name="connchain" class="validate"><br>').appendTo("#connForm");
		});
	});
	
	$(document).ready(function a(){
		$("#userId").keyup(function() {
				
			var userId= $(this).val();
			$.ajax({
				type: 'POST', 
				url: '../checkId.do',
				data: 
					{
						userId: userId
						//앞의 id: getParameter할 것 / 뒤 id: 위의 var id= 값
					},
				success: function(result){
					if($.trim(result) == "ok"){
						$("#idCheckResult").html("사용가능한 ID입니다.");
					}else{
						$("#idCheckResult").html("사용중인  ID입니다.");
					}
				}
			});
		});
		
		
		$("#pwCheck").keyup(function() {
			var pw = $("#pw").val();
			var pwCheck = $(this).val();
			
			if(pw == pwCheck){
				$("#pwCheckResult").html("일치");
			} else {
				$("#pwCheckResult").html("불일치");
			}
		});
		
		$("#email").keyup(function(){
       		if($(this).val()&&!$(this).val().match(/.+@.+\.com+/g)){
       			$("#mailCheckResult").html("메일 형식이 잘못되었습니다.");
        	}else{
        		$("#mailCheckResult").remove();
        	}
    	});
	});
	
    $("form").submit(function(){
        //에러 초기화 추가로 붙는 내용 삭제
        $("p.error").remove();
        $("dl dd").removeClass("error");
        
        //filter메소드를 이용해서 text, textareea 요소들 중에 validate
        //클래스를 같고 있는 것만 찾는다.
        $(":text, textarea").filter(".validate").each(function(){
            
            //필수 항목 검사
            //this -> filter로 걸러진 text, textarea 중에 하나를 뜻한다.
            $(this).filter(".required").each(function(){
                if($(this).val() == ""){
                    $(this).before("<p class='error'>필수 항목 입니다.</p>");
                }
            });
            
            //연락처 검사
            $(this).filter(".number").each(function(){
                if(isNaN($(this).val())){
                    $(this).before("<p class='error'>숫자만 입력 가능합니다.</p>");
                }
            });
            
         	// 메일 검사
        	$(this).filter(".mail").each(function(){
           		if($(this).val()&&!$(this).val().match(/.+@.+\..+/g)){
                	$(this).before("<p class='error'>메일 형식이 잘못되었습니다.</p>");
            	}
        	});
         
        	//radio button check
        	$(":radio").filter(".validate").each(function(){
           		$(this).filter(".required").each(function(){
                	if($(":radio[name=" + $(this).attr("name")+"]:checked").length == 0){
                    	$(this).before("<p class='error'>필수 선택 항목입니다.</p>");
                	}
            	});
        	});
        
        
        	//check box check
        	$(".checkboxRequired").each(function(){
            	if($(":checkbox:checked", this).length == 0){
                	$(this).prepend("<p class='error'>필수 선택 항목입니다.</p>");
            	}
        	});
            
            
        
        	if($("p.error").length> 0){
            	//에러가 발생한 위치로 스크롤 이동
            	$("html, body").animate({scrollTop : 
            	$("p.error.first").offset.top - 40}, "slow");
            	//에러 항목에 대한 음영 처리
            	$("p.error").parent().addClass("error");
            	return false;
        	}
		});
	});
	 
    </script>

