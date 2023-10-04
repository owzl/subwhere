package com.kh.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.service.ReviewService;
import com.kh.common.model.vo.Comments;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class AjaxReviewReplyInsertController
 */
@WebServlet("/rinsert.re")
public class AjaxReviewReplyInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxReviewReplyInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String replyContent = request.getParameter("content");
		int boardNo = Integer.parseInt(request.getParameter("bno"));
		int userNo = ((Member)request.getSession().getAttribute("loginMember")).getMemberNo();
						   // request.getSession().getAttribute("loginMember") : Object형. 따라서 형변환 필요
		
		Comments c = new Comments(); // 기본생성자
		c.setCommentContent(replyContent);
		c.setBoardNo(boardNo + "");		 // vo에서 String형으로 설정해뒀음
		c.setMemberNo(userNo);
		
		int result = new ReviewService().insertReply(c);
		
		//응답데이터
		response.getWriter().print(result);  //success:function(result)
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
