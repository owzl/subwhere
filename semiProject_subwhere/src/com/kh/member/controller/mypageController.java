package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 마이페이지 응답
 * Servlet implementation class mypageController
 */
@WebServlet("/mypageform.me")
public class mypageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mypageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 * 마이페이지 폼 띄우는 과정
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//로그인 전 => 메인페이지 응답 , alert로 로그인 후 사용 
		//로그인 후 => 마이페이지 응답 , 포워딩 방식으로
		HttpSession session =request.getSession();
		
		if(session.getAttribute("loginMember")==null) {//로그인전
			session.setAttribute("alertMsg","로그인후 이용가능한 서비스입니다.");
			response.sendRedirect(request.getContextPath());
		}else {//로그인 후
			RequestDispatcher view = request.getRequestDispatcher("views/mypage/mypagechange.jsp");
			view.forward(request, response);
			
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
