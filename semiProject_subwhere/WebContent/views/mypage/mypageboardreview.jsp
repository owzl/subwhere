<%@page import="com.kh.common.model.vo.PageInfo"%>
<%@page import="com.kh.board.model.vo.Review"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	ArrayList<Review> list = (ArrayList<Review>)request.getAttribute("list");

	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage(); 
%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

.warp{ 
            border: 2px solid lightgray;
            width: 1200px;
            height: 780px;
            margin: auto;
            margin-top: 15px;
        }
        
        .profilel,.profiler{
            border: 1px solid lightgray;
            box-sizing: border-box;
            height: 98%;
            float: left;
            margin-top: 0.7%;
            margin-left: 1%;
        }
        
        .profilel{
            width: 30%;
        }
        .profiler{
            width: 67%;
        }

      
	
        .jylist_title{
            /* border: 1px solid blue; */
            box-sizing: border-box;
            height: 8%;
        }
        .jylist_title>h1{
            margin-left:7%;
            margin-top: 3%;
            color: gray;
        }

        .jylist_box{
            /* border: 1px solid red; */
            box-sizing: border-box;
            height: 89%;
        }

        .jybtn_box{
            /* border: 1px solid green; */
            box-sizing: border-box;
            height: 8%;
        }

        .jywriter_list{
            /* border: 1px solid gold; */
            box-sizing: border-box;
            height: 82.3%;
        }

        #jyimg{
            width: 85%;
            padding:1.5%;
            height:123px;
            border-radius: 20px;
            padding-left: 5px;
            margin-left: 11%;
        }

        
        
        .jylist>table{
            /* border: 1px solid skyblue; */
            box-sizing: border-box;
            /* height: 80%; */
            /* border-collapse:collapse; */
            border-collapse:separate;
            border-spacing: 0px 7px;
            border-style: none; 
        }

        /*tr크기 고정해야 할 때 풀기*/
        /* tr {
            min-height: 130px; 
            max-height: 130px; 
        } */

        #jylist_table>.jylist{
            /* border: 1px solid violet; */
            box-sizing: border-box;
            height: 90%;
        }
       

        .jypage_btn{
            /* border: 1px solid blueviolet; */
            box-sizing: border-box;
            height: 10%;
        }

        .jypage_btn>button {
            border: none;
            width: 30px;
            height: 30px;
            margin: 0 5px;

        }

        .jypage_btn>button:hover {
            background-color: #007fff;
            color: white;
        }

        .jybtn_box>button{
            margin-top: 2%;
            width: 45%;
            height: 60%;
            border: 1px solid rgb(224, 224, 224);
            color: gray;
        }

        .jybtn_box>button:hover {
            background-color: #007fff;
            color: white;
        }

        #jylist_table tr{
            background-color: rgb(226, 226, 226);
            
        }
        
        #jylist_table tr:hover{
            cursor: pointer;
            background-color: lightgray;
        }

        

        #jylist_table #jya{
            padding: 0;
            vertical-align:middle;
            border-radius: 10px;
        }

        #jya>p,h2{
            margin-left: 5%;
            color: gray;
        }

        #jyh2{
            margin-bottom: 0;
        }

        #jyp{
            margin-top: 0;
        }

        
        #jycheck_list{
            margin-top: 50px;
            position: absolute;
        }


        #de_board{
            margin-left: 70%;
            border: none;
            height: 30px;
            border-radius: 10%;
            background-color: gray;
            color: white;
        }

        #de_board:hover{
            background-color: rgb(114, 114, 114);
        }


</style>


</head>
<body>

<!-- 내가 쓴 후기글 게시글  -->

	<%@ include file="../common/header.jsp" %>

	<div class="warp">
		
	
        <%@ include file="mypageleft.jsp" %>
	
	
	    <div id="rightpro" class="profiler">

            <div class="jylist_title">
                <h1><%=loginMember.getNickname() %>님이 작성하신 글</h1>
            </div>
     
            <div class="jylist_box">
     
                <div class="jybtn_box" align="center">
                    <button type="button" onclick="ctest1();" id="mycoslist">여행 코스</button>
                    <button type="button" onclick="rtest2();" id="myreviewlist">후기글</button>
                    <!-- <button type="button">여행지</button> -->
                </div>
     
                <div class="jywriter_list">   
     
                    <div class="jylist">
                        <table align="center" id="jylist_table">
                        	
                        	<!-- case1. 작성한 글이 없을 경우 -->
                        	<%if(list.isEmpty()){ %>
                            <tr>
                                <P align="center">작성하신 후기 게시글이 없습니다.</P>
                            </tr>
                            <%}else{ %>
                            <!-- case2. 작성한 글이 있을 경우 -->
        					<%for(Review r : list){ %>
                            <tr class="blist-area">
                               <input type="hidden" value="<%=r.getBoardNo()%>">
                                    <div class="jypic">
                                        <td width="100" id="jya"><img src="<%=r.getTitleImg() %>" alt="" id="jyimg"></td>
                                    </div>
        
                                    <td width="450" height="130" id="jya"> 
                                        <h2 id="jyh2"><%String Rreview =  r.getTitle(); %><%=Rreview.length()>10 ? Rreview.substring(0, 10)+"..":Rreview %></h2>
                                        <p id="jyp"><%String Rcontent = r.getContent(); %><%=Rcontent.length()>15?Rcontent.substring(0, 15)+"..":Rcontent %></p>
                                        <span>날짜:<%=r.getCreateDate() %> &nbsp;&nbsp; 조회수:<%=r.getCount() %></span>
                                    </td>
                                
                            </tr>
                            <%} %>
                         <%} %>
        
                        </table>
                    </div>
                    
                    
                    <script>
                    	function ctest1(){
                    		location.href="<%=contextPath%>/myblist.me?Mno=<%= loginMember1.getMemberNo()%>&cpage=1";
                    	}
                    	
                    	function rtest2(){
                    		location.href="<%=contextPath%>/mycomlist.me?Mno=<%=loginMember1.getMemberNo()%>";
                    	}
                    
                    	$(function(){
                    		$(".blist-area").click(function(){
                    			location.href="<%=contextPath%>/detail.re?bno="+$(this).children("input").val();
                    		})
                    	})
                    	
                    </script>
                    

                   </div>
                    
                    <div class="jypage_btn" align="center">
<!--  
                        <div>
                            <button id="de_board">삭제하기</button>
                        </div>
-->
                        <%if(currentPage != 1){ %>
                        <button onclick="location.href='<%= contextPath%>/mycomlist.me?Mno=<%=loginMember.getMemberNo()%>&cpage=<%=currentPage -1%>'">&lt;</button>
						<%} %>
						
						<%for(int p = startPage; p<=endPage ; p++){ %>
					
						<%if(p==currentPage){ %>	
                        <button disabled><%=p %></button>
                        
                        <%}else{ %>
                        <button onclick="location.href='<%= contextPath%>/mycomlist.me?Mno=<%=loginMember.getMemberNo()%>&cpage=<%=p %>'"><%=p %></button>
                        <%} %>
                        
                      <%} %>
                      
                      <%if(currentPage != maxPage){ %>
                        <button onclick="location.href='<%= contextPath%>/mycomlist.me?Mno=<%=loginMember.getMemberNo()%>&cpage=<%=currentPage + 1%>'">&gt;</button>
    					<%} %>

                    </div>
        
                </div>
     
            </div>


	</div>
	
<br>



<%@ include file="../../views/common/footer.jsp" %>


 



</body>
</html>