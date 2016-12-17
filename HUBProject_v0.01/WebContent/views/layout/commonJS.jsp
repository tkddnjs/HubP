<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- jQuery -->
<script src="${pageContext.request.contextPath}/resources/vendors/jquery/dist/jquery.min.js"></script>
<!-- jQuery Knob -->
<script src="${pageContext.request.contextPath}/resources/vendors/jquery-knob/dist/jquery.knob.min.js"></script>
<!-- Bootstrap -->
<script src="${pageContext.request.contextPath}/resources/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="${pageContext.request.contextPath}/resources/vendors/fastclick/lib/fastclick.js"></script>
<!-- NProgress -->
<script src="${pageContext.request.contextPath}/resources/vendors/nprogress/nprogress.js"></script>
<!-- bootstrap-progressbar -->
<script src="${pageContext.request.contextPath}/resources/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
<!-- bootstrap-daterangepicker -->
<script src="${pageContext.request.contextPath}/resources/vendors/moment/min/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
<!-- bootstrap-wysiwyg -->
<script src="${pageContext.request.contextPath}/resources/vendors/bootstrap-wysiwyg/js/bootstrap-wysiwyg.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendors/jquery.hotkeys/jquery.hotkeys.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendors/google-code-prettify/src/prettify.js"></script>
<!-- jQuery Tags Input -->
<script src="${pageContext.request.contextPath}/resources/vendors/jquery.tagsinput/src/jquery.tagsinput.js"></script>
<!-- iCheck -->
<script src="${pageContext.request.contextPath}/resources/vendors/iCheck/icheck.min.js"></script>
<!-- Datatables -->
<script src="${pageContext.request.contextPath}/resources/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendors/jszip/dist/jszip.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendors/pdfmake/build/pdfmake.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendors/pdfmake/build/vfs_fonts.js"></script>
<!-- starrr -->
<script src="${pageContext.request.contextPath}/resources/vendors/starrr/dist/starrr.js"></script>

<!-- Select2 -->
<script src="${pageContext.request.contextPath}/resources/vendors/select2/dist/js/select2.full.min.js"></script>
<!-- Parsley -->
<script src="${pageContext.request.contextPath}/resources/vendors/parsleyjs/dist/parsley.min.js"></script>
<!-- Autosize -->
<script src="${pageContext.request.contextPath}/resources/vendors/autosize/dist/autosize.min.js"></script>
<!-- Custom Theme Scripts -->
<script src="${pageContext.request.contextPath}/resources/js/custom.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" type="text/javascript"></script>

<!-- Custom Script -->

<!-- Init Script -->
<script>
	var defaultImgURL = '${pageContext.request.contextPath}/resources/img/cooperImg/default.png';
	var defaultUserImgURL = '${pageContext.request.contextPath}/resources/img/userImg/default.png';
	var changed='no';
	var userId = '${sessionScope.userId}';
	
	var connChains = [];
	var tabOpt;

	var user = new Array();
	var bucketlists = new Array();
	var coopers = new Array();
	var follows = new Array();
	var groups = new Array();
	
	<c:forEach items="${bucketlists}" var="bucketlist">
		var bucketlist = new Array();
		bucketlist.push("${bucketlist.bucketlistId}");
		bucketlist.push("${bucketlist.title}");
		bucketlist.push("${bucketlist.connChains}");
		bucketlist.push("${bucketlist.goal}");
		bucketlist.push("${bucketlist.star}");
		bucketlist.push("${bucketlist.progress}");
		bucketlist.push("${bucketlist.memo}");
		bucketlist.push("${bucketlist.sos}");
		bucketlist.push("${bucketlist.lock}");
		bucketlist.push("${bucketlist.userId}");
		bucketlists.push(bucketlist);
	</c:forEach>
	
	<c:forEach items="${coopers }" var="cooper">
		var cooper = new Array();
		cooper.push("${cooper.coId }");
		cooper.push("${cooper.coName }");
		cooper.push("${cooper.startDay }");
		cooper.push("${cooper.lastDay }");
		cooper.push("${cooper.connChains }");
		cooper.push("${cooper.coBanner }");
		cooper.push("${cooper.image }");
		coopers.push(cooper);
	</c:forEach>

	<c:forEach items="${groups}" var="group">
		var group = new Array();
		group.push("${group.groupId}");
		group.push("${group.groupName}");
		group.push("${group.managerId}");
		group.push("${group.lastDay}");
		group.push("${group.connChains}");
		group.push("${group.introduce}");
		group.push("${group.local}");
		group.push("${fn:length(group.joinPeople)}");
		group.push("${group.maxPeople}");
		groups.push(group);
	</c:forEach>
