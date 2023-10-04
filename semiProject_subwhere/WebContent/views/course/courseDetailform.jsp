	

<%@page import="com.kh.board.model.vo.Uploadfile"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.board.model.vo.Course"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
    
    
    
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>여행 코스 게시글 보기</title>
   

 
 <!-- 지도 api -->
 <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=52127fd3baa1ecbc3d895a941668aff8"></script>

    <style>
        .UJ-wrap{
            /* border: 1px solid red; */
            width: 1200px;
            height: 1200px;
            margin: auto;
            margin-top: 50px;
        }

        .UJ-wrap>div{
            width: 100%;
            box-sizing: border-box;
            /* border: 1px solid blue; */
        }




        /* 맨 위 */
        .UJ-course1{
          
            height: 10%;
            box-sizing: border-box;
        }


        /* course1 여행코스 게시글 부분도 나누기 */
        /* id가 각각 upword/ upimg */
        
        #UJ-up>div{
            width: 500px;
            height: 100%;
            box-sizing: border-box;
            float: left;
            /* border: 1px solid red; */
        }


        /* 여행 코스 게시글 글씨 부분 */
        #UJ-up-word{
            width: 50%;
            box-sizing: border-box;
        }


		#UJ-up-img{
		padding-left:394px;	
		cursor: pointer;
		
		}

        /* 좋아요/신고 이미지 */
        #like{
           width: 50px; 
            box-sizing: border-box;
            
        }
        
         #report{
          width: 50px;
            box-sizing: border-box;
            
        }

        #like>img{
            padding-top: 30px;
            cursor: pointer;
        }

	



        /* 제목, 파일(사진) */
        .UJ-course2{
            height: 8%;
            box-sizing: border-box;
        }


         
        /* -----------------------------------selectbox-------------------------- */


		

       #UJ-search_station1{
            background-color: #f7f7f7;
            height: 60px;
            line-height: 60px;
            padding-left: 10px;
        }



       

        /* 지도(사진) */
        .UJ-course3{
            height: 27%;
            box-sizing: border-box;
        }

        /* 코스 순서 */
        .UJ-course4{
        
            height: 25%;
            box-sizing: border-box;
            /* border: 1px solid red; */
        }

        /* 코스 내용 */
        .UJ-course5{
         
            box-sizing: border-box;
           
            
        }


       #courseContent{
        width: 100%;
        height: 250px;
        box-sizing: border-box;
       }
            


         /* 꿀팁란 */
        .UJ-course6{
            margin-top: 20px;
            box-sizing: border-box;
          
        }


      
        .UJ-course6>textarea{
        width: 1200px;
        height: 150px;
        box-sizing: border-box;
       }
            



        /* 세세하게 나누기 */

        /* 맨 위 상단 */
        #UJ-up{
            font-size: 20px;
            color: gray;
            font-weight: bold;
            padding-bottom: 50px;
        }


        /* course2 나누기 (코스 제목)  */
        .UJ-course2>div{
            /* border: 1px dashed green; */
            width: 100%;
            box-sizing: border-box;
            
        }

        #UJ-courseTitle{
            height: 40%;
            box-sizing: border-box;
        }

        /* 제목입력 input */
        #UJ-courseTitle>h1{
            width: 100%;
            height: 100%;
            box-sizing: border-box;
            color: gray;
            
        }

        /* 첨부 파일 */
        #UJ-search_station1{
            height: 60%;
            box-sizing: border-box;
            background-color: #f7f7f7;
            position: relative;
        }

        #UJ-search_station1>input{
            position: absolute;
            margin-left: 10px;
            margin-top: 13px;
        }



         /* 지도 api */
         .UJ-course3{
            height: 23%;
            box-sizing: border-box;
            margin-top: 10px;
        }

        /* 코스 순서 */
       .UJ-course4{
            height: 39%;
            box-sizing: border-box;
            margin-top: 50px;
        }


         /* 꿀팁란 */
        .UJ-course6{

        
        box-sizing: border-box;
        }


      
       



        /* 세세하게 나누기 */

        /* course2 나누기  */
        .UJ-course2>input{
            width: 100%;
            height: 100%;
            box-sizing: border-box;
        }

        /* 지도 api*/
        .UJ-course3>img{
            height: 100%;
            margin-left: 150px;
          
        }

       

        /* course4 */
        /* 사용자가 선택한 코스 목록 div */
        .UJ-course4>div{
            /* border: 1px solid lightgray; */
            height: 20%;
            width: 80%;
            box-sizing: border-box;
            margin: 10px 0 10px 75px;
            /* background-color: lightgray;  */
            

        }

        /* 첫번째 여행 코스 */
        #UJ-seq1>div{
            /* border: 1px solid lightgrey; */
            height: 100%;
            box-sizing: border-box;
            float: left;
        }

        /* 여행 코스 순서 */
        #UJ-seq1-1{
            width: 10%;
            box-sizing: border-box;
          

            padding: 30px;
        
        
            
        }
      
        /* 여행 코스 장소명이 적힌 p태그 */
        .UJ-p{
            text-decoration: none;
            color: gray;
            line-height: 80px;
            font-size: 15px;
           
        }
        
        /* 여행 코스 사진 부분  */
        #UJ-seq1-2{
            width: 25%;
            box-sizing: border-box;
            border: 1px solid #f7f7f7;
            border-right: 0;
            background-color: #f7f7f7;
           
        }

        /* 여행 코스 장소명 부분  */
        #UJ-seq1-3{
            width: 65%;
            box-sizing: border-box;
            border: 1px solid #f7f7f7;
            border-left: 0;
            background-color: #f7f7f7;
        }


        /* 두 번째 여행코스 목록  */
        #UJ-seq2>div{
            /* border: 1px solid lightgrey; */
            height: 100%;
            box-sizing: border-box;
            float: left;
        }

        /* 여행 코스 순서  */
        #UJ-seq2-1{
            width: 10%;
            box-sizing: border-box;
            padding: 30px;
        }
      
        /* 사진 */
        #UJ-seq2-2{
            width: 25%;
            box-sizing: border-box;
            border: 1px solid #f7f7f7;
            border-right: 0;
            background-color: #f7f7f7;
        }

        /* 장소명 */
        #UJ-seq2-3{
            width: 65%;
            box-sizing: border-box;
            border: 1px solid #f7f7f7;
            border-left: 0;
            background-color: #f7f7f7;
        }


        /* 세번째 여행 코스 */
        #UJ-seq3>div{
            /* border: 1px solid lightgrey; */
            height: 100%;
            box-sizing: border-box;
            float: left;
        }

        /* 여행코스 순서 번호 */
        #UJ-seq3-1{
            width: 10%;
            box-sizing: border-box;
            padding: 30px;
        }
      
        /* 사진 */
        #UJ-seq3-2{
            width: 25%;
            box-sizing: border-box;
            border: 1px solid #f7f7f7;
            border-right: 0;
            background-color: #f7f7f7;
        }

        /* 장소명 */
        #UJ-seq3-3{
            width: 65%;
            box-sizing: border-box;
            border: 1px solid #f7f7f7;
            border-left: 0;
            background-color: #f7f7f7;
        }


        /* 네번째 여행코스 목록 */
        #UJ-seq4>div{
            /* border: 1px solid lightgrey; */
            height: 100%;
            box-sizing: border-box;
            float: left;
        }


        /* 여행코스 순서 번호 */
        #UJ-seq4-1{
            width: 10%;
            box-sizing: border-box;
            padding: 30px;
        }
      
        
        /* 사진 */
        #UJ-seq4-2{
            width: 25%;
            box-sizing: border-box;
            border: 1px solid #f7f7f7;
            border-right: 0;
            background-color: #f7f7f7;
        }

        /* 장소명 */
        #UJ-seq4-3{
            width: 65%;
            box-sizing: border-box;
            border: 1px solid #f7f7f7;
            border-left: 0;
            background-color: #f7f7f7;
        }


        /* 여행 코스 목록 사진의 스타일 부분 */
        .UJ-course4 img{
            height: 80%;
            width: 70%;
            margin-top: 10px;
            margin-left: 10px;
            border-radius: 20px;
        }



        /* 댓글 기능  */
        
        #UJ-reply{
            width:1200px;
          
            background-color: #f7f7f7; 
            margin: auto;
            margin-top: 600px;
            
        }

        #UJ-reply>table{
            width: 90%;
            margin: auto;
            /* border:1px solid red; */
            box-sizing: border-box;
          /*  background-color:#f7f7f7; */
           
            
        }


      


        #UJ-reply>table input{
            width: 100%;
            height: 40px;
            box-sizing: border-box;
            border: 1px solid lightgrey;
            border-radius: 5px;
         /*   margin-left:117px;*/
         
        
        }
        
      
        #UJ-reply>table>thead>tr{
           width: 100%;

          
       
         
        }

        #UJ-reply>table>tbody>tr{
           width: 100%;
         
        }
        

        /* 하단의 수정/삭제/목록 버튼 부분  */
        #UJ-button{
        text-align: right;
       }









          /* --------------------- 지도 api ----------------------------- */

        .dot {overflow:hidden;float:left;width:12px;height:12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/mini_circle.png');}    
        .dotOverlay {position:relative;bottom:10px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;font-size:12px;padding:5px;background:#fff;}
        .dotOverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}    
        .number {font-weight:bold;color:#ee6152;}
        .dotOverlay:after {content:'';position:absolute;margin-left:-6px;left:50%;bottom:-8px;width:11px;height:8px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white_small.png')}
        .distanceInfo {position:relative;top:5px;left:5px;list-style:none;margin:0;}
        .distanceInfo .label {display:inline-block;width:50px;}
        .distanceInfo:after {content:none;}
        
        
        #UJ-con01 {
            font-size: 15px;
            color: gray;
            line-height: 1.8;
            width: 20%;
            margin-left: 1000px;
          
        }

 

        

    </style>


</head>
<body>
	<%@ include file = "../common/header.jsp" %>
	<%
	
	int memberNo = 0;
	int likeResult = -1;
	int reportResult = -1;
	String memberName = "";
	String memberNickName = "";
	
	if(loginMember != null){
		
		memberNo = loginMember.getMemberNo();
		memberName = loginMember.getMemberName();
		memberNickName = loginMember.getNickname();
		  likeResult = (int)request.getAttribute("likeResult");
		    // * 신고
		  reportResult = (int)request.getAttribute("reportResult");
	}
	
    	Course c = (Course)request.getAttribute("c");
    	ArrayList<Uploadfile> list = (ArrayList<Uploadfile>)request.getAttribute("list");
    	
    	String userName = c.getMemberNo();
    	// list에는 첨부파일에 대한 정보가 담겨있음
    	
    	// userNo을 String 형으로
		 //  String userNo = String.valueOf(request.getAttribute("memberNo"));
		   
		   // CourseDetailController 에서 쏴줌
		    // * 좋아요
		    
		    
	
		    
		    
    	
    %>
	
    <div class="UJ-wrap">
    
		   <!-- -------------위로가기 버튼------------ -->
        <div style="position:fixed; bottom: 200px; right: 10%; width: 5px; height: 5px; z-index: 999;">
           <a href="#"><img src="resources/images/upbutton.png" title="위로 가기" style="width: 50px;"></a>
        </div>

        <!-- -------------대한민구석구석 사이트 가기 버튼------------ -->
        <div style="position:fixed; bottom: 140px; right: 10%; width: 5px; height: 5px; z-index: 999;">
           <a href="https://1330chat.visitkorea.or.kr:3000/#/ttalk_main/CHAT1330_160635739001093018/_0300_0100_main.do" target="_blank"><img src="resources/images/movesite.png" title="대한민국구석구석" style="width: 50px;"></a>
        </div>
    

         <!------------------------------여행 코스 게시글------------------------------>
        <div class="UJ-course1" id="UJ-up">
            <div id="UJ-up-word">

                <b>[여행 코스 게시글]</b>
            </div>


             <!------------------------------좋아요/신고------------------------------->
            <div id="UJ-up-img" style="margin-left :190px;">
             
         <% if(loginMember != null){ %>  
              <%if(likeResult ==1){ %>
                     <img src="resources/images/heart2.png" id="like" onclick="sendLikeRequest()">
              <%}else{ %>
                     <img src="resources/images/heart1.png" id="like" onclick="sendLikeRequest()">
               <%} %>
                            
            <%} %>               
                            <script>
                               function sendLikeRequest(){
                                   //하트 클릭시
                                   $.ajax({
                                      url: "courseLike.co",
                                      type: "GET",
                                      data: {
                                          bno:<%=c.getBoardNo()%>,
                                   
                                   
                                      },
                                      success: function(result){
                                         console.log(result);
                                         var heartImage = document.getElementById("like");

                                          if (heartImage.src.endsWith("heart1.png")) {
                                                 heartImage.src = "resources/images/heart2.png";
                                             } else {
                                                 heartImage.src = "resources/images/heart1.png";
                                             }
                                            
                                      },error:function(){
                                      console.log("찜하기ajax실패");
                                   }
                                   })
                               }   
                                
                            </script>
                            
                            
               <!------------------------------- 신고 -------------------------------->
                           <!-- reportResult : ReviewDetailController에서 set해놓은거 위에서 받아주고 써 -->
                          
                        <% if(loginMember != null){ %>  
                           <%if(reportResult == 1){ %>
                               <img src="resources/images/report2.png" id="report" onclick="sendReportRequest()">
                           <%}else{ %>
                               <img src="resources/images/report1.png" id="report" onclick="sendReportRequest()">
                           <%} %>
                        <%} %>   
                            <script>
                               function sendReportRequest(){
                                   //신고 클릭시
                                   $.ajax({
                                      url: "courseReport.co",
                                      type: "GET",
                                      data: {
                                          bno:<%=c.getBoardNo()%>,
                                      },
                                      success: function(result){
                                         //console.log(result);
                                         var reportImage = document.getElementById("report");

                                          if (reportImage.src.endsWith("report1.png")) {
                                                 reportImage.src = "resources/images/report2.png";
                                             } else {
                                                 reportImage.src = "resources/images/report1.png";
                                             }
                                            
                                      },error:function(){
                                      console.log("신고 ajax 실패");
                                   }
                                   })
                               }   
                            </script>
                            
            </div>


        </div>
        
 			<div id="UJ-con01" style ="padding-bottom:60px;" >
 			
                <div></div>
                <div></div>
	         <span>작성자 :  <%=c.getMemberNo() %></span> <br>
		     <span>조회수 :  <%=c.getCount() %> </span> <br>
             <span>작성일 :  <%=c.getCreateDate() %> </span>
 			
		        
		     </div>
		    
        

    
      <!------------------------------코스 제목------------------------------->
        <div class="UJ-course2" id="UJ-courseTitle-file">
            <div id="UJ-courseTitle">
              
                <h1 align="center" style="line-height:0;"> <b><%=c.getCourseTitle() %></b> </h1>
              
            </div>


             
          
               <!-- --------------------- selectbox로 역 선택하게 하기 -------------------------->
            <div id="UJ-search_station1">
                    
                <table>
                    <tr>
                        <td>
                            <input type="text" name="station_line" value="<%=c.getLine() %>호선" readonly style="height: 35px; width: 150px;"> 
                        </td>
                        <td>
                            <input type="text" name="station_name" value="<%=c.getStationName()%>" readonly style="height: 35px; width: 170px; ">
                        </td>
                        <td>
                            <span style="font-size: 14px; color: gray; padding-left: 20px;">하단에 지도로 경로를 확인해보세요 (지도를 클릭시 경로 그리기, 오른쪽 버튼을 클릭시 경로 그리기 종료)</span>

                        </td>
                    </tr>
                    
                    
	

   
                    

                </table>

               
               

              
               
               
               
        
            </div>




        

        </div>


         <!------------------------------지도------------------------------->
        
        <div class="UJ-course3" id="map"></div>

        <script>
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
                mapOption = { 
                    center: new kakao.maps.LatLng(37.529128500148, 126.9654885873), // 지도의 중심좌표
                    level: 3 // 지도의 확대 레벨
                };
            
            var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
            
            var drawingFlag = false; // 선이 그려지고 있는 상태를 가지고 있을 변수입니다
            var moveLine; // 선이 그려지고 있을때 마우스 움직임에 따라 그려질 선 객체 입니다
            var clickLine // 마우스로 클릭한 좌표로 그려질 선 객체입니다
            var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다
            var dots = {}; // 선이 그려지고 있을때 클릭할 때마다 클릭 지점과 거리를 표시하는 커스텀 오버레이 배열입니다.
            
            // 지도에 클릭 이벤트를 등록합니다
            // 지도를 클릭하면 선 그리기가 시작됩니다 그려진 선이 있으면 지우고 다시 그립니다
            kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
            
                // 마우스로 클릭한 위치입니다 
                var clickPosition = mouseEvent.latLng;
            
                // 지도 클릭이벤트가 발생했는데 선을 그리고있는 상태가 아니면
                if (!drawingFlag) {
            
                    // 상태를 true로, 선이 그리고있는 상태로 변경합니다
                    drawingFlag = true;
                    
                    // 지도 위에 선이 표시되고 있다면 지도에서 제거합니다
                    deleteClickLine();
                    
                    // 지도 위에 커스텀오버레이가 표시되고 있다면 지도에서 제거합니다
                    deleteDistnce();
            
                    // 지도 위에 선을 그리기 위해 클릭한 지점과 해당 지점의 거리정보가 표시되고 있다면 지도에서 제거합니다
                    deleteCircleDot();
                
                    // 클릭한 위치를 기준으로 선을 생성하고 지도위에 표시합니다
                    clickLine = new kakao.maps.Polyline({
                        map: map, // 선을 표시할 지도입니다 
                        path: [clickPosition], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
                        strokeWeight: 3, // 선의 두께입니다 
                        strokeColor: '#db4040', // 선의 색깔입니다
                        strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
                        strokeStyle: 'solid' // 선의 스타일입니다
                    });
                    
                    // 선이 그려지고 있을 때 마우스 움직임에 따라 선이 그려질 위치를 표시할 선을 생성합니다
                    moveLine = new kakao.maps.Polyline({
                        strokeWeight: 3, // 선의 두께입니다 
                        strokeColor: '#db4040', // 선의 색깔입니다
                        strokeOpacity: 0.5, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
                        strokeStyle: 'solid' // 선의 스타일입니다    
                    });
                
                    // 클릭한 지점에 대한 정보를 지도에 표시합니다
                    displayCircleDot(clickPosition, 0);
            
                        
                } else { // 선이 그려지고 있는 상태이면
            
                    // 그려지고 있는 선의 좌표 배열을 얻어옵니다
                    var path = clickLine.getPath();
            
                    // 좌표 배열에 클릭한 위치를 추가합니다
                    path.push(clickPosition);
                    
                    // 다시 선에 좌표 배열을 설정하여 클릭 위치까지 선을 그리도록 설정합니다
                    clickLine.setPath(path);
            
                    var distance = Math.round(clickLine.getLength());
                    displayCircleDot(clickPosition, distance);
                }
            });
                
            // 지도에 마우스무브 이벤트를 등록합니다
            // 선을 그리고있는 상태에서 마우스무브 이벤트가 발생하면 그려질 선의 위치를 동적으로 보여주도록 합니다
            kakao.maps.event.addListener(map, 'mousemove', function (mouseEvent) {
            
                // 지도 마우스무브 이벤트가 발생했는데 선을 그리고있는 상태이면
                if (drawingFlag){
                    
                    // 마우스 커서의 현재 위치를 얻어옵니다 
                    var mousePosition = mouseEvent.latLng; 
            
                    // 마우스 클릭으로 그려진 선의 좌표 배열을 얻어옵니다
                    var path = clickLine.getPath();
                    
                    // 마우스 클릭으로 그려진 마지막 좌표와 마우스 커서 위치의 좌표로 선을 표시합니다
                    var movepath = [path[path.length-1], mousePosition];
                    moveLine.setPath(movepath);    
                    moveLine.setMap(map);
                    
                    var distance = Math.round(clickLine.getLength() + moveLine.getLength()), // 선의 총 거리를 계산합니다
                        content = '<div class="dotOverlay distanceInfo">총거리 <span class="number">' + distance + '</span>m</div>'; // 커스텀오버레이에 추가될 내용입니다
                    
                    // 거리정보를 지도에 표시합니다
                    showDistance(content, mousePosition);   
                }             
            });                 
            
            // 지도에 마우스 오른쪽 클릭 이벤트를 등록합니다
            // 선을 그리고있는 상태에서 마우스 오른쪽 클릭 이벤트가 발생하면 선 그리기를 종료합니다
            kakao.maps.event.addListener(map, 'rightclick', function (mouseEvent) {
            
                // 지도 오른쪽 클릭 이벤트가 발생했는데 선을 그리고있는 상태이면
                if (drawingFlag) {
                    
                    // 마우스무브로 그려진 선은 지도에서 제거합니다
                    moveLine.setMap(null);
                    moveLine = null;  
                    
                    // 마우스 클릭으로 그린 선의 좌표 배열을 얻어옵니다
                    var path = clickLine.getPath();
                
                    // 선을 구성하는 좌표의 개수가 2개 이상이면
                    if (path.length > 1) {
            
                        // 마지막 클릭 지점에 대한 거리 정보 커스텀 오버레이를 지웁니다
                        if (dots[dots.length-1].distance) {
                            dots[dots.length-1].distance.setMap(null);
                            dots[dots.length-1].distance = null;    
                        }
            
                        var distance = Math.round(clickLine.getLength()), // 선의 총 거리를 계산합니다
                            content = getTimeHTML(distance); // 커스텀오버레이에 추가될 내용입니다
                            
                        // 그려진 선의 거리정보를 지도에 표시합니다
                        showDistance(content, path[path.length-1]);  
                         
                    } else {
            
                        // 선을 구성하는 좌표의 개수가 1개 이하이면 
                        // 지도에 표시되고 있는 선과 정보들을 지도에서 제거합니다.
                        deleteClickLine();
                        deleteCircleDot(); 
                        deleteDistnce();
            
                    }
                    
                    // 상태를 false로, 그리지 않고 있는 상태로 변경합니다
                    drawingFlag = false;          
                }  
            });    
            
            // 클릭으로 그려진 선을 지도에서 제거하는 함수입니다
            function deleteClickLine() {
                if (clickLine) {
                    clickLine.setMap(null);    
                    clickLine = null;        
                }
            }
            
            // 마우스 드래그로 그려지고 있는 선의 총거리 정보를 표시하거
            // 마우스 오른쪽 클릭으로 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 생성하고 지도에 표시하는 함수입니다
            function showDistance(content, position) {
                
                if (distanceOverlay) { // 커스텀오버레이가 생성된 상태이면
                    
                    // 커스텀 오버레이의 위치와 표시할 내용을 설정합니다
                    distanceOverlay.setPosition(position);
                    distanceOverlay.setContent(content);
                    
                } else { // 커스텀 오버레이가 생성되지 않은 상태이면
                    
                    // 커스텀 오버레이를 생성하고 지도에 표시합니다
                    distanceOverlay = new kakao.maps.CustomOverlay({
                        map: map, // 커스텀오버레이를 표시할 지도입니다
                        content: content,  // 커스텀오버레이에 표시할 내용입니다
                        position: position, // 커스텀오버레이를 표시할 위치입니다.
                        xAnchor: 0,
                        yAnchor: 0,
                        zIndex: 3  
                    });      
                }
            }
            
            // 그려지고 있는 선의 총거리 정보와 
            // 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 삭제하는 함수입니다
            function deleteDistnce () {
                if (distanceOverlay) {
                    distanceOverlay.setMap(null);
                    distanceOverlay = null;
                }
            }
            
            // 선이 그려지고 있는 상태일 때 지도를 클릭하면 호출하여 
            // 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 표출하는 함수입니다
            function displayCircleDot(position, distance) {
            
                // 클릭 지점을 표시할 빨간 동그라미 커스텀오버레이를 생성합니다
                var circleOverlay = new kakao.maps.CustomOverlay({
                    content: '<span class="dot"></span>',
                    position: position,
                    zIndex: 1
                });
            
                // 지도에 표시합니다
                circleOverlay.setMap(map);
            
                if (distance > 0) {
                    // 클릭한 지점까지의 그려진 선의 총 거리를 표시할 커스텀 오버레이를 생성합니다
                    var distanceOverlay = new kakao.maps.CustomOverlay({
                        content: '<div class="dotOverlay">거리 <span class="number">' + distance + '</span>m</div>',
                        position: position,
                        yAnchor: 1,
                        zIndex: 2
                    });
            
                    // 지도에 표시합니다
                    distanceOverlay.setMap(map);
                }
            
                // 배열에 추가합니다
                dots.push({circle:circleOverlay, distance: distanceOverlay});
            }
            
            // 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 지도에서 모두 제거하는 함수입니다
            function deleteCircleDot() {
                var i;
            
                for ( i = 0; i < dots.length; i++ ){
                    if (dots[i].circle) { 
                        dots[i].circle.setMap(null);
                    }
            
                    if (dots[i].distance) {
                        dots[i].distance.setMap(null);
                    }
                }
            
                dots = [];
            }
            
            // 마우스 우클릭 하여 선 그리기가 종료됐을 때 호출하여 
            // 그려진 선의 총거리 정보와 거리에 대한 도보, 자전거 시간을 계산하여
            // HTML Content를 만들어 리턴하는 함수입니다
            function getTimeHTML(distance) {
            
                // 도보의 시속은 평균 4km/h 이고 도보의 분속은 67m/min입니다
                var walkkTime = distance / 67 | 0;
                var walkHour = '', walkMin = '';
            
                // 계산한 도보 시간이 60분 보다 크면 시간으로 표시합니다
                if (walkkTime > 60) {
                    walkHour = '<span class="number">' + Math.floor(walkkTime / 60) + '</span>시간 '
                }
                walkMin = '<span class="number">' + walkkTime % 60 + '</span>분'
            
                // 자전거의 평균 시속은 16km/h 이고 이것을 기준으로 자전거의 분속은 267m/min입니다
                var bycicleTime = distance / 227 | 0;
                var bycicleHour = '', bycicleMin = '';
            
                // 계산한 자전거 시간이 60분 보다 크면 시간으로 표출합니다
                if (bycicleTime > 60) {
                    bycicleHour = '<span class="number">' + Math.floor(bycicleTime / 60) + '</span>시간 '
                }
                bycicleMin = '<span class="number">' + bycicleTime % 60 + '</span>분'
            
                // 거리와 도보 시간, 자전거 시간을 가지고 HTML Content를 만들어 리턴합니다
                var content = '<ul class="dotOverlay distanceInfo">';
                content += '    <li>';
                content += '        <span class="label">총거리</span><span class="number">' + distance + '</span>m';
                content += '    </li>';
                content += '    <li>';
                content += '        <span class="label">도보</span>' + walkHour + walkMin;
                content += '    </li>';
                content += '    <li>';
                content += '        <span class="label">자전거</span>' + bycicleHour + bycicleMin;
                content += '    </li>';
                content += '</ul>'
            
                return content;
            }
                
            </script>



         <!------------------------------사용자가 선택한 코스------------------------------->
        <div class="UJ-course4" id="UJ-sequence">

            
               
                <div id="UJ-seq1">
                    <div id="UJ-seq1-1">1</div>

				
			

                    <div id="UJ-seq1-2">
                        <img src="<%=contextPath %>/<%=list.get(0).getFilePath() %>/<%=list.get(0).getChangeName() %>">
                    </div>

			
			
                    <div id="UJ-seq1-3">

                        <p class="UJ-p"><%=c.getDtn1() %></p>

                    </div>
               
                </div>
                
            
       <!-- dtn2번부터는 null일 수도 있음  -->          


			 <% if (list != null && list.size() > 1 && list.get(1).getFilePath() != null) { %>
				
				
		         <div id="UJ-seq2">
                    <div id="UJ-seq2-1">2</div>

				
                    <div id="UJ-seq2-2">
                        <img src="<%=contextPath %>/<%=list.get(1).getFilePath() %>/<%=list.get(1).getChangeName() %>">
                    </div>
				

                 
					
                    <div id="UJ-seq2-3">

                        <p class="UJ-p"><%=c.getDtn2() %></p>

                    </div>
                    
               
                </div>
                
               <%}else{ %>
                 <div id="UJ-seq2">
                    <div id="UJ-seq2-1">2</div>

                    <div id="UJ-seq2-2">
                        <img src="resources/images/gray.png" >
                    </div>


                    <div id="UJ-seq2-3">

                        <p class="UJ-p"></p>

                    </div>
               
                </div>
               
               <%} %> 
                
                
                
              <% if (list != null && list.size() > 2 && list.get(2).getFilePath() != null) { %>
				
				
		         <div id="UJ-seq3">
                    <div id="UJ-seq3-1">3</div>

				
                    <div id="UJ-seq3-2">
                        <img src="<%=contextPath %>/<%=list.get(2).getFilePath() %>/<%=list.get(2).getChangeName() %>">
                    </div>
				

                    
					
                    <div id="UJ-seq3-3">

                        <p class="UJ-p"><%=c.getDtn3()%></p>

                    </div>
                    
               
                </div>
                
               <%}else{ %>
                 <div id="UJ-seq3">
                    <div id="UJ-seq3-1">3</div>

                    <div id="UJ-seq3-2">
                        <img  src="resources/images/gray.png">
                    </div>


                    <div id="UJ-seq3-3">

                       <p class="UJ-p"></p>
                    </div>
               
                </div>
               
               <%} %> 
                
                
                
                
                
                
               <% if (list != null && list.size() > 3 && list.get(3).getFilePath() != null) { %>
				
				
		         <div id="UJ-seq4">
                    <div id="UJ-seq4-1">4</div>

				
                    <div id="UJ-seq4-2">
                        <img src="<%=contextPath %>/<%=list.get(3).getFilePath() %>/<%=list.get(3).getChangeName() %>">
                    </div>
				

                
					
                    <div id="UJ-seq4-3">

                        <p class="UJ-p"><%=c.getDtn4() %></p>

                    </div>
                    
               
                </div>
                
               <%}else{ %>
                 <div id="UJ-seq4">
                    <div id="UJ-seq4-1">4</div>

                    <div id="UJ-seq4-2">
                        <img src="resources/images/gray.png">
                    </div>


                    <div id="UJ-seq4-3">

                       <p class="UJ-p">
                       </p>
                    </div>
               
                </div>
               
               <%} %> 
                
		             
		             
		             
		     </div> <!-- course4의 끝나는 div -->

       
	

        
                
 
 			
         
         
         <!------------------------------코스 내용------------------------------->

      

            <div class="UJ-course5" id="UJ-courseContent"  >
            
                 
                <textarea name="courseContent" id="courseContent"  style="padding-left:10px; border:0; resize: none; background-color:#f7f7f7; color:gray; border-radius:10px;" readonly> <%=c.getCourseContent() %> </textarea>
            </div>
    
    
             <!------------------------------코스 꿀팁------------------------------->
            <div class="UJ-course6" id="UJ-tip">
                <textarea name="tip" id="UJ-tip" style=" padding-left:10px;  border:0; resize: none; background-color:#f7f7f7; color:gray;border-radius:10px;" readonly><%=c.getCourseTip() %></textarea>
            </div>
       

        <br><br>
        <hr>

         <!------------------------------ 수정/삭제/목록 버튼 ------------------------------>
         <!-- 작성자만 삭제하고 수정할 수 있게 하기  -->
        <div id="UJ-button" >
        
       
        	
            <br><br>

            <!-- 로그인을 하고 해당 게시물의 작성자일 경우만 수정/삭제 가능하게 하기 -->
            <button class="btn btn-secondary" onclick="location.href='<%=contextPath %>/list.co?cpage=1'" >목록</button>
            <!-- 수정 누르면 수정하는 jsp로 넘어가게 -->



    <% if (loginMember != null && loginMember.getMemberId().equals("admin") || loginMember != null && memberNickName.equals(userName))  { %>

            <button class="btn btn-secondary" onclick="location.href='<%=contextPath %>/updateForm.co?cno=<%=c.getBoardNo() %>'" > 수정</button>
             <!-- 삭제 누르면 삭제하는 폼 서블릿으로 넘어가게 -->



             <!-- 목록은 로그인/작성자 여부 상관없이 항상 보이게 하기 -->
            <button class="btn btn-secondary" onclick="location.href='<%=contextPath%>/delete.co?cno=<%=c.getBoardNo()%>'"> 삭제</button>
             <!-- 목록 누르면 목록보여주는 jsp로 넘어가게 -->

         <%} %>

             <br><br><br>
             
             
             
             
            </div>
            <hr>
            
            </div>


            <!------------------------------댓글------------------------------->
            <div id="UJ-reply">


                <table class="replyTable" >

                    <!-- 로그인 한 회원이 볼 화면  -->
                   
                   
                  <thead>

               <%if(loginMember != null){ %>    
                    <tr >
                

                        <th colspan="3"  >
                         
                            <p>&nbsp;</p>
                        </th>
                       
                      
                    </tr>

                      <tr >
                
                        <th colspan="3"  >
                          <input type="text" placeholder="댓글을 입력하세요" style="padding-left: 10px;" id="UJreply">
                        

                        </th>

                       
                       
                        <td>
                            <button style="width: 70px;" class="btn btn-primary" onclick="UJinsertReply();">작성</button>
                            

                        </td>
                        
                        
                      </tr>  


                        <tr >
                    
                

                            <th colspan="3"  >
                             
                                <p>&nbsp;</p>
                            </th>
                           
                          
                        </tr>
                        
                     <%}else{ %>   

                        <!-- 로그인안한 회원이 볼 화면  -->


                        <th colspan="3"  >
                             
                            <p>&nbsp;</p>
                        </th>


					<tr>
                         <td colspan="3">
                            <input type="text" value="로그인 후 이용가능한 서비스입니다." readonly>
                        </td>
                        <td>
                            <button disabled>댓글 등록</button>
                        </td> 

                    </tr>
                    
				<%} %>
                  </thead>
              
                  <tbody id="UJ-courseTbody">
                    <!-- 작성한 댓글을 ajax로 여기다가 그릴 예정   -->
                    




					</tbody>

                    <th colspan="3"  >
                             
                        <p>&nbsp;</p>
                    </th>
                  
                </table>


            </div>
            
            
        </div>
        
        
        <br><br><br><br><br><br><br><br><br>
        
        

 
      


    

 
  <script>
 

    
    
    
    
    
    $(function(){
    	selectCourseReply();
    	
    	setInterval(selectCourseReply,1000);
		// 이건 실시간 인기 검색어 등에 설정하면 됨!	
    	
    })
    
    
    
    
    // 댓글 작성하는 ajax
    function UJinsertReply(){
    	
    	$.ajax({
    		
    		url:"insertReply.co",
    		data:{
    			
    			content:$("#UJreply").val(),
    			cno:<%=c.getBoardNo()%>
    			
    		},
    		
    		
    		type:"post",
    		
    		
    		success:function(result){
    			
    			if(result>0){
    				// 댓글 작성 성공하면 댓글 조회한거 호출하고 , 댓글 창도 비워주기 
    				
    				selectCourseReply();            						
            						
	    	       // 댓글 작성하는 곳도 초기화하기
	    			$("#UJreply").val("")
    				
    				
    			}
    			
    		
    			
    		} // success 끝 
    		
    		
    	})  // insert ajax끝 
    	
    	
    
    }// insert 함수 끝 
    
   
    // 댓글 조회해오는 함수
    
    function selectCourseReply(){
    	
    	$.ajax({
    	
    		url:"selectCourseReply.co",
    		data:{
    			cno:<%=c.getBoardNo()%>
    			
    		},
    		
    		
    		
    		
    		success:function(list){
    			
    			
    			
    			let result = "";
    			
    			let memberNo = "<%= memberNo %>"
    			
    			//console.log(memberNo)
    			
    			for(let i=0; i<list.length; i++){
    			result += "<tr>"
                       + "<td style='background-color: #fff; width: 180px; padding-left: 10px;'>" + list[i].memberName + "</td>"
                       + "<td  style='background-color: #fff; width: 550px; padding-left: 10px;'>" + list[i].commentContent + "</td>"
                       + "<td  style='background-color: #fff; padding-left: 10px;'>" + list[i].enrollDate + "</td>"
                       + "<td>";
                       
                       
                       
                    
                         if(list[i].memberNo == memberNo || memberNo ==1 ){
                        	   
                         
                    	   result += "<button style='width: 70px; background-color: #0D98BA; color: white;' class='btn' onclick='deleteCourseReply(" + list[i].commentNo + ");'>삭제</button>";
                      
                           
                           }
                       
                       
                      result += "</td>"
           			          + "</tr>";
           			   
    			}
           			   
           		$("#UJ-courseTbody").html(result);   
    				
    			
    			
    		}
    		
    		
    		
    	})
    	
    	
    	
    }
    
    // 여행 코스 댓글 삭제
    // 댓글 번호, 멤버 번호, 보드 넘버
    function deleteCourseReply(num){
    	

    	$.ajax({
    	
    		url:"deleteReply.co",
    		data:{
    			cno:<%=c.getBoardNo()%>,
    			memberNo:"<%= memberNo %>",
    			commentNo:num
    		},
    		
    		type:"post",
    		
    		
    		success:function(result){
    			
    			if(result>0){
    				alert("댓글 삭제를 성공했습니다.")
    				selectCourseReply();
    			}
    			
    			
    		}
    		
    		
    		
    	})
    	
    	
    }
    
    
    
    
    
    
</script>










</body>
<%@ include file="../common/footer.jsp" %>
</html>
	
	
