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
 * Servlet implementation class FindMemberIdController
 */
@WebServlet("/findId.me")
public class FindMemberIdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindMemberIdController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		
		String memberName = request.getParameter("memberName");
		String email = request.getParameter("email");
		
		Member findIdMem = new MemberService().findMemberId(memberName, email);
		
		//--------------------------------------------------------------------------
		

		
		if(findIdMem == null) { // 아이디 찾기 실패
			
			request.getRequestDispatcher("views/common/findIdResult.jsp").forward(request, response);
			
		}else { // 아이디 찾기 성공
			
			HttpSession session = request.getSession();
			
			session.setAttribute("findIdMem", findIdMem);
			
			request.getRequestDispatcher("views/common/findIdResult.jsp").forward(request, response);
			
			
		}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
