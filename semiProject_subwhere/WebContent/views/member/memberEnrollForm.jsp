<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    

 <style>
        div * {box-sizing: border-box;}

        .all {
            margin: auto;
            margin-top: 50px;
            width: 1200px;
            height: 1000px;
        }

        /* -------------------------profile--------------------------- */
        #profile>#standardProfile {
            width: 240px;
            height: 240px;
            border-radius: 120px;
        }

        /* -------------------------con1--------------------------- */
        #con1 {
            padding-top: 20px;
        }
        
        #con1>p {
            padding-left: 120px;
            color: #007fff;
            font-weight: bold;
            font-size: 17px;
        }

        #con1 input {
            width: 80%;
            height: 45px;
            border: none;
            background-color: #f1f2f3;
            margin-bottom: 20px;
            border-radius: 5px;

        }

        #con1 input::placeholder {
            color: rgb(161, 161, 161);
        }

        #con1>#memberId {
            width: 70%;
        }

        #con1>#checkId {
            width: 10%;
            height: 42px;
            background-color: #007fff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 15px;
        }

        #con1>#checkId:hover {
            background-color: #0077ee;
            color: white;
        }

        #con1>#checkPwdMsg {
            padding-left: 120px;
            font-weight: bold;
        }

        /* -------------------------con2--------------------------- */

        #con2>#enrollBtn {
            width: 650px;
            height: 50px;
            background-color: #007fff;
            color: white;
            font-size: 17px;
            line-height: 40px;
            text-decoration: none;
            border: 1px solid lightgray;
            cursor: pointer;
            border-radius: 5px;
        }

        #con2>#enrollBtn:hover {
            background-color: #0077ee;
            color: white;
        }

    </style>

</head>
<body>

	<%@ include file = "../common/header.jsp" %>

	<div class="all">
        <form action="<%= contextPath%>/insert.me" onsubmit="return insert();" method="post" id="enroll-form" enctype="multipart/form-data">
            <!------------------------profile----------------------------->
            
            <br>
            <div id="profile" align="center">
                <img id="standardProfile" src="resources/images/profile_img_nocamera.png" onclick="chooseFile();">
            </div>
            <br><br>
    
            
            <!------------------------con1----------------------------->
            <div id="con1" align="center">
                
                <!-- input 파일첨부 -->
                <input type="file" name="profileImg" id="profileImg" onchange="loadImg(this);" style="display: none;">
                
                <p align="left">* 모든 입력 사항은 필수 정보입니다!</p>
                <input type="text" name="memberName" placeholder="이름"> <br>
                <input type="text" name="memberId" id="memberId" placeholder="아이디">
                <button type="button" onclick="idCheck();" id="checkId">중복확인</button>
                <input type="text" name="nickname" placeholder="닉네임"> <br>
                <input type="password" name="memberPwd" id="memberPwd" placeholder="비밀번호"> <br>
                <input type="password" name="checkPwd" id="checkPwd" placeholder="비밀번호 확인"> <br>
                <div id="checkPwdMsg" align="left"></div> <br>
                <input type="text" name="phone" placeholder="' - ' 를 포함한 연락처를 입력해주세요." onclick="pwdCheck();"> <br>
                <input type="email" name="email" placeholder="'@' 를 포함한 이메일을 입력해주세요."> <br>
            </div>
    
    
            <!------------------------con2----------------------------->
            <br>
            <div id="con2" align="center">
                <button type="submit" id="enrollBtn">가입하기</button>
            </div>
            
         
            
        </form>

    </div>
    <br><br>
    
    <%@ include file = "../common/footer.jsp" %>
	
</body>
	

	<script>
	
		// 아이디 중복 확인
		function idCheck() {
			
			const $idInput = $("#memberId"); 
			
			$.ajax({
				url:"idCheck.me",
				data:{checkId:$idInput.val()}, 
				success:function(result){ // /idCheck.me 에서의 결과를 result로 받아줌
					if(result == 'NNNNN'){ // 사용 불가능
						alert("이미 존재하거나 탈퇴한 회원의 아이디입니다.");
						$idInput.focus(); 
					}else { // 사용 가능 ('NNNNY')
						if(confirm("사용가능한 아이디 입니다. 사용하시겠습니까?")) { // (확인)true
							$("#enroll-form :submit").removeAttr("disabled"); 
							// enroll-form (후손중) 타입이 :submit인것의 속성()을 제거
							$idInput.attr("readonly", true);
						}else { // (취소)false
							$idInput.focus();
						}
					}
				},
				error:function(){
					console.log("아이디 중복체크용 ajax 통신 실패!!")
				}
			})
		
		}

        // 비번일치확인 (불일치하면 아예 안넘어가도록)
        function checkPwd() {

           var memberPwd = $("#memberPwd").val();
           var checkPwd = $("#checkPwd").val();

           if(memberPwd!=checkPwd) {
                alert('비밀번호가 일치하지 않습니다.');
                return true;
           }
        
        }

        function insert() {
            if(checkPwd()) {
                return false;
            }
        }

        // 비번일치확인 (div안에 경고문)
        function pwdCheck() {
            var memberPwd = $("#memberPwd").val();
            var checkPwd = $("#checkPwd").val();

            if(memberPwd!=checkPwd) {
                $("#checkPwdMsg").html("비밀번호가 일치하지 않습니다!");
                $("#checkPwdMsg").css("color", "red");
            }else {
                $("#checkPwdMsg").html("✔ 비밀번호가 일치합니다!");
                $("#checkPwdMsg").css("color", "#4caf50");
            }
        }




        // 프로필 <-> input type:file
        function chooseFile(){
            $("#profileImg").click();
        } 

        function loadImg(inputFile){
            if(inputFile.files.length == 1){
                const reader = new FileReader();

                reader.readAsDataURL(inputFile.files[0]);

                reader.onload = function(e){
                    $("#standardProfile").attr("src",e.target.result);
                }

            }else{
                $("#standardProfile").attr("src",null);
            }
        }



	</script>
</html>