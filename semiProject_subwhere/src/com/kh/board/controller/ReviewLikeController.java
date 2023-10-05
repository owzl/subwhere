package com.kh.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.service.ReviewService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class ReviewLikeController
 */
@WebServlet("/like.re")
public class ReviewLikeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewLikeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		  //MemberNo, boardNo받고 기존 '좋아요' 여부 확인하러..
	      //(기존)있으면-> 이미 '좋아요' 한 것 해제 delete
	      //(기존)없으면->     '좋아요' insert     
	      
	      int boardNo = Integer.parseInt(request.getParameter("bno")); 								// jsp에서 받아온 key값
	      int MemberNo= ((Member)request.getSession().getAttribute("loginMember")).getMemberNo();	// session에 넣어뒀으니까
	      
	      int result = 0;
	      int likeResult = new ReviewService().checkLike(boardNo, MemberNo);	//기존 '좋아요' 여부 확인

	      if(likeResult == 0) {//(0)안했으면 '좋아요' 추가
	         result = new ReviewService().insertLike(boardNo, MemberNo);
	      }else {//(1)했으면 '좋아요' 삭제
	         result = new ReviewService().deleteLike(boardNo, MemberNo);   
	      }
	      
	      response.getWriter().print(likeResult); //success: function(result) | 사실 ajax에서 success에서 받을 때 변수명은 달라도 상관 없음
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
