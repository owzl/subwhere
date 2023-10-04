<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SUBWHERE</title>
    
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

    <!-- 스마트에디터 -->
    <script type="text/javascript" src="resources/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>

    
    <!-- 부트스트랩 -->
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
    />

<style>
	div * {box-sizing: border-box;}
	
	.body{
		margin:auto;
	    width: 1360px;
	    height: 1000px;
		margin: auto;
		margin-top: 10px;
		margin-bottom: 10px;

	    position: relative;
		background-color: #5c5c5f;
		border-radius: 5px;
	}
	#linemap{ /* 노선도 진한 회색 제일 큰 바탕 */
		/* border: 3px solid black; */
		height: 100%;
		padding: 20px;
		border-radius: 5px;
	}

	.linemap_tab_bundle{
		/* border: 2px solid red; */
		border-radius: 5px;
	}

	.linemap_tab{
		/* border: 2px solid yellowgreen; */
		background-color: #f1f2f3;
		border-top-left-radius: 5px;
		border-top-right-radius: 5px;
	}

	.tab-pane{
		/* border: 2px solid yellow; */
		margin-right: 0 !important;
		margin-left: 0 !important;
		margin: auto !important;
	}
	
	/* .tab-content{
		width:1300px;
		height: 900px !important;
		border: 1px solid #D8E6E6;
	} */
	#line_content{
		width:1320px;
		height: 900px !important;
		border: 1px solid #D8E6E6;
	}

	.line_each{ /*각 노선 img*/
		width: 1140px; 
		height: 882px;
		position: absolute;
		top: 0;
		left: 0;
		right: 0;
		bottom: 0;
		z-index: 2;
	}

	.line-all{ /*전체 노선도 img*/
		width: 1140px;
		height: 882px;
		position: absolute;
		top: 0;
		left: 0;
		right: 0;
		bottom: 0;
		z-index: 1;
	}
	
</style>


</head>

<%@ include file="views/common/header.jsp" %>


<body>

