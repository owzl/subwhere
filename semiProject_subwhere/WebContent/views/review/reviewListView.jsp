<%@page import="com.kh.common.model.vo.PageInfo"%>
<%@page import="com.kh.board.model.vo.Review"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	
	ArrayList<Review> list = (ArrayList<Review>)request.getAttribute("list");
	// 게시글번호, 역번호, 회원번호, 제목, 주소, 내용, 꿀팁, 조회수, 대표이미지경로

	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<style>
       div * {box-sizing: border-box;}

       .all {
           margin: auto;
           width: 1400px;
           height: 1600px;
       }
       
       /* ---------------content_h----------------- */
       #content_h {
           width: 100%;
           height: 50px;
       }

       /* float:left */
       #content_h>div {
           height: 100%;
           float: left;        
           line-height: 50px;
       }
       #content_h>#content_h_1 {
           width: 80%;
           color: gray;
           padding-left: 80px;
       }
       
       #reviewSearchResult {
       	   color: #007fff;
       	   font-weight: bold;
       	   font-size: 18px;
       }
       
       #content_h>#content_h_2 {
           width: 20%;
           padding-left: 100px;
           color: gray;
           font-size: bold;
       }
       /**/

       #content_h>#content_h_2>a {
           text-decoration: none;
           color: gray;
           font-size: bold;
           
       }
       
       /* ---------------content_b----------------- */
       #content_b {
           width: 100%;
           height: 800px;
       }
       
       #content_b>#content_b_1 {
           width: 100%;
           height: 700px;
       }

       #content_b>#content_b_1>ul>.con1 {
           list-style: none;
           width: 25%;   /* 한줄에 4개씩 */
           height: 50%;
           float: left;
           padding: 5px 5px;
           text-align: left;
       }

       #content_b>#content_b_1>ul>.con1>a {
           position: relative;
           
       }

       #content_b>#content_b_1 .reviewImg {
           width: 100%;
           height: 210px;
           border-radius: 10px;
       }

       #content_b>#content_b_1 .heartImg {
           width: 30px;
           position: relative;
           top: 185px;
           left: 280px;
       }

       #content_b>#content_b_1 .reviewTitle {
           width: 100%;
           color: gray;
           font-weight: bold;
           font-size: 18px;
           margin-bottom: 0px;
       }
       #content_b>#content_b_1 .reviewAddress {
           width: 100%;
           color: lightgray;
           font-weight: bold;
           font-size: 12px;
           margin-bottom: 0px;
       }
       

       #content_b>#content_b_2 {
           width: 100%;
           height: 50px;
           padding-top: 12px;
       }

		#content_b>#content_b_2>a {
		   width: 80px;
           height: 45px;
           line-height: 35px;
        }
     
       
       /* ---------------content_f----------------- */
       #selectbox select{
           width: 250px;
           height: 45px;
       }

       #selectbox button {
           width: 80px;
           height: 45px;
       }


       #content_f {
           width: 100%;
           height: 200px;
       }

       #content_f>#content_f_1 {
           width: 100%;
           height: 100px;
           /* 자식 요소(.pagination)를 중앙 정렬하기 */
           display: flex;
           justify-content: center;
       }

       #content_f>#content_f_2 {
           width: 100%;
           height: 100px;
           /* 자식 요소(.pagination)를 중앙 정렬하기 */
           display: flex;
           justify-content: center;

       }
       .wrapDropSearch>* {
           height: 100%;
           float: left;
       }

       .page-link:hover {
           background-color: #007fff;
           color: white;
       }
       
       
       /* --------------페이징---------------- */
        #paging {
            height: 10%;
            display: flex;
            justify-content: center;
            margin-top: 50px;
        }

        #paging button {
            background-color: #f1f2f3;
            color: #555;
            border: none;
            padding: 8px 15px;
            margin: 0 5px;
            cursor: pointer;
            border-radius: 5px;
            font-size: 14px;
            transition: background-color 0.3s, color 0.3s;
            height: 200%;
        }

        #paging button:hover {
            background-color: #dcdcdc; 
        }

        #paging button:focus {
            outline: none;
        }

        #paging button.active {
            background-color: gray;
            color: white;
        }

   </style>

