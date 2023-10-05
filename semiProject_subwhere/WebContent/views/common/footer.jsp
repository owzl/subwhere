<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>footer</title>

    <!-- 글씨체 css -->
    <link href="resources/css/subwherefonts.css" rel="stylesheet">

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script> 

    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <style>
         /* div{border: 1px solid red;} */

        #footer{
            margin: auto;
            width: 1400px;
            height: 150px;
            background-color: #f1f2f3;
        }

        #footer_1{height: 25px;}

        #footer_2{height: 80px;}

        #footer_3{height: 45px;}
        
        /*--------------footer1-------------*/
        #footer_1>a{
            /* border: 1px solid; */
            text-decoration: none;
            color: rgb(58, 58, 58);
            font-weight: 400;
            margin: 15px;
            width: 100%;
            font-weight: 600;
            font-family: 'NEXON Lv1 Gothic OTF';
        }

        /* footer2 */
        #official_logo{ /*로고 사진을 넣을 div*/
           /* border: 2px solid green; */
           width: 290px;
           height: 75px;
           overflow:hidden;
           display: inline-block;
           margin-top: 2px;
           margin-left: 15px;
        }

        #official_logo img{ /*로고 이미지*/
            /* border: 1px solid coral; */
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        /*--------------footer2-------------*/

        #sites{ /*사이트 리스트를 통째로 감싸는 div*/
            /* border: 2px solid lightgreen; */
            display: inline-block;
            float: right;
            height: 80px;
            margin-right: 15px;
        }

        #site_link_img{ /*사이트 리스트 div*/
            /* border: 2px solid orange; */
            list-style-type: none;
            padding: 0;
            margin-bottom: 0;
            margin-right: 0;
            margin-left: 0;
            margin-top: 29px;
            float: right;
        }

        #site_link_img li{ /*리스트 목록(이미지) 각각을 감싸는 div*/
            /* border: 2px solid yellow; */
            border-radius: 7px;
            float: right;
            height: 44px;
            width: 129px;
            overflow:hidden;
            text-align: center;
            margin-right: 10px;
            margin-left: 10px;
        }

        #site_link_img img{ /*이미지*/
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        /*--------------footer3-------------*/
        #footer_3>p{
            width: 100%;
            /* border: 1px solid blue; */
            box-sizing: border-box;
            margin: 0;
            font-size: 12px;
            color: rgb(58, 58, 58);
            font-weight: 600;
            font-family: 'NEXON Lv1 Gothic OTF';
        }
        #address{height: 60%; padding: 5px 15px;}
        #copyright{height: 40%; text-align: center;}

        
    </style>
    
</head>
<body>
    <div id="footer">

        <div id="footer_1">
            <a href="#">이용약관</a>  
            <a href="#">개인정보취급방침</a>  
            
        </div>

        <div id="footer_2">
            <div id="official_logo">
                <a href="#"><img src="resources/images/logo_blue_subwhere.png"></a>
            </div>

            <div id="sites">
                <ul id="site_link_img">
                    <li><a href="https://www.mcst.go.kr/kor/main.jsp"><img src="resources/images/site_foot_mg.png"></a></li>
                    <li><a href="https://knto.or.kr/index"><img src="resources/images/site_foot_gg.png"></a></li>
                    <li><a href="http://www.wa.or.kr/index.asp"><img src="resources/images/site_foot_wa.png"></a></li>
                    <li><a href="https://api.visitkorea.or.kr/#/"><img src="resources/images/site_foot_api.png"></a></li>
                </ul>
            </div>

        </div>


        <div id="footer_3">
            <p id="address">
                강남지원 1관 : 서울특별시 강남구 테헤란로14길 6 남도빌딩 2F, 3F, 4F, 5F, 6F <br>
            </p>
            <p id="copyright">
                Copyright © 2023 Team 가2드 of H Class Information Educational Institute All Right Reserved
            </p>
        </div>

    </div>
    
</body>
</html>