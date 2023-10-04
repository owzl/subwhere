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
import com.kh.board.model.vo.Uploadfile;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class ReviewDetailController
 */
@WebServlet("/detail.re")
public class ReviewDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int boardNo = Integer.parseInt(request.getParameter("bno"));	// 전 화면(reviewListView.jsp)에서 hidden으로 bno 키값으로 이것의 값(2018) 변수에 저장
		
		
		// * 조회수 증가
		int countResult = new ReviewService().increaseCount(boardNo);
		
		if(countResult > 0) { // 성공(조회수 올라갔다는 것) == 유효한 게시글
			
			// 게시글 조회 (글)
			Review r = new ReviewService().selectReview(boardNo);
			
			// 게시글 조회 (사진)
			ArrayList<Uploadfile> list = new ReviewService().selectUploadfileList(boardNo);
			
			// 올려두고, 보내
			request.setAttribute("r", r);
			request.setAttribute("list", list);
			
	
			
			// ---------------------------------------------------------------------
			// * 좋아요
			// * 신고
			
			int userNo = 0;
			
			if(request.getSession().getAttribute("loginMember") != null) {
				
				// session에 넣어두면 controller, jsp 에서 모두 쓸 수 있음
				// session접근해서 loginMember불러와.MemberNo얻어와서 userNo변수에 담고 set!
				userNo = ((Member)request.getSession().getAttribute("loginMember")).getMemberNo();
	            request.setAttribute("userNo", userNo);
	            
	            // 좋아요
	            int likeResult = new ReviewService().checkLike(boardNo, userNo);
	            request.setAttribute("likeResult", likeResult);
	            // 신고
	            int reportResult = new ReviewService().checkReport(boardNo, userNo);
	            request.setAttribute("reportResult", reportResult);
			}
			
		
			request.getRequestDispatcher("views/review/reviewDetailView.jsp").forward(request, response);
			
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
