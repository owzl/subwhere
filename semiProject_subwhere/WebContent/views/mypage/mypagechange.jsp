<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

    
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

       
	
	
	
	
	
            
            
            
              .title{
            /* border: 1px solid red; */
            box-sizing: border-box;
            height: 9%;
        }

        #mychange{
            /* border: 1px solid red; */
            font-weight: 700;
            font-size: xx-large;
            margin-left: 3%;
            margin-top: 5%;
            color: gray;
        }

        .outer{
            /* border: 1px solid blue; */
            box-sizing: border-box;
            height: 89%;
        }

       #mypage_form{
        /* border: 1px solid green; */
        height: 97%;
       }

       #mypage_form>#change_table{
        border: 1px solid lightgray;
        border-collapse:collapse;
        width: 550px;
        height: 540px;
       }

       #change_table input{
        height: 30px;
        width: 80%;
        margin-left: 2%;
        border-style: none;
       }
       
       #proimg{
        margin-left: 3%;
        margin-top: 3%;
        border-radius: 50%;
        cursor: pointer;
       }

       td{
        position: relative;
        padding: 0;
       }

       #changeimg{
        position: absolute;
        left: 30%;
        bottom: 20%;
        z-index: 2;
        cursor: pointer;
       }

       #memberPwd{
        font-size: x-small;
       }

       th{
        color: gray;
       }
            
            

</style>



</head>
<body>

