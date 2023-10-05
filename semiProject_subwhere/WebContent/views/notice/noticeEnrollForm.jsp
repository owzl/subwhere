<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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


        /* --------------------공지사항 제목------------------  */

     
        #UJ-btn{
            height: 10%;text-align: right;padding-right: 20px;
            /* border: 1px solid green; */
           
        }

   
        #UJ-reply{
            height: 15% ;
            /* border: 1px solid orange; */
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


        <div style="padding-left: 30px;">
            <select  style="height: 50px; width: 200px; padding-left: 15px; font-size: 17px;" id="UJ-enrollSelect" >
                       
               
                <option value="1">공지사항 작성하기</option>
                <option value="2">FAQ 작성하기</option>
    
            </select>
            
			<span style="padding-left:15px; font-size:17px; color:gray;"> (작성할 게시글 종류를 선택해주세요)</span>
	

        </div>

        <br><br>
        
      <div class="UJ-div">  
       
       
       
       
        </div>

       

	


        <div id="UJ-btn">

         <!------------------------------ 수정/삭제/목록 버튼 ------------------------------>


        </div>
        <hr>
       
       	<script>
       	
       		$(".UJ-wrap select").click(function(){
       		
       			
       			const num = $("#UJ-enrollSelect option:selected").val()
       			
       			let result ="";
       			
       			if(num == 1){  // 1은 공지사항을 선택했을 경우 
       				
       			
                     
       		  result += "<div id='UJ-up' style=' height: 5%;font-size: 20px;color: gray;font-weight: bold;padding-bottom: 50px;border-bottom: 1px solid lightgray;'>"
       	             + "<b style='padding: 30px;'>[공지사항 게시글]</b>"
       	             + "<input type='hidden' value=''>"
       	             + "</div>"
       	             + "<div id='UJ-title' style='height: 10%;'>"
       	             + "<div id='UJ-title-btn' style=' height: 100%;box-sizing: border-box;border-top: 0;float: left;padding-left: 20px; width: 10%;'>"
       	             + "<button type='button' style='width: 50px;height: 30px;margin-left: 25px;margin-top: 25px;background-color: pink;color: red;border: 0;border-radius: 25%;'>공지</button>"
       	             + "</div>"
	       	         + "<div id='UJ-notice-title' style='width: 90%;padding-top: 15px;'>"
       	             +  "<h1>"
       	             + "<input type='text' name='noticeTitle' id='noticeTitle'  style='padding-left: 25px; width:960px;' placeholder='공지사항의 제목을 입력하세요' required>"
       	             + "</h1>"
       	             + "</div>"
       	        	 + "</div>"
       	             + "<hr>"
       	             + "<div id='UJ-content' style='height: 60%;border-bottom: 1px solid lightgray;'>"
       	             + "<p style='padding-left: 40px; padding-top: 40px;'>"
       	             + "<textarea name='noticeContent' id='noticeContent'  cols='125' rows='15' style='resize: none; padding-left: 15px;'  required></textarea>"
       	             + "</p>"
       	             + "</div>"
       	             + "<div id='UJ-btn'>"
       	             + "<br>"
       	             + "<button type='submit' class='btn btn-secondary' id='UJ-NOenrollBtn' style='margin-right:10px;'> 작성하기 </button>"
       	             + "<button  type='button' class='btn btn-secondary' id='noticeListBtn'>목록</button>"
       	             +  "</div>"
       	             
       			
       				
       	             $(".UJ-div").html(result);
       	             
       			}else{   // 2는 FAQ를 선택했을 경우
       				
       			 result += "<div id='UJ-up' style=' height: 5%;font-size: 20px;color: gray;font-weight: bold;padding-bottom: 50px;border-bottom: 1px solid lightgray;'>"
       	             + "<b style='padding: 30px;'>[FAQ]</b>"
       	             + "</div>"
       	             + "<div id='UJ-title' style='height: 10%;'>"
       	             + "<div id='UJ-title-btn' style=' height: 100%;box-sizing: border-box;border-top: 0;float: left;padding-left: 20px; width: 10%;'>"
       	             + "</div>"
	       	         + "<div id='UJ-notice-title' style='width: 90%;padding-top: 15px; padding-left:40px;'>"
       	             +  "<h1>"
       	             + "<input type='text' name='faqTitle' id='faqTitle'  style='padding-left: 15px; width:980px;' placeholder='FAQ 제목을 입력하세요'  required>"
       	             + "</h1>"
       	             + "</div>"
       	        	 + "</div>"
       	             + "<hr>"
       	             + "<div id='UJ-content' style='height: 60%;border-bottom: 1px solid lightgray;'>"
       	             + "<p style='padding-left: 40px; padding-top: 40px;'>"
       	             + "<textarea name='faqContent' id='faqContent' cols='125' rows='15' style='resize: none; padding-left: 15px;'  required></textarea>"
       	             + "</p>"
       	             + "</div>"
       	             + "<div id='UJ-btn'>"
    	             + "<br>"
    	             + "<button type='submit' class='btn btn-secondary' id='UJ-QAenrollBtn' style='margin-right:10px;'> 작성하기 </button>"
    	             + "<button  type='button' class='btn btn-secondary' id='noticeListBtn'>목록</button>"
    	             +  "</div>"
       				
       	             $(".UJ-div").html(result);
       			}
       			
       		
       			
       				
       				
       				
       			})
       			
       			
       			
       			
       			// 작성하기 버튼을 눌렀을 때
       			// 동적으로 그린 요소라서 선택을 다르게 해야함 
       			//  $(".UJ-tbody").on("click","tr",function(){
                //  const ujBno = $(this).children().eq(0).text();
                // 이런식으로 

       			  
       			  // 동적으로 그려진 목록 버튼을 눌렀을 때 공지사항 리스트로 이동함
       			  $(document).on('click', '#noticeListBtn', function() {
       				location.href="<%=contextPath%>/list.no?cpage=1";
				});
       			
       		
       			 // 동적으로 그려진 공지사항 작성 버튼을 눌렀을 때 작성하는 곳
       			  $(document).on('click', '#UJ-NOenrollBtn', function() {
       				
       				  // 공지사항 제목, 공지사항 내용필요 
       				  
       				 
       				  $.ajax({
       					  url:"insertsemi.no",
       					  data:{
       						noticeTitle:$("#noticeTitle").val(),
       						noticeContent:$("#noticeContent").val()
       						  
       					  },
       					  type:"post",
       					  
       					  
       					  success:function(result){
       						 
       						alert("공지사항 등록을 성공했습니다.");
       						window.location.href="<%=contextPath%>/list.no?cpage=1"
       						  
       					  }
       						 
       					  
       					  
       					  
       					  })
       				
       				
       				  
       				  
       				  
				});  // 공지사항 작성 끝 
       			
				
				
				// 동적으로 생성된 FAQ 작성버튼을 눌렀을 경우 
				 $(document).on('click', '#UJ-QAenrollBtn', function() {
	       				
      				 // 자주 묻는 질문 제목, 내용 필요
      				  
      				 $.ajax({
      					  url:"insertsemi.qa",
      					  data:{
      						faqTitle:$("#faqTitle").val(),
      						faqContent:$("#faqContent").val()
      						  
      					  },
      					  type:"post",
      					  
      					  
      					  success:function(result){
      						 
      						alert("FAQ 등록을 성공했습니다.");
      						window.location.href="<%=contextPath%>/list.no?cpage=1"
      						  
      					  }
      						 
      					  
      					  
      					  
      					  })
      				
      				
      				  
      				  
      				  
				});  // FAQ 작성 끝 
       		
       	
       	</script>

     


    </div>


<br><br><br><br><br><br><br><br><br>

    <%@ include file="../common/footer.jsp" %>


<br><br><br><br><br><br><br>
</body>
</html>