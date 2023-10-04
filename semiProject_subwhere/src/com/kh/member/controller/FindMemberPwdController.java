package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class FindMemberPwdController
 */
@WebServlet("/findPwd.me")
public class FindMemberPwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindMemberPwdController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		request.setCharacterEncoding("UTF-8");
		
		String memberId = request.getParameter("memberId");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		
		Member findPwdMem = new MemberService().findMemberPwd(memberId, email, phone);
		
		//----------------------------------------------------------------------------------------------------
		
		if(findPwdMem == null) { // 비밀번호 찾기 실패
			
			request.getRequestDispatcher("views/common/findPwdResult.jsp").forward(request, response);
			
			
		}else { // 비밀번호 찾기 성공
			
			HttpSession session = request.getSession();
			
			session.setAttribute("findPwdMem", findPwdMem);
			
			request.getRequestDispatcher("views/common/findPwdResult.jsp").forward(request, response);
			
		}
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