<%@ include file="../common/header.jsp" %>

  




 <div class="warp">
 

        <%@ include file="mypageleft.jsp" %>
        
        
        
         <div id="rightpro" class="profiler">
            <div class="title">

                <p id="mychange" align="center">개인정보 변경</p>
                
            </div>
    
            <div class="outer">
                <br>
    
                <form id="mypage_form" action="<%=contextPath %>/myupdate.me" method="post" enctype="multipart/form-data">
                    <table border="1" align="center" id="change_table">
                        <tr>
                           
                            <th width="130" style="text-align: center;">프로필 사진</th>
                            <td width="360">
                               <%if(loginMember.getProfileImg().equals("resources/profile_upfiles/null")){ %>
                                <img src="resources/images/profile_img_nocamera.png" name="profileImg" value="" alt="" width="140" height="140" id="proimg" onclick="filebtn();">
                                <%}else{ %>
                                <img src="<%=loginMember.getProfileImg() %>" name="profileImg" value="" alt="" width="140" height="140" id="proimg" onclick="filebtn();">
                                <%} %>
                                <img src="resources/images/camera.png" width="25" alt="" id="changeimg"  onclick="filebtn();">
                                <input type="file" name="pic" value="pic" style="display: none;" id="changefile" onchange="choosepic(this);"> 
                            </td>
  
                        </tr>
    
                        <tr>
                            <th height="65" style="text-align: center;">아이디</th>
                            <td><input type="text" name="memberId" id="memberId" value="<%= loginMember.getMemberId() %>" readonly></td>
                        </tr>
                       
                        <tr>
                            <th height="65" style="text-align: center;">닉네임</th>
                            <td><input type="text" name="nickName" value="<%=loginMember.getNickname() %>"  required></td>
                            
                        </tr>
    
                        
    
                        <tr>
                            <th height="65" style="text-align: center;">이메일</th>
                            <td><input type="email" name="email" value="<%=loginMember.getEmail()%>"></td>
                        </tr>
    
                        <tr>
                            <th height="65" style="text-align: center;">전화번호</th>
                            <td><input type="text" name="phone" value="<%= loginMember.getPhone() %>" placeholder="-를 포함해서 입력해주세요."></td>
                        </tr>
                        
                        
                    </table>
    
                    <br>
    
                    <div id="btn" align="center">
                        <button type="submit" class="btn btn-sm btn-secondary">정보변경</button>
                        <button type="button" class="btn btn-sm btn-secondary" data-toggle="modal" data-target="#updatePwdModal">비밀번호변경</button>
                        <button type="button" class="btn btn-sm btn-secondary" id="deletebtn">회원탈퇴</button>
                    </div>
                    
    
                </form>
    
                 <!-- 비밀번호 변경 용 Modal -->
	<div class="modal" id="updatePwdModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">비밀번호 변경</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body" align="center">
	        <form action="<%=contextPath %>/mypwdup.me" method="post">
	        	<!-- 해당 form에서 받는 값은 비밀번호 관련된 값들인데 controller로 넘어가면 아이디 값도 필요 => hidden으로 숨겨서 넘겨야 한다. -->
	        	<input type="hidden" name="memberId" value="<%=loginMember.getMemberId() %>" >
	        	
                <table>
                    <tr>
                        <td>현재 비밀번호</td>
                        <td><input type="password" name="memberPwd" required></td>
                    </tr>
                    <tr>
                        <td>변경할 비밀번호</td>
                        <td><input type="password" name="updatePwd" required></td>
                    </tr>
                    <tr>
                        <td>변경할 비밀번호 확인</td>
                        <td><input type="password" name="checkPwd" required></td>
                    </tr>
                </table>
                <br>

                <button type="submit" class="btn btn-sm btn-secondary" onclick="return vaildatePwd();">비밀번호 변경</button>

                <br><br>
            </form>
	      </div>
	
            <script>
                function vaildatePwd(){
                    if($("input[name=updatePwd]").val() != $("input[name=checkPwd]").val()){
                        alert("변경할 비밀번호가 일치하지 않습니다.");
                        return false; 
                        //false를 반환화면 form태그 안에 있는 값이 다음으로 넘어가지 않는다.
                    }
                }
            </script>

            </div>
        </div>
    </div>
                
                
                
    
                <script>
    
                    
                    function validate(){
                        //비밀번호
                        // const nickName = document.getElementsByName("nickName");
                        // const memberPwd = document.getElementsByName("memberPwd");
                        // const checkPwd = document.getElementById("checkPwd");
    
                        //1.비밀번호 검사
                        // let regExp = /^[a-zA-Z0-9]$/  //영문자, 숫자, 특문 사용 총 12글자
                        
                        // let regExp = /^[a-z][a-z0-9]{3,11}$/  //개수는 둘째자리부터 0~9를 의미하는 => \d
                        // if(!regExp.test(nickName.value)){ //잘못 입력한 경우
                        // alert("닉네임을 다시 입력해주세요!");
                        // idInput.select(); //여기 때문에 위에서(const에서) value값을 안했다.
                        // return false;
                        // }
                    }
    
    
                    function filebtn(){
                    $("#changefile").click();
                    } 

                    function choosepic(inputFile){
                        if(inputFile.files.length == 1){
                            const reader = new FileReader();

                            reader.readAsDataURL(inputFile.files[0]);

                            reader.onload = function(e){
                                $("#proimg").attr("src",e.target.result);
                            }

                        }else{
                            $("proimg").attr("src",null);
                        }
                    }
    
                    // function check(){
                    //     const memberPwd = document.getElementById("memberPwd");
                    //     const checkPwd = document.getElementById("checkPwd");
    
                    //     let regExp = /^[]$/
    
                    //     //2)비밀번호 검사
                    //     //  영문자(대소문자), 숫자, 특수문자(!,@,#,$,%,^,&,*)로 총 8~15글자 이루어져야 함
                    //     regExp = /^[a-z\d!@#$%^&*]{8,13}$/i
                    //     if(!regExp.test(memberPwd.value)){  
                    //     alert("유효한 비밀번호를 입력해주세요!")
                    //     memberPwd.value = ""; //value지우기 1
                    //     memberPwd.focus();//커서 깜박깜박 2  => 1,2 는 pwdInput1.select();를 대체해서 사용 가능
                    //      return false;
                    //     }
    
                    //     //비밀번호 일치
                    //     if(memberPwd.value != checkPwd.value){
                    //     alert("동일한 비밀번호를 입력해주세요")
                    //     checkPwd.value="";
                    //     checkPwd.focus();
                    //     return false;
                    //     }
                        
                    // }

                        $("#memberPwd,#checkPwd").keyup(function(){
                            let pass1 = $("#memberPwd").val();
                            let pass2 = $("#checkPwd").val();

                            if(pass1 != "" && pass2 != ""){
                                if(pass1 == pass2){
                                    $("#aa").html("일치");
                                    $("#aa").attr('color','black');
                                }else{
                                    $("#aa").html("불일치");
                                    $("#aa").attr('color','red');
                                }
                            }else{
                                if (pass1.length == 0 && pass2.length == 0) {
                                $("#aa").html("");
                            }
                            }
                            
                        });

                        $(function(){
                        	$("#deletebtn").click(function(){
                        		location.href = "<%=contextPath %>/mydeleteform.me";
                        	})
                        })
                        

    
                </script>
    
            </div>

		</div>
        
        </div>
        <br>
<%@ include file="../../views/common/footer.jsp" %>
</body>
</html>