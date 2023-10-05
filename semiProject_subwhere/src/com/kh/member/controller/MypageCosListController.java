package com.kh.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.vo.Review;
import com.kh.common.model.vo.PageInfo;
import com.kh.member.model.service.MemberService;

/**
 * 마이페이지 내가 쓴 후기글 게시물
 * Servlet implementation class MypageCosListController
 */
@WebServlet("/mycomlist.me")
public class MypageCosListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageCosListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		int memberno = Integer.parseInt(request.getParameter("Mno"));
//		
//		ArrayList<Review> list = new MemberService().selectReview(memberno);
//		
//		request.setAttribute("list", list);
//		request.getRequestDispatcher("views/mypage/mypageboardreview.jsp").forward(request, response);
		
		int klistCount;//현재 총 내가 쓴 후기글 게시글
		int currentPage;//현재 페이지
		int PageLimit; // 페이징 바의 개수
		int boardLimit; // 한 페이지 내 보여질 게시글 최대 개수
		
		int maxPage;
		int startPage;
		int endPage;
		int memberno = Integer.parseInt(request.getParameter("Mno"));
		
		klistCount = new MemberService().selectReBoardCount(memberno);
		
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		
		PageLimit = 5;
		boardLimit = 4;
		
		maxPage = (int)Math.ceil((double)klistCount/boardLimit);
		
		startPage = (currentPage - 1) / PageLimit * PageLimit + 1;
		
		endPage = startPage + PageLimit-1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(klistCount, currentPage, PageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<Review> list = new MemberService().selectReview(pi,memberno);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/mypage/mypageboardreview.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
