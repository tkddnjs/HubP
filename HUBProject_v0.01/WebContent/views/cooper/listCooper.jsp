<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/views/cooper/registerCooper.jsp"%>
<%@ include file="/views/cooper/modifyCooper.jsp"%>
>
<div class="col-xs-12">
	<!-- 업체 목록 -->
	<div class="x_panel">
		<!-- 업체 목록 헤드 -->
		<div class="x_title">
			<h2>
				<i class="fa fa-bitbucket"></i>업체목록
			</h2>
			<ul class="nav navbar-right panel_toolbox">
				<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false"> <i
						class="fa fa-wrench"></i></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">Settings 1</a></li>
						<li><a href="#">Settings 2</a></li>
					</ul></li>
				<li><a class="close-link"><i class="fa fa-close"></i></a></li>
			</ul>
			<div class="clearfix"></div>
		</div>
		<!-- /업체 목록 헤드 -->

		<!-- 업체 목록 바디 -->
		<div class="x_content">
			<div class="accordion" id="accordion1" role="tablist"
				aria-multiselectable="true">
				<!--1st item-->
				<c:forEach items="${coopers }" var="cooper" varStatus="status">
					<c:set var="no" value="${status.count  }"></c:set>
						<div class="panel">
							<a class="panel-heading " role="tab" id="headingOne1"
								data-toggle="collapse" data-parent="#accordion1"
								href="#collapseOne${no  }" aria-expanded="true"
								aria-controls="collapseOne">
								<h3 class="panel-title">${cooper.coName }</h3>
							</a>
							<div id="collapseOne${no  }"
								class="panel-collapse collapse" role="tabpanel"
								aria-labelledby="headingOne">
								<div class="panel-body">
									<table class="table table-striped"
										style="width: 70%; height: 100px; margin: 20px 10px 0 140px; gravity: center; font-size: 16px">
										<tr>
											<td>${cooper.coBanner }</td>
										</tr>
									</table>
								</div>

								<div style="margin-left: 90%;">
									<button type="button" value="${no }" data-toggle="modal" name="modifyBtn"
										data-target="#modifyCooperModal">수정</button>
									<a href="${pageContext.request.contextPath }/cooper/remove.do?cooperId=${cooper.coId }"></a>
								</div>
								
							</div>
						</div>
				</c:forEach>

				<!-- 업체 등록 -->
				<c:if test="${isAdmin }">
					<div class="panel">
						<a id="registerBtn" data-toggle="modal" data-target="#registerCooperModal">
							<h1 align="center">
								<i class="fa fa-plus-circle"></i>
							</h1>
						</a>
					</div>
				</c:if>
				<!-- /업체 등록 -->
				
			</div>
		</div>
		<!-- 업체 목록  바디 -->
	</div>
	<!-- 업체 목록 -->
</div>
<script>
	var coopers = new Array();
	
	
</script>
