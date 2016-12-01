<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>모임방 수정</title>
<%@ include file="/views/layout/common.jsp"%>

</head>
<body>
	<fieldset>
		<legend>모임방 수정</legend>
		<div>
			<form class="form-inline" action="group/register.do" method="post">
				<table>
					<tr>
						<th>모임방이름</th>
						<td><input type="text" name="groupName" value="${group.groupName }"></td>
					</tr>
					<tr>
						<th>연결고리</th>
						<td>
							<c:forEach items="${group.connChains }" var="connChain" varStatus="status">
								<div id="conn${status.count }">
									${connChain }
									<button type="button" name="removeButton">-</button>
								</div>
							</c:forEach>
							<div id="connForm">						
								<input type="text" id="connChain" name="connChains">
								<button type="button" id="addButton">+</button>
							</div>
						</td>
					</tr>
					<tr>
						<th>모임마감일</th>
						<td><input type="date" name="lastDay" value="${group.lastDay }"></td>
					</tr>
					<tr>
						<th>최대인원</th>
						<td><input type="number" min="3" max="25" name="maxPeople" value="${group.maxPeople }"></td>
					</tr>
					<tr>
						<th>지역</th>
						<td><select class="ring" name="local" id="local" >
								<option value="서울">서울</option>
								<option value="경기">경기</option>
								<option value="강원">강원</option>
								<option value="경북">경북</option>
								<option value="경남">경남</option>
								<option value="대전">대전</option>
								<option value="대구">대구</option>
								<option value="부산">부산</option>
								<option value="인천">인천</option>
								<option value="울산">울산</option>
								<option value="전북">전북</option>
								<option value="전남">전남</option>
								<option value="충북">충북</option>
								<option value="충남">충남</option>
						</select></td>
					</tr>
					<tr>
						<th>소개</th>
						<td><textarea rows="5" style="width: 100%; height: 300px;"
								name="introduce">${group.introduce }</textarea></td>
					</tr>
				</table>
				
				<div>
					<input type="hidden" name="groupId" value="${group.groupId }">
					<input type="hidden" name="managerId" value="${group.managerId }">
					<button type="submit">수정</button>
				</div>
			</form>
		</div>
	</fieldset>

	<script>
		var availableTag = [];
		var counter = 0;
		$(document).ready(function() {
			$("#local").val('${group.local}');
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

						
			$(":button [name='removeButton']").click(function() {
				var id = $(this).closest('div').attr('id');
				$("#"+id).remove();
			});
			
			$("#connForm").on("create", function() {
				$("#connCahin"+ counter.toString()).autoComplete({
					appendTo : "#connForm",
					source : availableTags
				});
				$("#removeButton"+ counter.toString()).click(function() {
					var id = $(this).closest('div').attr('id');
					$("#" + id).remove();
				});
			});

			$("#addButton").click(function() {
				counter++;
				$("#connForm")
				.append('<div id="iconn'+ counter.toString()
				+ '"><input type="text" id="connChain"'+ counter.toString()
				+ ' name="connChains" placeholder="연결고리입력" />'
				+ '<button type="button" id="removeButton"'+ counter.toString()
				+ '">-</button></div>')
				.trigger("create");
			});
			
		});

		function list(array) {
			for (var i = 0; i < array.length; i++) {
				availableTag.push(array[i]);
			}
		};
	</script>

</body>
</html>