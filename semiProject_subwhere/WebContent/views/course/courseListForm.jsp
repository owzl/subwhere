
<%@page import="com.kh.common.model.vo.PageInfo"%>
<%@page import="com.kh.board.model.vo.Course"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
     	ArrayList<Course> list = (ArrayList<Course>)request.getAttribute("list");
    	// boardNo, nickname,title, content, coursetip, stationNo, 장소명4개, 
    	// count, createDate, modifyDate, titleImg
    
       PageInfo pi = (PageInfo)request.getAttribute("pi");
       
    	
    	
    	
    	int startPage = pi.getStartPage();
    	int endPage = pi.getEndPage();
    	int maxPage = pi.getMaxPage();
    	int currentPage = pi.getCurrentPage();
    	
    	
    	
    %>
    
    <%@ include file="../common/header.jsp" %>
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style>
        /* wrap은 가져가지 않을 거임  */
        .UJ-wrap{ 
            /* border: 5px solid black;  */
            width: 1200px;
            height: 750px ;
            margin: auto;
            margin-top: 30px;

        }

        .UJ-wrap>#UJ-menu-body{
            /* border: 1px solid red; */
            width: 100%;
            height: 10%;
            box-sizing: border-box;
        }

        .UJ-wrap>#UJ-m-body{
            /* border: 1px solid red; */
            width: 100%;
            height: 7%;
            box-sizing: border-box;
           
        }

        .UJ-wrap>#UJ-content-body{
            /* border: 1px solid blue; */

            width: 100%;
            /* height: 75%; */
            box-sizing: border-box;
        }

        .UJ-wrap>#UJ-down-body{
            /* border: 1px solid green; */
            width: 100%;
            height: 10%;
            box-sizing: border-box;
        }


        #UJ-menu-body>div{
            /* border: 1px dashed black; */
            height: 100%;
            width: 10%;
            float: left;
            box-sizing: border-box;
            
        }

        #UJ-m-body>div{
            height: 100%;
            float: left;
            line-height: 35px;
        }
        
        #UJ-m-body>#UJ-m1{
            width: 30%;
            box-sizing: border-box;
        }

        #UJ-m-body>#UJ-m2{
            width: 30%;
            box-sizing: border-box;
        }

        #UJ-m-body>#UJ-m3{
            width: 30%;
            box-sizing: border-box;
            text-align: right;
            margin-left: 70px;
            
        }


        
        



        #UJ-menu-body button{
            color: white;
            width: 100%;
            height: 100%;
            box-sizing: border-box;
            border-radius: 20px 20px 0 0;
            border: none;
        }

       #UJ-menuAll{
        background-color: black;
       }


       #UJ-menu1{
        background-color: #0052A4;
       }

       #UJ-menu2{
        background-color: #00A84D;
       }

       #UJ-menu3{
        background-color: #EF7C1C;
       }

       #UJ-menu4{
        background-color: #00A5DE;
       }

       #UJ-menu5{
        background-color: #996CAC;
       }

       #UJ-menu6{
        background-color: #CD7C2F;
       }

       #UJ-menu7{
        background-color: #747F00;
       }

       #UJ-menu8{
        background-color: #E6186C;
       }

       #UJ-menu9{
        background-color: #BB8336;
       }

       #UJ-menu-body button:hover{
        background-color: gray;
        cursor: pointer;
       }





        #UJ-m1{
            margin-left: 10px;
        }

        #UJ-m3>a{
            text-decoration: none;
            color: black;
        }


        /* content */

        #UJ-content-body>table{
            width: 100%;
            height: 100%;
            box-sizing: border-box;
            /* border: 1px solid black; */
        }

       
       
    /* content안에 이미지에 대한거라서 나중에 삭제하기 */
    
    
    
    
    /* content부분 테이블로 만든 스타일 */
    
     /* #UJ-content-body>table{
        width: 100%;
       
       
    } */
    
    
    
    /* .UJ-img{
        width: 65%;
        height: 100px;
        margin-left: 30px;
        box-sizing: border-box;
        border-radius: 20px;
    } */
    
   
		
		
    .UJ-tr>td>div{
        width: 100%;
      
        /* border: 1px dashed green; */
        box-sizing: border-box;
    }
 





    

    .UJ-tr{
        border-top: 10px solid white;
        border-bottom: 10px solid white;
        margin-bottom: 10px;
        background-color: #f7f7f7;
   
    }

    

    .UJ-tr:hover{
        background-color: lightgray;
        cursor: pointer;
    }



        /* down-body */

        #UJ-down-body{
            text-align: right;
           
           
        }

        #UJ-down-body>a{
            margin-right: 20px;
       
        }

        #UJ-paging {
             display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        #UJ-paging button {
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

        #UJ-paging button:hover {
            background-color: #dcdcdc; 
        }

        #UJ-paging button:focus {
            outline: none;
        }

        #UJ-paging button.active {
            background-color: gray;
            color: white;
        }

 

       

        /* 버튼에 onclick달아서 배경색 변경하기 호버했을때도 색이 회색으로 변하게 하기 */


    </style>
