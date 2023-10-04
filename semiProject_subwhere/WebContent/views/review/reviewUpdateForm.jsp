
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
    // 첨부파일 있을 경우 파일번호, 원본명, 수정명, 저장경로
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세게시글 수정하기</title>

<style>
     div * {box-sizing: border-box;}


     .all {
         margin: auto;
         width: 1200px;
         height: 1400px;
     }

     #info{
         color: #222;
         font-weight: 700;
         font-size: 13px;
         
     }
     .table-responsive {
         margin-top: 20px;
     }
     
     .table th, .table td {
         vertical-align: middle;
     }


     input.form-control {
         border: none;
     }

    
     input.form-control::placeholder {
         font-size: 16px;
         font-weight: bold;
         color: #555;
     }

    
     table.table {
         border: none;
     }

     
     table.table tbody tr td {
         border-top: none;
     }

     /* ---------------content_h----------------- */
     #content_h {
         width: 100%;
         height: 50px;
         color: gray;
         font-size: 25px;
         font-weight: bold;
         margin-left: 50px;
     }

     /* ---------------content_b----------------- */
     #content_b {
         padding-left: 50px;
     }

     #content_b #writeTitle {
         width: 1127px;
         height: 35px;
         border: 1px solid lightgray;
         margin-top: 7px;
         margin-bottom: 7px;
     }
     #content_b #writeAddress {
         width: 1127px;
         height: 35px;
         border: 1px solid lightgray;
         margin-bottom: 7px;
     }

     #content_b #content{
         width: 1127px;
         border: 1px solid lightgray;
     }
     
     #content_b #tip{
         width: 1127px;
         border: 1px solid lightgray;
     }
     
     /* ---------------content_b----------------- */
     #content_f {
         width: 100%;
         height: 50px;
         padding-top: 12px;
         padding-right: 20px;
     }

     /*--미리보기--*/
       .uploaded-image {
           max-width: 100px;
           max-height: 100px;
           margin: 5px;
           border: 1px solid #ccc;
       }

         .input-file-button{
             padding: 6px 25px;
             background-color:#007fff ;
             border-radius: 4px;
             color: white;
             cursor: pointer;
         }
         
         #manyphoto {
         color: lightgray;
         font-size: 13px;
     	}

     #tip {
         border: 1px solid lightgray;
         color: gray;
         margin-top: 2px;
     }
     	
     #outerReviewImg {
         /* border: 1px solid blue; */
         width: 100%;
         height: 220px;
         color: gray;
         font-weight: bold;
     }
     
     #outerReviewImg>#leftTitle {
         /* border: 1px solid red; */
         width: 25%;
         height: 220px;
         float: left;
     }

     #outerReviewImg>#rightContent {
         /* border: 1px solid red; */
         width: 75%;
         height: 220px;
         float: left;
         padding-left: 30px;
     }

 
     #outerReviewImg>#leftTitle>img {
         background-color: #f1f2f3;
     }
     #outerReviewImg>#rightContent>img {
         background-color: #f1f2f3;
     }

</style>

