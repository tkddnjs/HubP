<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Welcome HUB : Have U get a BucketList?</title>

<%@ include file="/views/user/registerUser.jsp"%>
<%@ include file="/views/layout/commonCSS.jsp"%>

<style>
.mainBody {
	top: 30%;
}
</style>

</head>
<body style="background-size:100%; background-image: url(${pageContext.request.contextPath}/resources/img/mainPicture.jpg);">

	<body class="login">
      <div class="login_wrapper" style="margin:18% 0 0 66%; height:400px; border:2px solid #cf9c36; 
      color:#cf9c36;  background : rgba(245, 234, 212, 0.3);">
        <div class="animate form login_form"  style="margin-top:15%;" >
          <section class="login_content" style="width:250px; float:center; ">
            <form action="${pageContext.request.contextPath}/user/login.do" method="post">
              <h1>HUB LogIn</h1>
              <div >
                <input id="userId" name="userId" class="form-control"
					type="text" value="" placeholder="Login ID">
              </div>
              <div>
                <input id="password" name="pw" class="form-control"
					type="password" value="" placeholder="Password">
              </div>
              <div style="margin-left:20px;">
                <button class="btn btn-default submit">로그인</button>
                
                <button type="button" class="btn btn-default submit" 
						data-toggle="modal" data-target="#registerUserModal">회원가입</button>
              </div>
              <div class="clearfix"></div>
              
            </form>
          </section>
        </div>
      </div>
  </body>
	
</body>
</html>
