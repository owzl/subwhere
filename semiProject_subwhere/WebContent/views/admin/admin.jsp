<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.common.model.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%
    PageInfo pi = (PageInfo)request.getAttribute("pi");
    ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
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
</head>

<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"/>

    <style>

        .wrap{
            width: 1400px;
            height: 1100px;
            margin: auto;
            margin-top: 80px;
            /* border: 1px solid red; */
            color: gray;
        }

        .wrap>#table{
            width: 100%;
            height: 80%;
            box-sizing: border-box;
        }

        h2{
            font-size: 45px;
        }

        table th,td{
            padding-left: 10px;
        }
        
        table th{
            height: 50px;
            border-bottom: 2px solid gray;
            background-color: #f1f2f3;
        }

        table td{
            height: 30px;
        }
        
         .update-input {
        border: none; 
    }

        /* --------------페이징---------------- */
        #paging {
            height: 10%;
            display: flex;
            justify-content: center;
            margin-top: 50px;
        }

        #paging button {
            background-color: #f1f2f3;
            color: #555;
            border: none;
            padding: 8px 15px;
            margin: 0 5px;
            cursor: pointer;
            border-radius: 5px;
            font-size: 14px;
            transition: background-color 0.3s, color 0.3s;
            height: 40%;
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


        /* ---------- searchbar -------------- */
           
        #search-area{
            width: 100%; /* 전체 너비를 100%로 설정 */
    height: 80px;
    box-sizing: border-box;
    margin-top: 100px;
    text-align: center; /* 텍스트 가운데 정렬 */
        }

        #search-area> div{
            height: 50%;
            box-sizing: border-box;
            float: left;
        }

        #search-bar{
            display: inline-block; /* 인라인 요소로 설정하여 가로 중앙 정렬 */
        }

        #search-bar>input{
            width: 100%;
            height: 100%;
        }

        #search-btn{
            width: 10%;
        }

        #search-btn>button{
            width: 80px;
            height: 100%;
            font-size: 15px;
            float: left;
        }
        
    

       #searchI {
        height: 45px;
    width: 500px;
       }
        
        #searchB {
            width: auto;
            height: 45px; /* 버튼 높이를 검색 상자와 동일하게 설정 */
        }
   </style>

<body>

   <%@ include file = "../common/header.jsp" %>

   <div class="wrap">

      

        <h2 align="center"><b>[관리자 페이지]</b></h2>
        <br><br><br>
        <div id="table">
            <table border="1">

                <thead>
                    <tr>
                        <th rowspan="2" width="70">회원 NO</th>
                        <th rowspan="2" width="200">아이디</th>
                        <th rowspan="2" width="200">비밀번호</th>
                        <th width="400">이름</th>
                        <th rowspan="2" width="300">이메일</th>
                        <th rowspan="2" width="250">휴대폰번호</th>
              
                        <th rowspan="2" width="100">상태</th>
                        <th rowspan="2" width="100"></th>
                    </tr>
            
                    <tr>
                        <th>닉네임</th>
                    </tr>
                </thead>
            	
                
                
               <%for(Member m : list){ %>
               
               
                <form action="update.ad" method="POST">
               
                	
                    <tr>
                     
                        <td rowspan="2"><%=m.getMemberNo() %></td>
                        <td rowspan="2"><input type = "text" class="update-input" name="id[<%=m.getMemberNo() %>]" value=<%=m.getMemberId() %>></td>
                        <td rowspan="2"><input type = "text" class="update-input" name="pwd[<%=m.getMemberNo() %>]"value=<%=m.getMemberPwd() %>></td>
                        <td><input type = "text" class="update-input" name="name[<%=m.getMemberNo() %>]" value=<%=m.getMemberName() %>></td>
                        <td rowspan="2"><input type = "text" class="update-input" name="email[<%=m.getMemberNo() %>]" value=<%=m.getEmail() %>></td>
                        <td rowspan="2"><input type = "text" class="update-input" name="phone[<%=m.getMemberNo() %>]"value=<%=m.getPhone() %>></td>
                        
                        <td rowspan="2" align="center">
                            <select name="status[<%= m.getMemberNo() %>]">
                                <option value="Y" <%= m.getStatus().equals("Y") ? "selected" : "" %>>Y</option>
                                <option value="W" <%= m.getStatus().equals("W") ? "selected" : "" %>>W</option>
                                <option value="S" <%= m.getStatus().equals("S") ? "selected" : "" %>>S</option>
                            </select>
                        </td>
                        <td rowspan="2" align="center">
                            <button type="submit"  class="btn btn-sm btn-secondary">수정</button>
                            <input type="hidden" name="memberNo" value="<%= m.getMemberNo() %>">
                        </td>
                    </tr>
                    <tr>
                        <td><input type = "text" class="update-input" name="nn[<%=m.getMemberNo()%>]" value=<%=m.getNickname() %>></td>
                         
                    </tr>

                    </form>
                    
  
                     
                 
               
                <%} %>
            
            </table>
           

        </div>
        
        
    
   

        <div align="center" id="paging">
        <%if(currentPage !=1){ %>

            <button onclick="location.href='<%=contextPath%>/manage.ad?cpage=<%=currentPage-1%>'"> &lt; </button>
            <%} %>
            <%for(int p = startPage; p<=endPage; p++){ %>
            <%if(p == currentPage){ %>
            <button class="active" disabled><%=p %></button>
            <%}else{ %>
           <button onclick= "location.href='<%=contextPath%>/manage.ad?cpage=<%=p%>'"><%=p %></button>
    <%} %>
        <%} %>
       <%if(currentPage != maxPage){ %>
        <button onclick="location.href='<%=contextPath%>/manage.ad?cpage=<%=currentPage+1%>'">&gt;</button>
        <%} %>
        </div>

        <div id="search-area" align="center">
          	  <form action="search.ad" method="GET">
              <div id="search-bar">
                <input type="hidden" name="cpage" value="1">

                <input type="text" placeholder="아이디로 검색" name="searchById" id="searchI" style="height: 45px; width: 500px;">
                <button type="submit" class="btn btn-sm btn-primary" id="searchB" >조회</button>

              </div>
              </form>
  
              <div id="search-btn">
              </div>

        </div>
            
        

    </div>
    
    <br><br>
    
    <br><br><br><br><br><br><br><br><br><br><br>
    
    <%@ include file = "../common/footer.jsp" %>




</body>
</html>