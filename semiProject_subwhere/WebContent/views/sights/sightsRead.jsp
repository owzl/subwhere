<%@page import="com.kh.board.model.vo.Uploadfile"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.board.model.vo.Sight"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	Sight s = (Sight)request.getAttribute("s");
    	ArrayList<Uploadfile> list = (ArrayList<Uploadfile>)request.getAttribute("list");
    	String userNo = String.valueOf(request.getAttribute("userNo"));
    	int likeResult = -1;
    	int reportResult = -1;
    	int userNumber = -1;
    	if(request.getSession().getAttribute("loginMember") != null){
    	likeResult = (int)request.getAttribute("likeResult");
    	reportResult = (int)request.getAttribute("reportResult");
    	userNumber = ((Member)request.getSession().getAttribute("loginMember")).getMemberNo();
    	}
    	
    	 
    	
    %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>여행지 추천</title>

    <!-- w3schools 부트스트랩 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <!-- 부트스트랩 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"/>


    <!-- Swiper CSS -->
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">


    <style>
        div * {box-sizing: border-box;}

        .all {
            margin: auto;
            width: 1200px;
            height: 1600px;
        }
        
        /* ---------------content_h----------------- */
        #content_h {
            padding-bottom: 50px;
            color: gray;
            font-weight: bolder;
        }
        
        

        /* ---------------content_b----------------- */
        #con1>#con1_head>#contentTitle {
            width: 92%;
            height: 50px;
            float: left;
            font-size: 40px;
            font-weight: bold;
            color: gray;
        }
        
        #con1>#con1_head>#contentIcon {
            width: 8%;
            height: 50px;
            float: left;
        }
        
        #con1>#con1_head>#contentIcon>#like {
            width: 50%;
            float: left;
            cursor: pointer;
        }
        #con1>#con1_head>#contentIcon>#report {
            width: 50%;
            float: left;
            cursor: pointer;
        }

        #con1>#con1_photo {
            width: 100%;
            padding: 70px 0px;
        }
        
        #con1_content>p, #con1_tip>p {
            color: gray;
            font-size: 16px;
            line-height: 30px;
            padding: 5px 10px;
        }

        #con1>#con1_content {
            width: 100%;
            height: 200px;
            background-color: rgb(235, 235, 235);
            border-radius: 10px;
            
        }

        #info1{
            color: #222;
            font-weight: 700;
            font-size: 18px;
            width:20%;
            
        }

        #info2{
            color: gray;
            font-weight: 300;
            font-size: 18px;
            
        }

        /* ---------------content_f----------------- */
         #content_f_right {
            width: 100%;
            float: left;
        }

        #manyphoto {
            color: lightgray;
            font-size: 12px;
        }

        #bottom_btn>a {
            height: 40px;
            width: 60px;
            line-height: 30px;
            font-size: 15px;
        }
        

        /*------슬라이드쇼------*/

        
          .swiper-button-next, .swiper-button-prev {
            position: absolute;
            top: 80%;
            transform: translateY(-50%);
        }
        
       
        .swiper-button-next, .swiper-button-prev {
            width: 30px;
            height: 30px;
            font-size: 20px;
            line-height: 1;
            color: rgba(0, 0, 0, 0.5);
            /*background-color: rgba(0, 0, 0, 0.5);*/
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            cursor: pointer;
        }
        
        .swiper-button-prev {
            left: 100px;
        }
        
        .swiper-button-next {
            right: 100px;
        }

        .swiper-slide img { /* 슬라이드 이미지 크기 자유롭게 변경하시면 됩니다 */
            width: 850px; 
            height: 500px; 
        }
        
        .disabled-button {
			pointer-events: none; 
			opacity: 1; 
			cursor: not-allowed;
		}
    </style>

    
</head>

