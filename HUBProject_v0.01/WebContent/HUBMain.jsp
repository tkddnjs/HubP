<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome HUB : Have U get a BucketList?</title>
<link href="resources/css/bootstrap-theme.min.css" rel="stylesheet">
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/bootstrap-ko.css" rel="stylsheet">
<link href="resources/css/bootstrap-ko.min.css" rel="stylsheet">
<link href="resources/css/bootstrap-responsive.css" rel="stylsheet">
<link href="resources/css/bootstrap-responsive.min.css" rel="stylsheet">
<link href="resources/css/bootstrap.css" rel="stylsheet">

<script type="text/javascript">

	
</script>
<script src="resources/js/jquery.min.js" type="text/javascript"></script>

<style>
.mainBody {
	top: 30%;
}
</style>

</head>
<body>
	<form action="login.do" method="post">
		<table align="center">
			<div class="maincenter" >
				<a href=HUBMain.jsp><h1 align="center" >HUB : Have U get a
						BucketList?</h1></a>
			<tr>
				<th>ID</th>
				<td></td>
				<td><input id="userId" name="userId" class="form-control"
					type="text" value="" placeholder="ID를 입력해주세요."></td>
				<td></td>
				<th>Password</th>
				<td></td>
				<td><input id="password" name="password" class="form-control"
					type="password" value="" placeholder="비밀번호를 입력해주세요."></td>
				<td></td>
				<th><button class="btn btn-xs btn-info btnPlay">로그인</button></th>

				<th><a class="btn btn-xs btn-info btnPlay"
					href="User/registerUser.jsp">회원가입</a></th>
			</tr>
			</div>
		</table>
	</form>
</body>
</html>
