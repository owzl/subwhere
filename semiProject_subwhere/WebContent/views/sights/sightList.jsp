<%@page import="com.kh.board.model.vo.Sight"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.common.model.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    PageInfo pi = (PageInfo)request.getAttribute("pi");
    ArrayList<Sight> list = (ArrayList<Sight>)request.getAttribute("list");
    String search = (String)request.getAttribute("buttonText");
    String headerStationName = (String)request.getAttribute("headerSearch"); 
    String orderByCount = String.valueOf(request.getAttribute("orderByCount"));
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
    <title>여행 코스 목록</title>

    <style>
        /* wrap은 가져가지 않을 거임  */
        .wrap{ 
            /* border: 5px solid black;  */
            width: 1200px;
            height: 750px ;
            margin: auto;
            margin-top: 30px;

        }

        .wrap>#menu-body{
            /* border: 1px solid red; */
            width: 100%;
            height: 10%;
            box-sizing: border-box;
        }

        .wrap>#m-body{
            /* border: 1px solid red; */
            width: 100%;
            height: 5%;
            box-sizing: border-box;
           
        }

        .wrap>#content-body{
            /* border: 1px solid blue; */

            width: 100%;
           
            box-sizing: border-box;
        }

        .wrap>#down-body{
            /* border: 1px solid green; */
            width: 100%;
            height: 10%;
            box-sizing: border-box;
        }


        #menu-body>div{
            /* border: 1px dashed black; */
            height: 100%;
            width: 10%;
            float: left;
            box-sizing: border-box;
            
        }

        #m-body>div{
            height: 100%;
            float: left;
            line-height: 35px;
        }
        
        #m-body>#m1{
            width: 30%;
            box-sizing: border-box;
        }

        #m-body>#m2{
            width: 30%;
            box-sizing: border-box;
        }

        #m-body>#m3{
            width: 30%;
            box-sizing: border-box;
            text-align: right;
            margin-left: 70px;
            
        }


        
        



        #menu-body button{
            color: white;
            width: 100%;
            height: 100%;
            box-sizing: border-box;
            border-radius: 20px 20px 0 0;
            border: none;
        }

       #menuAll{
        background-color: black;
       }


       #menu1{
        background-color: #0052A4;
       }

       #menu2{
        background-color: #00A84D;
       }

       #menu3{
        background-color: #EF7C1C;
       }

       #menu4{
        background-color: #00A5DE;
       }

       #menu5{
        background-color: #996CAC;
       }

       #menu6{
        background-color: #CD7C2F;
       }

       #menu7{
        background-color: #747F00;
       }

       #menu8{
        background-color: #E6186C;
       }

       #menu9{
        background-color: #BB8336;
       }

       #menu-body button:hover{
        background-color: gray;
        cursor: pointer;
       }





        #m1{
            margin-left: 10px;
        }

        #m3>a{
            text-decoration: none;
            color: black;
        }


        /* content */

        #content-body>table{
            width: 100%;
            height: 100%;
            box-sizing: border-box;
            table-layout:fixed;
            border-collapse: collapse;
            /* border: 1px solid black; */
        }

       
       
    /* content안에 이미지에 대한거라서 나중에 삭제하기 */
    
    
    
    
    /* content부분 테이블로 만든 스타일 */
    
    table{
        width: 100%;
        /* border: 1px solid red; */
    }
    
    .img{
        width: 70%;
        height: 95px;
        margin-left: 30px;
        box-sizing: border-box;
        border-radius: 20px;
    }
    


    tr>td>div{
        width: 100%;
        /* border: 1px dashed green; */
        box-sizing: border-box;
    }
    
    .h3-class{
        height: 40%;
        box-sizing: border-box;
    }
   
    .p-class{
        height: 60%;
        box-sizing: border-box;
    }

    .h3-class>h3{
        width: 100%;
        height: 45px;
        line-height: 50px;
        padding-left: 10px;
        /* border: 1px solid red; */
        margin: 0;
        color: gray;
        
       
    }

    .p-class>p{
        width: 100%;
        height: 60px;
        margin: 0;
        line-height: 50px;
        padding-left: 10px;
        /* border: 1px solid black; */
        font-size: 13px;
        color: gray;
      
 
    }
    
    tr{
        border-top: 10px solid white;
        border-bottom: 10px solid white;
        margin-bottom: 10px;
        background-color: #f7f7f7;
        height: 20%;
        overflow: hidden;
        
     
    }

    tr:hover{
        background-color: lightgray;
        cursor: pointer;
    }



        /* down-body */

        #down-body{
            text-align: right;
           
           
        }

        #down-body>a{
            margin-right: 20px;
       
        }

        #btn>button{
            margin: 2px;
            border: 0;
            inline-size: 40px;
            block-size: 45px;
        }

        /*paging*/
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

        
       

        /* 버튼에 onclick달아서 배경색 변경하기 호버했을때도 색이 회색으로 변하게 하기 */


    </style>

