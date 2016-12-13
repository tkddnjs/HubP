<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



	<div class="col-md-12 col-sm-12 col-xs-12">

		<div class="x_panel">
			<div class="x_title">
				<h2>Helper</h2>
				<ul class="nav navbar-right panel_toolbox">
					<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
					</li>

					<li><a class="close-link"><i class="fa fa-close"></i></a></li>
				</ul>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<p class="text-muted font-13 m-b-30">Responsive is an extension
					for DataTables that resolves that problem by optimising the table's
					layout for different screen sizes through the dynamic insertion and
					removal of columns from the table.</p>
				<table id="datatable-responsive"
					class="table table-striped table-bordered dt-responsive nowrap"
					cellspacing="0" width="100%">
					<thead>
						<tr>
							<th style="width: 100px; text-align: center;">도움</th>
							<th style="width: 250px; text-align: center;">ID</th>
							<th style="width: 900px; text-align: center;">버킷리스트</th>
							<th style="width: 100px; text-align: center;">연결고리</th>
							<th style="width: 300px; text-align: center;">SOS</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>내가</td>
							<td>rlatkddnjs</td>
							<td>나이아가라 폭포 가기</td>
							<td>여행</td>
							<td>x</td>
						</tr>
						<tr>
							<td>나를</td>
							<td>yhyunsik90</td>
							<td>포토샾 정복하기</td>
							<td>포토샾</td>
							<td>63</td>
						</tr>
						<tr>
							<td>서로</td>
							<td>minjung Jin</td>
							<td>내가 쓴 시로 시집 내기</td>
							<td>문학</td>
							<td>인쇄업체 소개좀 해주세요</td>
						</tr>
						<tr>
							<td>내가</td>
							<td>ChoiSY2016</td>
							<td>컴퓨터조립하는방법 배우기</td>
							<td>컴퓨터</td>
							<td>잘 알려주실 분</td>
						</tr>
						<tr>
							<td>나를</td>
							<td>coffeeLove</td>
							<td>캘리그래피 배우기</td>
							<td>캘리그래피</td>
							<td></td>
						</tr>
						<tr>
							<td>나를</td>
							<td>Williamson</td>
							<td>이 교정하기</td>
							<td>치과</td>
							<td>61</td>
						</tr>
						<tr>
							<td>내가</td>
							<td>Chandler</td>
							<td>레인지로버 뽑기</td>
							<td>자동차</td>
							<td>딜러이신분 도와주세요</td>
						</tr>

					</tbody>
				</table>

			</div>
		</div>
	</div>
</div>
<!-- end tab2-->

<script src="${pageContext.request.contextPath}/resources/vendors/jquery/dist/jquery.min.js"></script>