</head>
<body>

	<%@ include file="../common/header.jsp" %>
	
	<div class="all">
	
		<!-- -------------위로가기 버튼------------ -->
        <div style="position:fixed; bottom: 200px; right: 10%; width: 5px; height: 5px; z-index: 999;">
           <a href="#"><img src="resources/images/upbutton.png" title="위로 가기" style="width: 50px;"></a>
        </div>

        <!-- -------------대한민구석구석 사이트 가기 버튼------------ -->
        <div style="position:fixed; bottom: 140px; right: 10%; width: 5px; height: 5px; z-index: 999;">
           <a href="https://1330chat.visitkorea.or.kr:3000/#/ttalk_main/CHAT1330_160635739001093018/_0300_0100_main.do" target="_blank"><img src="resources/images/movesite.png" title="대한민국구석구석" style="width: 50px;"></a>
        </div>
	
							  <!-- 제발.. method="post" enctype="multipart/form-data" 까먹지마 -->
       <form action="<%= contextPath%>/update.re" method="post" enctype="multipart/form-data">

           <!------------------------------content_h------------------------------->
           <br><br>
           <div id="content_h">
               <span id="title">여행 후기</span>
               <span id="titleRed" style="color: #ff4554;">수정하기</span>
               
           </div> <br>
           
   
           <!------------------------------content_b------------------------------->
           <div id="content_b">
           
           	<!-- submit시 넘겨야할것 : 역관련.. | 제목, 주소, 내용, 꿀팁, 첨부파일4개, '게시글번호' -->												   	 
			
			<!-- *** hidden : 역관련 *** -->
			<input type="hidden" name="stationNo" value="<%= r.getStationNo()%>">
		
                    

			<!-- *** hidden : 게시글번호 *** -->
           	<input type="hidden" name="bno" value="<%= r.getBoardNo() %>">
           	<input type="hidden" name="memberNo" value="<%= r.getBoardWriter() %>">
            
               
               <!-- --------------------역 관련------------------- -->
               
               <!-- 이중셀렉트 -->
               <div id="SJ-search_station">
                   <select onclick="SJcategoryChange();" name="SJ-stationLine" id="SJ-stationLine" style="height: 36px; width: 170px;" >
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
                       
                   <select name="SJ-stationName" id="SJ-stationName" style="height: 36px; width: 150px;" >
                       <option value="<%=r.getStationNo() %>" ><%=r.getStationName() %></option>
                   </select>
                   	
                   <script>
                   function SJcategoryChange() {
                       
                       $.ajax({
                           url:"selectBox.re",
                           data:{num:$("#SJ-stationLine option:selected").val()},   // num : value="1"
                           success:function(list){
                           
                           	// *** (ajax) ReviewSelectSationController -> s -> d 후, list 받아와서 (101 용산역 1) ***
                           	
                               if(list == null){  // '호선 선택'을 눌렀을 경우
                                   $("#SJ-stationName").html("");   // 먼저 역명 부분을 모두 비워주기
                                   let val = "<option >역 명 선택</option>";  //역명 선택을 그려주기
                                   $("#SJ-stationName").html(val);  // 역명이 들어가는 부분에 val값 넣기 
                               }else{
                                   // 만약 호선이 잘 넘어왔다면
                                   console.log(list)
                                   // stationNo, stationName, line
                                   //    101,  	 용산역, 		1
                                   
                                   let val = "";
                                   for(let i=0; i<list.length; i++){
                                   	// <option value="1">용산역</option>
                                       val += "<option value= '" + list[i].stationNo +"'>" + list[i].stationName + "</option>"
                                       $("#SJ-stationName").html(val);  // val에 옵션을 그려주고 selectbox에 넣어주기
                                   }
                               }
                           
                           },
                           error:function(){}
                       })

                   }
                   
                   $(function(){
                	      // 호선을 위한 스크립트
                	      // 수정눌루했을때 호선에 내가 선택한 것이 빵 뜨게!!
                	   
                	      
                	      
                	      // 호선을 작성자가 선택한 호선이 뜨게하기 
                	      $("#SJ-stationLine option").each(function(){
                	         // option에 각각 접근했을 때 실행할 함수
                	         
                	         // 내가 가지고 있는 카테고리 이름과 옵션 사이의 글자랑 일치하는지 찾아야함 
                	          if($(this).val() == "<%=r.getLine()%>"){
                	             // 내가 지금 순차적으로 접근하는 요소의 글자와 카테고리와 일치한다면
                	             
                	             $(this).attr("selected",true);
                	             // 일치한 값의 속성을 selected로 변경하라는 의미
                	             
                	          }
                	         
                	      })
                	      
                	  })
                	      // 역명을 작성자가 선택한 역명이 뜨게 하기 

                   
                   
                   </script> 
               </div>

			<!-- --------------------글 관련------------------- -->
           
               <input type="text" name="title" id="writeTitle" placeholder="제목을 입력해주세요." required value="<%= r.getTitle() %>">
               <input type="text" name="address" id="writeAddress" placeholder="다녀오신 여행지 주소를 입력해주세요." required value="<%= r.getAddress() %>">
                   
               <div id="txtarea">
                  <textarea name="content" id="content" rows="20" cols="150" style="resize: none;" placeholder="내용을 입력해주세요." required ><%= r.getContent() %></textarea>     
                  <textarea name="tip" id="tip" cols="150" rows="10" style="resize: none;" placeholder="꿀팁란을 작성해주세요^_^" required><%= r.getTip() %></textarea>
               </div>
               <br>

			<!-- --------------------첨부파일 관련------------------- -->
		
			<!-- enrollForm과 비슷하지만 다른 점은 여긴 상단에 list 박아두고, 기존 데이터 넣어둬야함 + 여기서 수정된 값이 submit전송되어 그 값 들고 수정하러 가야함 -->
            <!-- 사진 업로드 -->
            <!-- 첨부파일 img -->
            <% if(list == null || list.size() <= 0) { %>
            <div id="outerReviewImg">        
                <div id="leftTitle">
                    <p>&gt; 대표이미지</p>
                    <img id="titleImg" width="265" height="170" onclick="chooseFile(1);">
                </div>   
                <div id="rightContent">
                    <p>&gt; 상세이미지</p>
                    <img id="contentImg1" width="265" height="170" onclick="chooseFile(2);">
                    <img id="contentImg2" width="265" height="170" onclick="chooseFile(3);">
                    <img id="contentImg3" width="265" height="170" onclick="chooseFile(4);">
                </div>                
            </div>
			<% }else { // list에 따른 분기를 쳐줌 list에 값 있냐(수정), 없냐(등록)  /  여기서 (enroll해서 가져온)list에 담긴 사진4장 기존 값으로 넣어줄것임
			
					int fileCount = list.size();
			
					Uploadfile thumbnail = null;									// 대표사진(1장)
					ArrayList<Uploadfile> subFiles = new ArrayList<Uploadfile>();	// 상세사진(3장)
					
					// 대표 이미지 찾기
					for (int i=0; i < fileCount; i++) { // 0,1,2,3
						
						Uploadfile file = list.get(i); // file에 일단 4장 다 담는데
						if(file.getFileLevel() == 1) { // 그 중 fileLevel이 1이면 thumbnail에 담고
							thumbnail = file;
						}else {						   // 그 중 fileLevel이 2이면 subFilews에 담음
							subFiles.add(file);
						}
					} %>
					
	            <div id="outerReviewImg">
	            	
	                <div id="leftTitle">
	                    <p>&gt; 대표이미지</p>
	                    <!-- *** hidden으로 fileNo 가져가야해!!!!!!!!!!!!!!!!!!!!!!!!-->
	                    <input type="hidden" name="fileNo1" value="<%=list.get(0).getFileNo()  %>">
	                    <img id="titleImg" src="<%=thumbnail.getFilePath() + "/" + thumbnail.getChangeName()%>" width="265" height="170" onclick="chooseFile(1);">
	                </div>   
	                <div id="rightContent">
	                    <p>&gt; 상세이미지</p>
	                    <% for(int i=0; i<subFiles.size(); i++) { %>
	                    	<!-- *** hidden으로 fileNo 가져가야해!!!!!!!!!!!!!!!!!!!!!!!!-->
	                    	<input type="hidden" name="fileNo<%= i + 2 %>" value="<%=list.get(i + 1).getFileNo()  %>">
	                    	<img id="contentImg<%= i + 1 %>" src="<%= subFiles.get(i).getFilePath() + "/" +  subFiles.get(i).getChangeName() %>" width="265" height="170" onclick="chooseFile(<%= i + 2 %>);">
	                    <% } %>
	                </div>
	                           
	            </div>
					
			<% } %> <!-- else 끝 -->


            <!-- 첨부파일 input -->
            <div id="file-area" style="display:none;">
                <input type="file" name="file1" id="file1" onchange="loadImg(this, 1);">  <!-- name 키값 -->
                <input type="file" name="file2" id="file2" onchange="loadImg(this, 2);">
                <input type="file" name="file3" id="file3" onchange="loadImg(this, 3);">
                <input type="file" name="file4" id="file4" onchange="loadImg(this, 4);">
            </div>
            
            <script>
       
            	function chooseFile(num) {
            		// 수정시, img 눌루 했을 때 시작적으로먄 빼기
            		//$("#titleImg").attr("src", null);
            		//$("#contentImg" + (num-1)).attr("src", null);
            		
            		$("#file" + num).click();
            	}
            	
            	function loadImg(inputFile, num) {
            		// 예:(this, 1)
            		// inputFile : (==this)현재 변화가 생긴 input type = 그 "file" 요소 객체
            		// num : 몇번째 input 요소인지 확인 후 해당 그 영역에 미리보기 하기 위해 전달받는 숫자
            		
            		// 선택된 파일이 있다면 inputFile.files[0]에 선택된 파일이 담겨 있음
            					 //=> inputFile.files.length 또한 1이 될것임
            		if(inputFile.files.length == 1) { // 1 반환했다는 것은 파일이 선택된 경우라는 것 => 파일 읽어들여서 '미리보기'
            			
            			// => 있다면, 1)해당파일에 고유한url 부여해주고, 2)해당num일때 src를 고유한url넣어서 선택한파일 띄움 
            			
            			// 1)파일을 읽어들일 FileReader 객체 생성
            			const reader = new FileReader();
            			
            			// 1)파일을 읽어들이는 메소드 호출
            			// 해당 파일을 읽어들이는 순간, inputFile.files[0]에 담긴 이 파일만의 '고유한 url'(겁나긴거) 부여해주는 코드
            			reader.readAsDataURL(inputFile.files[0]);
            			
            			// 2)파일 읽어들이기가 완료(onload) 됐을 때, 실행할 함수 정의해두기
            			reader.onload = function(e) {
            				
            				// (event)는 기본적으로 항상 있는 존재.. 우린 부여받은 '고유한 url' 필요하니까 e로 받고, (script에서 매개변수의 자료형은 필요x)
            				// e.target.result == 읽어들인 파일의 '고유한 url'(겁나긴거) 들어있음
            				switch(num) {
            					case 1: $("#titleImg").attr("src", e.target.result); break;
            					case 2: $("#contentImg1").attr("src", e.target.result); break;
            					case 3: $("#contentImg2").attr("src", e.target.result); break;
            					case 4: $("#contentImg3").attr("src", e.target.result); break;
            				}
            			}
            			
            		}else { // 선택된 파일이 취소된 경우(뺌) => 미리보기 한것도 사라지도록
            			switch(num) {
	    					case 1: $("#titleImg").attr("src", null); break;
	    					case 2: $("#contentImg1").attr("src", null); break;
	    					case 3: $("#contentImg2").attr("src", null); break;
	    					case 4: $("#contentImg3").attr("src", null); break;
    					}
            		}

                }

                </script>
                <br>
                
                
                
                
            </div>
    
    
            <!------------------------------content_f------------------------------->
            <div id="content_f" align="right">
                <button type="reset"  class="btn btn-secondary">초기화</button>
                <button type="submit" id="writeBtn" class="btn btn-secondary">수정완료</button> <!-- submit버튼 -->
            </div>


        </form>


    </div>
	
	
	
	
	<%@ include file="../common/footer.jsp" %>


</body>
</html>