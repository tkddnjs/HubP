<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>
<%@ include file="/View/layout/common.jsp" %>
<style>
#container {
	width: 600px;
	margin: 0 auto;
	padding: 20px;
}

h1 {
	font-size: large;
}

dl dt {
	border-left: 5px solid #6699CC;
	font-size: small;
	padding: 5px;
}

dl dt span {
	color: red;
	font-weight: bold;
}

dl dd {
	font-size: small;
	margin: 0;
	padding: 10px;
}

dl dd input {
	position: relative;
	z-index: 2;
}

dl dd label {
	position: relative;
	padding: 5px 5px 5px 25px;
	margin: 0 5px 0 -25px;
	margin-left: -25px;
	position: relative;
	z-index: 1;
}
/*	경고에 대한 style
	jQuery에서 사용*/
dl dd.error input, dl dd.error textarea, dl dd.error label {
	background: #CCFFFF;
}

dl dd p.error {
	margin: 0;
	color: red;
	font-weight: bold;
	margin-bottom: 1em;
}
</style>

</head>
<body>

	<div id="container">
		<h1>회원가입</h1>
		<form action="user/register.do" method="post">
			<dl>
				<dt>
					ID<span> (*) </span>
				</dt>
				<dd>
					<input type="text" size="20" id="userId" name="userid"
						class="validate required">
					<span id="idCheckResult"></span>
				</dd>
				<dt>
					PW<span> (*) </span>
				</dt>
				<dd>
					<input type="password" size="20" id="pw" name="pw" class="validate pw">
				</dd>
				<dt>
					PW확인<span> (*) </span>
				</dt>
				<dd>
					<input type="password" size="20" id="pwCheck" name="pwcheck"
						class="validate pw pw_check">
					<span id="pwCheckResult"></span>
				</dd>


				<dt>이메일</dt>
				<dd>
					<input type="text" size="50" id="email" name="email"
						class="validate mail mail_check">
					<span id="mailCheckResult"></span>
				</dd>

				<dt>
					연결고리(직업, 취미 등 도움을 줄 수 있는 분야)<span> (*) 1개 이상 입력</span>
				</dt>
				<dd id="connForm">
					<input type="text" size="10" name="connchain" class="validate">
					<button type="button">+</button><br>
				</dd>
				
				<dt>도움 리스트 조회 여부</dt>
				<dd class="checkboxRequired">
					<label for="toU"> 내가 <input type="checkbox"
						name="listoption" checked value=1 /></label> <label for="toMe">나를
						<input type="checkbox" name="listoption" checked value=2 />
					</label>
				</dd>

				<dt>
					자기소개<span>2000byte</span>
				</dt>
				<dd>
					<textarea name="introduce" rows="13" cols="63" class=""></textarea>
				</dd>
			</dl>
			<p>
				<input type="submit" value="가입">
			</p>
		</form>
	</div>
	
</body>
</html>