<%@page import="com.kh.board.model.vo.Liked"%>

<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	ArrayList<Liked> list = (ArrayList<Liked>)request.getAttribute("list");
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
 /*.warp는 최종적으로 안가져 감*/
      .warp{ 
            border: 2px solid lightgray;
            width: 1200px;
            height: 780px;
            margin: auto;
            margin-top: 15px;
        }
        
        .profilel,.profiler{
            border: 1px solid lightgray;
            box-sizing: border-box;
            height: 98%;
            float: left;
            margin-top: 0.7%;
            margin-left: 1%;
        }
        
        .profilel{
            width: 30%;
        }
        .profiler{
            width: 67%;
        }

       
        
        
        
         /*제목 박스*/
        .title{
            /* border: 1px solid red; */
            box-sizing: border-box;
            width: 100%;
            height: 11%;
            padding:3%;
            margin-left: 5%;
        }

        /*게시물 들어가는 큰 박스*/
        .outer{
            /* border: 1px solid blue; */
            box-sizing: border-box;
            width: 100%;
            height: 89%;
            
        }
        /*사진 나중에 픽셀로 고정 해야 크기 변동 없다.*/
        .pic img{
            width: 100%;
            height: 150px;
            border-radius: 5% 5% 0% 0%;
        }

        /*ul을 감싸고 있는 div*/
        .list-area{
            /* border: 1px solid green; */
            box-sizing: border-box;
            width: 100%;
            height: 90%;
        }

        #jyli{
            box-sizing: border-box;
            list-style-type: none;
            position: relative;
            width: 100%;
        }

        /*게시물 하나하나의 div*/
        .pic{
            border: 1px solid lightgray;
            box-sizing: border-box;
            width: 100%;
            border-radius: 5%; 
            cursor: pointer;
        }

        a{
            text-decoration: none;
            color: rgb(143, 141, 141);
            text-align: center;
        }

        #jyli:hover{
            background-color: lightgray;
            border-radius: 5%;
        }
       
        /*li 감싸고 있는 div*/
        #area{
            /* border: 1px solid black; */
            box-sizing: border-box;
            width: 25%;
            display: inline-block;
            margin-left: 5%;
            margin-top: 5%;
        }
       
        /* .pic #pic{
            position: relative;
            z-index: 1;
        } */

        .pic #heart{
            position: absolute;
            z-index: 2;
        }

        .pic #heart2{
            position: absolute;
            z-index: 2;
        }

        #heart{
            width: 13%;
            height: 10%;
            margin-top: 63%;
            right: 5%;
        }

        #heart2{
            width: 13%;
            height: 10%;
            margin-top: 63%;
            right: 5%;
        }

       #font{
        font-size: small;
        color: rgb(161, 161, 161);
       }
        
       .title>h1{
        color: rgb(163, 163, 163);
       }

       #btn-area{
        display: flex;
        justify-content: center;
       }

       #btn-area button {
            background-color: #f7f7f7; 
            color: #555;
            border: none;
            padding: 8px 15px;
            margin: 0 5px;
            cursor: pointer;
            border-radius: 5px;
            font-size: 14px;
            transition: background-color 0.3s, color 0.3s;
        }

        #btn-area button:hover {
            background-color: #007fff; 
        }

        #btn-area button:focus {
            outline: none;
        }

        #btn-area button.active {
            background-color: gray;
            color: white;
        }
        

</style>

</head>
<body>
  <%@ include file="../../views/common/header.jsp" %>

	<!-- 좋아요 보관함 -->
		
		<div class="warp">

        <%@ include file="mypageleft.jsp" %>
		
		
	 <div id="rightpro" class="profiler"> 
	 		<div class="title">
	            <h1> <%=loginMember.getMemberId() %>님의 "좋아요" 보관함</h1>
	         </div>
	 
	         <div class="outer">
	             
	             <ul class="list-area">
	             <%if(list.isEmpty()){ %>
                      <p align="center">좋아요 한 게시글이 없습니다.</p>
                <%}else{ %>
                   <%for(Liked l : list){ %>
                    <div id="area" class="llike-area">
                       
                        <li id="jyli">
                            <div class="pic">
                               <input type="hidden" value="<%=l.getBoardNo()%>">
                                <img src="resources/images/heart2.png" id="heart" alt="" class="toggle-heart" onclick="likeToggle(this);">
                                
                                    <img src="<%=l.getTitleImg() %>" alt="" id="pic">
                                    <h4><%String title = l.getTitle(); %>
                                       <%=title.length() >6 ? title.substring(0, 6)+".." : title %>
                                    </h4>
                               
                            </div>
                        </li>
    
                    </div>
                   <%} %>
                <%} %>
	 				<!-- 
	                 <div id="area">
	                     <li id="jyli">
	                         <div class="pic">
	                             <img src="resources/images/heart2.png" id="heart" alt="" class="toggle-heart" onclick="likeToggle(this);">
	                             <a href="">
	                                 <img src="resources/images/롯데타워.png" alt="">
	                                 <h4>남산</h4>
	                                 <p id="font">우리나라 최고층 ...</p>
	                             </a>
	                             
	                         </div>
	                     </li>
	                 </div>
	                  -->
	                
	             </ul>
	 
	             <script>
	                 // var h = 1;
	                 // function likeToggle(){
	                 //     var like = document.getElementById("heart")
	         
	                 //     if(h % 2 ==0){
	                 //         like.src="resource/fheart.png";
	                     
	                 //     }else{
	                 //         like.src="resource/heart.png";
	                 //     }
	         
	                 //     h++;
	                 // }
	 
	 
	                 function likeToggle(heartImage) {
	                     if (heartImage.src.includes("heart2.png")) {
	                         heartImage.src = "resources/images/heart1.png";
	                     } else {
	                         heartImage.src = "resources/images/heart2.png";
	                     }
	                 }
	                 $(function(){
	                       $(".pic").click(function(){
	                          if(100<= $(this).children("input").val() && 500>=$(this).children("input").val()){
	                             location.href="<%=contextPath%>/read.si?bno="+$(this).children("input").val();                             
	                          }else if(1000<= $(this).children("input").val() && 1500>=$(this).children("input").val()){
	                             location.href="<%=contextPath%>/detail.co?cno="+$(this).children("input").val();
	                          }else if(2000<= $(this).children("input").val() && 2500>=$(this).children("input").val()){
	                             location.href="<%=contextPath%>/detail.re?bno="+$(this).children("input").val();
	                          }
	                          
	                       })
	                    })
	                       
	 
	             </script>
	 
	 
	            <!--  <div id="btn-area" align="center">
	                 <button>&lt;</button>
	                 <button class="first">1</button>
	                 <button>2</button>
	                 <button>3</button>
	                 <button>4</button>
	                 <button>4</button>
	                 <button>&gt;</button>
	             </div> -->
	             
	         </div></div>

    </div>

    <br>

<%@ include file="../../views/common/footer.jsp" %>
</body>
</html>