</script>
<!-- /Init Script -->

<!-- Function Script -->
<script>
	function list(array, result){
		result.length = 0;
		for (var i=0; i<array.length; i++){
			result.push(array[i]);
		}
	};
	
	function initConn(str) {
		var conn = str;
		conn = conn.replace("[", "");
		conn = conn.replace(/ /gi, "");
		conn = conn.replace("]", "");
		$(".tags").each(function() {
			$(this).importTags(conn);
		});
	};
	
	function initConnReadonly(str, selector) {
		var conn = str;
		conn = conn.replace("[", "");
		conn = conn.replace(/ /gi, "");
		conn = conn.replace("]", "");
		selector.importTags(conn);
		$('.tagsinput').find('a').remove();
	};
	
	function initStar(str) {
		if(str != $(".changeStar").attr('data-rating')){
			$(".changeStar").starrr('setRating', str);
		}
		$(".changeStar").attr("data-rating", str);
		$(".changeStar").on('starrr:change', function(e, value) {
			$(".changeStar").attr("data-rating", value);
		});
		$("[name='star']").val(str);
	};
	
	// 이미지 미리보기
	function getThumbnailPrivew(html, $target) {
	    if (html.files && html.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
	            $target.attr('src', e.target.result);
	            $('#removeBtn').show();
	        }
	        reader.readAsDataURL(html.files[0]);
	    }
	};
	function ajaxFollow() {
		return $.ajax({
			type : 'GET',
			url : '${pageContext.request.contextPath}/follow/listAll.do',
			data : {
				userId : userId
			},
			success : function(result) {
				result = result.replace(/ /gi, "");
				result = result.replace("[", "");
				result = result.replace("]", "");
				result = result.split(',');
				listFollow(result);
			}
		});
	}
	
	function listFollow(array) {
		for (var i = 0; i < array.length; i++) {
			array[i] = array[i].replace("(", "");
			array[i] = array[i].replace(")", "");
			array[i] = array[i].split("/");
			follows.push(array[i]);
		};
	};
	
	function appendConfirm(selector){
		for(var i = 0; i < follows.length; i++){
			if(follows[i][3] == 'false'){
				selector.append(
					'<li class="sub_menu" style="height: 70px;">'
					+'<form action="${pageContext.request.contextPath}/user/detail.do" method="get">'
					+	'<input type="hidden" name="myId" value="' + follows[i] + '">'
					+	'<input type="hidden" name="userId" value="' + follows[i][1] + '">'
					+	'<button class="btn btn-xs btn-default btn-block" type="submit"'
					+	'style="border: hidden; font-size: 15px; background: none !important;">' + follows[i][1] + '</button>'
					+'</form>'
					+'<form action="${pageContext.request.contextPath}/follow/confirm.do" method="post" style="display: block; float: left; width: 60px;">'
					+		'<input type="hidden" name="followId" value="' + follows[i][1] + '">'
					+		'<input type="hidden" name="userId" value="' + follows[i][0] + '">'
					+		'<button type="submit" class="fa fa-plus-square" style="width: 60px; font-size: 16px; background: none !important; border: none;">수락</button>'
					+'</form>'
					+'<form action="${pageContext.request.contextPath}/follow/remove.do" method="post" style="display: block; margin-right: 50px; float: right; width: 60px;">'
					+		'<input type="hidden" name="followId" value="' + follows[i][1] + '">'
					+		'<input type="hidden" name="userId" value="' + follows[i][0] + '">'
					+		'<button type="submit" class="fa fa-minus-square" style="width: 60px; font-size: 16px; background: none !important; border: none;">거절</button>'
					+'</form>'
					+'</li>'
				);
			};
		};
	};

	function appendFollow(selector, opt){
		for(var i=0; i<follows.length; i++){
			if(follows[i][3] == 'true' && follows[i][2] == opt){
				selector.append(
					'<li class="sub_menu">'
					+'<button type="button" data-toggle="modal" data-target="#sendPostModal" class="fa fa-envelope-o sendPostBtn" value="' + follows[i][1] + '"'
					+'style="border: hidden; background:none !important; width:30px; float:right">'
					+'</button>'
					+'	<form action="${pageContext.request.contextPath}/user/detail.do" method="get">'
					+'		<input type="hidden" name="myId" value="' + userId + '"> '
					+'		<input type="hidden" name="userId" value="' + follows[i][1] + '">'
					+'		<button class="btn btn-xs btn-default btn-block" type="submit"'
					+'		 style="border: hidden; font-size: 15px; background: none !important; width:50px; float:left">' + follows[i][1] + '</button>'
					+'	</form>'
					+'</li>'
				);
			}
		}
	}
	
	function ajaxUser(userId, user){
		return $.ajax({
			type : 'post',
			url : '${pageContext.request.contextPath}/user/detail.do',
			data : {
				userId : userId
			},
			success : function(result){
				result = result.replace("(", "");
				result = result.replace(")", "");
				result = result.replace(/ /gi, "");
				result = result.split("/");
				inputUser(result, user);
			}
		});
	};
	
	function ajaxCheckFollow(userId){
		var temp = '${sessionScope.userId}';
		return $.ajax({
			type : 'post',
			url : '${pageContext.request.contextPath}/follow/check.do',
			data : {
				userId : temp,
				followId : userId
			},
			success : function(result){
				if($.trim(result)=="available"){
					$(".requestButton").show();
					$(".sendPostBtn").hide();
				} else {
					$(".requestButton").hide();
					$(".sendPostBtn").show();
				}
			}
		});
	};
	
	function inputUser(array, user){
		for(var i=0; i<array.length; i++){
			user.push(array[i]);
		}
	}
	
	function ajaxPost(senderId, receiverId, content){
		return $.ajax({
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
	}
</script>
<!-- /Function Script -->

<!-- Common Script -->
<script>
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
		//tab 누를때 Controller에서 정보를 가져옴
		tabOpt = ${tabOpt};
		if(tabOpt < 5){
			$("[role='presentation']").attr("class", "");
			$("#profile-tab"+tabOpt).closest("[role='presentation']").attr("class", "active");
		}
		$(".active.in.main").attr("class", "tab-pane fade");
		$("#tab_content"+tabOpt).attr("class", "tab-pane fade active in main");
	});