</head>
<body>

	<%@ include file = "../common/header.jsp" %>

	<div class="all">
	
		<!-- -------------위로가기 버튼------------ -->
        <div style="position:fixed; bottom: 200px; right: 10%; width: 5px; height: 5px; z-index: 999;">
           <a href="#"><img src="resources/images/upbutton.png" title="위로 가기" style="width: 50px;"></a>
        </div>

        <!-- -------------대한민구석구석 사이트 가기 버튼------------ -->
        <div style="position:fixed; bottom: 140px; right: 10%; width: 5px; height: 5px; z-index: 999;">
           <a href="https://1330chat.visitkorea.or.kr:3000/#/ttalk_main/CHAT1330_160635739001093018/_0300_0100_main.do" target="_blank"><img src="resources/images/movesite.png" title="대한민국구석구석" style="width: 50px;"></a>
        </div>
	

        <!------------------------------content_h------------------------------->
        <br>
        <div id="content_h">
            <div id="content_h_1">
                <span id="reviewSearchResult">[&nbsp;전체&nbsp;]</span> 에 대한 검색 결과 
            </div>
   
        </div>


        <!------------------------------content_b------------------------------->
        <div id="content_b">
            <div id="content_b_1">
				
                <ul>
                	<!-- 게시글 for문 -->
                	<% for(Review r : list) { %>
	                    <li class="con1">
	                        <a href="#" class="thumb">
	                                           
	                            <!-- hidden : 내가클릭한게시글번호 가져오기 위해 -->
	                            <input type="hidden" value="<%= r.getBoardNo()%>"> 
	                            
	                            <img src="<%= contextPath%>/<%= r.getTitleImg() %>" class="reviewImg"> <br><br>
	                            <p class="reviewTitle"><%= r.getTitle() %></p>
	                            <p class="reviewAddress"><%= r.getAddress() %></p>
	                            
	                        </a>
	                    </li>
                    <% } %>
                </ul>

            </div>
            
			
		
            <!-- 로그인한 회원만 보여지는 div버튼(글작성) -->
	        <% if(loginMember != null) { %>
            <div id="content_b_2" align="right">
                <a href="<%= contextPath %>/enrollForm.re" class="btn btn-sm btn-secondary">작성하기</a>
            </div>
            <% } %>

            
        </div>
        
        
        


        <!------------------------------content_f------------------------------->
        <br>
        <div id="content_f">
            <div id="content_f_1">
                <nav class="navbar navbar-expand-sm ">
                    <div id="selectbox">
                    
                        <form class="form-inline" action="<%= contextPath %>/linelist.re">
                            <select name="selectbox">
                                <option value="0">전체</option>
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
                            <button class="btn btn-primary" type="submit">조회</button>
                        </form>
                        
                    </div>
                </nav>
            </div>


            
            <!-- pageingbar -->
	        <div id="paging" align="center">
				<% if(currentPage != 1) { %>
	            	<button onclick="location.href='<%= contextPath %>/list.re?cpage=<%= currentPage -1 %>'">&lt;</button>
	            <% } %>
	            
	            <% for(int p=startPage; p<=endPage; p++) { %>
	            	<% if(p == currentPage) { %>
	            		<button class="active"><%= p %></button>
					<% }else { %>
	            		<button onclick="location.href='<%= contextPath%>/list.re?cpage=<%= p %>'"><%= p %></button>
	            	<% } %>
	            <% } %>
	            
	            <% if(currentPage != maxPage) { %>
	            	<button onclick="location.href='<%= contextPath %>/list.re?cpage=<%= currentPage +1 %>'">&gt;</button>
	        	<% } %>
	        </div>
            
            
            
            
        </div>

    </div>

	<%@ include file = "../common/footer.jsp" %>
	
	
	
	<!-- 게시글 중 상세페이지로 보기 위해 하나 눌루! (250줄) -->		
	<script>
        $(function() {
        	$(".thumb").click(function(){
        		<% if(loginMember == null) { %>
        			alert('SUB-WHERE 회원만 볼 수 있습니다! 로그인 후 이용해주세요!');
        			location.href = "<%=contextPath%>/list.re?cpage=1";
        		<% }else{ %>
	        		//location.href = "/subwhere/detail.re?bno=내가클릭한게시글글번호";			// bno=2018
	        		//                 /subwhere/detail.re?bno=2018						// 키값=벨류
	    			location.href = "<%=contextPath%>/detail.re?bno=" + $(this).children("input").val();
        		<% } %>
        	})
        	
        })
        
    </script>

</body>
</html>