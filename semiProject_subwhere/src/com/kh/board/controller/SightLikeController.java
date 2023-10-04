package com.kh.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.service.SightService;
import com.kh.board.model.vo.Liked;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class SightLikeController
 */
@WebServlet("/like.si")
public class SightLikeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SightLikeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//아이디, boardNo받고 liked에 해당되는 데이터가 있는지 확인
		//있으면-> 이미 찜해둔거 찜 해제를 위해서 delete
		//없으면-> 찜안해둔거 찜을 위해서 insert
		
		int result = 0;
		
		int boardNo = Integer.parseInt(request.getParameter("bno"));
		int memberId= ((Member)request.getSession().getAttribute("loginMember")).getMemberNo();
		
		int likeResult = new SightService().checkLike(boardNo, memberId);//찜했는지 안했는지확인
		//result = new SightService().insertLike(boardNo, memberId);
		
		
		if(likeResult == 0) {//안했으면 찜하기
			result = new SightService().insertLike(boardNo, memberId);
		}else {//했으면 지우기
			
			result = new SightService().deleteLike(boardNo, memberId);
			
		}
		
		response.getWriter().print(likeResult);
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
