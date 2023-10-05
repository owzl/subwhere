<%@page import="com.kh.board.model.vo.Uploadfile"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.board.model.vo.Review"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
   Review r = (Review)request.getAttribute("r");
   // 게시글에 관한 것들
   // 게시글번호, 역번호, 역명, 호선, 회원아이디, 제목, 주소, 내용, 꿀팁, 조회수, 작성일
   ArrayList<Uploadfile> list = (ArrayList<Uploadfile>)request.getAttribute("list");
   // 첨부파일에 관한 것들
   
   // userNo을 String 형으로
   String userNo = String.valueOf(request.getAttribute("userNo"));
   
   // ReviewDetailController 에서 쏴줌
    // * 좋아요
   int likeResult = (int)request.getAttribute("likeResult");
    // * 신고
    int reportResult = (int)request.getAttribute("reportResult");
%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"/>

<style>
        div * {box-sizing: border-box;}

        .all {
            margin: auto;
            width: 1400px;
            height: 2200px;
        }
        
        /* ---------------content_h----------------- */
        #content_h {
            padding-bottom: 10px;
            font-size: 20px;
            color: gray;
            font-weight: bold;
        }

        /* ---------------content_b----------------- */
        #lineOuter {
            padding-right: 300px;
            padding-top: 150px;
            color: gray;
            font-size: 16px;
        }

        #lineOuter>#lineType {
            background-color: orange;
            padding: 7px 20px;
            border-radius: 20px 0 0 0;
            color: white;
        }
        #lineOuter>#lineName {
            background-color: gray;
            padding: 7px 20px;
            border-radius: 0 20px 0 0;
            color: white;
        }


        #con0 {
            font-size: 16px;
            color: gray;
            line-height: 1.8;
            padding-bottom: 80px;
        }

        #con1>#con1_head>#contentTitle {
            width: 93%;
            height: 50px;
            float: left;
            font-size: 45px;
            font-weight: bold;
            color: gray;
        }
        
        #con1>#con1_head>#contentIcon {
            width: 7%;
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

        #lignOuter {
            padding-top: 150px;
            color: gray;
            font-size: 17px;
            font-weight: bold;
        }


        #con1>#con1_photo {
            width: 100%;
            padding: 10px 0px 50px 0px;
        }

        #con1>#con1_photo>img {
            width: 60%;
            height: 500px;
            border-radius: 20px;
        }

        #con1_photo_sub {
            width: 60%;
            height: 200px;
            margin-bottom: 50px;
        }

        #con1_photo_sub {
            width: 80%;
            height: 220px;
        }

        #con1_photo_sub img {
            width: 33.3%;
            height: 220px;
            float: left;
            padding-right: 5px;
            /* border-radius: 20px; */
        }

        #con1_photo_sub>.sub1 img {
            border-radius: 20px;
        }
      

        
        #con1_content>p, #con1_tip>p {
            color: gray;
            font-size: 16px;
            line-height: 30px;
            padding: 5px 10px;
        }

        #con1>#con1_content {
            width: 80%;
            height: 200px;
            background-color: rgb(235, 235, 235);
            border-radius: 10px;
            
        }

        #con1>#con1_tip {
            width: 80%;
            height: 100px;
            background-color: rgb(235, 235, 235);
            border-radius: 10px;
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
        
      
        #comment {
           padding-bottom : 50px;
        }
        
       
        #replyContent {
            width: 85%;
            height: 42px;
           float : left;
            margin-top: 15px;
        }

        #replyInsertBtn {
            width: 60px;
            height: 40px;
            font-size: 16px;
        }

        #replyDeleteBtn {
            width: 60px;
            height: 40px;
            font-size: 16px;
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
                <p>[여행 후기 게시글]</p>
            </div>


            <!------------------------------content_b------------------------------->
            <div id="content_b">
                <br><br><br>
                <div id="con0" align="right">
                    작성자 : <sapn style="font-weight: bold;"><%= r.getBoardWriter() %></sapn> <br>
                    작성일 : <sapn style="font-weight: bold;"><%= r.getCreateDate() %></sapn> <br>
                    조회수 : <sapn style="font-weight: bold;"><%= r.getCount() %></sapn> <br>
                </div>

                <div id="con1" align="center">
                    <div id="con1_head">

                        <br>
                        
                        <p align="right" style="color: rgb(255, 94, 94); font-weight: bold;">해당 여행 후기가 마음에 드시나요?</p>
                        <div id="contentTitle" align="center">
                            <p>' <%= r.getTitle() %> '</p>
                        </div>
                        
                        <div id="contentIcon">
                            
                           <!------------------------------- 좋아요 -------------------------------->
                           <!-- likeResult : ReviewDetailController에서 set해놓은거 위에서 받아주고 써 -->
                           <%if(likeResult == 1){ %>
                               <img src="resources/images/heart2.png" id="like" onclick="sendLikeRequest()">
                           <%}else{ %>
                               <img src="resources/images/heart1.png" id="like" onclick="sendLikeRequest()">
                           <%} %>
                           
                            <script>
                               function sendLikeRequest(){
                                   //하트 클릭시
                                   $.ajax({
                                      url: "like.re",
                                      type: "GET",
                                      data: {
                                          bno:<%=r.getBoardNo()%>,
                                      },
                                      success: function(result){ 
                                         //console.log(result);
                                         var heartImage = document.getElementById("like");

                                          if (heartImage.src.endsWith("heart1.png")) {
                                               heartImage.src = "resources/images/heart2.png";
                                          } else {
                                               heartImage.src = "resources/images/heart1.png";
                                          }
                                            
                                      },
                                      error:function(){
                                      console.log("좋아요 ajax 실패");
                                      }
                                  })
                               }
                            </script>
                            
                    
                           <!------------------------------- 신고 -------------------------------->
                           <!-- reportResult : ReviewDetailController에서 set해놓은거 위에서 받아주고 써 -->
                           <%if(reportResult == 1){ %>
                               <img src="resources/images/report2.png" id="report" onclick="sendReportRequest()">
                           <%}else{ %>
                               <img src="resources/images/report1.png" id="report" onclick="sendReportRequest()">
                           <%} %>
                            <script>
                               function sendReportRequest(){
                                   //신고 클릭시
                                   $.ajax({
                                      url: "report.re",
                                      type: "GET",
                                      data: {
                                          bno:<%=r.getBoardNo()%>,
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



               <!--------------------- 호선 / 역명 / 대표이미지 + 상세이미지 -------------------->
                    <div id="lineOuter" align="right">
                        <span id="lineType"><%= r.getLine() %>호선</span>
                        <span id="lineName"><%= r.getStationName() %></span>
                    </div>

                    <div id="con1_photo" align="center">
                        <!-- list에서 뽑기. 대표사진이니까 0번째인덱스 get(0).-->
                        <img src="<%= contextPath %>/<%= list.get(0).getFilePath() %>/<%= list.get(0).getChangeName() %>">
                    </div>

                    <div id="con1_photo_sub">
                        <div class="sub1">
                         <!-- 대표사진은(0번) 제외하고, 상세사진만(1,2,3번) 나와야하니까 i=1(o)부터 -->
                         
                       <% for(int i=1; i<list.size(); i++) { %>
                            <% if (!list.isEmpty()) { %>
                               <img src="<%= contextPath %>/<%= list.get(i).getFilePath() %>/<%= list.get(i).getChangeName() %>">      
                     <% } %>
                     
                       <% } %>
                       
                       <% if(list.size() == 1) { %>
                     <img src="resources/images/standardimage.png" width="265" height="170">
                     <img src="resources/images/standardimage.png" width="265" height="170">
                     <img src="resources/images/standardimage.png" width="265" height="170">
                       <% }else if(list.size() == 2) { %>
                     <img src="resources/images/standardimage.png" width="265" height="170">
                     <img src="resources/images/standardimage.png" width="265" height="170">
                       <% }else if(list.size() == 3){ %>
                     <img src="resources/images/standardimage.png" width="265" height="170">        
                       <% } %>
          
                       
                       
                        </div>
                    </div>
                    
                    <div id="con1_content" align="left">
                        <p><%= r.getContent() %></p>
                    </div>
                    <br>
                    <div id="con1_tip" align="left">
                        <p><%= r.getTip() %></p>
                    </div>
                    <br>
                </div>
        
                
        
            </div>

            <!------------------------------content_f------------------------------->
            
            <br>
       
            <div id="bottom_btn" align="right">
              <a href="<%=contextPath %>/list.re?cpage=1" class="btn btn-sm btn-secondary">목록</a>
              
              <!-- 로그인 한 멤버만 수정, 삭제 가능하도록 -->
              <% if(loginMember != null && loginMember.getMemberId().equals(r.getBoardWriter()) || loginMember.getMemberId().equals("admin")) { %>
                 <a href="<%=contextPath %>/updateForm.re?bno=<%= r.getBoardNo() %>" class="btn btn-sm btn-secondary">수정</a>
                 <a href="<%=contextPath %>/delete.re?num=<%= r.getBoardNo() %>" class="btn btn-sm btn-secondary">삭제</a>
              <% } %>
           </div>
            
            <br><br><br><br>
            <hr>
            <br>

        </form>
        
        
       
        
      
        
        
        
        <!------------------------------댓글------------------------------->
        
        <!-- 로그인한 회원만 댓글 쓸 수 있도록 -->
        <!-- (사실 애초에 여행 후기는 회원만 볼 수 있도록 해놓았기 때문에 당연히 댓글 쓸 수 있음.. 나중에 모든회원으로 풀 수도 있으니까 일단 조건걸어둠) -->
      
              <div class="card-footer" style="padding-left: 100px;">
                  <div class="form-group">
                     <input type="text" class="form-control" id="replyContent" placeholder="댓글을 입력하세요" required>
                  </div>
                
                        <button type="button" class="btn btn-primary" id="replyInsertBtn" onclick="insertReply();">작성</button>
                    
                  
                  
                  <div class="comments mt-3" id="replyList">
                     <!-- 여기에 댓글 꽂힘 -->
                     
                     
                  </div>
                  
              </div>
              
              <script>
              
                   $(function(){
                      selectReplyList();
                      setInterval(selectReplyList, 3000);
                   })
                   
                   function insertReply(){
                      $.ajax({
                             url:"rinsert.re",
                             data:{
                                   content:$("#replyContent").val(), // 댓글content
                                   bno:<%=r.getBoardNo()%>,          // 게시글번호
                                  },
                              type:"post",
                              success:function(result){ // result
                                    if(result > 0){
                                       selectReplyList();
                                       $("#replyContent").val("");
                                    }
                              },
                              error:function(){
                                 console.log("ajax실패");
                              }
                         })
                   }
                   
              
                   var loginMemberId = '<%= loginMember.getMemberId() %>';
                   var boardWriterId = '<%= r.getBoardWriter() %>';
                   var loginMemberNo = '<%= loginMember.getMemberNo() %>';
                   
                   
                   function selectReplyList(){
                      $.ajax({
                         url:"rlist.re",
                         data:{bno:<%=r.getBoardNo()%>},
                         success: function(list){
                               
                               //console.log(list);            //{commentNo: 16, memberNo: 4, commentContent: '댓글', modifyDate: '2023/09/03', memberName: '이둥이'}
                               //console.log(loginMemberId);    //doong
                               //console.log(boardWriterId);   //doong
                               //console.log(loginMemberNo);   //4
                               
                               //console.log(list[0].memberNo);   //1 (2018게시글 댓글 중)
                               //console.log(list[1].memberNo);   //2
                               //console.log(list[2].memberNo);   //4
                               //console.log(list[3].memberNo);   //4
                
                               let result = "";
                               let result2= "";
                               
                               for(let i=0; i<list.length;i++){
                              
                                  result2 += "<br><br>";
                                  result += "<tr>"
                                     + "<td style='padding-left: 10px;'>"
                                     + "<td>" + list[i].memberName + "</td>"
                                     + "<td style='padding: 20px;'>"
                                     + "<td width='823px'>" + list[i].commentContent + "</td>"
                                     + "<td style='padding: 20px;'>"
                                     + "<td>" + list[i].modifyDate + "</td>"
                                     + "<td style='padding: 20px;'>";
                                  
                                  // 해당 댓글을 작성한 회원과 관리자만 '삭제' 버튼이 보이도록
                                  // JavaScript 코드에 있는 문자열 내에서는 if 문이 들어갈 수 없음. 따라서 문자열 이외의 곳에서 if문 사용해야함(위에 변수 설정)
                                   //if (loginMemberId === boardWriterId) {
                                   //if (userNumber === 1 || userNumber === list[i].memberNo) {
                                  //if (loginMemberNo === 1 || loginMemberNo === list[i].memberNo) {
                                  if (loginMemberId == 'admin' || loginMemberNo == list[i].memberNo) {
                                       result += "<td><button id='replyDeleteBtn' class='btn btn-sm btn-warning' onclick='deleteReply(" + list[i].commentNo + ");'>삭제</button></td>";
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
                   
               
                   function deleteReply(commentNo){

                         $.ajax({
                                url:"rdelete.re",
                                data:{
                                      //content:$("#replyContent").val(), // 댓글content
                                      commentNo: commentNo,
                                      bno:<%=r.getBoardNo()%>,          // 게시글번호
                                     },
                                 type:"post",
                                 success:function(result){ // result
                                       if(result > 0){
                                          selectReplyList();
                                          //$("#replyContent").val("");
                                       }
                                 },
                                 error:function(){
                                    console.log("ajax실패");
                                 }
                            })
                     
               }

              </script>


    </div> <!-- 왕div 끝 -->
    
    
    
   <div id="replybr"></div>
    
    
    
   <br><br> 
   

   <%@ include file = "../common/footer.jsp" %>

    
</body>
</html>