<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String contextPath = request.getContextPath(); // /jsp

	Member loginMember = (Member)session.getAttribute("loginMember");
	//MEMBER_NO, MEMBER_NAME, MEMBER_ID, MEMBER_PWD, PHONE, EMAIL, NICKNAME, STATUS, ENROLL_DATE, PROFILE_IMG
	Member findIdMem = (Member)session.getAttribute("findIdMem");
	//MEMBER_NO, MEMBER_NAME, MEMBER_ID, MEMBER_PWD, PHONE, EMAIL, NICKNAME, STATUS, ENROLL_DATE, PROFILE_IMG
	
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
        
        #user_info{
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
        #user_info img{ /*프사*/
            /* border: 1px solid; */
            width: 65px;
            margin-top: 5px;
        }
        #user_info b{ /*닉네임*/
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
            text-decoration: none;
            color: rgb(96, 96, 96);
            font-weight: 700;
        }
        #usermenu_page_login a:hover{ /* 로그인 버튼 아래 ID찾기, 비번찾기, 회원가입*/
            text-decoration: none;
            color: #007fff;
            font-weight: 700;
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
            width: 280px;
            text-align: center;
            font-weight: 700;
            margin-top: 250px;
            font-size: 14px;
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
        
       
    </style>
</head>
<body>
    
    <div id="header">
        
        <div id="header_1">
            <!-- 로고 -->
            <a href="<%=contextPath%>"><img src="resources/images/logo_blue_subwhere.png" alt="logo"></a>
        </div>

        <div id="header_2">
            <!-- 역 검색창 -->

            
            <form action="<%=contextPath %>/selectStation.do" id="search_form" method="get">

                <div id="search_station">
                    
                    <select onclick="categoryChange();" style="height: 36px; width: 170px; font-family: 'SUITE-Regular';" id="station-line">
                      
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
                    
                    <select id="stationName" style="height: 36px; width: 150px; font-family: 'SUITE-Regular';" name="stationName">
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
                                    $("stationName").html("");   // 먼저 역명 부분을 모두 비워주기
                                    let val = "<option >역 명 선택</option>";  //역명 선택을 그려주기
                                    $("stationName").html(val);  // 역명이 들어가는 부분에 val값 넣기 
                                }else{
                                    
                                    // 만약 호선이 잘 넘어왔다면
                                    console.log(list)
                                    let val = "";
                                    

                                for(let i=0; i<list.length; i++){
                                    
                                    val += "<option value= 'list[i].stationNo'>" + list[i].stationName + "</option>"
                                    
                                    $("#stationName").html(val);  // val에 옵션을 그려주고 selectbox에 넣어주기
                                    
                                    
                                }
                                    
                                }
                            },
                            error:function(){}
                        })

                    }
                    </script>

                    <!-- 검색버튼 -->
                    <div id="search_btn" style="font-family: 'SUITE-Regular'">
                        <input type="submit" value="검색" class="btn btn-primary">
                    </div>
                   
            
                </div>
            
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
        
        <div id="overlay"></div>

            <!-- case1. 로그인 전 : 로그인 -->
            <div id="before_login">
                <a href="#" onclick="openUserMenu()">Login</a>
            </div>

            
            <div id="usermenu_page" class="usermenu_page" style="display: none;">

                <!-- 팝업창 닫힘 버튼 -->
                <button id="closeUserMenu">×</button>                


                <!-- ID / 비밀번호 찾기 -->
                <div id="usermenu_page_find">


                    <h3>ID / 비밀번호 찾기</h3>

                    <div class="find_id_or_pwd">

                        <ul class="nav nav-pills nav-justified" role="tablist" id="find_id_or_pwd_pills">

                            <li class="nav-item">
                                <a class="nav-link active btn btn-secondary" data-toggle="pill" href="#home">ID 찾기</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link btn btn-secondary" data-toggle="pill" href="#menu1">비밀번호 찾기</a>
                            </li>
                            
                        </ul>

                        <div class="tab-content">

                            <div id="home" class="container tab-pane active"><br>

                                <% if(findIdMem == null){ %>
                                
                                    <!-- ID 찾기 실패 -->
                                    <div id="usermenu_page_find_id_or_pwd_fail">
                                        
                                        <div class="usermenu_page_plain">

                                            <table>
                                                <tr>
                                                    <td>
                                                        <p>
                                                            입력하신 정보와 일치하는 계정이 없습니다.
                                                        </p>
                                                        <p>
                                                            회원가입을 원하시나요?
                                                        </p>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input type="button" class="btn btn-sm btn-secondary" value="재시도" onclick="history.back()">
                                                        <input type="button" class="btn btn-sm btn-primary" value="회원가입" onclick="location.href='<%=contextPath%>/terms.me'">
                                                    </td>
                                                </tr>
                                            </table>

                                            
                                            
                                        </div>
                                        
                                    </div>
                                
                                <%}else { %>
                                
                                    <!-- ID 찾기 성공 -->
                                    <table id="hometable2" style="margin-top: 270px;">
                                    	
                                        <tr>
                                            <p style="font-size: 12px; text-align: center; margin-top: 20px;">입력하신 정보와 일치하는 계정을 발견했습니다.</p>
                                            <th>
                                                <input type="radio"> <%= findIdMem.getMemberId()%>
                                            </th>
                                        </tr>
                                        <tr>
                                            <th>
                                                <button class="btn btn-secondary" onclick = "location.href = 'views/common/findIdPwdPage.jsp'">비밀번호 찾기</button>
                                                <button class="btn btn-secondary" onclick = "location.href ='<%=contextPath%>'">로그인</button>
                                            </th>
                                            
                                        </tr>
                                        

                                    </table>
                                    
                                
                                <%} %>
                                    
                                    
                            </div>
                            
                            <!-- 비밀번호 찾기 -->
                            <div id="menu1" class="container tab-pane fade"><br>

                                <form action="">
                                    <table>
                                        <tr>
                                            <td><input type="text" class="form-control" placeholder="이름"></td>
                                        </tr>
                                        <tr>
                                            <td><input type="text" class="form-control" placeholder="이메일"></td>
                                        </tr>
                                        <tr>
                                            <td><input type="text" class="form-control" placeholder="휴대폰 번호"></td>
                                        </tr>
                                        <tr>
                                            <td style="font-size: x-small;">이름, 이메일, 휴대폰 모두 일치하셔야 합니다.</td>
                                        </tr>
                                        <tr>
                                            <td><button class="btn btn-primary btn-block">비밀번호 찾기</button></td>
                                        </tr>

                                    </table>
                                </form>

                            </div>
                            
                        </div>

                    </div>
    
                    

                </div>
                
                
            </div>
                
            </div>
                

            <!-- 팝업창 함수 -->
            <script>

                function openUserMenu() {
                        var overlay = document.getElementById('overlay');
                        var userMenuPage = document.getElementById('usermenu_page');
                        var closeButton = document.getElementById('closeUserMenu');

                        // 팝업창 열기
                        if (userMenuPage.style.display === 'block') {
                            userMenuPage.style.display = 'none';
                            overlay.style.display = 'none';
                        } else {
                            userMenuPage.style.display = 'block';
                            overlay.style.display = 'block';
                        }

                        // X 눌러서 창 닫기
                        closeButton.addEventListener('click', function() {
                            userMenuPage.style.display = 'none';
                            overlay.style.display = 'none';
                        });

                        // 뒷 배경 누르면 팝업창 닫기
                        overlay.addEventListener('click', function() {
                            userMenuPage.style.display = 'none';
                            overlay.style.display = 'none';
                        });
                    }

                    // Trigger the openUserMenu function when the page loads
                    window.onload = openUserMenu;

                
                
            </script>

        </div>
        
    <div id="navigator">
        <!-- navi -->
        <ul class="nav nav-pills justify-content-center">
            <li class="nav-item">
                <a class="btn btn-light nav_tab_font" href="<%=contextPath%>" style="box-shadow: 0px 0px 4px #585858">HOME</a>
            </li>
            <li class="nav-item">
                <a class="btn btn-primary nav_tab_font" href="#" style="box-shadow: 0px 0px 4px #585858">여행지 추천</a>
            </li>
            <li class="nav-item">
                <a class="btn btn-primary nav_tab_font" href="#" style="box-shadow: 0px 0px 4px #585858">여행 코스 추천</a>
            </li>
            <li class="nav-item">
                <a class="btn btn-primary nav_tab_font" href="#" style="box-shadow: 0px 0px 4px #585858">여행 후기</a>
            </li>
            <li class="nav-item">
                <a class="btn btn-light nav_tab_font" href="#" style="box-shadow: 0px 0px 4px #585858">공지사항</a>
            </li>
        </ul>
    </div>
    <%@ include file="mainBodyForInclude.jsp" %>

            <!-- -------------위로가기 버튼------------ -->
            <div style="position:fixed; bottom: 200px; right: 10%; width: 5px; height: 5px; z-index: 999;">
                <a href="#"><img src="resources/images/upbutton.png" title="위로 가기" style="width: 50px;"></a>
             </div>
     
             <!-- -------------대한민구석구석 사이트 가기 버튼------------ -->
             <div style="position:fixed; bottom: 140px; right: 10%; width: 5px; height: 5px; z-index: 999;">
                <a href="https://1330chat.visitkorea.or.kr:3000/#/ttalk_main/CHAT1330_160635739001093018/_0300_0100_main.do" target="_blank"><img src="resources/images/movesite.png" title="대한민국구석구석" style="width: 50px;"></a>
             </div>
             
</body>
<%@ include file= "footer.jsp" %>
</html>