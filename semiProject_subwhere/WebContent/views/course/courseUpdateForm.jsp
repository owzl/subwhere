	
	<%@page import="com.kh.board.model.vo.Uploadfile"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.board.model.vo.Course"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%
    	Course c = (Course)request.getAttribute("c");
    	ArrayList<Uploadfile> list = (ArrayList<Uploadfile>)request.getAttribute("list");
    	// list에는 첨부파일에 대한 정보가 담겨있음
    %>
    
    
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

         .UJ-wrap>div,form{
            width: 100%;
            box-sizing: border-box;
            /* border: 1px solid blue; */
        }
		 


   .UJ-form{
          
          height: 95%;
          box-sizing: border-box;
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


   


        /* 좋아요/신고 이미지 */
        #UJ-up-img{
            width: 50%;
            box-sizing: border-box;
            
        }

        #UJ-up-img>img{
            padding-top: 30px;
            cursor: pointer;
        }




        /* 제목, 파일(사진) */
        .UJ-course2{
            height: 10%;
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
            
        }


        /* course2 나누기 (코스 제목)  */
        .UJ-course2>div{
          /*  border: 1px dashed green; */ 
            width: 100%;
            box-sizing: border-box;
            
            
        }

        #UJ-courseTitle{
            height: 40%;
            box-sizing: border-box;
         
        }

        /* 제목입력 input */
        #UJ-courseTitle>input{
            width: 100%;
            height: 60px;
            box-sizing: border-box;
            color: gray;
            font-size:25px;
            padding-left:10px;
            
            
        }

        /* 첨부 파일 */
        #UJ-search_station1{
            height: 50%;
            margin-top:15px;
            box-sizing: border-box;
            background-color: #f7f7f7;
            position: relative;
        }

        #UJ-search_station1>input{
            position: absolute;
            margin-left: 10px;
            margin-top: 20px;
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
             <h2 style="color: gray;"> <b>여행코스 수정하기</b></h2>
           


        </div>
        
 			
		    

	<form action="<%=contextPath %>/realUpdate.co" method="post" enctype="multipart/form-data" class="UJ-form">  
    
    <div id="UJ-con01" >
 			
                <div></div>
                <div></div>
	         <span>작성자 :  <%=c.getMemberNo() %></span> <br>
		     <span>조회수 :  <%=c.getCount() %> </span> <br>
             <span>작성일 :  <%=c.getCreateDate() %> </span>
 			
		        
		     </div>
    
      <!------------------------------코스 제목------------------------------->
        <div class="UJ-course2" id="UJ-courseTitle-file">
            <div id="UJ-courseTitle">
              
                <input type="hidden" value=<%=c.getMemberNo()%> name="userName">
                <input type="text" id="courseTitle" name="courseTitle" value="<%=c.getCourseTitle() %>" required>
              
            </div>


            <input type="hidden" name="cno" value="<%=c.getBoardNo()%>">
          
               <!-- --------------------- selectbox로 역 선택하게 하기 -------------------------->
            <div id="UJ-search_station1">
                    
               
               
                <select onclick="UJcategoryChange();" style="height: 36px; width: 170px;" id="UJ-station-line">
                   	
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
                    
                    <select id="UJ-stationName" style="height: 36px; width: 150px;" name="UJ-stationNo">
                    	<option value="<%=c.getStationNo() %>" ><%=c.getStationName() %></option>
                    </select>

                  
                <span style="font-size: 17px; color: gray; padding-left: 20px;">하단에 지도로 경로를 확인해보세요 (지도를 클릭시 경로 그리기, 오른쪽 버튼을 클릭시 경로 그리기 종료)</span>
               

              
               
               
               
        
            </div>




        

        </div>


         <!------------------------------지도------------------------------->
        
        <div class="UJ-course3" id="map"></div>

       



         <!------------------------------사용자가 선택한 코스------------------------------->
        <div class="UJ-course4" id="UJ-sequence">

               
                <p style="font-size: 17px; color: gray; text-align: center; "> (하단의 사각형 영역을 클릭하여 해당 장소의 사진을 첨부해주세요 . 단, 첫 번째 사진은 필수입니다.)</p>  
           	
           	
           		<input type="hidden" name="dtn1_fileNo" value="<%=list.get(0).getFileNo()%>">
           
           		
           		
               <%if (list != null && list.size() > 0) {%>
               <input type="hidden" name="dtn1_fileNo" value="<%=list.get(0).getFileNo()%>">
               
                <div id="UJ-seq1">
                    <div id="UJ-seq1-1">1</div>

                    <div id="UJ-seq1-2">
                        <img id="UJ-titleImg1" onclick="clickImg(1);" src="<%=contextPath %>/<%=list.get(0).getFilePath() %>/<%=list.get(0).getChangeName() %>"  >
                    </div>

                    <div id="UJ-seq1-3" style="padding-top: 30px;">
                        <input type="text" value="<%=c.getDtn1()%>" style="width: 350px;" name="DTN_1">
                       
                    </div>


                </div>
                
                <%} %>
 
             
      <% if (list != null && list.size() > 1 && list.get(1).getFilePath() != null) { %>
       		<input type="hidden" name="dtn2_fileNo" value="<%=list.get(1).getFileNo()%>">
              <div id="UJ-seq2">
                    <div id="UJ-seq2-1">2</div>
                    <div id="UJ-seq2-2">
                        <img  id="UJ-contentImg2" onclick="clickImg(2);" src="<%=contextPath %>/<%=list.get(1).getFilePath() %>/<%=list.get(1).getChangeName() %>">
                    </div>

                    <div id="UJ-seq2-3" style="padding-top: 30px;">
                        <input type="text" value="<%=c.getDtn2() %>" style="width: 350px;" name="DTN_2">
                    </div>

              </div>
              
              
        <%}else{ %>
          <div id="UJ-seq2">
        
                    <div id="UJ-seq2-1">2</div>
                    <div id="UJ-seq2-2">
                        <img  id="UJ-contentImg2" onclick="clickImg(2);" >
                    </div>

                    <div id="UJ-seq2-3" style="padding-top: 30px;">
                        <input type="text" placeholder="장소명을 입력해주세요" style="width: 350px;" name="DTN_2">
                    </div>

              </div>
        
          <%} %> 
              


     <% if (list != null && list.size() > 2 && list.get(2).getFilePath() != null) { %>
      <input type="hidden" name="dtn3_fileNo" value="<%=list.get(2).getFileNo()%>">
              <div id="UJ-seq3">
                    <div id="UJ-seq3-1">3</div>
                    <div id="UJ-seq3-2">
                        <img  id="UJ-contentImg3" onclick="clickImg(3);" src="<%=contextPath %>/<%=list.get(2).getFilePath() %>/<%=list.get(2).getChangeName() %>">
                    </div>

                    <div id="UJ-seq3-3" style="padding-top: 30px;">
                        <input type="text" value="<%=c.getDtn3()%>" style="width: 350px;" name="DTN_3">
                    </div>

              </div>
              
              
         <%}else{ %>
         
           <div id="UJ-seq3">
                    <div id="UJ-seq3-1">3</div>
         
                    <div id="UJ-seq3-2">
                        <img  id="UJ-contentImg3" onclick="clickImg(3);" >
                    </div>

                    <div id="UJ-seq3-3" style="padding-top: 30px;">
                        <input type="text" placeholder="장소명을 입력해주세요" style="width: 350px;" name="DTN_3">
                    </div>

              </div>
              
              
           <%} %>     
         
         
               
              
		<% if (list != null && list.size() > 3 && list.get(3).getFilePath() != null) { %>
		<input type="hidden" name="dtn4_fileNo" value="<%=list.get(3).getFileNo()%>">
              <div id="UJ-seq4">
                    <div id="UJ-seq4-1">4</div>
                    <div id="UJ-seq4-2">
                        <img  id="UJ-contentImg4" onclick="clickImg(4);" src="<%=contextPath %>/<%=list.get(3).getFilePath() %>/<%=list.get(3).getChangeName() %>">
                    </div>

                    <div id="UJ-seq4-3" style="padding-top: 30px;">
                        <input type="text" value="<%=c.getDtn4() %>" style="width: 350px;" name="DTN_4">
                    </div>

              </div>
              

			<%}else{ %>
 				<div id="UJ-seq4">
 				
                    <div id="UJ-seq4-1">4</div>
                    <div id="UJ-seq4-2">
                        <img  id="UJ-contentImg4" onclick="clickImg(4);" >
                    </div>

                    <div id="UJ-seq4-3" style="padding-top: 30px;">
                        <input type="text" placeholder="장소명을 입력해주세요" style="width: 350px;" name="DTN_4">
                    </div>

              </div>
              
              
          <%} %> 

	

              <div id="imgFile" style="display: none;">
                <input type="file" id="file1" name="file1" onchange="loadImg(this,1);">
                <input type="file" id="file2" name="file2" onchange="loadImg(this,2);">
                <input type="file" id="file3" name="file3" onchange="loadImg(this,3);">
                <input type="file" id="file4" name="file4" onchange="loadImg(this,4);">
              </div>

              <script>
                function clickImg(num){
                    $("#file" + num).click();
                    
                      

                }
                
                function loadImg(file, num) {
                    if (file.files.length === 1) {
                       
                        const reader = new FileReader();
                        reader.readAsDataURL(file.files[0]);
                        reader.onload = function (e) {
                         
                            switch (num) {
                                case 1:
                                    $("#UJ-titleImg1").attr("src", e.target.result);
                                    break;
                                case 2:
                                    $("#UJ-contentImg2").attr("src", e.target.result);
                                    break;
                                case 3:
                                    $("#UJ-contentImg3").attr("src", e.target.result);
                                    break;
                                case 4:
                                    $("#UJ-contentImg4").attr("src", e.target.result);
                                    break;
                            }
                        }
                        
                        // 사진을 넣었다가 취소하는 경우
                    } else {
                     
                        switch (num) {
                            case 1:
                                $("#UJ-titleImg1").attr("src", null);
                               
                                break;
                            case 2:
                                $("#UJ-contentImg2").attr("src", null);
                               
                                break;
                            case 3:
                                $("#UJ-contentImg3").attr("src", null);
                             
                                break;
                            case 4:
                                $("#UJ-contentImg4").attr("src", null);
                              
                                break;
                        }
                    }
                }

              </script>
              
		             
		             
		     </div> <!-- course4의 끝나는 div -->

       
	

        
                
 
 			
         
         <!------------------------------코스 내용------------------------------->

      

            <div class="UJ-course5" id="UJ-courseContent"  >
            
                 
                <textarea name="courseContent" id="courseContent" style="resize: none;"> <%=c.getCourseContent() %> </textarea>
            </div>
    
    
             <!------------------------------코스 꿀팁------------------------------->
            <div class="UJ-course6" id="UJ-tip">
                <textarea name="tip" id="UJ-tip" style="resize: none;"><%=c.getCourseTip() %></textarea>
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

            <button class="btn btn-secondary" type="submit" > 수정</button>
             <!-- 삭제 누르면 삭제하는 폼 서블릿으로 넘어가게 -->


             <!-- 목록은 로그인/작성자 여부 상관없이 항상 보이게 하기 -->
            <button class="btn btn-secondary" onclick="location.href='<%=contextPath%>/delete.co?cno=<%=c.getBoardNo()%>'"> 삭제</button>
             <!-- 목록 누르면 목록보여주는 jsp로 넘어가게 -->

    

             <br><br><br>
             
             
             
             
            </div>

        </form>  
            
      </div>
        
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <!------------------------------댓글------------------------------->
        
        

 
      


    

 
  <script>
   
  // 이중 select문
  
  // 호선 id UJ-station-line
  // 역명 id UJ-stationName
  
  // 호선은 동적으로 생기지 않음 
  // 역명은 동적으로 생긴 요소임 
  
  
  
  
  
  
  function UJcategoryChange(){
  	
  	$.ajax({
  		url:"selectbox.co",
  		data:{num:$("#UJ-station-line option:selected").val()},
  		success:function(list){
  			if(list == null){  // 호선 선택을 눌렀을 경우
  				$("#UJ-stationName").html("");   // 먼저 역명 부분을 모두 비워주기
  				let val = "<option >역 명 선택</option>";  //역명 선택을 그려주기
  				$("#UJ-stationName").html(val);  // 역명이 들어가는 부분에 val값 넣기 
  			}else{
  				
  				// 만약 호선이 잘 넘어왔다면
  				console.log(list)
  				let val = "";
  				

					for(let i=0; i<list.length; i++){
						
						val += "<option value ='" + list[i].stationNo + "'>"  + list[i].stationName + "</option>"
						
						
						$("#UJ-stationName").html(val);  // val에 옵션을 그려주고 selectbox에 넣어주기
						
					
					}
  				
  			}
  		},
  		error:function(){
  			
  			console.log("호선 선택 ajax 실패!")
  		}
  	})
  	
  	
  }
  
  
  
  $(function(){
		// 호선을 위한 스크립트
		// 수정눌루했을때 호선에 내가 선택한 것이 빵 뜨게!!
	
		
		
		// 호선을 작성자가 선택한 호선이 뜨게하기 
		$("#UJ-station-line option").each(function(){
			// option에 각각 접근했을 때 실행할 함수
			
			// 내가 가지고 있는 카테고리 이름과 옵션 사이의 글자랑 일치하는지 찾아야함 
			 if($(this).val() == "<%=c.getLine()%>"){
				 // 내가 지금 순차적으로 접근하는 요소의 글자와 카테고리와 일치한다면
				 
				 $(this).attr("selected",true);
				 // 일치한 값의 속성을 selected로 변경하라는 의미
				 
			 }
			
		})
		
  })
		
		// 역명을 작성자가 선택한 역명이 뜨게 하기 
		
		
	


	
				
  
  
  
  
  // 지도 
  
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





<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
  <%@ include file="../common/footer.jsp" %>
	


	


<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>
	
	
