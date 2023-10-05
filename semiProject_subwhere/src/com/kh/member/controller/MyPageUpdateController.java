package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.common.MyFileRenamePolicy;
import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class MyPageUpdateController
 */
@WebServlet("/myupdate.me")
public class MyPageUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * 마이페이지 정보변경
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				String resourePath = "resources/profile_upfiles/";
				 request.setCharacterEncoding("UTF-8");

			      if(ServletFileUpload.isMultipartContent(request)) {//form 태그 안에 있는 enctype이 잘 써져 있어야 잘 실행 됨(약간 오타 감별부분)
			         //용량제한
			         int maxSize = 10*1024*1024;
			         
			         //저장 시킬 폴더의 물리적인 경로
			         String savePath = request.getSession().getServletContext().getRealPath(resourePath);
			         
			         
			         //아래 코드에 들어가면 사진파일은 폴더에 자동 저장이 된다. 
			        MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			         
			        //쿼리에 필요한 값
			        String memberId = multiRequest.getParameter("memberId");
			        String nickname = multiRequest.getParameter("nickName");
					String email = multiRequest.getParameter("email");
					String phone = multiRequest.getParameter("phone");			  
					String profileImg = resourePath + multiRequest.getFilesystemName("pic");

			         Member m = new Member();
			         
			         	m.setMemberId(memberId);
						m.setNickname(nickname);
						m.setEmail(email);
						m.setPhone(phone);
						if(multiRequest.getFilesystemName("pic") == null) {
							m.setProfileImg(((Member)request.getSession().getAttribute("loginMember")).getProfileImg());
						}else {
							m.setProfileImg(profileImg); 							
						}

					
					
			      Member updateMem = new MemberService().updateMember(m);
			      
			      
			         if(updateMem != null) { //성공
			            HttpSession session = request.getSession();
			            session.setAttribute("alertMsg", "성공적으로 정보변경이 되었습니다.");
			            session.setAttribute("loginMember", updateMem);
			            response.sendRedirect(request.getContextPath()+"/mypageform.me");
			            
			         }else {//실패
			        	 
			            request.setAttribute("errorMsg", "정보변경에 실패했습니다");
			            RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			            view.forward(request, response);
			         }
			         
			         
			         
			      }
			      
			      
	}
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