</script>
<!-- /Common Script -->

<!-- Bucketlist Script -->
<script>
	// register Modal로 연결될 때 이벤트
	$("#registerBtn").click(function() {
		$(".tags").each(function() {
			$(this).importTags("");
		});
		$(".changeStar").starrr();
		$(".changeStar").starrr('setRating', 0);
		$(".changeStar").attr("data-rating", 0);
		$(".changeStar").on('starrr:change', function(e, value) {
			$(this).attr("data-rating", value);
		});
	});

	// modify Modal로 연결될 때 이벤트
	$("[name=modifyBtn]").click(function() {
		var index = $(this).val() - 1;
		$("#modifyBucketlistModal #bucketlistId").val(bucketlists[index][0]);
		$("#modifyBucketlistModal #title").val(bucketlists[index][1]);
		initConn(bucketlists[index][2]);
		$("#modifyBucketlistModal #goal").val(bucketlists[index][3]);
		initStar(bucketlists[index][4]);
		$("#modifyBucketlistModal #progress").val(bucketlists[index][5]).trigger("change");
		$("#modifyBucketlistModal #memo").val(bucketlists[index][6]);
		$("#modifyBucketlistModal #sos").val(bucketlists[index][7]);
		var lock = bucketlists[index][8];
		if (lock == 'true') {
			$('#modifyBucketlistModal #private').attr("checked", true);
		} else {
			$("#modifyBucketlistModal #public").attr("checked", true);
		}
		$("#modifyBucketlistModal #userId").val(bucketlists[index][9]);
	});
	
	$("[name=removeBucketlistBtn]").each(function(){
		$(this).click(function() {
			alert($(this).val());
			var bucketlistId = $(this).val();
			$("#removeBucketlistModal [name=bucketlistId]").val(bucketlistId);
		});	
	});

	$(".bucketlistForm").submit(function() {
		
		$(this).filter(".tags").each(function(){
			var tags = $(this).val();
			tags = tags.split(",");
			$(this).val(tags);	
		})
		;
		// 연결고리 값 domain type으로 변경
		//var tags = $(this).find("#mbtags").val();
		//tags = tags.split(",");
		//$(this).find("#mbtags").val(tags);

		// star 값 domain type으로 변경
		var star = $(this).find(".changeStar").attr("data-rating");
		$(this).find("#star").val(star);

		// memo의 줄넘김 문자 삭제
		var memo = $(this).find("[name='memo']").val();
		memo = memo.replace(/\n/gi, " ");
		$(this).find("[name='memo']").val(memo);
	});
	
	$('#registerBucketlistModal .btn-primary').on('click', function() {
		$(this).closest(".modal.fade").find(".close").click();
	});
	
	$('#modifyBucketlistModal .btn-primary').on('click', function() {
		$(this).closest(".modal.fade").find(".close").click();
	});
	
	$('#removeBucketlistModal .btn-primary').on('click', function() {
		$(this).closest(".modal.fade").find(".close").click();
	});