</head>
<body>



 <div class="UJ-wrap">

		<!-- -------------위로가기 버튼------------ -->
        <div style="position:fixed; bottom: 200px; right: 10%; width: 5px; height: 5px; z-index: 999;">
           <a href="#"><img src="resources/images/upbutton.png" title="위로 가기" style="width: 50px;"></a>
        </div>

        <!-- -------------대한민구석구석 사이트 가기 버튼------------ -->
        <div style="position:fixed; bottom: 140px; right: 10%; width: 5px; height: 5px; z-index: 999;">
           <a href="https://1330chat.visitkorea.or.kr:3000/#/ttalk_main/CHAT1330_160635739001093018/_0300_0100_main.do" target="_blank"><img src="resources/images/movesite.png" title="대한민국구석구석" style="width: 50px;"></a>
        </div>
		

        <div id="UJ-menu-body">
            <!-- 여기는 여행지 담당 연우님과 겹치는 부분이라 일단 임시로 만들어보기 -->
            
            <div>
                <button id="UJ-menuAll" onclick="btnAll(this);">전체</button>
            </div>
            
            <div>
                <button id="UJ-menu1" onclick="btn(this,1);" >1호선</button>
            </div>

            <div >
                <button id="UJ-menu2" onclick="btn(this,2);">2호선</button>
            </div>

            <div >
                <button id="UJ-menu3" onclick="btn(this,3);">3호선</button>
            </div>

            <div >
                <button id="UJ-menu4" onclick="btn(this,4);" >4호선</button>
            </div>

            <div >
                <button id="UJ-menu5" onclick="btn(this,5);">5호선</button>
            </div>

            <div >
                <button id="UJ-menu6" onclick="btn(this,6);">6호선</button>
            </div>

            <div >
                <button id="UJ-menu7" onclick="btn(this,7);">7호선</button>
            </div>

            <div >
                <button id="UJ-menu8" onclick="btn(this,8);" >8호선</button>
            </div>

            <div >
                <button id="UJ-menu9" onclick="btn(this,9);" >9호선</button>
            </div>

        </div>
    
        <div id="UJ-m-body" style="margin-top: 20px; ">
            <div id="UJ-m1" style="color: gray; font-size: 18px;">
             '<span id="span" ><b id="b" >전체</b></span>' 에 대한 검색 결과 

            </div>
            <div id="UJ-m2"></div>

            <div id="UJ-m3" >
                <a href="#" style="color: gray; font-size: 18px;"><b>최신순</b></a> | <a href="#" style="color: gray; font-size: 18px;"><b>조회수 순</b></a>
            </div>
        </div>
    
        <!-- 여행코스 목록은 연우님과 상의해서 정하기 -->
        <!-- 5개씩 하기로 함 -->
        
        
        
        <div id="UJ-content-body" >
          
		<!-- ajax로 조회한 값을 여기다가 그려서 넣을 거임 -->
            <table class="UJTable">
			
					

            <tbody class="UJtbody">
               
        <% for(Course c : list){ %> 
              
              <!--  boardNo를 hidden으로 가져오기 -->
              
              
              
                <tr class="UJ-tr">
                    <th style="width: 25%; height: 20%; " class="UJ-tableImg">
                      <img src="<%=c.getTITLEIMG()%>" class="UJ-img"  style="width: 250px; height:125px;  border-radius: 20px;  margin-left: 30px;">
                   
                    <input type="hidden"  name="cno" value="<%=c.getBoardNo() %>"  >
                    <input type="hidden" name="userNo" value="<%=c.getMemberNo() %>">
                      
                    </th>
                    
                    <td>
                            <h3 style="padding-top: 10px;"> <b style="color: gray; padding-left: 10px;"> <%=c.getCourseTitle() %></b> </h3>
                      		<%if(c.getCourseContent().length() > 50){ %>
      
                            <p style="color: gray; padding-left: 10px; padding-top: 15px;" > <%=c.getCourseContent().substring(0, 50)%>.....</p>
                      		
                      		<%}else{%>
                      		
                      			 <p style="color: gray; padding-left: 10px; padding-top: 15px;" > <%=c.getCourseContent()%> </p>
                      		<%} %>
                      
                      
                     </td>
                     
                     <td style=" width: 160px; color: gray;">
                         
                           <span>조회수 :  <%=c.getCount() %> </span> <br>
                           <span>작성일 :  <%=c.getCreateDate() %> </span>

                     </td>
                        
                
                                            
                   
                    
                </tr>
               
                <%} %>
                
            </tbody>

           
           </table>
            

		


        </div>


       <br><br>

        <div id="UJ-down-body" >
            <br><br><br>
            <%if(loginMember != null || loginMember!=null && loginMember.getMemberId().equals("admin")){ %>
            <a href="<%=contextPath %>/enrollForm.co" class="UJ-btn btn-sm btn-secondary" style="block-size: 40px; inline-size: 70px; line-height: 30px;">글작성</a>
            <!-- 글 작성은 회원과 관리자일때만 보이게 하기! (자바에서)-->
			<%} %>
			
			
        </div>

    </div>

  <br><br><br><br><br><br>

    <div align="center" id="UJ-paging">


	<!-- 강사님께서 페이징바는 없애는 게 좋다고 하심 나중에 없애보기!! -->

	<% if(currentPage != 1){ %>
        <button onclick = "location.href ='<%=contextPath%>/list.co?cpage=<%=currentPage-1%>'"> &lt; </button>
        
     <%} %>
        
       <% for(int i = startPage; i<= endPage; i++){ %> 
       
       		<%if(i == currentPage){ %>
       
       		 <button class="active"><%=i%></button>
      		<%}else{ %>
      			<button onclick="location.href='<%=contextPath %>/list.co?cpage=<%=i%>'"><%=i%></button>
      		<%} %>
     
     <%} %>
     
     <% if(currentPage!= maxPage){ %>
        <button onclick="location.href='<%=contextPath%>/list.co?cpage=<%=currentPage+1 %>'"> &gt; </button>
	 <% } %>
	 
    </div>
    
    <br><br>
  
    <script>
        
    // 전체 페이지를 클릭했을 때 모든 게시물을 조회해오는 함수
      
            	
    
    
     function btnAll(el){
    	 $("#b").html(el.textContent);
    	 
    	 
    	 $.ajax({
    		
    		 url:"list.co",
    		 data:{
    			 cpage:1,
    			 kind:"ajax"
    		 },
    		 
    		 success:function(list){ 
    			
    			 let result ="";
    			 
    			 
    		if(list.length > 0){ 	 
    			 for(let i=0; i<list.length; i++){
    				 
    				 let truncatedContent = list[i].courseContent.length > 50
    		            ? list[i].courseContent.substring(0, 50) + "..."
    		            : list[i].courseContent; 
    		            
    		            
    				 result += "<tr class='UJ-tr'>"
    				     
     			    	  +  "<th style='width: 25%; height: 20%; ' class='UJ-tableImg'> "
     			    	 + "<input type='hidden' name='cno' value='" + list[i].boardNo + "'>"
     			    	  + "<img src ='" + list[i].TITLEIMG + "' class='UJ=img' style='width: 250px; height:125px;  border-radius: 20px;  margin-left: 30px;  ' >"
    			    	  + "</th>"
    			    	  + "<td>" 
    			    	  + "<h3 style='padding-top:10px';>" + "<b style='color: gray; padding-left: 10px;'>"
    			    	  + list[i].courseTitle + "</b>"
							  + "</h3>"
							  + "<p style='color: gray; padding-left: 10px; padding-top: 15px;'>" + truncatedContent + "</p>"
    				   	  + "</td>"
    				   	  + "<td style=' width: 160px; color: gray;'> " 
    				   	  + "<span> 조회수 :  </span>" + list[i].count + "<br>"
    				   	  + "<span> 작성일 :  </span>" + list[i].createDate 
    				   	  + "</td>"
    				   	  + "</tr>"
    				   
    		    	$(".UJTable>.UJtbody").html(result);
       		   
       			
       		   }
       		   
       		} else{       
       			
       			 result = "<tr><th colspan='3'>전체 여행 코스에 대한 결과가 없습니다.<th></tr>"
       			 $(".UJTable>.UJtbody").html(result);
       		 }
       		   
    			 }
    			 
    			 
    			 
    		 
    	 })
    	 
    	}
    	 
    

        // 호선 버튼 누를때마다 실행될 ajax
        function btn(el,num){
		// 버튼을 누를때마다 해당 호선에 대한 여행 코스를 보여주는 ajax
		
			$("#b").html(el.textContent);
			
		
		
           $.ajax({
        	   url:"selectline.co",
        	   data:{
        		   cpage:1,
        		   line:num
        	   },
        	   
        	   success:function(list){
        		   
        		 // let test = list;
        		 // console.log(test);
        		  let result = "";
        		 
        			$(".UJTable>.UJtbody").html("");
        		
        		if(list.length > 0){ 
        			
        		   for(let i=0; i<list.length; i++){
        			   
        			   
        			   let truncatedContent = list[i].courseContent.length > 50
		   		            ? list[i].courseContent.substring(0, 50) + "..."
		   		            : list[i].courseContent; 
   		            
        			   
        			   result += "<tr class=' UJ-tr'>"
        				
     			    	  +  "<th style='width: 25%; height: 20%; ' class='UJ-tableImg'> "
     			    	  + "<img src ='" + list[i].TITLEIMG + "' class='UJ=img' style='width: 250px; height:125px;  border-radius: 20px;  margin-left: 30px;  ' >"
     			    	  + "<input type='hidden' name='cno' value='" + list[i].boardNo + "'>"
     			    	  + "</th>"
     			    	  + "<td>" 
     			    	  + "<h3 style='padding-top:10px';>" + "<b style='color: gray; padding-left: 10px;'>"
     			    	  + list[i].courseTitle + "</b>"
							  + "</h3>"
							  + "<p style='color: gray; padding-left: 10px; padding-top: 15px;'>" + truncatedContent + "</p>"
     				   	  + "</td>"
     				   	  + "<td style=' width: 160px; color: gray;'> " 
     				   	  + "<span> 조회수 :  </span>" + list[i].count + "<br>"
     				   	  + "<span> 작성일 :  </span>" + list[i].createDate 
     				   	  + "</td>"
     				   	  + "</tr>"
     				   
     		    	$(".UJTable>.UJtbody").html(result);
        		   
        			
        		   }
        		   
        		} else{       
        			
        			 result = "<tr><th colspan='3'>해당 호선에 대한 결과가 없습니다.<td></tr>"
        			 $(".UJTable>.UJtbody").html(result);
        		 }
        		   
        	   }
        	
    
        	   
        	   
           })
          	
        	   
           
        }
        
        
        
        // 사용자가 게시물을 눌렀을 때 상세페이지로 넘어가기 
        
        $(function(){
        	
        	$(".UJ-tr").click(function(){
        		
        		location.href="<%=contextPath%>/detail.co?cno=" + $(this).children().children().eq(1).val();
        	})
        	
        })


        $(".UJtbody").on("click",".UJ-tr",function(){
           // const ujBno = $(this).children().eq(0).text();
            
        	location.href="<%=contextPath%>/detail.co?cno=" + $(this).children().children().eq(1).val();
            
            
          
        })
            
            
            
    
    </script>
    <br><br><br><br>
    <%@ include file="../common/footer.jsp" %>


</body>
</html>