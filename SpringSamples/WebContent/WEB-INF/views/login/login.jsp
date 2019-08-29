<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>      
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" type="text/css" />  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>
<link rel="stylesheet" type="text/css" href="css/style.css"/>

<!-- cookie 추가 -->

<style type="text/css">
#login_wrap {
	margin:10px;
}
#login_wrap th {
	font-weight:bold;
}
#main_wrap { 
	width:800px; 
	margin-left:auto; 
	margin-right:auto; padding:0px; 
}			
#content_wrap { 
	width: 100%; 
	height: 500px; 
	background-image:url("image/nini01.png"); 
	background-repeat:no-repeat; 
	background-position:top center;  
}
			
.login_title_warp {
	width:500px; 
	color:#FFFFFF; 
	text-align:center; 
	background-color:#3e5fba; 
	border:solid 1px #EFEFEF; 
	font-weight:bold; 
	height:60px;
}

/* table셋팅 */
.content_table { width:98%; border-bottom:1px solid #EFEFEF; border-right:1px solid #EFEFEF; border-collapse:collapse; margin-left:auto; margin-right:auto;  clear:both; }
.content_table td, .content_table th { text-align:center; border-top:1px solid #EFEFEF; border-left:1px solid #EFEFEF; padding:0.3em; }
.content_table th { background-color:#4D6BB3; color:#FFFFFF; line-height: 1.7em; font-weight:normal;}
.content_table td { padding-left:5px; text-align:left; line-height: 1.7em; }
.content_table td.contents { width:100%; height:400px; overflow:auto; }
.content_table th, .content_table td { vertical-align:middle; }

.content_table select { height:19px; border:#CCCCCC solid 1px; vertical-align:middle; line-height: 1.8em; padding-left:0px; }
.content_table select option { margin-right:10px; }

</style>

</head>
<body>

<div id="main_wrap">
	<div id="middle_wrap">
		<div id="content_wrap">
			
			<div style="width: 502px; height: 166px; margin-left: auto; margin-right: auto;
						position: relative; top: 100px;">
								
			<!-- 페이지 타이틀부 -->
			<div class="login_title_warp">
				<div style="margin-top: 12px">
					<h2>My Home Page</h2>
				</div>
			</div>
			
			<!-- 로그인 화면 : post-->
			<div id="login_wrap">
				<form action="loginAf.do" name="frmForm" id="_frmForm" method="post">
					<table class="content_table" style="width: 75%"> <!-- 이후 테이블 작업시 모든 table에 해당 클래스 추가하면 css가 통일적으로 적용 -->
					<colgroup>
						<col style="width:30%">
						<col style="width:70%">
					</colgroup>
					
					<tbody>	
						<tr>			
							<th style="background: #eeeeee; color: #3e5fba">아이디</th>
							<td>&nbsp;
								<input type="text" id="_userid" name="id" data-msg="ID를 "
										size="20px" title="아이디" style="border: 1px solid #dddddd;"><!-- 다른 곳에서 불러다 사용하려고 사용자어트리뷰트 -->
								<!-- id저장 : cookie -->
								<input type="checkbox" id="chk_save_id">ID저장
							</td>
						</tr>
						
						<tr>			
							<th style="background: #eeeeee; color: #3e5fba">패스워드</th>
							<td>&nbsp;
								<input type="text" id="_pwd" name="pwd" data-msg="패스워드를 "
										size="20px" title="패스워드" style="border: 1px solid #dddddd;"><!-- 다른 곳에서 불러다 사용하려고 사용자어트리뷰트 -->							
							</td>
						</tr>
						
						<tr>
							<td colspan="2" style="height: 50px; text-align: center;">
							<span>
								<a href="#none" id="_btnLogin" title="로그인">
									<img alt="" src="./image/login_btn.jpg">
								</a>
								<a href="#none" id="_btnRegi" title="회원가입">
									<img alt="" src="./image/regi.jpg">
								</a>
							</span>
							</td>
						</tr>
					</tbody>
					
					
					</table>
				</form>
			</div>
				
				
				
			</div>		
		</div>	
	</div>
</div>


<script type="text/javascript">

// 저장된 쿠키 변수로 저장
var user_id = $.cookie("user_id");

//doc시작시 user_id 라는 쿠키가 있을 시
if(user_id != null){	
	// alert("쿠키 있음");
	$("#_userid").val( user_id );
	$("#chk_save_id").attr("checked", "checked");
}

// login버튼 클릭
$("#_btnLogin").click(function() {	
	// id미입력
	if( $("#_userid").val().trim() == "" ){
		alert("id를 입력해 주십시오");
		$("#_userid").focus();
	}
	// pwd미입력
	else if( $("#_pwd").val().trim() == "" ){
		alert("password를 입력해 주십시오");
		$("#_pwd").focus();
	}
	// 모두기입시 controller로 이동
	else{		 
		alert("loginAf.do 이동");
		$("#_frmForm").attr({"action":"loginAf.do", "target":"_blank"}).submit();
	}
});

// id저장
$("#chk_save_id").click(function() {
	// id저장 체크
	if( $("#chk_save_id").is(":checked") ){	
		// id 미기입 상태
		if( $("#_userid").val().trim() == "" ){
			alert("id를 입력해 주십시오");
			$("#chk_save_id").prop("checked", false);			
		}
		// id 기입된 상태
		else{
			alert("쿠키저장");
			// 쿠키 저장
			$.cookie("user_id", $("#_userid").val().trim(), {expires:7, path:'/'});
		}
	}
	// id저장 체크해제
	else{
		alert("체크 없어짐");
		$.removeCookie("user_id", {path:'/'});
	}	
});

// 회원가입
$("#_btnRegi").click(function () {
	location.href="regi.do";
});

</script>


</body>
</html>