</script>
<!-- /Bucketlist Script -->

<!-- Cooper Script -->
<script>
	$("#registerCooperBtn").click(function(){
		$(".tags").each(function(){
			$(this).importTags("");
		});
	});
	
	$("[name=modifyCooperBtn]").click(function() {
		var index = $(this).val() - 1;
		$("#modifyCooperModal #coId").val(coopers[index][0]);
		$("#modifyCooperModal #coName").val(coopers[index][1]);
		$("#modifyCooperModal #startDay").val(coopers[index][2]);
		$("#modifyCooperModal #lastDay").val(coopers[index][3]);
		initConn(coopers[index][4]);
		$("#modifyCooperModal #coBanner").val(coopers[index][5]);
		$("#modifyCooperModal #cmb_image").attr('src', '${pageContext.request.contextPath}/resources/img/cooperImg/'+coopers[index][6]);
		$("#modifyCooperModal #removeBtn").show();
	});
	
	$(".cooperFile").each(function(){
		var that = $(this);
		$(this).next().on('click', function(){
			that.click();
		})
	});

	$(".cooperFile").each(function(){
		$(this).on('change', function() {
			changed='yes';
			getThumbnailPrivew(this, $('.cooperImage'));
		});
	});
	
	$('.removeImageBtn').each(function(){
		$(this).on('click', function() {
			$(this).closest(".cursor").find("img").attr('src', defaultImgURL);
			$(this).hide();
		});
	});

	$(".cooperForm").submit(function() {
		var tags = $(this).find(".tags").val();
		tags = tags.split(",");
		$(this).find(".tags").val(tags);
		$(this).find("#changed").val(changed);
	});
	
	//$('#cma_image').on('click', function() {
	//	$('#cma_file').click();
	//});
	//$('#cma_file').on('change', function(e) {
	//	changed='yes';
	//	getThumbnailPrivew(this, $('#cma_image'));
	//});
	//$('#removeBtn').on('click', function() {
	//	$('#cmb_image').attr('src', defaultImgURL);
	//	$(this).hide();
	//});	
	//$("#modifyCooperForm").submit(function() {
	//	var tags = $("#mctags").val();
	//	tags = tags.split(",");
	//	$("#mctags").val(tags);
	//	$(this).find("#changed").val(changed);
	//});
