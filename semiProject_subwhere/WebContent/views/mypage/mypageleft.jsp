<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member loginMember1 = (Member)session.getAttribute("loginMember");
%>    
    
 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.top,.body,.foot{
                /* border: 1px solid blue; */
                box-sizing: border-box;
                width: 100%;
            }
    
            .top{height: 40%;}
            .body{height: 10%;}
            .foot{height: 40%;}
    
            .body>table{
                width: 90%;
                height: 75%;
                margin: auto;
                margin-top: 5%;
            }
    
            #Id{
                color: gray;
            }
    
            .foot>table{
                width: 90%;
                height: 90%;
                margin: auto;
                margin-top: 1%;
            }
    
    
            th input{
                height: 90%;
                width: 100%;
                border: none;
                background-color: lightgray;
                color: white;
                border-radius: 15px;
                cursor: pointer;  
                font-size: medium;
            }
    
            #btn input:hover{
            background-color: #007fff;
                color: white;
            }
    
            .propicturejy img{
                /* border: 1px solid red; */
                margin-top: 15%;
                border-radius: 50%;
                padding: 7%;
            }
    
            #pro>input{
                width: 20%;
                float: right;
                margin-top: 80%;
            }
            

            

</style>

</head>
<body>


  <div id="leftpro" class="profilel">

            <div id="picture" class="top" align="center">

                <%if(loginMember1.getProfileImg().equals("resources/profile_upfiles/null")){ %>
                      <div class="propicturejy" id="pro">
                          <img src="resources/images/profile_img_nocamera.png" width="280" height="280" alt="파일에서 업로한 사진으로">
                      </div>
                  <%}else{ %>
                        <div class="propicturejy" id="pro">
                         <img src="<%=loginMember1.getProfileImg() %>" width="280" height="280" alt="파일에서 업로한 사진으로">
                       </div>
                  <%} %>

            </div>

            <div id="MemberId" class="body">

                <table border="0">
                    <tr>
                        <th id="nicname" width="90%" style="font-size:x-large; text-align: center;"><%=loginMember1.getMemberName()%></th>
                    </tr>
                    
                    <tr>
                        <td align="center" id="Id" style="font-size:small;"><%=loginMember1.getMemberId() %>님</td>
                    </tr>
                    
                </table>

            </div>
            
            <div id="btn" class="foot">

                <table border="0" id="btn_area">
                    
                    <tr>
                         <th>
                         	<a href="/subwhere/mypageform.me">
                         	    <input type="button" name="" id="" value="회원정보 변경">
                            </a>
                         </th>
                    </tr>
                    
                    <tr>
                        <th></th>
                    </tr>
                    
                    <tr>
                         <th>
                         	<a href="/subwhere/myblist.me?Mno=<%= loginMember1.getMemberNo()%>&cpage=1">
                         		<input type="button" value="내가 쓴 글 보기">
                         	</a>
                         </th>
                    </tr>
                    
                    <tr>
                         <th>
                            <a href="/subwhere/mydreview.me?deno=<%= loginMember1.getMemberNo()%>&cpage=1">

                                <input type="button" name="" id="" value="내가 쓴 댓글 보기">
                            </a>
                        </th>
                    </tr>
                    
                    
                    <tr> 
                         <th>
                            <a href="/subwhere/mylikelist.me?mylno=<%=loginMember1.getMemberNo()%>">
                                <input type="button" name="" id="" value="좋아요 보관함">
                             </a>
                        </th>
                    </tr>
                    
                    <tr>
                        <th></th>
                    </tr>
                    
                    <tr>
                        <th>
                            <a href="/subwhere/mylogout.me">
                                <input type="button" name="" id="" value="로그아웃">
                            </a>
                        </th>
                    </tr>

                </table>
                
               
				</div>
            </div>
            
 

</body>
</html>