<body>
<%@ include file="../common/header.jsp" %>

    <div class="all">
        <form action="">
            <!------------------------------content_h------------------------------->
            <div id="content_h">
                <p></p>
            </div>

            <!------------------------------content_b------------------------------->
            <div id="content_b">
        
                <div id="con1">
                    <div id="con1_head">
                        <div id="contentTitle" align="center">
                            <p><%=s.getTitle() %></p>
                        </div>
                        
                        <div id="contentIcon">
                        <%if(request.getSession().getAttribute("loginMember") != null) {%>
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
                                		url: "like.si",
                                		type: "GET",
                                		data: {
                                		    bno:<%=s.getBoardNo()%>,
                                	
                                	
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
                            
                            
                            
                            <!-- 신고기능 -->
                            <%if(request.getSession().getAttribute("loginMember") != null) {%>
                            <%if(reportResult ==1){ %>
                         <img src="resources/images/report2.png" id="report" onclick="sendReportRequest()">
                           <%}else{ %>
                            <img src="resources/images/report1.png" id="report" onclick="sendReportRequest()">
                            <%} %>
                            <%} %>
                            <script>
                               function sendReportRequest(){
                                	//하트 클릭시
                                	$.ajax({
                                		url: "report.si",
                                		type: "GET",
                                		data: {
                                		    bno:<%=s.getBoardNo()%>,
                                	
                                	
                                		},
                                		success: function(result){
                                			console.log(result);
                                			var reportImage = document.getElementById("report");

                                			 if (reportImage.src.endsWith("report1.png")) {
                                                 reportImage.src = "resources/images/report2.png";
                                             } else {
                                                 reportImage.src = "resources/images/report1.png";
                                             }
                                            
                                		},error:function(){
                  						  console.log("신고하기ajax실패");
                  					  }
                                	})
                               }	
                                
                            </script>
                        
                        
                       
                       
                       
                        </div>
                    </div>
                    <br><br>
                    <!--슬라이드 swiper-->
                    <div id="con1_photo" align="center">
                        
                        <div class="swiper-container">
                            <div class="swiper-wrapper"> <!--슬라이드 이미지 원하는만큼 추가-->
                            
                            	<%
                            	
                            	for(int i=0; i<list.size();i++){ %>
                                <div class="swiper-slide"><img src="<%=contextPath%>/<%=list.get(i).getFilePath()%>/<%=list.get(i).getChangeName()%>"></div>
                                <%} %>
                                
                            </div>
                           
                            <div class="swiper-button-next">&#9658;</div>
                            <div class="swiper-button-prev">&#9668;</div>
                        </div>
                    </div>
                    <!--슬라이드 끝-->
                    <div id="con1_content">
                        <p><%=s.getContent() %></p>
                        
                        
                    </div>
                    <br>
                    
                    <br>
                </div>
                <!--태그-->
                <div id="tag">
                	<%
                	String[] hashtags = s.getHashtag().split(",");
                	for(String hashtag : hashtags){
                	%>
                    <button class="btn btn-sm btn-primary disabled-button">#<%=hashtag.trim()%></button>
                    <%
                	}
                    %>
                </div>
                <br>
                <!--여행지 정보-->
                <div>


                </div>
                    
                <table width="1000">
                    <tr>
                        <th id="info1">이용시간</th>
                        <td id="info2"><%=s.getRuntime() %></td>
                    </tr>
                    <tr>
                        <th id="info1">휴무일</th>
                        <td id="info2"><%=s.getHoliday() %></td>
                    </tr>
                    <tr>
                        <th id="info1">주소</th>
                        <td id="info2"><%=s.getAddress() %></td>
                    </tr>
                    <tr>
                        <th id="info1">교통 정보</th>
                        <td id="info2"><%=s.getTransport() %></td>
                    </tr>
                </table>
                        
                       
                        
                <br>
                <br>
        
                <div id="con2">
                </div>
        
            </div>


            <!-------슬라이드 전용 swiper------>
            <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
            <script>
                var swiper = new Swiper('.swiper-container', {
                    navigation: {
                        nextEl: '.swiper-button-next',
                        prevEl: '.swiper-button-prev',
                    },
                    slidesPerView: 1,  
                    spaceBetween: 10000, 
                });
            </script>



            <!------------------------------content_f------------------------------->
            
           <div id="bottom_btn" align="right">   
           <%if(userNumber == 1) {%>
            	<button type="button" id="updateBtn" class="btn btn-secondary" onclick="submitUpdateForm()">수정</button>
                <button type="button" id="deleteBtn" class="btn btn-secondary" onclick="goToDelete()">삭제</button>
                <%} %>
                <button type="button" id="listBtn" class="btn btn-secondary" onclick="goToList()">목록</button>
                <%if(userNumber == 1){ %>
                <button type="button" id="writeBtn" class="btn btn-secondary" onclick="goToWrite()">글쓰기</button>
                <%} %>
            </div>
            <br><br><br><br>
            <hr>
            <br>
			<script>
			function submitUpdateForm() {
			    const form = document.createElement('form');
			    form.method = 'GET';
			    form.action = 'updateForm.si';

			    const input = document.createElement('input');
			    input.type = 'hidden';
			    input.name = 'bno';
			    input.value = <%=s.getBoardNo()%>;

			    form.appendChild(input);
			    document.body.appendChild(form);

			    form.submit();
			}
			    function goToList() {
			        window.location.href = "list.si?cpage=1"; 
			    }
			    function goToWrite(){
			    	window.location.href = "write.si";
			    }
			    function goToDelete(){
			    	window.location.href = "delete.si?bno="+<%=s.getBoardNo()%>;
			    }
			</script>
        </form>

        <!------------------------------댓글------------------------------->
        <div class="card-footer">
            <%if(request.getSession().getAttribute("loginMember") != null) { %>
              <div class="form-group">
                <input type="text" class="form-control" id="replyContent" placeholder="댓글을 입력하세요"  maxlength="49"  required>
              </div>
              <button type="button" class="btn btn-primary" onclick="insertReply();">작성</button>
            <%} %>
            <div class="comments mt-3" id="replyList">
            </div>
        </div>
    	<script>
    		$(function(){
    			selectReplyList();
    			
    		})
    		function insertReply(){
    			$.ajax({
    				url:"rinsert.si",
    				data:{content:$("#replyContent").val(),
    					  bno:<%=s.getBoardNo()%>,
    					  },
    					  type: "post",
    					  success:function(result){
    						  if(result>0){
    							  selectReplyList();
    							  $("#replyContent").val("");
    						  }
    					  },error:function(){
    						  console.log("ajax실패");
    					  }
    			})
    		}
    		
    		
    		function selectReplyList(){
    			$.ajax({
    				url:"rlist.si",
    				data:{bno:<%=s.getBoardNo()%>},
    				success: function(list){
    					console.log(list);
    					let result = "";
    					let result2= "";
    					for(let i=0; i<list.length;i++){
    						 
    						 result2 += "<br><br>";
    						 const truncatedContent = list[i].commentContent.length > 49
    		                    ? list[i].commentContent.substring(0, 49)
    		                    : list[i].commentContent;
    		                    
    		                    
    						result += "<tr>"
    							+ "<td>" + list[i].memberName+ "</td>"
    							+ "<td style='padding: 20px;'>"
    							+ "<td>" +  truncatedContent + "</td>"
    							+ "<td style='padding: 20px;'>"
    							+ "<td>" + list[i].modifyDate + "</td>"
    							+ "<td style='padding: 20px;'>";
    							
    							
    							if (<%=userNumber%> == 1 || <%=userNumber%> == list[i].memberNo) {
    						        result += "<td><button class='btn btn-sm btn-info' onclick='deleteComment(" + list[i].commentNo + ");'>삭제</button></td>";
    						    }
    							
    							
    							result += "</tr>";
    							
    					}
    					$("#replyList").html(result);
    					$("#replybr").html(result2);
        				
        			},
        			error:function(){
        				console.log("댓글 조회용 ajax 통신 실패!");
        			}
        		})
        	}
    		
    		function deleteComment(commentNo) {
    		    $.ajax({
    		        url: "cdelete.si",
    		        data: { commentNo: commentNo },
    		        type: "POST",
    		        success: function (result) {
    		            if (result > 0) {
    		                selectReplyList();
    		            }
    		        },
    		        error: function () {
    		            console.log("댓글 삭제용 ajax 통신 실패!");
    		        }
    		    });
    		}
        </script>
        


    </div>

        <!-- -------------위로가기 버튼------------ -->
        <div style="position:fixed; bottom: 200px; right: 10%; width: 5px; height: 5px; z-index: 999;">
           <a href="#"><img src="resources/images/upbutton.png" title="위로 가기" style="width: 50px;"></a>
        </div>

        <!-- -------------대한민구석구석 사이트 가기 버튼------------ -->
        <div style="position:fixed; bottom: 140px; right: 10%; width: 5px; height: 5px; z-index: 999;">
           <a href="https://1330chat.visitkorea.or.kr:3000/#/ttalk_main/CHAT1330_160635739001093018/_0300_0100_main.do" target="_blank"><img src="resources/images/movesite.png" title="대한민국구석구석" style="width: 50px;"></a>
        </div>
	<div id="replybr"></div>
    <br><br>
    <%@ include file="../common/footer.jsp"%>


</body>
</html>