<!-- 부트 스트랩 -->

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">


<!-- 이게 jQuery 컴파일 한 거인듯..? -->
<!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>




</head>
<body>
    
   <%@ include file="../common/header.jsp" %>

    
    <div class="wrap">

        <div id="menu-body">
            <!-- 여기는 여행지 담당 연우님과 겹치는 부분이라 일단 임시로 만들어보기 -->
            
            <div>
                <button id="menuAll" >전체</button>
            </div>
            
            <div>
                <button id="menu1" >1호선</button>
            </div>

            <div >
                <button id="menu2">2호선</button>
            </div>

            <div >
                <button id="menu3">3호선</button>
            </div>

            <div >
                <button id="menu4">4호선</button>
            </div>

            <div >
                <button id="menu5">5호선</button>
            </div>

            <div >
                <button id="menu6">6호선</button>
            </div>

            <div >
                <button id="menu7">7호선</button>
            </div>

            <div >
                <button id="menu8" >8호선</button>
            </div>

            <div >
                <button id="menu9">9호선</button>
            </div>

        </div>
    
        <div id="m-body">
            <div id="m1" style="color: gray;">
             <%
                if (search != null) {
               %>
               '<b><%= search %></b>'에 대한 검색 결과
               <%
                   } else if (headerStationName != null) {
               %>
               '<b><%= headerStationName %></b>'에 대한 검색 결과
               <%
                   } else {
               %>
               '전체'에 대한 검색 결과
               <%
                   }
               %>
			</span>
            </div>
            <div id="m2"></div>

            <div id="m3" >
            <%if(search != null){ %>
            <a href="<%=contextPath%>/search.si?cpage=1&buttonText=<%=search%>" style="color: gray;"><b>최신순</b></a>
                 |
            <a href="<%=contextPath%>/count.si?cpage=1&buttonText=<%=search %>" style="color: gray;"><b>인기순</b></a>
            <% }else{%>
            <a href="<%=contextPath %>/list.si?cpage=1" style="color: gray;"><b>최신순</b></a>
            |
            <a href="<%=contextPath%>/count.si?cpage=1&buttonText=전체" style="color: gray;"><b>인기순</b></a>
            <%} %>
            </div>
        </div>
    
        <!-- 여행코스 목록은 연우님과 상의해서 정하기 -->
        <!-- 5개씩 하기로 함 -->
        <div id="content-body" >
            <!-- 눌루하면 색 변하게 하기 -->
 
            <!-- 
                .wrap>#content-body>div을 click했을때 이런식으로 
                자바에 식을 작성하면 될 듯
            -->
  

        <table>
        
         <%if(list.isEmpty()){ %>
        <!-- 게시글이 없을 경우 -->
        
        
            <tr>
            
                <th style="width: 25%; height: 20%;">
                </th>
                
                <td>
                    <div class="h3-class">
                        <h3> <b> 게시글이 없습니다.</b> </h3>
                    </div>
                    
                    <div class="p-class">
                       
                    </div>
                </td>

            </tr>
		<%}else{ %>
		<!-- 게시글이 있을 경우 -->
		<%for(Sight s : list){ %>
			<tbody class="tablebody">
			
            <tr>
            	
                <th style="width: 25%; height:20%">
                <input type ="hidden" class="boardNoInput" value = "<%=s.getBoardNo()%>">
                    <img src="<%=contextPath %>/<%=s.getFilePath()%>" class="img">
                </th>
                
                <td data-bno="<%=s.getBoardNo()%>">
                    
                        <h3 style="padding-top: 10px"> <b style="color:gray; padding-left: 10px;"> <%=s.getTitle() %></b> </h3>
                    
                    
                  
                        <p style="color:gray; padding-left: 10px; padding-top: 15px;"> 
                        <% String content = s.getContent(); %>
                        <%= content.length() > 50 ? content.substring(0, 50) + "..." : content %>
                        </p>
</td>  
                    
                                 <td style="width: 160px; color:gray;">
                        <span>조회수 :</span> <%=s.getCount() %><br>
                        <span>수정일 :</span> <%=s.getModifyDate()%>
                        </td>
                    </tr> 
                    
                    </tbody>                  
                           

                
            
            <% }} %>


        </table>






        </div>



        
        <div id="down-body" >
            <br><br>
            <%if(request.getSession().getAttribute("loginMember") != null && ((Member)request.getSession().getAttribute("loginMember")).getMemberNo() == 1){  %>
            <a href="<%=contextPath %>/write.si" class="btn btn-sm btn-secondary" style="block-size: 40px; inline-size: 70px; line-height: 30px;">글작성</a>
            <%} %>
            <!-- 글 작성은 회원과 관리자일때만 보이게 하기! (자바에서)-->

        </div>

    </div>

        <!-- -------------위로가기 버튼------------ -->
        <div style="position:fixed; bottom: 200px; right: 10%; width: 5px; height: 5px; z-index: 999;">
           <a href="#"><img src="resources/images/upbutton.png" title="위로 가기" style="width: 50px;"></a>
        </div>

        <!-- -------------대한민구석구석 사이트 가기 버튼------------ -->
        <div style="position:fixed; bottom: 140px; right: 10%; width: 5px; height: 5px; z-index: 999;">
           <a href="https://1330chat.visitkorea.or.kr:3000/#/ttalk_main/CHAT1330_160635739001093018/_0300_0100_main.do" target="_blank"><img src="resources/images/movesite.png" title="대한민국구석구석" style="width: 50px;"></a>
        </div>    

    <div align="center" id="paging">
        <%if(currentPage != 1){ %>
        
        <button onclick="location.href='<%=contextPath%>/list.si?cpage=<%=currentPage-1%>'"> &lt; </button>
        <%} %>
        <%for(int p = startPage; p<=endPage; p++){ %>
        
        <%if(p == currentPage){ %>
        	<button class="active" disabled><%=p %></button>
        <%}else{ %>
        <%if(search == null){ %>
        <%if(orderByCount == "1"){ %>
        <button class="page-button" onclick= "location.href='<%=contextPath%>/count.si?cpage=<%=p%>'"><%=p %></button>
        <%}else{ %>
         <button class="page-button" onclick= "location.href='<%=contextPath%>/list.si?cpage=<%=p%>'"><%=p %></button><%} %>
         
         <%}else{ %>
         <button class="page-button" onclick= "location.href='<%=contextPath%>/search.si?cpage=<%=p%>&buttonText=<%=search%>'"><%=p %></button> <%} %>
       
        <%} %>
        <%} %>
        <%if(currentPage != maxPage){ %>
        
        <%if(search ==null){ %>
        
        
		        <%if(orderByCount =="1"){ %>
		         <button onclick="location.href='<%=contextPath%>/count.si?cpage=<%=currentPage+1%>'">&gt;</button>
		        <%}else{ %>
        <button onclick="location.href='<%=contextPath%>/list.si?cpage=<%=currentPage+1%>'">&gt;</button>
        <%} %>
         <%}else{ %>
         <button onclick="location.href='<%=contextPath%>/search.si?cpage=<%=currentPage+1%>'&buttonText=<%=search%>">&gt;</button>
         <%} %><%} %>
        
    </div>

  <br><br>
  
   <form id="menu-form" action="" method="GET">
    <input type="hidden" id="cpage" name="cpage" value="1">
    <input type="hidden" id="button-text" name="buttonText" value="">
</form>

<script>
    const menuButtons = document.querySelectorAll('#menu-body button');
    menuButtons.forEach(button => {
        button.addEventListener('click', function () {
            const buttonText = this.textContent;
            const form = document.getElementById('menu-form');
            const cpageInput = form.querySelector('#cpage');
            const buttonTextInput = form.querySelector('#button-text');

            if (buttonText === '전체') {
                form.action = 'list.si';
            } else {
                form.action = 'search.si';
                buttonTextInput.value = buttonText;
            
            }
			
            form.submit();
        });
    });
</script>
  <script>
  $(function(){
	  $("table>tbody").click(function(){
		  const boardNoInput = $(this).find(".boardNoInput");
		  if (boardNoInput.length > 0) {
		  location.href = "<%=contextPath%>/read.si?bno=" + $(this).find(".boardNoInput").val();
		  }
	  })
  })
  
  </script>
    
<%@ include file="../common/footer.jsp" %>
</body>
</html>





