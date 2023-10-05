<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



<style>

/*.warp는 최종적으로 안가져 감*/
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

    

        


         
        .out{
            /* border: 1px solid red; */
            box-sizing: border-box;
            height: 13%;
            margin-top: 5.5%;
        }

        .out_body{
            /* border: 1.5px solid black; */
            width: 89%;
            height: 78%;
            margin: auto;
        } 

        .content{
            /* border: 1px solid black; */
            box-sizing: border-box;
            height: 85%;
        }

        h2{
            font-size: xx-large;
            margin-top: 2.5%;
        }

        
        /* .btn_area{
            border: 1px solid green;
            box-sizing: border-box;
            height: 5%;
        } */

        h4,p{
            margin-left: 10%;
        }

        h2,h6{
            margin-left: 15%;
        }

        #check_out{
            margin-left: 13%;
        }


        h4{
            margin-top: 1%;
        }

        button{
            margin-left: 48%;
            margin-top: 2%;
        }

        p b{
            color: red;
        }

        em{
            color: green;
        }

        strong{
            color: red;
        }
        
        h2{
            font-size:xx-large;
            font-weight: 700;
        }

        h4{
            font-size:large;
            font-weight: 600;
        }

        p{
            font-size: small;
        }


        #checkbtn button{
            margin-left: 250px;
            }

</style>


</head>
<body>
	<%@ include file="../common/header.jsp" %>

	<div class="warp">


           <%@ include file="mypageleft.jsp" %>

           <!-- 회원 탈퇴 약관 -->
           
		<div id="rightpro" class="profiler"><div class="out" id="memberout">
            <h2>탈퇴 안내</h2>
            <h6>회원 탈퇴를 산청하기 전에 안내사항을 꼭 확인해 주세요.</h6>
        </div>

        <div class="out_body">
            <div class="content">
                <h4>&#x2714; 사용하고 계신 아이디(<em><%=loginMember.getMemberId() %></em>)는 탈퇴할 경우 재사용 및 복구가 불가능 합니다.</h4>
                <p><b>탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가</b>하오니 신중하게 선택하시기 바랍니다.</p>

                <br>

                <h4>&#x2714; 개인정보 처리 및 보유 기간</h4>
                <p>SUB-WHERE는 개인정보 취급 방침에 따라 불량이용 및 이용제한에 관한 기록은 1년동안 삭제하기 않고 보관됩니다. <br>
                    이때 회원님의 정보는 상업적인 목적으로 이용 되지 않으며 별도 관리가 이루어집니다.
                </p>

                <br>

                <h4>&#x2714; 탈퇴 후에도 게시판에 등록된 게시물은 그대로 남아 있습니다.</h4>
                <p>여행지 정보 게시판, 여행 코스 게시판, 후기글 게시판에 올린 게시글 및 댓글은 탈퇴 시 자동으로 삭제되지 않고 그대로 남아 있습니다. <br>
                    <b>삭제를 원하는 게시글이 있다면 반드시 탈퇴 전 삭제하시기 바랍니다.</b>
                </p>
                <br>
                <p>
                    <strong>
                        탈퇴 후에는 <em><%=loginMember.getMemberId() %></em>로 다시 가입할 수 없으며 아이디와 데이터는 복구할 수 없습니다. <br>
                        게시판형 서비스에 남아 있는 게시글은 탈퇴 후 삭제할 수 없습니다.
                    </strong>
                </p>

                <hr width="90%">

                <br>
            
                <input type="checkbox" name="" id="check_out"><b>안내 사항을 모두 확인하였으며, 이에 동의 합니다.</b>

                <br><br>

                <div id="checkbtn">
                    <button type="button" class="btn btn-sm btn-danger"  data-toggle="modal" data-target="#deleteModal" id="delete_jyj" onclick="de();">확인</button>
                </div>
                 <!--data-toggle="modal" data-target="#deleteModal" -->

            </div>
            

            <br><br>
            <!-- <button type="button" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#deleteModal">확인</button> -->

            <!-- <div class="btn_area" align="center">
                <button type="button" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#deleteModal">확인</button>
            </div> -->

        </div>

         <script>
         
    //    	    $("#delete_jyj").click(function() {
   //    	        if($("#check_out").prop("checked")) {
   //     	            $('#deleteModal').modal('show');
   //     	       } else {
   //     	           alert("회원 탈퇴 동의후 체크 박스 선택해주세요");
   //     	       }
   //     	    });
    
    		// function de(){
    		// 	if(document.getElementById("check_out").checked){
            //         $("#delete_jyj").modal('show');
            //     }else{
            //         alert("안내사항을 확인하시고 약관에 동의해주세요");
            //     }
    		// }
        

        </script> 

    </div>

    <div class="modal" id="deleteModal">
        <div class="modal-dialog">
          <div class="modal-content">
      
            <!-- Modal Header -->
            <div class="modal-header">
              <h4 class="modal-title">회원 탈퇴</h4>
              <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
      
            <!-- Modal body -->
            <div class="modal-body" align="center">
              <form action="<%=contextPath %>/memdelete.me" method="post">
                    <input type="hidden" name="memberId" value=<%=loginMember.getMemberId() %> >
                  <b>탈퇴 후 복구가 불가능 합니다. <br> 정말로 탈퇴하시겠습니까?</b> <br><br>
                  비밀번호 : <input type="password" name="memberPwd" required> <br><br>
                  <button type="submit" class="btn btn-sm btn-danger" id="debtn">탈퇴하기</button>
              </form>
  
  
            </div>
            
        
          </div>
        </div></div>

    </div>

    <br>

<%@ include file="../../views/common/footer.jsp" %>
</body>
</html>