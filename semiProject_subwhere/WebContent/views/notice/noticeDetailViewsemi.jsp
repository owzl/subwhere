<%@page import="com.kh.notice.model.vo.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	Notice n = (Notice)request.getAttribute("n");
    
    %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 게시글 보기</title>

  

    <style>
        .UJ-wrap{
            width: 1200px;
            height: 800px;
            /* border: 1px solid lightgrey; */
            border-bottom: 0;
            margin: auto;
            margin-top: 50px;
        }

        .UJ-wrap>div{
            width: 100%;
            box-sizing: border-box;
            /* border: 1px solid red ; */
        }


        /* 공지사항 게시글 글씨 부분 */
        #UJ-up{
            height: 5%;
            font-size: 20px;
            color: gray;
            font-weight: bold;
            padding-bottom: 50px;
            border-bottom: 1px solid lightgray;

        }

        #UJ-up>b{
            padding: 30px;
          
        }


        /* --------------------공지사항 제목------------------  */

        #UJ-title{
            height: 10%;
          
        }

        #UJ-title>div{
            height: 100%;
            box-sizing: border-box;
            border-top: 0;
            float: left;
            padding-left: 20px;
        }

        #UJ-title-btn{
            width: 10%;
     
        
        }

        /* 공지사항 부분에서 버튼이라 */
        #UJ-title-btn>button{
            width: 50px;
            height: 30px;
            margin-left: 25px;
            margin-top: 25px;
            background-color: pink;
            color: red;
            border: 0;
            border-radius: 25%;
          
            
        }

        
        
        
        #UJ-notice-title{
            width: 90%;
            padding-top: 15px;
        }
        
        #UJ-content{
            height: 60%;
           border-bottom: 1px solid lightgray;
            
        }
        
        #UJ-content>p{
            padding-top: 40px;
        }
        
        #UJ-btn{
            height: 10%;
            text-align: right;
            padding-right: 20px;
            /* border: 1px solid green; */
           
        }

       

        



    


    </style>

</head>
<body>
    
    <%@ include file="../common/header.jsp" %>
     <div class="UJ-wrap">

		<!-- -------------위로가기 버튼------------ -->
        <div style="position:fixed; bottom: 200px; right: 10%; width: 5px; height: 5px; z-index: 999;">
           <a href="#"><img src="resources/images/upbutton.png" title="위로 가기" style="width: 50px;"></a>
        </div>

        <!-- -------------대한민구석구석 사이트 가기 버튼------------ -->
        <div style="position:fixed; bottom: 140px; right: 10%; width: 5px; height: 5px; z-index: 999;">
           <a href="https://1330chat.visitkorea.or.kr:3000/#/ttalk_main/CHAT1330_160635739001093018/_0300_0100_main.do" target="_blank"><img src="resources/images/movesite.png" title="대한민국구석구석" style="width: 50px;"></a>
        </div>

        <div id="UJ-up">
            
            <b>[공지사항 게시글]</b>
        </div>

        <div id="UJ-title">
            
            <div id="UJ-title-btn">
                <button type="UJ-button">공지</button>
                
            </div>
            
            <div id="UJ-notice-title">
                    <h1><%=n.getNoticeTitle() %></h1>
                    
                </div>
                
        </div>

        <hr>

        <div id="UJ-content">
            <p style="padding-left: 20px;">
               <%=n.getNoticeContent() %>
            </p>

        </div>

		
		
        <div id="UJ-btn">


         <!------------------------------ 수정/삭제/목록 버튼 ------------------------------>
            <br>
         <% if (loginMember != null && loginMember.getMemberId().equals("admin")) { %>
            <!-- 로그인을 하고 해당 게시물의 작성자일 경우만 수정/삭제 가능하게 하기 -->
            <button type="button" class="btn btn-secondary" onclick="location.href='<%=contextPath %>/updateForm.no?UJnoticeNo=<%=n.getNoticeNo()%>'" >수정</button>
            <!-- 수정 누르면 수정하는 jsp로 넘어가게 -->

            <button type="button" class="btn btn-secondary" onclick="location.href='<%=contextPath%>/deleteSemi.no?UJnoticeNo=<%=n.getNoticeNo()%>'"> 삭제</button>
             <!-- 삭제 누르면 삭제하는 서블릿으로 넘어가게 -->

			<%} %>

             <!-- 목록은 로그인/작성자 여부 상관없이 항상 보이게 하기 -->
            <button class="btn btn-secondary" onclick="location.href='<%=contextPath%>/list.no?cpage=1'"> 목록</button>
             <!-- 목록 누르면 목록보여주는 jsp로 넘어가게 -->  
             
        
            
            
        </div>
      
        
        <hr>
               
      

     


    </div>
    
   	
<br><br><br><br><br><br><br><br><br><br><br>
   
	<%@ include file="../common/footer.jsp" %>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>