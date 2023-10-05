
<%@page import="com.kh.common.model.vo.PageInfo"%>
<%@page import="com.kh.notice.model.vo.Notice"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
    	PageInfo pi = (PageInfo)request.getAttribute("pi");
    	
    	
    	 int currentPage = pi.getCurrentPage();
    	    int startPage = pi.getStartPage();
    	    int endPage = pi.getEndPage();
    	    int maxPage = pi.getMaxPage();
    
    %>
    
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 초안</title>

 
    
    <style>
        .UJ-wrap{
            width: 1200px;
            height: 800px;
            /* border: 1px solid red; */
            margin: auto;
            margin-top: 50px;
        }

        .UJ-wrap>div{
            width: 100%;
            box-sizing: border-box;
            /* border: 1px solid blue; */
        }


        /* ------------------버튼 부분--------------- */
        /* 클릭했을때 색 변하게 하기 */
        #UJ-btn-area{
            height: 20%;
            box-sizing: border-box;
        }

        #UJ-btn-area>div{
            height: 100%;
            width: 50%;
            box-sizing: border-box;
            /* border: 1px dashed black; */
            float: left;
        }

        #UJ-btn-notice>button{
            width: 90%;
            height: 50%;
            margin-left: 45px;
            margin-top: 50px;
            line-height: 60px;
            background-color: lightgrey;
            font-weight: 900;
            border: 0;
          

        }

        #UJ-btn-qna>button{
            width: 90%;
            height: 50%;
            margin-right: 45px;
            margin-top: 50px;
            line-height: 60px;
            background-color: lightgrey;
            font-weight: 900;
            border: 0;

        }

       


        /* ------------------내용부분---------------- */
        #UJ-content-area{
            height: 60%;
            box-sizing: border-box;
        }


        #UJ-content-area>table{
            width: 90%;
            
            box-sizing: border-box;
            margin-left: 50px;
            border-top: 1px solid white;
            border-left: 1px solid white;
            border-right: 1px solid white;
            /* border-bottom:1px solid lightgrey; */
        }

        .UJ-table>thead>tr>th{
            padding-left: 10px;
            border-bottom:1px solid gray;
            color:darkslategray
        }


         .UJ-table>tbody>tr>td{
            padding-left: 10px;
            border-bottom:1px solid lightgrey;
            color: gray;
            
        }


    

         /*--------------- 페이징 바 부분 ------------*/
         #paging {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        #paging button {
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

        #paging button:hover {
            background-color: #dcdcdc; 
        }

        #paging button:focus {
            outline: none;
        }

        #paging button.active {
            background-color: gray;
            color: white;
        }




        /* --------------하단 검색/select박스---------- */
        #UJ-menubar-area{
            height: 10%;
            box-sizing: border-box;
        }

        #UJ-menubar-area>.UJ-form{
            width: 100%;
            height: 100%;
            box-sizing: border-box;
        }

        .UJ-form>div{
            height: 100%;
            
            box-sizing: border-box;
            /* border: 1px solid orange; */
            float: left;
        }

        .UJ-form>#UJ-selectbox{
            width: 40%;
        }

        .UJ-form>#UJ-search{
            width: 60%;
            /* border: 1px solid blueviolet; */
        }


        /* selectbox 부분  */
        .UJ-select{
            
            margin-left: 300px;
            margin-top: 173px;
            width: 150px;
            height: 35px;
        }

        /* 검색부분  */
        #UJ-search>div{
            /* border: 1px solid green; */
            height: 50%;
            width: 70%;
            float: left;
            box-sizing: border-box;
            margin-right: 300px;
            margin-top: 170px;
            

        }
       
        /* sel div */
       #UJ-search>div>div{
        height: 100%;
        /* border: 1px dashed black; */
        float: left;
       }

        #UJ-sel-1{
            width: 80%;
            
        }

        #UJ-sel-1>input{
            width: 100%;
            height: 100%;
            box-sizing: border-box;
           
        }

        #UJ-sel-2{
            width: 20%;
        }

        #UJ-sel-2>button{
            width: 100%;
            height: 100%;
            box-sizing: border-box;
        }

        #UJ-sel-2 img{
            width: 60%;
            height: 90%;
            background-color: #f7f7f7;
            
        }

        .UJ-table>tbody>tr:hover{
            background-color: lightgrey;
            cursor: pointer;
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


        <div id="UJ-btn-area">
            <div id="UJ-btn-notice">
                <button class="btn btn-secondary " id="UJ-all"> 공지사항</button>
            </div>

            <div id="UJ-btn-qna">
                <button class="btn btn-secondary"  id="UJ-qna" > FAQ [자주묻는 질문]</button>
            </div>

        </div>




        <div id="UJ-content-area">

          <% if (loginMember != null && loginMember.getMemberId().equals("admin")) { %>
            <div id="UJ-atag" align="right" style="width: 900px; margin-left:245px;">
        
                <a href="<%=contextPath %>/insertForm.no" class="btn btn-sm btn-secondary">글 작성</a>
		
            </div>
           <%} %> 
            

            <table border="1" class="UJ-table">


                <thead>
                    <tr>
                        <th width="70" height="70">No.</th>
                        <th width="400">제목</th>
                        <th width="200">작성자</th>
                        <th width="200">작성일</th>
                        <th width="70">조회수</th>
                    </tr>

                  
                </thead>

                <tbody class="UJ-tbody">
		
				<%for(Notice n : list){ %>
				
					
                     <tr height="90" class="UJ-notr">
                        <td class="uj-no-td"><%=n.getNoticeNo() %></td>
                        <td style="font-size: 14px;"><%=n.getNoticeTitle() %></td>
                        <td><%=n.getNoticeWriter() %></td>
                        <td><%=n.getCreateDate() %></td>
                        <td><%=n.getCount() %></td>
                     </tr>
                    
                    
                  <%} %>  
                    
                  
                    
                    
                    <script>
                        
                   
                        $(function(){
                        	
                        	// 공지사항 
                            $("#UJ-all").click(function(){
                            $(this).css("backgroundColor", 'gray');
                            $("#UJ-qna").css("backgroundColor",'lightgray');
                            
                           	$.ajax({
                           		url:"list.no",
                           		data:{
                           			cpage:1,
                           			kind:"ajax"
                           		},
                           		
                           		success:function(list){
                           			
                           			let result =""
                           	if(list.length !=0){	
                           			for(let i=0; i<list.length; i++){
                           				
                           				result 
                           					   += "<tr height='90' class='UJ-notr'>"
                                       		   + "<td class='class='uj-no-td'>" + list[i].noticeNo + "</td>"
                                       		   + "<td style='font-size: 14px;'>" + list[i].noticeTitle +"</td>"
                                        	   + "<td>" + list[i].noticeWriter + "</td>"
                                        	   + "<td>" + list[i].createDate + "</td>"
                                        	   + "<td>" + list[i].count + "</td>"
                                    		   + "</tr>"
                                    		   
                           				
                                    	$(".UJ-tbody").html(result)	   
                           					
                           			}
                           			
                           		}else{
                       			   
                       			   
                       			   result += "<tr>"
                       			   		  +  "<td colspan='5' >조회된 공지사항이 없습니다. </td>"
                       			   		  + "</tr>"
                       			   		
                       				  $(".UJ-tbody").html(result)	
                       		   }
                           		
                           		}
                           	})  // ajax끝
                            
                           	
                            })  // 공지사항 끝!
                            
                            
						// 질문사항 
                            $("#UJ-qna").click(function(){
                            	 $(this).css("backgroundColor", 'gray');
                            	 $("#UJ-all").css("backgroundColor",'lightgray');


                          		$.ajax({
                          			url:"list.faq",
                          			data:{
                          				cpage:1
                          			},
                          			
                          			success:function(list){
                          				let result = "";
                          			
                          		  if(list.length !=0){
                          				for(let i=0; i<list.length; i++){
                          					result += "<tr height='90' class='UJ-qatr' >"
                                        		   + "<td class='uj-qa-td'>" + list[i].qaNo + "</td>"
                                        		   + "<td style='font-size: 14px;'>" + list[i].question +"</td>"
                                         	   + "<td>관리자</td>"
                                         	   + "<td>" + list[i].qaDate + "</td>"
                                         	   + "<td>" + list[i].count + "</td>"
                                     		   + "</tr>"
                                     		 
                                     		   
                                     		   
                                     		  $(".UJ-tbody").html(result)	
                          			  
                          		        }
                          				
                          		   }else{
                          			   
                          			   
                          			   result += "<tr>"
                          			   		  +  "<td colspan='5' >조회된 FAQ가 없습니다. </td>"
                          			   		  + "</tr>"
                          			   		
                          				  $(".UJ-tbody").html(result)	
                          		   }
                          				
                          			}
                          		
                          		}) // ajax 끝
                            

                            })  // 질문 끝


                           
                         
                          
                        	 
                            // 공지사항 상세조회 
                            // 동적으로 만들어진 요소가 아닌 그냥 먼저 생성이 되어있는 공지사항의 tr을 눌렀을 경우는 
                            // 이렇게 작성해도 게시글 번호 잘 가져와짐 
                        	   $(".UJ-notr").click(function(){
                        		  
                                const ujBno = $(this).find("td:eq(0)").text();
    							
                                location.href="<%=contextPath%>/detailsemi.no?ujBno=" + ujBno;
                        		   
                        	   })
                        	   
                        	   
                        	   
                        	   // 동적으로 생성한 요소에 대해서는 위에처럼 작성하면 요소를 가져오지 못함 
                               // 그래서 이렇게 작성해야 함 
                               // (jQuery 에 12.이벤트 보면 마지막에 나와있음 )
                               // 이렇게 해야지만 동적으로 생성된 요소에 대해서 값을 선택해서 가져올 수 있음!!
                               // 생각지도 못했다....
                              $(".UJ-tbody").on("click","tr",function(){
                            	  const ujBno = $(this).children().eq(0).text();
                            	
                              	  
                            	  // 동적으로 만들어진 공지사항을 눌렀을 때 게시글 번호를 넘겨서 상세조회하기
                            	
                            	  
                            	  // 공지사항은 1~100 까지 이고 
                            	  // 질문은 100부터 시작
                            		
                            	  if(ujBno < 100){  // 공지사항 서블릿 타게   
                            		  
								  location.href="<%=contextPath%>/detailsemi.no?ujBno=" + ujBno;
                            	  
                            	  }else{  // 질문 서블릿 타게
                            		  
								  location.href="<%=contextPath%>/detailsemi.qa?ujQno=" + ujBno;  
                            		  
                            	  }
                            	  
                    			  
                            		  
                            		  
                            	  })
                            	  
                            	  
                            	  
                           	
                        	   
                   
                        		
                      
                    	  
                      })
                      
                      
                      
                           
                    
                            


               

                

                    </script>


 			</tbody> 
                   
           

            </table>


        </div>

   
   
   		<br><br><br><br><br><br><br><br>
        
         <div id="paging" align="center">


            <% if(currentPage != 1){ %>
              <button onclick = "location.href ='<%=contextPath%>/list.no?cpage=<%=currentPage-1%>'"> &lt; </button>
        
              <%} %>
        
                   <% for(int i = startPage; i<= endPage; i++){ %> 
       
                         <%if(i == currentPage){ %>
       
                             <button class="active"><%=i%></button>
                        <%}else{ %>
                           <button onclick="location.href='<%=contextPath %>/list.no?cpage=<%=i%>'"><%=i%></button>
                        <%} %>
                        
                  <%} %>      
              
              <% if(currentPage!= maxPage){ %>
                 <button onclick="location.href='<%=contextPath%>/list.no?cpage=<%=currentPage+1 %>'"> &gt; </button>
             <%} %>


        </div>



    </div>
<br><br><br><br><br><br><br><br>
  
	<%@ include file="../common/footer.jsp" %>

    

<br><br><br>
</body>
</html>