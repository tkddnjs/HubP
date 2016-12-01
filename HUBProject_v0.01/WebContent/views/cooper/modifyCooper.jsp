<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title> 업체수정 </title>
<%@ include file="/views/layout/common.jsp" %>

</head>
<body>
	<form action="${pageContext.request.contextPath}/cooper/modify.do" method="post">
		<table>
			<tr>
				<th>업체이름</th>
				<td>
					<input type="text" name="coName" value="${cooper.coName }" placeholder="업체이름입력" />
				</td>
			</tr>
			<tr>
				<th>만료일자</th>
				<td>
					<input type="date" name="lastDay" value="${cooper.lastDay }" placeholder="만료일자입력" />
				</td>
			</tr>
			<tr>
				<th>연결고리</th>
				<td>
					<c:forEach items="${cooper.connChains }" var="connChain" varStatus="status">
						<div id="conn${status.count }">
							${connChain }
							<button type="button" name="removeButton">-</button>
						</div>
					</c:forEach>
					<div id="connForm">
						<input type="text" id="connChain" name="connChains" placeholder="연결고리입력" />
						<button type="button" name="addButton">+</button>
					</div>
				</td>
			</tr>
			<tr>
				<th>배너정보</th>
				<td>
					<input type="text" name="coBanner" value="${cooper.coBanner}" placeholder="배너정보(url)입력" />
				</td>
			</tr>
		</table>
		<div>
			<input type="hidden" name="startDay" value="${cooper.startDay }">
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
			
			$(":button [name='removeButton']").click(function(){
				var id = $(this).closest('div').attr('id');
				$("#"+id).remove();
			});
			
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
			
		});
		
		$("form").submit(function(event) {
			//에러 초기화 추가로 붙는 내용 삭제
			$("p.error").remove();
			$("dl dd").removeClass("error");

			//filter메소드를 이용해서 text, textareea 요소들 중에 validate
			//클래스를 갖고 있는 것만 찾는다.
			
			$(":text").filter("[name='connChains']").each(function(){
				if($(this).val() === ""){
					if($(":hidden").filter("[name='connChains']").length > 0){
						$(this).closest("div").remove();						
					} else {
						$(this).before("<p class='error'>필수 입력 사항입니다.</p>");
					}
				}
			});
			
			if ($("p.error").length > 0) {
				//에러가 발생한 위치로 스크롤 이동
				$("html, body").animate({
					scrollTop : $("p.error.first").offset.top - 40
				}, "slow");
				//에러 항목에 대한 음영 처리
				$("p.error").parent().addClass("error");
				event.preventDefault();
			}
		});
		
		
		function list(array){
			for(var i=0; i<array.length; i++){
				availableTag.push(array[i]);
			}
		};
		
	</script>
	
</body>
</html>