<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/views/bucketlist/registerBucketlist.jsp"%>
<%@ include file="/views/bucketlist/modifyBucketlist.jsp"%>

<div class="col-xs-12">
	<!--진행중인 Bucketlist-->
	<div class="x_panel">
		<!-- 진행중 버킷 헤드 -->
		<div class="x_title">
			<h2>
				<i class="fa fa-bitbucket"></i>진행중인 버킷리스트
			</h2>
			<ul class="nav navbar-right panel_toolbox">
				<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
				<li><a class="close-link"><i class="fa fa-close"></i></a></li>
			</ul>
			<div class="clearfix"></div>
		</div>
		<!-- /진행중 버킷 헤드 -->

		<!-- 진행중 버킷 목록 -->
		<div class="x_content">
			<div class="accordion" id="accordion1" role="tablist"
				aria-multiselectable="true">
				<!--1st item-->
				<c:forEach items="${bucketlists }" var="bucketlist"
					varStatus="status">
					<c:set var="no" value="${status.count  }"></c:set>
					<c:if test="${bucketlist.progress != 100 }">
						<div class="panel">
						
							<ul class="nav navbar-right panel_toolbox" style="padding-top: 13px">
                          		<li><button class="fa fa-edit" value="${no }" data-toggle="modal" 
                          		name="modifyBtn" data-target="#modifyBucketlistModal"
                          		style="font-size:20px; background:none!important; border:none;"></button>
                          		</li>
                          		
                          		<li><button class="fa fa-trash-o" value="${bucketlist.bucketlistId }" data-toggle="modal" 
                           			name="removeBucketlistBtn" data-target="#removeBucketlistModal"
                           			style="font-size:20px; background:none!important; border:none;"></button>
                          		</li>
                          		
                           		<!-- <li><form action="${pageContext.request.contextPath}/bucketlist/remove.do">
                           			<button class="fa fa-trash-o" style="font-size:20px; background:none!important; border:none;"
                           			type="submit" name="bucketlistId" value="${bucketlist.bucketlistId }"></button>
                           		</form></li> -->
                       		</ul>
						
							<a class="panel-heading " role="tab" id="headingOne1"
								data-toggle="collapse" data-parent="#accordion1"
								href="#collapseOne${no  }" aria-expanded="true"
								aria-controls="collapseOne">
								<h3 class="panel-title">${bucketlist.title }</h3>
							</a>
							
							
							<div id="collapseOne${no  }" class="panel-collapse collapse" 
							role="tabpanel" aria-labelledby="headingOne">
								<div class="panel-body">
									<div>
										<div align="center"
											style="float: left; width: 20%; height: 130px;">
											<div style="height: 130px;">
												<h4>
													<p>진행도</p>
												</h4>
												<input class="knob" readonly="readonly" data-width="90" data-height="120"
													data-angleOffset=90 data-linecap=round
													data-fgColor="#26B99A" value="${bucketlist.progress }">
											</div>
										</div>
									</div>

									<table class="table table-striped"
										style="width: 70%; height: 100px; margin: 20px 10px 0 140px; gravity: center; font-size: 16px">
										<tr>
											<th style="width: 30%">중요도</th>
											<td>
												<div class="starrr stars-existing" data-rating="${bucketlist.star }"></div>
											</td>
										</tr>
										<tr>
											<th>목표기간</th>
											<td>${bucketlist.goal }</td>
										</tr>
										<tr>
											<th>연결고리</th>
											<td>${bucketlist.connChains }</td>
										</tr>
									</table>
								</div>
								<div style="margin: 20px 10px 0 10%; gravity: center;">
									<table>
										<tr>
											<th><h2>
													<strong>SOS</strong>
												</h2></th>
										</tr>
										<tr>
											<td>${bucketlist.sos }</td>
										</tr>
										<tr>
											<th><h2>
													<strong>메모</strong>
												</h2></th>
										</tr>
										<tr>
											<td>${bucketlist.memo }</td>
										</tr>
									</table>
									
								</div>
								
							</div>
						</div>
					</c:if>
				</c:forEach>


				<!-- bucketlist 추가 -->
				<div class="panel">
					<a id="registerBtn" data-toggle="modal" data-target="#registerBucketlistModal">
						<h1 align="center">
							<i class="fa fa-plus-circle"></i>
						</h1>
					</a>
				</div>
			</div>
			<!-- end of accordion -->
		</div>
	</div>



	<!--진행완료 Bucketlist-->
	<div class="x_panel">
		<!--진행완료 버킷 헤드 -->
		<div class="x_title">
			<h2>
				<i class="fa fa-bitbucket"></i>완료 된 버킷리스트
			</h2>
			<ul class="nav navbar-right panel_toolbox">
				<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
				<li><a class="close-link"><i class="fa fa-close"></i></a></li>
			</ul>
			<div class="clearfix"></div>
		</div>
		<!-- /진행완료 버킷 헤드 -->

		<!-- 진행완료 버킷 목록 -->
		<div class="x_content">
			<div class="accordion" id="accordion1" role="tablist"
				aria-multiselectable="true">
				<!--1st item-->
				<c:forEach items="${bucketlists }" var="bucketlist"
					varStatus="status">
					<c:if test="${bucketlist.progress == 100 }">
						<div class="panel">
						
							<ul class="nav navbar-right panel_toolbox" style="padding-top: 13px">
                          		<li><button class="fa fa-edit" value="${status.count }" data-toggle="modal" 
                          			name="modifyBtn" data-target="#modifyBucketlistModal"
                          			style="font-size:20px; background:none!important; border:none;"></button>
                          		</li>
                          		
                           		<li><button class="fa fa-trash-o" value="${bucketlist.bucketlistId }" data-toggle="modal" 
                           			name="removeBucketlistBtn" data-target="#removeBucketlistModal"
                           			style="font-size:20px; background:none!important; border:none;"></button>
                          		</li>
                       		</ul>
						
							<a class="panel-heading " role="tab" id="headingOne1"
								data-toggle="collapse" data-parent="#accordion1"
								href="#collapseTwo${status.count  }" aria-expanded="true"
								aria-controls="collapseOne">
								<h3 class="panel-title">${bucketlist.title }</h3>
							</a>

							<div id="collapseTwo${status.count  }"
								class="panel-collapse collapse" role="tabpanel"
								aria-labelledby="headingOne">
								<div class="panel-body">
									<div>
										<div align="center"
											style="float: left; width: 20%; height: 130px;">
											<div style="height: 130px;">
												<h4>
													<p>진행도</p>
												</h4>
												<input class="knob" readonly="readonly" data-width="90" data-height="120"
													data-angleOffset=90 data-linecap=round
													data-fgColor="#26B99A" value="${bucketlist.progress }">
											</div>
										</div>
									</div>

									<table class="table table-striped"
										style="width: 70%; height: 100px; margin: 20px 10px 0 140px; gravity: center; font-size: 16px">

											<tr>
												<th style="width: 30%">중요도</th>
												<td>
													<div class="starrr stars-existing" id="star"
														data-rating="${bucketlist.star }"></div>
												</td>
											</tr>
											<tr>
												<th>목표기간</th>
												<td>${bucketlist.goal }</td>
											</tr>
											<tr>
												<th>연결고리</th>
												<td>${bucketlist.connChains }</td>
											</tr>
									</table>
								</div>
								<br>
								<div>
									<table>
										<tr>
											<th><p><strong>SOS</strong></p></th>
										</tr>
										<tr>
											<td>${bucketlist.sos }</td>
										</tr>
										<tr>
											<th><p><strong>MEMO</strong></p></th>
										</tr>
										<tr>
											<td>${bucketlist.memo }</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
			<!-- end of accordion -->
		</div>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="removeBucketlistModal" role="dialog" style="margin-top: 20%;">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">버킷리스트삭제</h4>
			</div>
   			<div class="modal-body" style="text-align: center;">
				<form action="${pageContext.request.contextPath}/bucketlist/remove.do" id="removeBucketlistForm" method="get">
					<h4>삭제하시겠습니까?</h4><br>
					<button type="submit" class="btn btn-success" name="bucketlistId">삭제</button>
					<button type="button" class="btn btn-primary">취소</button>
				</form>
			</div>
  		</div>
	</div>
</div>