</script>

<!-- /Cooper Script -->

<!-- Follow Script -->
<script>
	$(document).ready(function() {
		$.when(ajaxFollow()).done(function(){
			appendConfirm($("#requestedFollow"));
			appendFollow($("#giveHelp"), 1);
			appendFollow($("#receiveHelp"), 2);
			appendFollow($("#bothHelp"), 3);
			appendFollow($("#groupFollow"), 4);
			$(".sendPostBtn").click(function (){
				var followId = $(this).val();
				$("#sendPostModal #receiverId").val(followId);
				$("#sendPostModal #sendPostBtn").val(followId);
			});
		});
		
		$(".requestButton").click(function (){
			var reqBtn = $(this);
			var modal = reqBtn.closest(".modal.fade");
			var userId = "${sessionScope.userId}";
			var followId = modal.find("#followId").val();
			var relation = reqBtn.val();
			$.ajax({
				type : 'POST',
				url : '${pageContext.request.contextPath}/follow/request.do',
				data : {
					userId : userId,
					followId : followId,
					relation : relation
				},
				success : function(result){
					if(result=="ok"){
						alert("팔로우를 요쳥했습니다.");
						modal.find(".close").click();
					}
				}
			});
		});
	});
</script>
<!-- /Follow Script -->

<!-- Group Script -->
<script>
	$("#registerBtn").click(function() {
		$(".tags").each(function() {
			$(this).importTags("");
		});
	});
	
	$("[name=detailGroupBtn]").click( function() {
		var gListOpt = '${listOpt}';
		var index = $(this).val() - 1;
		$("#detailGroupModal #groupId").html(groups[index][0]);
		$("#detailGroupModal [name='groupId']").val(groups[index][0]);
		$("#detailGroupModal #groupName").html(groups[index][1]);
		$("#detailGroupModal #managerId").html(groups[index][2]);
		$("#detailGroupModal #lastDay").html(groups[index][3]);
		initConnReadonly(groups[index][4], $("#dgtags"));
		$("#detailGroupModal #introduce").html(groups[index][5]);
		$("#detailGroupModal #local").html(groups[index][6]);
		$("#detailGroupModal #joinPeople").html(groups[index][7]);
		$("#detailGroupModal [name='joinPeople']").val(groups[index][7]);
		$("#detailGroupModal #maxPeople").html(groups[index][8]);
		$("#detailGroupModal [name='maxPeople']").val(groups[index][8]);
		$("#detailGroupModal #no").val(index);
		
		if(gListOpt == '0'){ // 모임방에 가입하지 않은 경우
			$("#myGroupBtns").attr("hidden", true);
			$("#joinedGroupBtn").attr("hidden", true);
			$("#unjoinedGroupBtn").attr("hidden", false);
		} else {
			if(groups[index][2] == userId){ // 모임방 관리자인 경우
				$("#myGroupBtns").attr("hidden", false);
				$("#joinedGroupBtn").attr("hidden", true);
				$("#unjoinedGroupBtn").attr("hidden", true);
			} else {	// 모임방에 가입한 경우
				$("#myGroupBtns").attr("hidden", true);
				$("#joinedGroupBtn").attr("hidden", false);
				$("#unjoinedGroupBtn").attr("hidden", true);
			}
		}
	});

	$("#modifyGroupBtn").click( function() {
		$("#detailGroupModal .close").click();
		var index = $("#no").val();
		$("#modifyGroupModal #groupId").val(groups[index][0]);
		$("#modifyGroupModal #groupName").val(groups[index][1]);
		$("#modifyGroupModal #managerId").val(groups[index][2]);
		$("#modifyGroupModal #lastDay").val(groups[index][3]);
		initConn(groups[index][4]);
		$("#modifyGroupModal #introduce").val(groups[index][5]);
		$("#modifyGroupModal #local").val(groups[index][6]);
		$("#modifyGroupModal #joinPeople").html(groups[index][7]);
		$("#modifyGroupModal #maxPeople").val(groups[index][8]);
	});

	$(".groupForm").submit(function() {
		// 연결고리 값 domain type으로 변경
		var tags = $(this).find(".tags").val();
		tags = tags.split(",");
		$(this).find(".tags").val(tags);
	});
	$("#modifyGroupForm").submit(function() {
		// memo의 줄넘김 문자 삭제
		var introduce = $(this).find("[name='introduce']").val();
		introduce = introduce.replace(/\n/gi, " ");
		$(this).find("[name='introduce']").val(introduce);
	});
