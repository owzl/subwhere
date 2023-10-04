<%@page import="com.kh.board.model.vo.Uploadfile"%>
<%@page import="com.kh.board.model.vo.Sight"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    Sight s = (Sight)request.getAttribute("s");
    ArrayList<Uploadfile> uploadList = (ArrayList<Uploadfile>)request.getAttribute("uploadList");
    int userNo = ((Member)request.getSession().getAttribute("loginMember")).getMemberNo();
    int uploadfileNum = uploadList.size();
   
    %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>여행지 추천 글수정하기</title>
    
    <!-- w3schools 부트스트랩 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

  
	
    
    <!-- 부트스트랩 -->
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
    />

    <style>
        div * {box-sizing: border-box;}


        .all {
            margin: auto;
            width: 1200px;
            height: 1400px;
            
        }

        #info{
            color: #222;
            font-weight: 700;
            font-size: 13px;
            
        }
        .table-responsive {
            margin-top: 20px;
        }
        
        .table th, .table td {
            vertical-align: middle;
        }


        input.form-control {
        	margin-left: 30px;
            border: none;
        }

       
        input.form-control::placeholder {
            font-size: 16px;
            font-weight: bold;
            color: #555;
        }

       
        table.table {
            border: none;
        }

        
        table.table tbody tr td {
            border-top: none;
        }

        /* ---------------content_h----------------- */
        #content_h {
            width: 100%;
            height: 50px;
            color: gray;
            font-size: 25px;
            font-weight: bold;
            margin-left: 50px;
        }

        /* ---------------content_b----------------- */
        #content_b {
            padding-left: 50px;
        }

        #content_b #writeTitle {
            width: 1127px;
            height: 40px;
            border: 1px solid lightgray;
        }
		#content_b #ir1{
			border: 1px solid lightgray;
		}
        
        /* ---------------content_b----------------- */
        #content_f {
            width: 100%;
            height: 50px;
            padding-top: 12px;
        }

        /*--미리보기--*/
		    .uploaded-image {
		        max-width: 100px;
		        max-height: 100px;
		        margin: 5px;
		        border: 1px solid #ccc;
		    }

            .input-file-button{
                padding: 6px 25px;
                background-color:#007fff ;
                border-radius: 4px;
                color: white;
                cursor: pointer;
                }
</style>
   

</head>
<body>
<%@ include file="../common/header.jsp" %>
    <div class="all">
        <form action="<%=contextPath%>/update.si" id="update-form" method="post" enctype="multipart/form-data">

            <!------------------------------content_h------------------------------->
            <br><br>
            <div id="content_h">
                <p id="title">여행지 추천 글수정하기</p>
            </div> <br>
    
            <!------------------------------content_b------------------------------->
            <div id="content_b">
                <input type="hidden" name = "userNo" value=<%=userNo %>> <!-- 나중에 value 동적으로 받아주기 -->
                <input type="hidden" name = "imgLength" value="0">
                <input type="hidden" name = "bno" value="<%=s.getBoardNo() %>">
   
    
                    <input type="text"  id = "writeTitle" name="writeTitle" placeholder="제목을 입력해주세요." value="<%=s.getTitle() %>" required>
                   
                   <select onclick="categoryChange();" style="height: 36px; width:560px;" id="stationLine">
                   <option>호선 번호 선택</option>
                   <option value="1">1호선</option>
                   <option value="2">2호선</option>
                   <option value="3">3호선</option>
                   <option value="4">4호선</option>
                   <option value="5">5호선</option>
                   <option value="6">6호선</option>
                   <option value="7">7호선</option>
                   <option value="8">8호선</option>
                   <option value="9">9호선</option>
                   
                   
                   
                   </select>
                   
                   <select id="stationNameNAME" style="height: 36px; width:562px;" name="stationNameNAME">
                   	<option>역 명 선택</option>
                   </select>
                   </div>
                   
                   <script>
    
    function categoryChange() {
        $.ajax({
            url: "selectbox.si",
            data: { num: $("#stationLine option:selected").val() },
            success: function (list) {
                if (list == null) { 
                    $("#stationNameNAME").html(""); 
                    let val = "<option>역 명 선택</option>";
                    $("#stationNameNAME").html(val);
                } else {
                    console.log(list);
                    let val = "";

                    for (let i = 0; i < list.length; i++) {
                        val += "<option value='" + list[i].stationNo + "'>" + list[i].stationName + "</option>";
                    }

                    $("#stationNameNAME").html(val);
                }
            },
            error: function () {
                console.log("ajax실패");
            }
        });
    }
