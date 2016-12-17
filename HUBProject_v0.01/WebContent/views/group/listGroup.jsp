<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="/views/group/registerGroup.jsp"%>
<%@ include file="/views/group/modifyGroup.jsp"%>
<%@ include file="/views/group/detailGroup.jsp"%>

<div class="col-md-12 col-sm-12 col-xs-12">
	<div class="x_panel">
		<div class="x_title">
			<h2>
				<!-- <i class="fa fa-bitbucket"></i>모임방 -->
				<form action="${pageContext.request.contextPath }/group/list.do" method="get" class="listOpt selector">
					<input type="hidden" name="userId" value="${sessionScope.userId }">
					<button type="submit" name="listOpt" value="0"
					style="border: hidden; background: #ecc7c0; font-size: 15px; font-weight: 800; width: 100px; height: 30px;">전체목록</button>
					
					<button type="submit" name="listOpt" value="1"
					style="border: hidden; background: #ecc7c0; font-size: 15px; font-weight: 800; width: 100px; height: 30px;">나의모임방</button>
					
					<button id="registerBtn" type="button" data-toggle="modal" data-target="#registerGroupModal"
					style="border: hidden; background: #ecc7c0; font-size: 15px; font-weight: 800; width: 100px; height: 30px;">모임방등록</button>
				</form>
			</h2>
			<ul class="nav navbar-right panel_toolbox">
				<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
				</li>

				<li><a class="close-link"><i class="fa fa-close"></i></a></li>
			</ul>
			<div class="clearfix"></div>
		</div>
		<div class="x_content">
			<div>
				
			</div>
			<table id="groupTable"
				class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
				<thead>
					<tr>
						<th style="width: 100px; text-align: center;">지역</th>
						<th style="width: 550px; text-align: center;">모임방이름</th>
						<th style="width: 150px; text-align: center;">개설자</th>
						<th style="width: 400px; text-align: center;">연결고리</th>
						<th style="width: 600px; text-align: center;">소개</th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<th style="width: 100px;">지역</th>
						<th style="width: 550px;">모임방이름</th>
						<th style="width: 150px;">개설자</th>
						<th style="width: 400px;">연결고리</th>
						<th style="width: 600px;">소개</th>
					</tr>
				</tfoot>
				<tbody>
					<c:forEach items="${groups }" var="group" varStatus="status">
						<c:set var="no" value="${status.count }"></c:set>
						<tr>
							<td style="text-align: center;">${group.local }</td>
							<td style="text-align: center;">
								<button style="border: 0; background: transparent;" type="button" name="detailGroupBtn" value="${no }"
										data-toggle="modal" data-target="#detailGroupModal">${group.groupName }</button>
							</td>
							<td style="text-align: center;">${group.managerId }</td>
							<td style="text-align: center;">${group.connChains }</td>
							<td>${group.introduce }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
<!-- end tab2-->
