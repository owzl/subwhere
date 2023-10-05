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
 * Servlet implementation class LoginController
 */
@WebServlet("/login.me")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
				String memberId = request.getParameter("memberId");
				String memberPwd = request.getParameter("memberPwd");
				
				
				Member loginMember = new MemberService().loginMember(memberId, memberPwd);
				//-----------------------------------------------------------------------
				
				
				HttpSession session = request.getSession();
				
				if(loginMember == null) { // 로그인 실패
					
					request.getSession().setAttribute("alertMsg", "로그인 실패! 로그인 정보 또는 서비스 이용 제한 여부를 확인해주세요.");
					//session.setAttribute("alertMsg", "성공적으로 회원탈퇴 되었습니다. 그동안 이용해주셔서 감사합니다.");
					response.sendRedirect(request.getContextPath()); // 메인화면으로
					
				}else { // 로그인 성공
					
					session.setAttribute("loginMember", loginMember);
					response.sendRedirect(request.getContextPath()); // 메인 페이지로

					
				}
				
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