</script>
<!-- /Group Script -->

<!-- List Script -->
<script type="text/javascript">
	$("[name=detailUserBtn]").click(function() {
		var listOpt = ${listOpt};
		
		var userId = $(this).val();
		$.when(ajaxUser(userId, user), ajaxCheckFollow(userId)).done(function(){
			$("#detailUserModal #userId").html(user[0]);
			$("#detailUserModal #followId").val(user[0]);
			$("#detailUserModal #picture").attr('src', '${pageContext.request.contextPath}/resources/img/userImg/'+user[4]);
			initConnReadonly(user[3], $("#dutags"));
			$("#detailUserModal #introduce").html(user[5]);
			$("#detailUserModal .requestButton").val(listOpt);
			$("#detailUserModal .sendPostBtn").val(userId);
		});
	});
	
	$("[name=detailBucketlistBtn]").click(function() {
		var index;
		var listOpt = ${listOpt};
		for(var i=0; i<bucketlists.length; i++){
			if($(this).val() == bucketlists[i][0]){
				index = i;
				break;
			}
		}
		$.when(ajaxCheckFollow(bucketlists[index][9])).done(function(){
			$("#detailBucketlistModal #title").html(bucketlists[index][1]);
			$("#detailBucketlistModal #userId").html(bucketlists[index][9]);
			$("#detailBucketlistModal #followId").val(bucketlists[index][9]);
			initConnReadonly(bucketlists[index][2], $("#dbtags"));
			$("#detailBucketlistModal #sos").html(bucketlists[index][7]);
			$("#detailBucketlistModal .requestButton").val(listOpt);
			$("#detailBucketlistModal .sendPostBtn").val(bucketlists[index][9]);
		});
	});
</script>
<!-- /List Script -->

<!-- Post Script -->
<script>
	$("#sendPostBtn").click(function() {
		var senderId = '${sessionScope.userId}';
		var receiverId = $(this).val();
		var content = $("#sendPostModal").find('[name="content"]').val();
		$.when(ajaxPost(senderId, receiverId, content)).done(function(){
			$("#sendPostModal").find(".close").click();	
		})
		
	});

	$('[name="checks"]').click(function(){
		$(this).attr("checked", "checked");
	});

	$("#removePost").closest("form").submit(function (){
		if($(this).id = "removePostInLP"){
			$(this).find('[name="listOpt"]').val(1);
		} else {
			$(this).find('[name="listOpt"]').val(0);
		}
	});
</script>
<!-- /Post Script -->

<!-- User Script -->
<script>
	$('#user_image').on('click', function() {
		$('#user_file').click();
	});

	$('#addImageBtn').on('click', function() {
		$('#user_file').click();
	});

	$('#user_file').on('change', function(e) {
		changed = 'yes';
		getThumbnailPrivew(this, $('#user_image'));
	});
                            
	$('#registerUserModal .removeBtn').on('click', function() {
		$('#user_image').attr('src', defaultUserImgURL);
		$(this).hide();
	});
	
	$("#modifyUserBtn").click(function() {
		var conn = "${user.connChains }";
		conn = conn.replace("[", "");
		conn = conn.replace(/ /gi, "");
		conn = conn.replace("]", "");
		$("#mutags").importTags(conn);
	});
	
	$("#modifyUserForm").submit(function() {
		var tags = $("#mutags").val();
		tags = tags.split(",");
		$("#mutags").val(tags);
		$(this).find("#changed").val(changed);
	});
	
	$('#modifyUserModal .btn-success').on('click', function() {
		alert("수정되었습니다.");
	});
	
	$('#modifyUserModal .btn-primary').on('click', function() {
		$(this).closest(".modal.fade").find(".close").click();
	});
	
	$('#delelteUserModal .btn-primary').on('click', function() {
		$(this).closest(".modal.fade").find(".close").click();
	});
