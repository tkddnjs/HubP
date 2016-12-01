<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title> 업체등록 </title>
<%@ include file="/views/layout/common.jsp" %>

</head>
<body>
	<form action="${pageContext.request.contextPath}/cooper/register.do" method="post">
		<table>
			<tr>
				<th>업체이름</th>
				<td>
					<input type="text" id="coName" name="coName" placeholder="업체이름입력" />
					<span id="coNameCheckResult"></span>
				</td>
			</tr>
			<tr>
				<th>만료일자</th>
				<td>
					<input type="date" id="lastDay" name="lastDay" placeholder="만료일자입력" />
					<span id="lastDayCheckResult"></span>
				</td>
			</tr>
			<tr>
				<th>연결고리</th>
				<td id="connForm">
					<input type="text" id="connChain" name="connChains" placeholder="연결고리입력" />
					<button type="button" name="addButton">+</button>
				</td>
			</tr>
			<tr>
				<th>배너정보</th>
				<td>
					<input type="text" id="coBanner" name="coBanner" placeholder="배너정보(url)입력" />
					<span id="coBannerCheck"></span>
				</td>
			</tr>
		</table>
		<div>
			<button class="btn btn-xs btn-default" type="submit">등록</button>
		</div>
	</form>
	
	<script>
		var availableTag = [];
		var counter = 0;
		var temp;
		$(document).ready(function() {
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
					result = result.split(",");
					list(result);
				}
			});
			
			$("#connChain").autocomplete({
				source : availableTags
			})
			
			$("#connForm").on("create", function(){
				$("#connCahin" + counter.toString()).autoComplete({
					appendTo: "#connForm",
					source: availableTags
				})
				$("#removeButton"+counter.toString()).click(function() {
					var id = $(this).closest('div').attr('id');
					$("#"+id).remove();
				})
			})
			
			$("#addButton").click(function () {
				counter++;
				$("#connForm")
				.append('<div id="iconn'+counter.toString()
						+ '"><input type="text" id="connChain"' + counter.toString()
						+ ' name="connChains" placeholder="연결고리입력" />'
						+ '<button type="button" id="removeButton"' + counter.toString()
						+ '">-</button></div>')
				.trigger("create");
			});
			
/*			$("#coName").keyup(function() {
				if ($("#coName").val().length > 5) {
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
			});*/
			
		});
		
		function list(array){
			for(var i=0; i<array.length; i++){
				availableTag.push(array[i]);
			}
		};
	

			
	</script>

	
</body>
</html>