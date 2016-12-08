<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- <%@ include file="/views/bucketlist/registerBucketlistTest.jsp"%>
 --%>
<div class="col-xs-12">
	<!--진행중인 Bucketlist-->
	<div class="x_panel">
		<!-- 진행중 버킷 헤드 -->
		<div class="x_title">
			<h2><i class="fa fa-bitbucket"></i>진행중인 버킷리스트</h2>
			<ul class="nav navbar-right panel_toolbox">
				<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
				<li class="dropdown">
				<a href="#" class="dropdown-toggle"	data-toggle="dropdown" role="button" aria-expanded="false">
					<i class="fa fa-wrench"></i></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">Settings 1</a></li>
						<li><a href="#">Settings 2</a></li>
					</ul>
				</li>
				<li><a class="close-link"><i class="fa fa-close"></i></a></li>
			</ul>
			<div class="clearfix"></div>
		</div>
		<!-- /진행중 버킷 헤드 -->
		
		<!-- 진행중 버킷 목록 -->
		<div class="x_content">
			<div class="accordion" id="accordion1" role="tablist" aria-multiselectable="true">
				<!--1st item-->
				<c:forEach items="${bucketlists }" var="bucketlist"	varStatus="status">
					<c:if test="${bucketlist.progress != 100 }">
					<div class="panel">
						<a class="panel-heading " role="tab" id="headingOne1"
							data-toggle="collapse" data-parent="#accordion1"
							href="#collapseOne${status.count  }" aria-expanded="true"
							aria-controls="collapseOne">
							<h3 class="panel-title">${bucketlist.title }</h3>
						</a>
						
						<div id="collapseOne${status.count  }"
							class="panel-collapse collapse" role="tabpanel"
							aria-labelledby="headingOne">
							<div class="panel-body">
								<div>
									<div align="center"
										style="float: left; width: 20%; height: 130px;">
										<div style="height: 130px;">
											<h4><p>진행도</p></h4>
											<input class="knob" data-width="90" data-height="120"
												data-angleOffset=90 data-linecap=round
												data-fgColor="#26B99A" value="${bucketlist.progress }">
										</div>
									</div>
								</div>

								<table class="table table-striped"
									style="width: 70%; height: 100px; margin: 20px 10px 0 140px; gravity: center; font-size: 16px">
									<div style="float: right; width: 30%;">
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
									</div>
								</table>
							</div>


							<table>
								<div>
									<br>
									<tr>
										<h2><p><strong>SOS</strong></p></h2>
										${bucketlist.sos }
									</tr>
									<br>
									<tr>
										<h2><p><strong>MEMO</strong></p></h2>
										${bucketlist.memo }
									</tr>
								</div>
							</table>
						</div>
					</div>
					</c:if>
					</c:forEach>


					<!-- bucketlist 추가 -->
					<div class="panel">
						<a data-toggle="modal" data-target="#registerBucketlistModal">
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
			<h2><i class="fa fa-bitbucket"></i>완료 된 버킷리스트</h2>
			<ul class="nav navbar-right panel_toolbox">
				<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
				<li class="dropdown">
				<a href="#" class="dropdown-toggle"	data-toggle="dropdown" role="button" aria-expanded="false">
					<i class="fa fa-wrench"></i></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">Settings 1</a></li>
						<li><a href="#">Settings 2</a></li>
					</ul>
				</li>
				<li><a class="close-link"><i class="fa fa-close"></i></a></li>
			</ul>
			<div class="clearfix"></div>
		</div>
		<!-- /진행완료 버킷 헤드 -->
		
		<!-- 진행완료 버킷 목록 -->
		<div class="x_content">
			<div class="accordion" id="accordion1" role="tablist" aria-multiselectable="true">
				<!--1st item-->
				<c:forEach items="${bucketlists }" var="bucketlist"	varStatus="status">
					<c:if test="${bucketlist.progress == 100 }">
					<div class="panel">
					
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
											<h4><p>진행도</p></h4>
											<input class="knob" data-width="90" data-height="120"
												data-angleOffset=90 data-linecap=round
												data-fgColor="#26B99A" value="${bucketlist.progress }">
										</div>
									</div>
								</div>

								<table class="table table-striped"
									style="width: 70%; height: 100px; margin: 20px 10px 0 140px; gravity: center; font-size: 16px">

									<div style="float: right; width: 30%;">
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
									</div>
								</table>
							</div>


							<table>
								<div>
									<br>
									<tr>
										<h2><p><strong>SOS</strong></p></h2>
										${bucketlist.sos }
									</tr>
									<br>
									<tr>
										<h2><p><strong>MEMO</strong></p></h2>
										${bucketlist.memo }
									</tr>
								</div>
							</table>
						</div>
					</div>
					</c:if>
					</c:forEach>
				</div>
				<!-- end of accordion -->
		</div>
	</div>
	
	
	
	
	
	<%-- 
	<div class="x_panel">
		<div class="x_title">
			<h2>
				<i class="fa fa-bitbucket"></i>완료<small></small>
			</h2>
			<ul class="nav navbar-right panel_toolbox">
				<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
				</li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false"><i
						class="fa fa-wrench"></i></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">Settings 1</a></li>
						<li><a href="#">Settings 2</a></li>
					</ul></li>
				<li><a class="close-link"><i class="fa fa-close"></i></a></li>
			</ul>
			<div class="clearfix"></div>
		</div>
		<div class="x_content">

			<!-- start accordion -->
			<div class="accordion" id="accordion1" role="tablist"
				aria-multiselectable="true">

				<!--1st item-->

				<div class="panel">
					<a class="panel-heading " role="tab" id="headingTwo"
						data-toggle="collapse" data-parent="#accordion1"
						href="#collapseTwo" aria-expanded="true"
						aria-controls="collapseOne">
						<h4 class="panel-title">${bucketlist.title }</h4>
					</a>
					<div id="collapseTwo" class="panel-collapse collapse in"
						role="tabpanel" aria-labelledby="headingOne">
						<div class="panel-body">
							<div>
								<div align="center"
									style="float: left; width: 20%; height: 130px;">
									<div style="height: 130px;">
										<h4>
											<p>진행도</p>
										</h4>
										<input class="knob" data-width="90" data-height="120"
											data-angleOffset=90 data-linecap=round data-fgColor="#26B99A"
											value="65">
									</div>
								</div>
							</div>

							<table class="table table-striped"
								style="width: 70%; height: 100px; margin: 20px 10px 0 140px; gravity: center; font-size: 16px">

								<div style="float: right; width: 30%;">
									<tr>
										<th style="width: 30%">중요도</th>
										<td>
											<div class="starrr stars-existing"
												data-rating=${bucketlist.star }></div>
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
								</div>
							</table>
						</div>


						<table>
							<div>
								<br>
								<tr>
									<h2>
										<p>
											<strong>SOS</strong>
										</p>
									</h2>
									${bucketlist.sos }
								</tr>
								<br>
								<tr>
									<h2>
										<p>
											<strong>MEMO</strong>
										</p>
									</h2>
									${bucketlist.memo }
								</tr>
							</div>
						</table>
					</div>
				</div>
			</div>
			<!-- end of accordion -->
		</div> --%>
	</div>
</div>



