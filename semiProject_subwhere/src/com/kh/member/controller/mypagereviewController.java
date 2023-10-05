package com.kh.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.model.vo.Comments;
import com.kh.common.model.vo.PageInfo;
import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class mypagereviewController
 */
@WebServlet("/myrlist.me")
public class mypagereviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mypagereviewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * 댓글 조회=> 여행 후기 게시판용
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		
		//--페이징 처리 
		int rlistCount;//현재 총 여행 후기 게시판 댓글 개수
		int currentPage;//현재 페이지(즉, 사용자가 요청한 페이지)
		int pageLimit; //페이징 바 버튼이 한번에 보여질 개수
		int boardLimit;//한페이지에서 사용자가 볼 수 있는 최대 게시글 개수
		
		int maxPage;//가장 마지막 페이지(총 페이지 수)
		int startPage;//페이징바의 시작 수
		int endPage;//페이징 바의 끝수
		int memberno =Integer.parseInt(request.getParameter("memno"));
		
		//총 후기 게시글 댓글 수 => db에서 조회해서 갖고 와야 하는 정보
		rlistCount =new MemberService().selectcReviewListCount(memberno);
		
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		
		//페이징바의 개수
		pageLimit = 5;
		
		//한번에 볼 수 있는 게시물 개수
		boardLimit = 4;
		
		//제일 마지막 페이지수
		maxPage = (int)Math.ceil((double)rlistCount / boardLimit);
		
		//페이징 바 시작 수
		startPage = (currentPage-1)/pageLimit*pageLimit+1;
		
		//페이징바의 끝 수
		endPage = startPage + pageLimit -1;
		
		//마지막 페이지리스트에 게시글이 꼭 안찾을 경우
		if(endPage > maxPage) {
			endPage=maxPage;
		}

		PageInfo pi = new PageInfo(rlistCount,currentPage,pageLimit,boardLimit,maxPage,startPage,endPage);
		//페이징에 필요한 정보
		
		ArrayList<Comments> list = new MemberService().selectRreviewList(memberno,pi);
		
		request.setAttribute("pi", pi); //페이징 바 변경을 위해 가져가야 함
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("views/mypage/mypagereviewlist.jsp").forward(request, response);
		
		
		
		//페이징 안했을 경우
		//마이페이지 => 회원 번호로 조회
//		int memberno =Integer.parseInt(request.getParameter("memno"));
//		
//		ArrayList<Comments> list = new MemberService().selectRreviewList(memberno);
//		

//		
//		request.setAttribute("list", list);
//		request.getRequestDispatcher("views/mypage/mypagereviewlist.jsp").forward(request, response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
