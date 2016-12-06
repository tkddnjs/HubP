<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>모임방 등록</title>
<%@ include file="/views/layout/common.jsp"%>

</head>
<body>
<div align="right">
<%@ include file="/views/header/header.jspf" %>
</div>
<%@ include file="/views/menu.jsp" %>
	<fieldset>
		<legend>모임방 등록</legend>
		<div>
			<form class="form-inline" action="${pageContext.request.contextPath}/group/register.do" method="post">
				<table>
				
				 <tr>
				  <th>모임방 개설자</th>
				  <td><input type="text" value="${userId }"  name="managerId" readonly>
				 </tr>
					<tr>
						<th>모임방이름</th>
						<td><input type="text" name="groupName"></td>
					</tr>
					<tr>
						<th>연결고리</th>
						<td id="connForm">
							<input type="text" id="connChain" name="connChains">
							<button type="button" id="addButton">+</button>
						</td>
					</tr>
					<tr>
						<th>모임마감일</th>
						<td><input type="date" name="lastDay"></td>
					</tr>
					<tr>
						<th>최대인원</th>
						<td><input type="number" min="3" max="25" name="maxPeople"></td>
					</tr>
					<tr>
						<th>지역</th>
						<td><select class="ring" name="local" id="local">
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
								name="introduce"></textarea></td>
					</tr>
				</table>
				
				<div>
				 <input class="btn btn-primary" type="submit" value="개설" style="margin-left: 100px;">
				 <a href="${pageContext.request.contextPath }/group/list.do?listOpt=0" class="btn btn-primary">취소</a>
				</div>
			</form>
		
		</div>
	</fieldset>

	<script>
		var availableTag = [];
		var counter = 0;
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