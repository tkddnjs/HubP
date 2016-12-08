<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
  <head>
    <%@ include file="/views/user/modifyUser.jsp" %>
    <title> 회원상세 </title>
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
      
            <div class="nav_menu">
            <nav>
              <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
              </div>

              <ul class="nav navbar-nav navbar-right">
                <li class="">
                  <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    <img src="images/img.jpg" alt="">John Doe
                    <span class=" fa fa-angle-down"></span>
                  </a>
                  <ul class="dropdown-menu dropdown-usermenu pull-right">
                    <li><a href="javascript:;"> Profile</a></li>
                    <li>
                      <a href="javascript:;">
                        <span class="badge bg-red pull-right">50%</span>
                        <span>Settings</span>
                      </a>
                    </li>
                    <li><a href="javascript:;">Help</a></li>
                    <li><a href="login.html"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
                  </ul>
                </li>

                <li role="presentation" class="dropdown">
                  <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
                    <i class="fa fa-envelope-o"></i>
                    <span class="badge bg-green">6</span>
                  </a>
                  <ul id="menu1" class="dropdown-menu list-unstyled msg_list" role="menu">
                    <li>
                      <a>
                        <span class="image"><img src="images/img.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    <li>
                      <a>
                        <span class="image"><img src="images/img.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    <li>
                      <a>
                        <span class="image"><img src="images/img.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    <li>
                      <a>
                        <span class="image"><img src="images/img.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    <li>
                      <div class="text-center">
                        <a>
                          <strong>See All Alerts</strong>
                          <i class="fa fa-angle-right"></i>
                        </a>
                      </div>
                    </li>
                  </ul>
                </li>
              </ul>
            </nav>
          </div>
      
        <!-- page content -->
        <div style="padding: 10px 20px 0;" role="main">
          <div class="">
            <div class="page-title">      
            </div>
            <div class="clearfix"></div>
            <div class="row">
              <div class="col-md-8 col-sm-12 col-xs-12 col-md-offset-2">
                <div class="x_panel">
                  <div class="x_title">
                    <h2><b>회원상세</b></h2>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <br />
					<div class="form-horizontal form-label-left">
                      <div class="form-group">
                          <label for="picture" class="control-label col-md-2 col-sm-3 col-xs-12">Picture</label>
                          <div class="col-md-6 col-sm-6 col-xs-8">
                              <img width="40%" height="40%" src="${pageContext.request.contextPath}/resources/img/userImg/${user.picture}">
                          </div>
                      </div>
                      <div></div>
                      <div class="form-group">
                        <label class="control-label col-md-2 col-sm-3 col-xs-12" for="email">Email</label>
                        <div class="col-md-3 col-sm-4 col-xs-5">
                          <label id="email" class="control-label">${user.email }</label>
                        </div>
                      </div>
                      <div class="control-group">
                        <label class="control-label col-md-2 col-sm-3 col-xs-12">ConnChains</label>
                        <div class="col-md-6 col-sm-6 col-xs-8" id="connForm">
                          <c:forEach items="${user.connChains }" var="connChain">
                          	<label class="control-label">${connChain }</label>
                          </c:forEach>
                        </div>
                      </div>
                      <div class="form-group"></div>
                      <div class="form-group">
                        <label class="control-label col-md-2 col-sm-3 col-xs-12">Introduce</label>
                        <div class="col-md-6 col-sm-6 col-xs-8">
                          <textarea readonly="readonly" class="form-control" rows="3" name="introduce">${user.introduce }</textarea>
                        </div>
                      </div>
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-8 col-md-offset-4 col-sm-offset-4 col-xs-offset-4">
                          <a class="btn btn-primary" href="${pageContext.request.contextPath }/user/remove.do?userId=${user.userId}">탈퇴</a>
                          <button type="button" class="btn btn-success" data-toggle="modal" data-target="#modifyUserModal">수정</button>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /page content -->
      </div>
    </div>
  </body>
</html>
