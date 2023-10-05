package com.kh.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.service.ReviewService;
import com.kh.board.model.vo.Review;
import com.kh.common.model.vo.PageInfo;

/**
 * Servlet implementation class ReviewListFormController
 */
@WebServlet("/list.re")
public class ReviewListFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewListFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// *** 페이징바 ***
		int listCount;		// 현재 총 게시글 갯수
		int currentPage;	// 현재 페이지 (즉, 사용자가 요청한 페이지)
		int pageLimit;		// 현재 페이지 하단에 보여질 '페이징바의 페이지 최대 갯수' (몇개 단위씩 할지)
		int boardLimit;		// 한 페이지 내에 보여질 '게시글 최대 갯수' (몇개 단위씩 할지)
		// 위의 4개를 가지고, 아래 3개의 값을 구해낼 것임
		int maxPage;		// 가장 마지막 페이지 (총 페이지 수)
		int startPage;		// 페이징바의 시작 수
		int endPage;		// 페이징바의 끝 수
		
		
		// * listCount : 총 게시글 갯수 //(구해와야함)
		listCount = new ReviewService().selectListCount();
		// * currentPage : 현재 페이지 (즉, 사용자가 요청한 페이지) //(처음)cpage=1 | 주소창에서1을2로바꾸면?? currentPage==2
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		// * pageLimit : 페이징바의 페이지 최대 갯수(내가정함)
		pageLimit = 5; 
		// * boardLimit : 게시글 최대 갯수(내가정함)
		boardLimit = 8;
		// * maxPage : 제일 마지막 페이지 수 (총 페이지 수)
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		// * startPage : 페이징바의 시작 수
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		// * endPage : 페이징바의 끝 수
		endPage = startPage + pageLimit - 1;
		// startPage가 11이면 endPage는 20임 (근데 maxPage가 고작 13밖에 안되면? endPage는 20이 아닌 13이 되어야 함)
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		// com.kh.common.model.vo.pageInfo
		// * 페이징바를 만들 때 필요한 'PageInfo' 객체 생성
		//   vo에 'PageInfo' 만들어주기 (src안에)
		//   db로 들고가기위해 모아요
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		
		// --------------------------------------------------------------------------------
		
		
		// reviewListView.jsp 상에 필요한 데이터 조회해서 가야됨
		// 리스트 담아서 가야함
		// (나중에 추가할 예정)
				
		// 자 이제 리스트 조회하러 가보쟝구 (with pagingbar)
		ArrayList<Review> list = new ReviewService().selectReviewList(pi);
		
		request.setAttribute("pi", pi);
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/review/reviewListView.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
