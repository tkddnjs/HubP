<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>쪽지전송</title>
<%@ include file="/views/layout/common.jsp" %>
<style type="text/css">
body {
	padding: 60px;
}

h1 {
	text-align: center;
	font-weight: bold;
	color: #A0B0DB;
}

.wrap {
	width: 300px;
	margin: o;
}

.wrap textarea {
	width: 260px;
	height: 100px
	resize: none;
	overflow-y: hidden; /* prevents scroll bar flash */
	padding: 1.1em; /* prevents text jump on Enter keypress */
	padding-bottom: 14em;
	margin-bottom: 0;
	line-height: 1.6;
}
</style>

<script>
    $(document).ready(function() {
      $('.wrap').on( 'keyup', 'textarea', function (e){
        $(this).css('height', 'auto' );
        $(this).height( this.scrollHeight );
      });
      $('.wrap').find( 'textarea' ).keyup();
    });
</script>



</head>
<body>
<form action="post/send.do" method="post" >
	<div class="wrap" style="height: auto; width: 300px; border: 1px solid black;">
		<div class="wrap">
		
			<div style="background-color: #666666" align="center">
				<font color="#FFFFFF"><b>쪽지쓰기</b></font>
			</div>
		
			<div style="background-color: ;" id="receiverId">
				<font style="font-style: oblique; margin-left: 5px;" size=2>To : </font>
				<input type="text" name="receiverId">
			</div>
			
			<div class="container">
				<div class="wrap" align="center">
					<textarea name="inputMassage"></textarea>
				</div>
			</div>
			
			<div align="right">
				<font style="font-style: oblique; margin-right: 10px;" size=2>From : ${userId }</font>
			</div>
		</div>
		<br>
		
		<div class="btn-post" align="center" style="width:300px; border-top: 1px solid #CDC9C9;">
 			<button class="btn" type="submit" value='쪽지'>전송</button>
 			<button class="btn" type=button value='닫기' onClick="window.close()">닫기</button>
		</div>
	</div>
</form>
</body>
</html>