<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>여행지 추천 글쓰기</title>

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
        <form action="<%= contextPath%>/insert.re" method="post" enctype="multipart/form-data">

            <!------------------------------content_h------------------------------->
            <br><br>
            <div id="content_h">
                <p id="title">여행 후기 글쓰기</p>
            </div> <br>
    
            <!------------------------------content_b------------------------------->
            <div id="content_b">
            
            	<!-- *** hidden : userNo == BOARD_WRITER -->
            	<!-- 카테고리, 제목, 내용, 첨부파일 한개, 로그인한 회원번호 -->
            	<!-- (로그인한 회원번호 : 없으니까 loginMember에서 가져오고 hidden으로 보관) -->
            	<input type="hidden" name="userNo" value="<%= loginMember.getMemberNo()%>">
          
                
                
                
                <!-- 이중셀렉트 -->
                <div id="SJ-search_station">
                    <select onclick="SJcategoryChange();" id="SJ-stationLine" style="height: 36px; width: 170px;" >
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
                        <option >역 명 선택</option>
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
                    </script> 
                </div>


            
                <input type="text" name="title" id="writeTitle" placeholder="제목을 입력해주세요." required>
                <input type="text" name="address" id="writeAddress" placeholder="다녀오신 여행지 주소를 입력해주세요." required>
                    
                <div id="txtarea">
                   <textarea name="content" id="content" rows="20" cols="150" style="resize: none;" placeholder="내용을 입력해주세요." required></textarea>     
                   <textarea name="tip" id="tip" cols="150" rows="10" style="resize: none;" placeholder="꿀팁란을 작성해주세요^_^"></textarea>
                </div>
                <br>



            <!-- 사진 업로드 -->
            <!-- 첨부파일 img -->
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

            <!-- 첨부파일 input -->
            <div id="file-area" style="display:none;">
                <input type="file" name="file1" id="file1" onchange="loadImg(this, 1);" required>  <!-- name 키값 -->
                <input type="file" name="file2" id="file2" onchange="loadImg(this, 2);">
                <input type="file" name="file3" id="file3" onchange="loadImg(this, 3);">
                <input type="file" name="file4" id="file4" onchange="loadImg(this, 4);">
            </div>
            
            <script>
            	function chooseFile(num) {
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
                <button type="button" class="btn btn-secondary">뒤로가기</button>
                <button type="submit" id="writeBtn" class="btn btn-secondary">작성하기</button>
            </div>

        </form>


    </div>


	<%@ include file="../common/footer.jsp" %>


</body>
</html>