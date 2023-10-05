package com.kh.member.controller;

import java.io.IOException;

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
 * Servlet implementation class MemberEnrollController
 */
@WebServlet("/insert.me")
public class MemberEnrollController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MemberEnrollController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String resourePath = "resources/profile_upfiles/"; // '/'뺐음. 마이페이지에 '//' 충돌나서

		request.setCharacterEncoding("utf-8");

		String memberName = request.getParameter("memberName");
		String memberId = request.getParameter("memberId");
		String nickname = request.getParameter("nickname");
		String memberPwd = request.getParameter("memberPwd");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String profileImg = null;
		
		if (ServletFileUpload.isMultipartContent(request)) { // 파일존재하는지 
			
			// 1_1. 전송용량제한
			int maxSize = 10 * 1024 * 1024;

			// 2_2. 저장시킬 폴더의 물리적인 경로
			// application == request.getSession().getServletContext()
			String savePath = request.getSession().getServletContext().getRealPath(resourePath); // '/'
																												

			// 2. 전달된 파일 업로드
			// MultipartRequest multiRequest = new MultipartRequest(request, 저장경로, 용량제한,인코딩, 이름변경객체);
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "utf-8", new MyFileRenamePolicy());
			// 저장, 넘긴 모든 값이 들어있음
			
			memberName = multiRequest.getParameter("memberName");
			memberId = multiRequest.getParameter("memberId");
			nickname = multiRequest.getParameter("nickname");
			memberPwd = multiRequest.getParameter("memberPwd");
			phone = multiRequest.getParameter("phone");
			email = multiRequest.getParameter("email");

			String changeFileName = multiRequest.getFilesystemName("profileImg"); // name 키값
			profileImg = resourePath + changeFileName;
			//           /resources/profile_upfiles/2023082717374710069.png
		}

		Member m = new Member();
		m.setMemberName(memberName);
		m.setMemberId(memberId);
		m.setNickname(nickname);
		m.setMemberPwd(memberPwd);
		m.setPhone(phone);
		m.setEmail(email);
		m.setProfileImg(profileImg);

		int result = new MemberService().insertMember(m);

		if (result > 0) {

			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "subwhere 회원이 되신걸 축하드립니다!"); 

			response.sendRedirect(request.getContextPath());

		} else {
			request.setAttribute("errorMsg", "회원가입에 실패하셨습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
