<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String contextPath = request.getContextPath(); 

	Member loginMember = (Member)session.getAttribute("loginMember");
	
	String alertMsg = (String)session.getAttribute("alertMsg");
%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>header</title>

    <!-- 글씨체 css -->
    <link href="resources/css/subwherefonts.css" rel="stylesheet">

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script> 

    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <style>
        
        
        #header{ /* 헤더 전체 영역 관련 */
            /* border: 2px solid blue; */
            width: 1400px;
            height: 168px;
            margin: auto;
            box-sizing: border-box;
        }

        #navigator{ /*네비바 영역 관련*/
            /* border: 2px solid yellowgreen; */
            width: 1400px;
            height: 72px;
            margin: auto;
            box-sizing: border-box;
            background-color: rgb(236, 236, 236);
            border-radius: 5px;
        }

        #header>div{ /*네비바 제외한 헤더 부분 영역 나누기*/
            /* border: 1px solid yellow; */
            height: 100%;
            float: left;
            box-sizing: border-box;
        }
        
        /*--------------header1-------------*/
        #header_1{
            width: 30%;
            position: relative;
        }

        #header_1 img{
            /* border: 2px solid lightgreen; */
            /*===정중앙 스타일===*/
            margin: auto;
            position: absolute;
            top: 0;
            bottom:0;
            left: 0;
            right: 0;
            /*===================*/
            width: 85%;
        }

        /*--------------header2-------------*/
        #header_2{
            width: 35%;
            position: relative;
        }

        #search_form {
            width: 80%; height: 25%;
            /*===정중앙 스타일===*/
            margin: auto;
            position: absolute;
            top: 0;
            bottom:0;
            left: 0;
            right: 0;
            /*===================*/
            /* border: 2px solid orangered; */
        }
        
        #search_form div{
           display: inline;
        }

        #search_btn{margin-left: 5px;}

        select{ /*select박스 스타일*/
            border-color: lightgray;
            border-width: 2px;
            font-size: 14px;
            border-radius: 7px;
        }

        /*--------------header3-------------*/
        #header_3{
            width: 15%;
            position: relative;
        }
        #weather{
            /* border: 3px solid purple; */
            width: 160px;
            height: 70px;
            /*===정중앙 스타일===*/
            margin: auto;
            position: absolute;
            top: 0;
            bottom:0;
            left: 0;
            right: 0;
            /*===================*/
        }

        #weather>a{text-decoration: none;}

        /*--------------header4-------------*/
        #header_4{
            width: 20%;
            position: relative;
        }
        
        /*-----------로그인 전-----------*/
        #before_login a{
            text-decoration: none;
            font-size: large;
            font-weight: 500;
            border:none;
        }

        #before_login{
            position: absolute;
            top: 65px;
            left: 100px;
        }

        #before_login a:hover{
            color: rgb(74, 182, 254);
            font-size: larger;
        }


        /*-----------로그인 후-----------*/
        
        .user_info{
            /* border: 2px solid lightskyblue; */
            width: 200px;
            height: 80px;
            
            /*===정중앙 스타일===*/
            margin: auto;
            position: absolute;
            top: 0;
            bottom:0;
            left:15px;

        }
        .user_info img{ /*프사*/
            /* border: 1px solid; */
            width: 65px;
            margin-top: 5px;
        }
        .user_info b{ /*닉네임*/
            /* border: 1px solid; */
            font-size: 17px;
            vertical-align: sub;
        }
        .pro { /*프사 여부에 따라 다르게 변함, 테두리 동그랗게*/
            margin-top: 50px;
            width: 70px;
            border-radius: 50px;
        }

        #usermenu{ /*햄버거버튼 속성*/
            background-color: transparent; /* 뒷 배경을 부모와 같게 맞춰줌 */
            border:none;
            float: right;
            margin-top: 55px;

        }

        #usermenu>img{ /*햄버거사진*/
            /* border: 1px solid; */
            width: 45px;
        }

        #usermenu_page{ /*팝업창 틀*/
            width: 400px; 
            height: 500px;
            position: absolute;
            display: none;
            border: 0.1px solid #f1f2f3;
            border-radius: 10px;
            background-color: #f1f2f3;
            z-index: 9999;
            right: 2px;
            top: 120px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.7);
        }
        
        #usermenu_page b,p{
        	font-family: 'SUITE-Regular';
        }
        
        .usermenu_page .btn{
        	font-family: 'LINESeedKR-Bd';
        	font-size:17px;
        }

        #closeUserMenu{ /*usermenu 닫기 x 버튼*/
            float: right;
            border: none;
            background-color: transparent;
            font-weight: 700;
            font-size: x-large;
            margin: 10px;
            z-index: 99999;
        }
        #closeUserMenu:hover{ /*usermenu 닫기 x 버튼 hover*/
            color: #686868;
        }

        #overlay { /*뒷 배경 어둡게*/
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 9998;
        }
        
        /* ==================== usermenu 안 세부 화면들 ==================== */

        /* usermenu_page_content 공통*/
        .usermenu_page{
            position: relative;
            width: 100%;
            height: 100%;
        }
        .usermenu_page table{
            /*===정중앙 스타일===*/
            margin: auto;
            position: absolute;
            top: 0;
            bottom:0;
            left: 0;
            right: 0;
            /*===============*/
            width: 250px;
        }
        .usermenu_page h3{ /* 메뉴 제목 */
            text-align: center;
            margin-top: 22%;
            font-weight: 700;
            font-family: 'Giants-Bold';
        }
        .form-control{
            /* input 공통 부트스트랩 */
            font-size: 14px;
            font-family: 'SUITE-Regular';
        }

        /* 로그인 usermenu_page_login */
        #usermenu_page_login table{
            margin-top: 170px;
            height: 200px;
        }
        #usermenu_page_login a{ /* 로그인 버튼 아래 ID찾기, 비번찾기, 회원가입*/
            /*text-decoration: none;*/
            color: rgb(96, 96, 96);
            font-weight: 400;
            font-family: 'LINESeedKR-Bd';
            font-size: 16px;
        }
        #usermenu_page_login a:hover{ /* 로그인 버튼 아래 ID찾기, 비번찾기, 회원가입*/
            text-decoration: none;
            color: #007fff;
            font-weight: 400;
        }

        /* 로그인 성공 후 usermenu_page_login_success */
        #usermenu_page_login_success table{
            margin-top: 250px;
            /* width: 250px; */
            height: 150px;
        }
        #usermenu_page_login_success_userinfo{ /*프사, 이름*/
            /*===정중앙 스타일===*/
            margin: auto;
            position: absolute;
            top: 0;
            bottom:0;
            left: 0;
            right: 0;
            /*===================*/
            
            text-align: center;
            margin-top: 20%;
            font-weight: 700;
        }

        /* 찾기 usermenu_page_find */
        .find_id_or_pwd{ 
            /* border: 3px solid magenta; */
            margin: auto;
            width: 75%;
            height: 300px;
            margin-top: 30px;
        }
        .tab-content{ /* 탭 내용*/
            background-color: white;
            width: 100%;
            height: 250px;
        }
        #find_id_or_pwd_pills{ /*탭버튼 뒷배경*/
            background-color: rgb(174, 174, 174);
            border-radius: 5px;
        }
        /* #home table{ 
            height: 120px;
            margin-top: 230px;
            border: 1px solid red;
        } */
        #hometable1{ /* ID 찾기 테이블 */
            height: 160px;
            margin-top: 230px;
        }
        #hometable2{
            height: 120px;
            margin-top: 230px;
            text-align: center;
        }
        #hometable2 button{
            width: 115px;
            font-size: 14px;
            margin: 3px;
        }
        #hometable2 button:hover{
            background-color: #007fff;
            border: 1px solid #007fff;
        }

        #menu1 table{ /* 비밀번호 찾기 테이블 */
            height: 190px;
            margin-top: 220px;
        }
        
        /* 비밀번호 변경 usermenu_page_change_pwd */
        #usermenu_page_change_pwd table{
            height: 200px;
            margin-top: 170px;
        }
        #usermenu_page_change_pwd input{
            font-size: 11px;
        }

        /* 비밀번호 변경 성공, ID/비번 찾기 실패*/
        .usermenu_page_plain table{
            width: 270px;
            text-align: center;
            font-weight: 700;
        }
        
        
        
        /*--------------navigator-------------*/

        #navigator li{
            /* border: 1px solid; */
            margin-top: 1px;
        }

        #navigator a{ /*네비바 버튼 요소 관련*/
            text-align: center;
            width: 140px;
            margin: 15px;
            margin-left: 30px;
            margin-right: 30px;
            border-radius: 12px;
        }
        
        #navigator>ul>li>a{ /*네비바 버튼 안 글자*/
        	font-style:oblique;
        	font-weight: 400;
            font-size: 17px;
            font-family:'Giants-Bold';
        }

        .btn-light{ /*홈, 공지사항 버튼*/
            background-color: #fffefe;
            border: 1px #ededed;
        }
        
        /* 스위트 */
		@font-face {
		    font-family: 'SUITE-Regular';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/SUITE-Regular.woff2') format('woff2');
		    font-weight: 400;
		    font-style: normal;
		}
		
		* {
			font-family: 'SUITE-Regular';
		}
        
       
    </style>