</script>
<!-- /User Script -->


<!-- /Custom Script -->

<!-- Validation -->
<script>
	$("#userId").keyup(function() {
		var id = $(this).val();
		if($(this).val().length > 5){
			$.ajax({
				type: 'POST',
				url: '${pageContext.request.contextPath}/user/checkId.do',
				data: {
						id: id
				},
				success: function(result){
					if($.trim(result)=="OK"){
						$("#idCheckResult").html("사용가능한 ID입니다.");
					} else {
						$("#idCheckResult").html("사용중인 ID입니다.");
					}
				}
			});
		}else{
			$("#idCheckResult").html("ID는 5자 이상입니다.");
		}
	});
	
	$("#pwCheck").keyup(function() {
		if($("#pwCheck").val() == $("#pw").val()){
			$("#pwCheckResult").html("일치");
		}else{
			$("#pwCheckResult").html("불일치");
		}
	});

	$("form").submit(function(){
		$("p.error").remove();
		$("dl dd").removeClass("error");

		$(":text, textarea").filter('[required="required"]').each(function() {

			if ($(this).val() == "") {
				$(this).before("<p class='error'>필수 항목 입니다.</p>");
			}

//			if(isNaN($(this).filter(":number").val())){
//				$(this).before("<p class='error'>숫자만 입력 가능합니다.</p>");
//			}

			if ($("p.error").length > 0) {
				//에러가 발생한 위치로 스크롤 이동
				$("html, body").animate({
					scrollTop : $("p.error.first").offset.top - 40
				}, "slow");
				//에러 항목에 대한 음영 처리
				$("p.error").parent().addClass("error");
				return false;
			}
		});
	});
</script>
<!-- Validation -->

<!-- Starrr -->
<script>
	$(document).ready(function() {
		//$(".stars").starrr();
		$('.stars-existing').each(function(){
			$(this).starrr({
				readOnly: true,
				rating: $(this).attr("data-rating")
			});
		});
		//$('.stars').on('starrr:change', function (e, value) {
		//	$('.stars-count').html(value);
		//});

		$('.stars-existing').on('starrr:change', function (e, value) {
			$('.stars-count-existing').html(value);
		});
	});
</script>
<!-- /Starrr -->

