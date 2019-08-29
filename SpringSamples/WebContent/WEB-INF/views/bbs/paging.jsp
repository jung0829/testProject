<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*
페이징 기법 1)
	<< [1][2][3][4][5][6][7][8][9][10] >>
 
페이징 기법 2) 웹툰에서 많이 사용하기도 하는 방법
	<< ...[4][5] 7 [8][9][10]... >>	
*/

int totalRecordCount;	// 전체글수 23 -> 10개씩 경우, 총 3page
int pageNumber;			// 현재 페이지 0 ~ 9 까지 ( ui에서는 [1]...[10] )
int pageCountPerScreen;	// 하나의 스크린 당 보여줄 페이지수 ( ex. 10개 )
int recordCountPerPage;	// 페이지 당 글의 개수 ( 1페이지 당 10)

// 페이지 번호 누를때마다 controller를 가도록 link를 걸어줘야한다.






// controller 통해 각 parameter 받아 변수값으로 대입
String st1 = request.getParameter("totalRecordCount");
if(st1 == null) totalRecordCount = 0;	// controller에서 param이 제대로 남어오지 않았을경우
else			totalRecordCount = Integer.parseInt(st1);

String st2 = request.getParameter("pageNumber");
if(st2 == null) pageNumber = 0;
else			pageNumber = Integer.parseInt(st2);

String st3 = request.getParameter("pageCountPerScreen");
if(st3 == null) pageCountPerScreen = 0;
else			pageCountPerScreen = Integer.parseInt(st3);

String st4 = request.getParameter("recordCountPerPage");
if(st4 == null) recordCountPerPage = 0;
else			recordCountPerPage = Integer.parseInt(st4);

// 총 페이지 수
int totalPageCount = totalRecordCount / recordCountPerPage;
//		2					23					10

if( (totalRecordCount % recordCountPerPage) != 0) {
	totalPageCount++;	// -> totalPageCount = 3 됨
}

// 해당 스크린의 시작 페이지 ( 유저 [1] or [11] or [21] or .... -> 자바 0 or 10 or 20 )
int screenStartPageIndex = ((pageNumber + 1) / pageCountPerScreen) * pageCountPerScreen;
//			0					1					10						

// 해당 스크린의 끝 페이지 ( 유저 [10] or [20] or [30] or .... -> 자바 0 or 10 or 20 )
int screenEndPageIndex = (((pageNumber + 1) / pageCountPerScreen) * pageCountPerScreen) + pageCountPerScreen;

// 끝 페이지 다시 계산
if(screenEndPageIndex > totalPageCount){ /* 시작 페이지가  */
	screenEndPageIndex = totalPageCount;
}

if((pageNumber + 1) % pageCountPerScreen == 0) {/* 시작 페이지, 끝페이지 딱떨어지면  */
	screenStartPageIndex = (((pageNumber + 1) / pageCountPerScreen) * pageCountPerScreen) - pageCountPerScreen;
	
	screenEndPageIndex = pageNumber + 1;	//0 -> 1, 9 -> 10
}
%>


<div style="float: left; width: 96%; text-align: center;">
	<!-- << -->
	<a href="#none" title="처음페이지" onclick="goPage('0')">
		<img alt="" src="image/arrow_first.gif" style="width: 9px; height: 9px;">
	</a>
	
	<!-- < -->
	<%
	if(screenStartPageIndex > 1){
		%>
		<a href="#none" title="이전페이지" onclick="goPage('<%=screenStartPageIndex-1%>')">
			<img alt="" src="image/arrow_back.gif" style="width: 9px; height: 9px;">
		</a>
		<%
	}
	%>
	
	<!-- [1] 2 [3] -->
	<%
	for(int i = screenStartPageIndex; i < screenEndPageIndex; i++){
		if(i == pageNumber){
			//현재페이지일 경우
		%>
		<span style="font-size: 9pt; color: #000000; font-weight: bold;">
			<%=i+1 %>
		</span>
		
		<%
		}else{	// 그 외 페이지 (는, 각 페이지번호마다 link 걸어주어야 한다.)
			%>
			<a href="#none" title="<%=i+1 %>페이지" onclick="goPage(<%=i %>)"
				style="font-size: 7.5pt; color: #000000; font-weight: normal;">
				[<%=i+1 %>]
			</a>
			<%		
		}
	}
	%>
	
	<!-- > -->
	<%
	if(screenEndPageIndex < totalPageCount) {
		// 스크린에 맨 끝 페이지가 현재 페이지인 경우 > next 링크 비활성화
		%>
		<a href="#none" title="다음페이지" onclick="goPage(<%=screenEndPageIndex %>)">
			<img alt="" src="image/arrow_next.gif" style="width: 9px; height: 9px;">
		</a>
		<%	
	}
	int end_page = 0;
	if(totalPageCount>0){
		end_page = totalPageCount - 1;
	}
	%>
	<!-- >> -->
	<a href="#none" title="마지막페이지" onclick="goPage(<%=end_page %>)">
		<img alt="" src="image/arrow_end.gif" style="width: 9px; height: 9px;">
	</a>
	
</div>
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 