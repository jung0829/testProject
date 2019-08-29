<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %> <!-- tiles -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- coreTag -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!-- format : 날짜, 시간표현등에 사용-->

<%-- <fmt:frquestEncoding value="utf-8"/> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<tiles:insertAttribute name="header"/>	<!-- header : css나 script 링크등이 주로 소속됨  -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css"><!-- 경로앞 scriptlet : 정확한 경로 설정가능  -->
</head>
<body>

<div id="body_wrap">
	<div id="main_wrap">
		<tiles:insertAttribute name="top_inc"/>
		<tiles:insertAttribute name="top_menu"/>		
	</div>
	
	<div id="middle_wrap">
		<div id="sidebar_wrap">
			<tiles:insertAttribute name="left_menu"/>
		</div>
		
		<div id="content_wrap">
			<div id="content_title_wrap"><!-- content에 해당 view의 타이틀 달아준다 -->
				<div class="title">${doc_title }</div>	<!-- controller에서 doc_type으로 날려줌..? -->
			</div>			
			<tiles:insertAttribute name="main"/>
		</div>
	</div>
	
	<div id="footer_wrap">
		<tiles:insertAttribute name="bottom_inc"/>
	</div>
</div>

<script type="text/javascript">
$(document).ready(function () {
	$("#content_title_wrap div.title").css("background-img", "url('./image/ico_sub_sb.gif')");
});
</script>

</body>
</html>
