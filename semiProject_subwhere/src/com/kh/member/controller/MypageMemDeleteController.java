package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;

/**
 * 마이페이지 회원 탈퇴
 * Servlet implementation class MypageMemDeleteController
 */
@WebServlet("/memdelete.me")
public class MypageMemDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageMemDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String memberId = request.getParameter("memberId");
		String memberPwd = request.getParameter("memberPwd");
		
		int result = new MemberService().deleteMember(memberId,memberPwd);
		
		HttpSession session = request.getSession(); //로그인 관련 정보가 세션에 저장 되어 있어서 가져오기
		if(result>0) { //탈퇴 성공시 url 재요청으로 메인 페이지 
			session.setAttribute("alertMsg", "성공적으로 회원 탈퇴가 되었습니다. 그동안 이용해주셔서 감사합니다.");
			session.removeAttribute("loginMember"); //longinMember세션에 있는 값 제거하기
			response.sendRedirect(request.getContextPath()); //메인페이지 이동
			
		}else {//탈퇴 실패시 url요청으로 마이페이지
			session.setAttribute("alertMsg", "회원 탈퇴에 실패했습니다.");
			response.sendRedirect(request.getContextPath()+"/mypageform.me");
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
