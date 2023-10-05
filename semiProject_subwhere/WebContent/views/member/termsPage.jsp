<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        *{margin: 0;padding: 0;box-sizing: border-box; font-size: 15px;}
        body{background-color: #f0f0f0;}
        ul>li{list-style: none}
        a{text-decoration: none;}
        .clearfix::after{content: "";display: block;clear: both;}

        #joinForm{width: 1000px;margin: 0 auto;}
        ul.join_box{
            border: 1px solid #ddd;
            background-color: #fff;
            width: 1200px;
            margin: auto;}
        .checkBox,.checkBox>ul{position: relative;}
        .checkBox>ul>li{float: left;}
        .checkBox>ul>li:first-child{width: 85%;padding: 15px;font-weight: 600;color: #888;}
        .checkBox>ul>li:nth-child(2){position: absolute;top: 50%;right: 30px;margin-top: -12px;}
        .checkBox textarea{width: 96%;height: 160px; line-height: 1.5; margin: 0 2%;background-color: #f0f0f0;color: #888; border: none;}
        .footBtwrap{margin-top: 15px;}
        .footBtwrap>li>button{
            display: block; 
            width: 1200px;
            height: 100%; 
            font-size: 20px;
            text-align: center;
            line-height: 60px;
            background-color: #007fff;
            color: white;
            border: 1px solid lightgray;
            cursor: pointer;
            margin: auto;
        }
        .footBtwrap>li>button:hover {
            background-color: #0077ee;
            color: white;
        }

        .checkBtn> input {
            width: 25px;
            height: 25px;
        }

</style>

</head>
<body>
	
	<%@ include file = "../common/header.jsp" %>
	
	<div>
        <br><br>
   
            <ul class="join_box">
                <br>
                <li class="checkBox check02">
                    <ul class="clearfix">
                        <li>이용약관 동의(필수)</li>
                        <li class="checkBtn">
                            <input type="checkbox" name="chk" id="check1"> 
                        </li>
                    </ul>
                    <textarea name="" id="" style="resize: none;">여러분을 환영합니다.

'SUB-WHERE' 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 'SUB-WHERE' 서비스의 이용과 관련하여 'SUB-WHERE' 서비스를 제공하는 'SUB-WHERE' 주식회사(이하 'SUB-WHERE')와 이를 이용하는 'SUB-WHERE' 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 'SUB-WHERE' 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
                    </textarea>
                </li>
                <br>
                <li class="checkBox check03">
                    <ul class="clearfix">
                        <li>개인정보 수집 및 이용에 대한 안내(필수)</li>
                        <li class="checkBtn">
                            <input type="checkbox" name="chk" id="check2">
                        </li>
                    </ul>
    
                    <textarea name="" id="" style="resize: none;">여러분을 환영합니다.

'SUB-WHERE' 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 'SUB-WHERE' 서비스의 이용과 관련하여 'SUB-WHERE' 서비스를 제공하는 'SUB-WHERE' 주식회사(이하 'SUB-WHERE')와 이를 이용하는 'SUB-WHERE' 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 'SUB-WHERE' 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
                    </textarea>
                </li>
                <br>
                
                <li class="checkBox check04">
                    <ul class="clearfix">
                        <li>이벤트 등 프로모션 알림 메일 수신(필수)</li>
                        <li class="checkBtn">
                            <input type="checkbox" name="chk" id="check3">
                        </li>
                    </ul>
    
                    <textarea name="" id="" style="resize: none;">여러분을 환영합니다.

'SUB-WHERE' 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 'SUB-WHERE' 서비스의 이용과 관련하여 'SUB-WHERE' 서비스를 제공하는 'SUB-WHERE' 주식회사(이하 'SUB-WHERE')와 이를 이용하는 'SUB-WHERE' 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 'SUB-WHERE' 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
본 약관은 다양한 'SUB-WHERE' 서비스의 이용과 관련하여 'SUB-WHERE' 서비스를 제공하는 'SUB-WHERE' 주식회사(이하 'SUB-WHERE')와 이를 이용하는 'SUB-WHERE' 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 'SUB-WHERE' 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
                    </textarea>
                </li>
                <br><br>
            </ul>
            <ul class="footBtwrap clearfix">
                <li><button class="btn1" onclick="enrollMember();">회원가입</button></li>
            </ul>
       

    </div>


    <script> 
        function enrollMember(){
            var check1 = document.getElementById("check1").checked;
            var check2 = document.getElementById("check2").checked;
            var check3 = document.getElementById("check3").checked;

            if (check1 && check2 && check3) {
                window.location.href = "<%= contextPath%>/enrollForm.me";
            } else {
            	alert("모든 약관 동의(체크)시 회원가입 가능합니다!");
            }
        }
    </script>
    
    <br><br><br><br>
    
    <%@ include file = "../common/footer.jsp" %>
	
</body>
</html>