</head>
<body>

		<%if(alertMsg != null){ %>
		      <script>
		         alert("<%=alertMsg%>");
		      
		      </script>   
		      <%
		      
		      // 회원가입 성공 후 다른 메뉴를 누르면 계속 alert가 발생 
		      // alert 막기 (하단 코드)
		      
		      %>
		      
		      <% session.removeAttribute("alertMsg"); %>
		      
		
		   <%} %>
    
    <div id="header">
        
        <div id="header_1">
            <!-- 로고 -->
            <a href="<%=contextPath%>"><img src="resources/images/logo_blue_subwhere.png" alt="logo"></a>
        </div>

        <div id="header_2">
            <!-- 역 검색창 -->

            
            <form action="<%=contextPath %>/searchStation.do?cpage=1" id="search_form" method="get">
				
                <div id="search_station">
                    
                    <select id="station-line" name="station-line" onclick="categoryChange();" style="height: 36px; width: 170px; font-family: 'SUITE-Regular';">
                      
                        <option>호선 번호 선택</option>
                        <option value="1">1호선</option>
                        <option value="2">2호선</option>
                        <option value="3">3호선</option>
                        <option value="4">4호선</option>
                        <option value="5">5호선</option>
                        <option value="6">6호선</option>
                        <option value="7">7호선</option>
                        <option value="8">8호선</option>
                        <option value="9">9호선</option>
    
                    </select>
                    
                    <select id="stationName" name="station-name" style="height: 36px; width: 150px; font-family: 'SUITE-Regular';">
                       <option >역 명 선택</option>
                    </select>
                    
                    

                    <script>
                    // selectbox를 클릭했을 때 ajax
            
                        function categoryChange(){
                        
                        $.ajax({
                            url:"selectStation.do",
                            data:{num:$("#station-line option:selected").val()},   // num값에 호선 번호를 가져오기! 


                            success:function(list){
                                if(list == null){  // '호선 선택'을 눌렀을 경우
                                    $("station-name").html("");   // 먼저 역명 부분을 모두 비워주기
                                    let val = "<option>역 명 선택</option>";  //역명 선택을 그려주기
                                    $("station-name").html(val);  // 역명이 들어가는 부분에 val값 넣기 
                                }else{
                                    
                                    // 만약 호선이 잘 넘어왔다면
                                    console.log(list)
                                    let val = "";
                                    console.log($("station-name").html(val));

                                for(let i=0; i<list.length; i++){
                                    
                                    val += "<option value='" + list[i].stationNo +"'>" + list[i].stationName + "</option>"
                                    
                                    $("#stationName").html(val);  // val에 옵션을 그려주고 selectbox에 넣어주기
                                    
                                	}
                                    
                                }
                            },
                            error:function(){}
                            })

                        }
                    
                    

                    </script>

                    <!-- 검색버튼 -->
                    <div id="search_btn" style="font-family: 'SUITE-Regular';">
                    	<button type="submit" class="btn btn-primary">검색</button>
                    </div>
                   
            
                </div>
            
            	<input type="hidden" name="cpage" value="1">
            
            </form>
            
        </div>

        <div id="header_3">
            <div id="weather">
                <!-- Weather widget by https://meteodays.com -->
                <a id="ms-informer-link-1c0f2690c0b614035a8e37b7b9f11ada" class="ms-informer-link" href="https://meteodays.com/ko/weather/overview/seoul">서울날씨</a>
                <script class="ms-informer-script" src="https://meteodays.com/ko/informer/script/1c0f2690c0b614035a8e37b7b9f11ada"></script>
                <!-- End -->
            </div>
        </div>

        <div id="header_4">
        
        
        	<% if(loginMember == null){ %>
        
	            <!-- case1. 로그인 전 : 로그인 -->
	            <div id="before_login">
	                <a  href="#" onclick="openUserMenu()">Login</a>
	            </div>
	
	            <div id="overlay"></div>
	            
	            
			<%}else { %>

            	<!-- case2. 로그인 후 : 프사+닉네임 -->
	            <div id="after_login">

				  <%if(loginMember.getProfileImg().equals("resources/profile_upfiles/null")){ %>
					<div class="user_info">
						<img class="pro" src="resources/images/profile_img_nocamera.png" alt="profile">
						<b><%= loginMember.getNickname()%></b>
					</div>
				  <%}else{ %>
                    <div class="user_info">
                        <img class="pro" src="<%= loginMember.getProfileImg() %>">
                        <b style="margin-top: 100px;"><%= loginMember.getNickname()%></b>
                    </div>
				  <%} %>
				  
				  <!-- 
				  <%if(loginMember.getProfileImg().equals("resources/profile_upfiles/null")){ %>
						  <div id="usermenu_page_login_success_userinfo" style="width: 100px; height: 100px;">
							  <img src="resources/images/profile_img_nocamera.png" alt="profile" style="width: 100px; height: 100px;">
							  <b><%= loginMember.getNickname()%></b>
						  </div>
					  	<%}else{ %>
					  		<div id="usermenu_page_login_success_userinfo" style="width: 100px; height: 100px;">
					  			<img class="pro" src="<%= loginMember.getProfileImg() %>" > <br>
							 	<b><%= loginMember.getNickname()%></b>
					  		</div>
					  	<%} %> -->

				   <button id="usermenu" onclick="openUserMenu()">
					   <img src="resources/images/hamburger_btn.png">
				   </button>
			    </div>
	            
			<%} %>


            <div id="overlay"></div>
            
            <!-- 팝업창 -->
            <div id="usermenu_page" class="usermenu_page">

                <!-- 팝업창 닫힘 버튼 -->
                <button id="closeUserMenu">×</button>


				<% if(loginMember == null){ %>
	                <!-- 로그인 -->
	                <div id="usermenu_page_login">
	
	                    <form action="<%= contextPath %>/login.me" method="post">
	
	                        <h3>로그인</h3>
	
	                        <table style="background-color: #f1f2f3;">
	                        
	                            <tr>
	                                <td><input type="text" name="memberId" class="form-control" placeholder="아이디" required></td>
	                            </tr>
	                            <tr>
	                                <td><input type="password" name="memberPwd" class="form-control" placeholder="비밀번호" required></td>
	                            </tr>
	                            <tr>
	                                <td><button class="btn btn-primary btn-block" type="submit">로그인</button></td>
	                            </tr>
	                            <tr>
	                                <td align="center">
	                                    <a href="views/common/findIdPwdPage.jsp">ID / 비밀번호 찾기</a> |
	                                    <a href="<%=contextPath%>/terms.me">회원가입</a>
	                                </td>
	                            </tr>
	                            
	                        </table>
	                        
	                        <script>
								function gotoFindIdPwdPage(){
									location.href = "<%=contextPath%>/findIdPwdPage.me";
								}	                        	
	                        </script>               
	    
	                    </form>
	                </div>
	                
                
				<%}else if(loginMember.getMemberName().equals("관리자")){ %>
				
	                <!-- 로그인 성공-->
	                <div id="usermenu_page_login_success" class="usermenu_page_content">
	                    
	                     <!-- 
	                    <div id="usermenu_page_login_success_userinfo" style="width: 100px; height: 100px;">
	                        <img src="resources/images/profile_img.png" alt="profile" style="width: 100px; height: 100px;">
	                        <p><b><%=loginMember.getMemberName() %>님</b></p>
	                    </div> -->
	                    
	                    
	                    <%if(loginMember.getProfileImg().equals("resources/profile_upfiles/null")){ %>
						  <div id="usermenu_page_login_success_userinfo" style="width: 100px; height: 100px;">
							  <img src="resources/images/profile_img_nocamera.png" alt="profile" style="width: 100px; height: 100px;">
							  <b><%= loginMember.getNickname()%></b>
						  </div>
					  	<%}else{ %>
					  		<div id="usermenu_page_login_success_userinfo" style="width: 100px; height: 100px; margin-top:30px">
					  			<img class="pro" src="<%= loginMember.getProfileImg() %>" style="width: 100px; height: 100px;"> <br>
							 	<b><%= loginMember.getNickname()%></b>
					  		</div>
					  	<%} %>
	                    
	                    
	                    <table style="margin-top:230px; height:200px;">
	                    
	                        <tr>
	                            <td><input type="button" class="btn btn-primary btn-block" value="마이페이지" onclick = "location.href = '<%=contextPath%>/mypageform.me'"></td>
	                        </tr>
	                        <tr>
	                            <td><input type="button" class="btn btn-secondary btn-block" value="회원정보 변경" onclick = "location.href = '<%=contextPath%>/mypageform.me'"></td>
	                        </tr>
	                        <tr>
	                        	<td><input type="button" class="btn btn-secondary btn-block" value="관리자 페이지" onclick = "location.href = '<%=contextPath%>/manage.ad?cpage=1'"></td>
	                        </tr>
	                        <tr>
	                            <td><input type="button" class="btn btn-secondary btn-block" value="로그아웃" onclick = "location.href = '<%=contextPath%>/logout.me' "></td>
	                        </tr>
	                        
	                    </table>
	
	                </div>
	                
                <%}else{ %>
                
                	<!-- 로그인 성공-->
	                <div id="usermenu_page_login_success" class="usermenu_page_content">
	                    <!-- 
	                    <div id="usermenu_page_login_success_userinfo" style="width: 100px; height: 100px;">
	                        <img src="resources/images/profile_img.png" alt="profile" style="width: 100px; height: 100px;">
	                        <p><b><%=loginMember.getMemberName() %>님</b></p>
	                    </div> -->
	                    
	                    <%if(loginMember.getProfileImg().equals("resources/profile_upfiles/null")){ %>
						  <div id="usermenu_page_login_success_userinfo" style="width: 100px; height: 100px;">
							  <img src="resources/images/profile_img_nocamera.png" alt="profile" style="width: 100px; height: 100px;">
							  <b><%= loginMember.getNickname()%></b>
						  </div>
					  	<%}else{ %>
					  		<div id="usermenu_page_login_success_userinfo" style="width: 100px; height: 100px; margin-top:50px">
					  			<img class="pro" src="<%= loginMember.getProfileImg() %>" style="width: 100px; height: 100px;"> <br>
							 	<b><%= loginMember.getNickname()%></b>
					  		</div>
					  	<%} %>
	                    
	                    <table>
	                    
	                        <tr>
	                            <td><input type="button" class="btn btn-primary btn-block" value="마이페이지" onclick = "location.href = '<%=contextPath%>/mypageform.me'"></td>
	                        </tr>
	                        <tr>
	                            <td><input type="button" class="btn btn-secondary btn-block" value="회원정보 변경" onclick = "location.href = '<%=contextPath%>/mypageform.me'"></td>
	                        </tr>
	                        <tr>
	                            <td><input type="button" class="btn btn-secondary btn-block" value="로그아웃" onclick = "location.href = '<%=contextPath%>/logout.me' "></td>
	                        </tr>
	                        
	                    </table>
	
	                </div>
                
                
                <%} %> 

                
            </div>
                

            <!-- 팝업창 함수 -->
            <script>

                function openUserMenu() {
                    var overlay = document.getElementById('overlay');
                    var userMenuPage = document.getElementById('usermenu_page');
                    var closeButton = document.getElementById('closeUserMenu');

                    // 창 띄우기
                    if (userMenuPage.style.display === 'block') {
                        userMenuPage.style.display = 'none';
                        overlay.style.display = 'none';
                    } else {
                        userMenuPage.style.display = 'block';
                        overlay.style.display = 'block';
                    }

                    // X누르면 창 닫힘
                    closeButton.addEventListener('click', function() {
                        userMenuPage.style.display = 'none';
                        overlay.style.display = 'none';
                    });

                    // 배경 누르면 창 닫힘
                    overlay.addEventListener('click', function() {
                        userMenuPage.style.display = 'none';
                        overlay.style.display = 'none';
                    });
                    
                }
                
                
            </script>

        </div>


    </div>
    
    <div id="navigator">
        <!-- navi -->
        <ul class="nav nav-pills justify-content-center">
            <li class="nav-item">
                <a class="btn btn-light nav_tab_font" href="<%=contextPath%>" style="box-shadow: 0px 0px 4px #585858">HOME</a>
            </li>
            <li class="nav-item">
                <a class="btn btn-primary nav_tab_font" href="<%=contextPath%>/list.si?cpage=1" style="box-shadow: 0px 0px 4px #585858">여행지 추천</a>
            </li>
            <li class="nav-item">
                <a class="btn btn-primary nav_tab_font" href="<%=contextPath %>/list.co?cpage=1" style="box-shadow: 0px 0px 4px #585858">여행 코스 추천</a>
            </li>
            <li class="nav-item">
                <a class="btn btn-primary nav_tab_font" href="<%=contextPath %>/list.re?cpage=1" style="box-shadow: 0px 0px 4px #585858">여행 후기</a>
            </li>
            <li class="nav-item">
                <a class="btn btn-light nav_tab_font" href="<%=contextPath %>/list.no?cpage=1" style="box-shadow: 0px 0px 4px #585858">공지사항</a>
            </li>
        </ul>
    </div>
    
</body>
</html>