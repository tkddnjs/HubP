<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title> 업체등록 </title>
<%@ include file="/views/layout/common.jsp" %>

<!-- <script type="text/javascript">
	$(document).ready(function() {
		$("#id").keyup(function() {
			if ($("#id").val().length > 5) {
				var id = $(this).val();

				$.ajax({
					type : 'POST',
					url : 'checkId.do',
					data : {
						id : id
					},
					success : function(result) {
						if ($.trim(result) == "ok") {
							$("#idCheckResult").html("사용가능한 ID입니다.");
						} else {
							$("#idCheckResult").html("사용중인 ID입니다.");
						}
					}
				});

			} else {
				$("#idCheckResult").html("ID는 5자 이상입니다.");
			}
		});
	});
</script> -->
</head>
<body>
	<form action="registerCooper.do" method="post">
		<table>
			<tr>
				<th>업체이름</th>
				<td>
					<input type="text" id="cooperName" name="cooperName" placeholder="업체이름입력" />
					<span id="cooperNameCheckResult"></span>
				</td>
			</tr>
			<tr>
				<th>만료일자</th>
				<td>
					<input type="text" id="lastDay" name="lastDay" placeholder="만료일자입력" />
					<span id="lastDayCheckResult"></span>
				</td>
			</tr>
			<tr>
				<th>연결고리</th>
				<td>
					<select id="cooperConnChain" name="cooperConnChain">
						<option value="여행">여행</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>배너정보</th>
				<td>
					<input type="text" id="cooperBanner" name="cooperBanner" placeholder="배너정보입력" />
					<span id="cooperBannerCheck"></span>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>