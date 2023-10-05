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
 * Servlet implementation class UpdateMemberPwdController
 */
@WebServlet("/updatePwd.me")
public class UpdateMemberPwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMemberPwdController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		String memberId = request.getParameter("memberId");
		String updatePwd = request.getParameter("updatePwd");
		
		
		
		Member updatePwdMem = new MemberService().updateMemberPwd(memberId, updatePwd);
		
		HttpSession session = request.getSession();
	
		if(updatePwdMem == null) { // 실패
			
			session.setAttribute("alertMsg", "비밀번호 변경 실패");
			//request.getRequestDispatcher("views/common/updatePwdResult.jsp").forward(request, response); // 실패화면
			
			
			
		}else { // 성공
			
			session.setAttribute("loginMember", updatePwdMem);
			
			request.getRequestDispatcher("views/common/updatePwdResult.jsp").forward(request, response); // 성공화면
			
			
			
		}
	}
		
		
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
