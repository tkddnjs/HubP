<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Welcome HUB : Have U get a BucketList?</title>

<%@ include file="/views/user/registerUserTest.jsp"%>
<%@ include file="/views/layout/commonTest.jsp"%>

<style>
.mainBody {
	top: 30%;
}
</style>

</head>
<body>

	<form action="${pageContext.request.contextPath}/user/login.do"
		method="post">
		<div class="maincenter">
			<a href=HUBMain.jsp><h1 align="center">HUB : Have U get a
					BucketList?</h1></a>
		</div>
		<table align="center">
			<tr>
				<th>ID</th>
				<td></td>
				<td><input id="userId" name="userId" class="form-control"
					type="text" value="" placeholder="ID를 입력해주세요."></td>
				<td></td>
				<th>Password</th>
				<td></td>
				<td><input id="password" name="pw" class="form-control"
					type="password" value="" placeholder="비밀번호를 입력해주세요."></td>
				<td></td>
				<th><button class="btn btn-xs btn-info btnPlay">로그인</button></th>

				<!-- 				<th><a class="btn btn-xs btn-info btnPlay"
					href="${pageContext.request.contextPath}/user/register.do">회원가입</a></th> -->
				<th><button type="button" class="btn btn-xs btn-info btnPlay"
						data-toggle="modal" data-target="#registerUserModal">회원가입</button></th>
			</tr>

		</table>
	</form>
</body>
</html>
