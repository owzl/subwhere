package com.kh.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.stream.events.Comment;

import com.kh.board.model.service.ReviewService;
import com.kh.common.model.vo.Comments;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class AjaxReviewReplyDeleteController
 */
@WebServlet("/rdelete.re")
public class AjaxReviewReplyDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxReviewReplyDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int commentNo = Integer.parseInt(request.getParameter("commentNo"));
		int boardNo = Integer.parseInt(request.getParameter("bno"));
		int userNo = ((Member)request.getSession().getAttribute("loginMember")).getMemberNo();
						   // request.getSession().getAttribute("loginMember") : Object형. 따라서 형변환 필요
						   // session에 던져놔서 controller에서도 불러다 사용 가능한것임!
		
		Comments c = new Comments();
		c.setCommentNo(commentNo);
		c.setBoardNo(boardNo + ""); // vo에서 String형으로 설정해뒀음
		c.setMemberNo(userNo);
		
		int result = new ReviewService().deleteReply(c);
		
		// 응답데이터
		response.getWriter().print(result); //success:function(result)
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