<div class="body">

	<div id="linemap">
		<br>
		<!-- 노선도 탭 Nav tabs -->
		<ul class="nav nav-tabs nav-justified linemap_tab_bundle" role="tablist">
			<li class="nav-item linemap_tab">
				<a class="nav-link active" data-toggle="tab" href="#home">
					<b style="font-size: 18px;">전체</b>
				</a>
			</li>
			<li class="nav-item linemap_tab">
				<a class="nav-link" data-toggle="tab" href="#menu1">
					<img src="resources/images/icon_line1.png" alt="" style="width: 25px;">
				</a>
			</li>
			<li class="nav-item linemap_tab">
				<a class="nav-link" data-toggle="tab" href="#menu2">
					<img src="resources/images/icon_line2.png" alt="" style="width: 25px;">
				</a>
			</li>
			<li class="nav-item linemap_tab">
				<a class="nav-link" data-toggle="tab" href="#menu3">
					<img src="resources/images/icon_line3.png" alt="" style="width: 25px;">
				</a>
			</li>
			<li class="nav-item linemap_tab">
				<a class="nav-link" data-toggle="tab" href="#menu4">
					<img src="resources/images/icon_line4.png" alt="" style="width: 25px;">
				</a>
			</li>
			<li class="nav-item linemap_tab">
				<a class="nav-link" data-toggle="tab" href="#menu5">
					<img src="resources/images/icon_line5.png" alt="" style="width: 25px;">
				</a>
			</li>
			<li class="nav-item linemap_tab">
				<a class="nav-link" data-toggle="tab" href="#menu6">
					<img src="resources/images/icon_line6.png" alt="" style="width: 25px;">
				</a>
			</li>
			<li class="nav-item linemap_tab">
				<a class="nav-link" data-toggle="tab" href="#menu7">
					<img src="resources/images/icon_line7.png" alt="" style="width: 25px;">
				</a>
			</li>
			<li class="nav-item linemap_tab">
				<a class="nav-link" data-toggle="tab" href="#menu8">
					<img src="resources/images/icon_line8.png" alt="" style="width: 25px;">
				</a>
			</li>
			<li class="nav-item linemap_tab">
				<a class="nav-link" data-toggle="tab" href="#menu9">
					<img src="resources/images/icon_line9.png" alt="" style="width: 25px;">
				</a>
			</li>
			
		</ul>
	
		<!-- 노선도 내용 Tab panes -->
		<div class="tab-content" id="line_content">

			<div id="home" class="container tab-pane active">
				<img src="resources/images/smap_sg_all.png" alt="" style="width: 1140px; height: 882px;">
			</div>

			<div id="menu1" class="container tab-pane fade" style="position: relative;">
				<div class="line_each">
					<img src="resources/images/smap_sg1.png" style="width: 1140px; height: 882px; margin-left: 15px;">
				</div>
				<div class="line_all">
					<img src="resources/images/smap_sg_all.png" style="width: 1140px; height: 882px; opacity:40%">
				</div>
			</div>

			<div id="menu2" class="container tab-pane fade" style="position: relative;">
				<div class="line_each">
					<img src="resources/images/smap_sg2.png" style="width: 1140px; height: 882px; margin-left: 15px;">
				</div>
				<div class="line_all">
					<img src="resources/images/smap_sg_all.png" style="width: 1140px; height: 882px; opacity:40%">
				</div>
			</div>

			<div id="menu3" class="container tab-pane fade" style="position: relative;">
				<div class="line_each">
					<img src="resources/images/smap_sg3.png" style="width: 1140px; height: 882px; margin-left: 15px;">
				</div>
				<div class="line_all">
					<img src="resources/images/smap_sg_all.png" style="width: 1140px; height: 882px; opacity:40%">
				</div>
			</div>

			<div id="menu4" class="container tab-pane fade" style="position: relative;">
				<div class="line_each">
					<img src="resources/images/smap_sg4.png" style="width: 1140px; height: 882px; margin-left: 15px;">
				</div>
				<div class="line_all">
					<img src="resources/images/smap_sg_all.png" style="width: 1140px; height: 882px; opacity:40%">
				</div>
			</div>

			<div id="menu5" class="container tab-pane fade" style="position: relative;">
				<div class="line_each">
					<img src="resources/images/smap_sg5.png" style="width: 1140px; height: 882px; margin-left: 15px;">
				</div>
				<div class="line_all">
					<img src="resources/images/smap_sg_all.png" style="width: 1140px; height: 882px; opacity:40%">
				</div>
			</div>

			<div id="menu6" class="container tab-pane fade" style="position: relative;">
				<div class="line_each">
					<img src="resources/images/smap_sg6.png" style="width: 1140px; height: 882px; margin-left: 15px;">
				</div>
				<div class="line_all">
					<img src="resources/images/smap_sg_all.png" style="width: 1140px; height: 882px; opacity:40%">
				</div>
			</div>

			<div id="menu7" class="container tab-pane fade" style="position: relative;">
				<div class="line_each">
					<img src="resources/images/smap_sg7.png" style="width: 1140px; height: 882px; margin-left: 15px;">
				</div>
				<div class="line_all">
					<img src="resources/images/smap_sg_all.png" style="width: 1140px; height: 882px; opacity:40%">
				</div>
			</div>

			<div id="menu8" class="container tab-pane fade" style="position: relative;">
				<div class="line_each">
					<img src="resources/images/smap_sg8.png" style="width: 1140px; height: 882px; margin-left: 15px;">
				</div>
				<div class="line_all">
					<img src="resources/images/smap_sg_all.png" style="width: 1140px; height: 882px; opacity:40%">
				</div>
			</div>

			<div id="menu9" class="container tab-pane fade" style="position: relative;">
				<div class="line_each">
					<img src="resources/images/smap_sg9.png" style="width: 1140px; height: 882px; margin-left: 15px;">
				</div>
				<div class="line_all">
					<img src="resources/images/smap_sg_all.png" style="width: 1140px; height: 882px; opacity:40%">
				</div>
			</div>
			
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

</div>	
</body>
<%@ include file="views/common/footer.jsp" %>
</html>