<!-- dataTable -->
<script>
	$(document).ready(function() {
		var handleDataTableButtons = function() {
			if ($("#datatable-buttons").length) {
				$("#datatable-buttons").DataTable({
					dom: "Bfrtip",
					buttons: [
						{
							extend: "copy",
							className: "btn-sm"
						},
						{
							extend: "csv",
							className: "btn-sm"
						},
						{
							extend: "excel",
							className: "btn-sm"
						},
						{
							extend: "pdfHtml5",
							className: "btn-sm"
						},
						{
							extend: "print",
							className: "btn-sm"
						},
					],
					responsive: true
				});
			}
		};

		TableManageButtons = function() {
			"use strict";
			return {
				init: function() {
					handleDataTableButtons();
				}
			};
		}();

		$('#datatable').dataTable();
		
		$('.followPostTable').each(function(){
			$(this).dataTable()
		});
			
		$('.listPostTable').each(function(){
			$(this).dataTable()
		});
		
		$('#datatable-keytable').DataTable({
			keys: true
		});

		if(tabOpt == 2){
			$('#datatable-responsive').DataTable();
		} else if(tabOpt == 4){
			$('#groupTable tfoot th').each(function() {
				var title = $(this).text();
				if(title == '소개'){
					$(this).html('<p></p>');
				} else {
					$(this).html('<input type="text" placeholder="' + title + ' 검색"/>');
				}
			});
		 	var groupTable = $('#groupTable').DataTable();
		 	groupTable.columns().every(function (){
		 		var that = this;
		 		$('input', this.footer() ).on('keyup change', function() {
		 			if (that.search() != this.value){
		 				that.search(this.value).draw();
		 			}
		 		});
		 	});
		}

		$('#datatable-scroller').DataTable({
			ajax: "js/datatables/json/scroller-demo.json",
			deferRender: true,
			scrollY: 380,
			scrollCollapse: true,
			scroller: true
		});

		$('#datatable-fixed-header').DataTable({
			fixedHeader: true
		});

		var $datatable = $('#datatable-checkbox');

		$datatable.dataTable({
			'order': [[ 1, 'asc' ]],
			'columnDefs': [
				{ orderable: false, targets: [0] }
			]
		});

		$datatable.on('draw.dt', function() {
			$('input').iCheck({
				checkboxClass: 'icheckbox_flat-green'
			});
		});

		TableManageButtons.init();
	});
</script>
<!-- /dataTable -->

<!-- jQuery Knob -->
<script>
	$(function($) {
		$(".knob").knob({
			change: function(value) {
				//console.log("change : " + value);
			},
			release: function(value) {
				//console.log(this.$.attr('value'));
				console.log("release : " + value);
			},
			cancel: function() {
				console.log("cancel : ", this);
			},
			/*format : function (value) {
			return value + '%';
			},*/
			draw: function() {
				// "tron" case
				if (this.$.data('skin') == 'tron') {
					this.cursorExt = 0.3;
					var a = this.arc(this.cv) // Arc
					,
					pa // Previous arc
					, r = 1;
					this.g.lineWidth = this.lineWidth;

					if (this.o.displayPrevious) {
						pa = this.arc(this.v);
						this.g.beginPath();
						this.g.strokeStyle = this.pColor;
						this.g.arc(this.xy, this.xy, this.radius - this.lineWidth, pa.s, pa.e, pa.d);
						this.g.stroke();
					}

					this.g.beginPath();
					this.g.strokeStyle = r ? this.o.fgColor : this.fgColor;
					this.g.arc(this.xy, this.xy, this.radius - this.lineWidth, a.s, a.e, a.d);
					this.g.stroke();

					this.g.lineWidth = 2;
					this.g.beginPath();
					this.g.strokeStyle = this.o.fgColor;
					this.g.arc(this.xy, this.xy, this.radius - this.lineWidth + 1 + this.lineWidth * 2 / 3, 0, 2 * Math.PI, false);
					this.g.stroke();
					return false;
				}
			}
		});
		// Example of infinite knob, iPod click wheel
		var v, up = 0,
		down = 0,
		i = 0,
		$idir = $("div.idir"),
		$ival = $("div.ival"),
		incr = function() {
			i++;
			$idir.show().html("+").fadeOut();
			$ival.html(i);
		},
		decr = function() {
			i--;
			$idir.show().html("-").fadeOut();
			$ival.html(i);
		};
		$("input.infinite").knob({
			min: 0,
			max: 20,
			stopper: false,
			change: function() {
				if (v > this.cv) {
					if (up) {
						decr();
						up = 0;
					} else {
						up = 1;
						down = 0;
					}
				} else {
					if (v < this.cv) {
						if (down) {
							incr();
							down = 0;
						} else {
							down = 1;
							up = 0;
						}
					}
				}
				v = this.cv;
			}
		});
	});
</script>
<!-- /jQuery Knob -->

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
		$(".tags").each(function(){
			if($(this).attr('id') == "dgtags"){
				$("#dgtags").tagsInput({
					width: 'auto',
					interactive: false
				});
			} else {
				$(this).tagsInput({
					width: 'auto',
					autocomplete_url: connChains
				});
			};
		})
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