</script>

                   
                   
                   
                   
                   
                    
                    <div id="txtarea" style="padding-left:50px">
                   <textarea name="ir1" id="ir1" rows="20" cols="123" style="resize: none;" placeholder="내용을 입력해주세요." required><%=s.getContent() %></textarea>
                     
                   </div>
                   <div id="imageInputContainer" style="padding-left:50px">
                   
                    <%
                    
				    for (int i = 0; i < uploadList.size(); i++) {
				        Uploadfile uploadfile = uploadList.get(i);
				    %>
				   <span class="uploaded-image-container">
					    <img src="<%= uploadfile.getFilePath() %>/<%=uploadfile.getChangeName() %>" class="uploaded-image" data-index="<%= i %>" name="uploadFiles[<%= i %>]" />
					    <input type="hidden" name="upload[<%= i %>]" value="<%=uploadfile.getChangeName() %>" />
					    <input type = "hidden" name = "uploadNo[<%=i %>]" value="<%=uploadfile.getFileNo() %>"/>
					    
				   </span>
				    <%
				    
				    }
   						 %>
                   
                   </div>
                   <script>
				    document.addEventListener("DOMContentLoaded", function() {
				        const imageContainers = document.querySelectorAll(".uploaded-image-container");
				
				        imageContainers.forEach(function(container) {
				            const image = container.querySelector(".uploaded-image");
				            const index = image.getAttribute("data-index");
				
				            image.addEventListener("click", function() {
				                
				                container.remove();
				
				                const uploadfileNumInput = document.querySelector("input[name='uploadfileNum']");
				                if (uploadfileNumInput) {
				                    uploadfileNumInput.value = parseInt(uploadfileNumInput.value) - 1;
				                   
				                }
				                
				                const hiddenInput = document.querySelector(`input[name="uploadFiles[${index}].fileNo"]`);
				                if (hiddenInput) {
				                    hiddenInput.value = "";
				                }
				               
				            });
				        });
				    });
				</script>
                   
                  <div style="padding-left:50px"> <button type="button" id="addImageButton" class="input-file-button" >사진 추가하기</button></div>
						<input type="file" id="imageInput" name="images[]" accept="image/*" style="display: none;">
						<input type="hidden" name = "uploadfileNum" value=<%=uploadfileNum %>>
						<input type="hidden" name = "originUploadFileNum" value = <%=uploadfileNum %>>
						
						<div id="imagePreview"></div>
						
						
					
                   
                   
        
        <div   style="border: none;">
            <table class="table table-borderless"  style="border: none;">
                <tbody>
                    <tr>
                        
                        <td><input type="text" class="form-control" name="dtn" placeholder="여행지명" value="<%=s.getDtnName() %>" style="border: none;"></td>
                    </tr>
                    <tr>
                        
                        <td><input type="text" class="form-control" name="tag" placeholder="태그(','로 구분해주세요)" value="<%=s.getHashtag() %>" style="border: none;"></td>
                    </tr>
                    <tr>
                        
                        <td><input type="text" class="form-control" name="time" placeholder="시간" value="<%=s.getRuntime() %>" style="border: none;"></td>
                    </tr>
                    <tr>
                        
                        <td><input type="text" class="form-control" name="holiday" placeholder="휴무일" value="<%=s.getHoliday() %>" style="border: none;"></td>
                    </tr>
                    <tr>
                        
                        <td><input type="text" class="form-control" name="address" placeholder="주소" value="<%=s.getAddress() %>" style="border: none;"></td>
                    </tr>
                    <tr>
                        
                        <td><input type="text" class="form-control" name="transportation" placeholder="교통 정보" value="<%=s.getTransport() %>" style="border: none;"></td>
                    </tr>
                </tbody>
            </table>
        </div>
       
        <!------------------------------content_f------------------------------->
     <div id="content_f" align="right">
                
                <button type="button" class="btn btn-secondary">뒤로가기</button>
                <button type="submit" id="writeBtn" class="btn btn-secondary">수정하기</button>
            </div>

        </form>
   
</div>
        <!-- -------------위로가기 버튼------------ -->
        <div style="position:fixed; bottom: 200px; right: 10%; width: 5px; height: 5px; z-index: 999;">
           <a href="#"><img src="resources/images/upbutton.png" title="위로 가기" style="width: 50px;"></a>
        </div>

        <!-- -------------대한민구석구석 사이트 가기 버튼------------ -->
        <div style="position:fixed; bottom: 140px; right: 10%; width: 5px; height: 5px; z-index: 999;">
            <a href="https://1330chat.visitkorea.or.kr:3000/#/ttalk_main/CHAT1330_160635739001093018/_0300_0100_main.do"  target="_blank" ><img src="resources/images/movesite.png" title="대한민국구석구석" style="width: 50px;"></a>
        </div>    
<script>
	$("#test").click(function(){
		let img = $(".uploaded-image");
		console.log(img)
	})
</script>
    
            
        

 <script>
    let imgCount = 0;

    document.addEventListener("DOMContentLoaded", function() {
        const imageInputContainer = document.getElementById("imageInputContainer");
        const imgLengthInput = document.querySelector("input[name='imgLength']");

        document.getElementById("addImageButton").addEventListener("click", function() {
            const input = document.createElement("input");
            input.type = "file";
            input.name = "images["+imgCount+"]";
            input.accept = "image/*";
            input.style.display = "none";

            input.addEventListener("change", function(event) {
                const files = event.target.files;

                imgLengthInput.value = imgCount + files.length;

                for (let i = 0; i < files.length; i++) {
                    const img = document.createElement("img");
                    img.src = URL.createObjectURL(files[i]);
                    img.className = "uploaded-image";
                    
                    img.name = "img["+imgCount+"]";
                    
                    img.addEventListener("click", function(){
                    	imageInputContainer.removeChild(img);
                    	imgCount--;
                    	imgLengthInput.value = imgCount;
                    });
                    imageInputContainer.appendChild(img);
                    imgCount +=1;
                }
               
            });

            imageInputContainer.appendChild(input);
            input.click();
        });
    });
</script>



<%@ include file="../common/footer.jsp" %>


</body>
</html>