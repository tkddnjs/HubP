<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
.img-cooper img {
	whdth: 100%;
	height: 300px;
}
.image {
    width: auto; height: auto;
    max-width: 100px;
    max-height: 100px;
}
.cursor {
	cursor: pointer;
}
.insert {
	margin-right: 0;
	margin-left: 0;
}
.insert-image{
	display: inline-block;
	margin-left: 3em;
}
.img-cooper {
	margin-right: 0;
	margin-left: 0;
}
.form-group {
	width: 80%;
}
</style>

<!-- Modal -->
<div class="modal fade" id="registerCooperModal" role="dialog">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">업체등록</h4>
			</div>
   			<div class="modal-body" >
				<form id="demo-form2" action="${pageContext.request.contextPath}/cooper/register.do" data-parsley-validate class="form-horizontal form-label-left cooperForm" method="post" enctype="multipart/form-data">
					<div class="img-cooper cooper cursor" align="center" style="width: 50%">
			    		<span>사진 업로드
			    		<button type="button" id="removeBtn" style="display: none;">X</button>
			    		<i class="fa fa-plus-circle" id="addImageBtn"></i>
			    		</span>
			        	<input class="image" type="file" name="cma_file" id="cma_file" accept="image/*" capture="camera" style="display: none;" />
			        	<img id="cma_image" style="width:100%; height:300px;max-width:100%;border:1px solid #000;" src="${pageContext.request.contextPath}/resources/img/cooperImg/default.png">
			    	</div>
			    	<br><br>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-3 col-xs-12" for="coName">CooperName <span class="required">*</span></label>
						<div class="col-md-6 col-sm-6 col-xs-8">
							<input type="text" id="coName" name="coName" required="required" class="form-control col-md-7 col-xs-12">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-3 col-xs-12" for="lastDay">LastDay <span class="required">*</span></label>
							<div class="col-md-6 col-sm-6 col-xs-8">
								<input type="date" id="lastDay" name="lastDay" required="required" class="form-control col-md-7 col-xs-12">
							</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-3 col-xs-12">ConnChains <span class="required">*</span></label>
						<div class="col-md-6 col-sm-6 col-xs-8">
							<input id="rctags" type="text" name="connChains" class="tags form-control" />
						</div>
					</div>
					<div class="form-group"></div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-3 col-xs-12" for="coBanner">CooperBanner </label>
						<div class="col-md-6 col-sm-6 col-xs-8">
							<input type="text" id="coBanner" name="coBanner" placeholder="업체 url 입력" class="form-control col-md-7 col-xs-12">
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

<script type="text/javascript">

var defaultImgURL = '${pageContext.request.contextPath}/resources/img/cooperImg/default.png';

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

$('#cma_image').on('click', function() {
	$('#cma_file').click();
});

$('#addImageBtn').on('click', function() {
	$('#cma_file').click();
});

$('#cma_file').on('change', function(e) {
	getThumbnailPrivew(this, $('#cma_image'));
});
                            
$('#removeBtn').on('click', function() {
	$('#cma_image').attr('src', defaultImgURL);
	
	$(this).hide();
});

/* 
 * img 태그 엑박 방지
 $().ready(function(){
	$('img).each(function(n){
		$(this).error(function(){
			$(this).attr('src', defaultImgURL);
			});
		});
});*/
</script>