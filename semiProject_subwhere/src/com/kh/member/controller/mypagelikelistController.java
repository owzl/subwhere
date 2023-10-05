package com.kh.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.vo.Liked;
import com.kh.member.model.service.MemberService;

/**
 * Servlet implementation class mypagelikelistController
 */
@WebServlet("/mylikelist.me")
public class mypagelikelistController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * 좋아요 보관함
     * @see HttpServlet#HttpServlet()
     */
    public mypagelikelistController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//RequestDispatcher view = request.getRequestDispatcher("views/mypage/mypagelikelist.jsp");
		//view.forward(request, response);
		
		int memberno = Integer.parseInt(request.getParameter("mylno"));
		
		
		ArrayList<Liked> list = new MemberService().mylikelist(memberno);
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/mypage/mypagelikelist.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
