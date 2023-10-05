package com.kh.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.vo.Course;
import com.kh.common.model.vo.Comments;
import com.kh.common.model.vo.PageInfo;
import com.kh.member.model.service.MemberService;

/**
 * 여행지 코스 게시글 리스트
 * Servlet implementation class mypageboardlistController
 */
@WebServlet("/myblist.me")
public class mypageboardlistController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mypageboardlistController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//RequestDispatcher view = request.getRequestDispatcher("views/mypage/mypageboardlist.jsp");
		//view.forward(request, response);
		
//		int memberno = Integer.parseInt(request.getParameter("Mno"));
//		
//		ArrayList<Course> blist = new MemberService().selectbcosList(memberno);
//		
//		request.setAttribute("blist", blist);
//		request.getRequestDispatcher("views/mypage/mypageboardlist.jsp").forward(request, response);

		
		int listCount; //현재 내가 쓴 총 여행지 코스 게시글 개스
		int currentPage; // 현재 페이지
		int pageLimit; // 페이지 하단에 보여질 페이징 바의 페이지 최대 개수
		int boardLimit; // 한 페이지 내에 보여질 게시글 최대 개수
		
		int maxPage; // 가장 마지막 페이지 
		int startPage; // 페이징 바의 시작 수
		int endPage; //페이징 바의 끝 수
		int memberno = Integer.parseInt(request.getParameter("Mno"));
		
		listCount = new MemberService().selectCboardCount(memberno);
		
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		
		pageLimit = 5;
		boardLimit = 4;
		
		maxPage = (int)Math.ceil((double)listCount/boardLimit);
		
		startPage = (currentPage - 1) / pageLimit * pageLimit +1;
		
		endPage = startPage + pageLimit - 1;
		
		if(endPage>maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount,currentPage,pageLimit,boardLimit,maxPage,startPage,endPage);
		
		ArrayList<Course> blist = new MemberService().selectbcosList(pi,memberno);
		
		request.setAttribute("blist", blist);
		request.setAttribute("pi", pi);

		request.getRequestDispatcher("views/mypage/mypageboardlist.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
