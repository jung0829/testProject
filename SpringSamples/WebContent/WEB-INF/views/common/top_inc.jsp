<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<jsp:useBean id="nows" class="java.util.Date"/><!-- Date class 객체생성 == 현재날짜,시간을 nows 호출로 사용가능-->

<div style="width:100%; height: 53px; border-bottom: 1px solid #5e5e5e;">
	<div style="width: 100%; height: 100%; clear: both; display: inline-block;">
		<div id="_title_image" style="width: 30%; float: left; display: inline;"><!-- float:방향 -->
			<img alt="" src="image/ninilogo.png" style="height: 53px">
		</div>
	
		<div id="_title_today" style="width: 70%; float: left; text-align: right;">
			<div style="position: relative; top: 27px;">
				
				<!-- 로그인한 id가 없을 경우 -->
				<c:if test="${login.id ne '' }">
					<a href="logout.do" title="로그아웃">[로그아웃]</a>&nbsp;&nbsp;&nbsp;&nbsp;
				</c:if>
				
				<!-- 로그인한 user의 name이 공백이 아닐경우 -->
				<c:if test="${login.name ne '' }">
					[${login.name }]님, 환영합니다
				</c:if>
				
				<!-- value로 가져온 date 데이터를 설정한 pattern으로 사용가능하다 -->
				<fmt:formatDate var="now" value="${nows }" pattern="yyyy/MM/dd"/>
				${now }
				
			</div>
		</div>
	
	
	
	
	
	
	
	
	</div>
</div>