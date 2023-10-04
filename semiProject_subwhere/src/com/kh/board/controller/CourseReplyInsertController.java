package com.kh.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.board.model.service.CourseService;
import com.kh.common.model.vo.Comments;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class CourseReplyInsertController
 */
@WebServlet("/insertReply.co")
public class CourseReplyInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CourseReplyInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		request.setCharacterEncoding("UTF-8");
		
		int cno = Integer.parseInt(request.getParameter("cno"));
		String content = request.getParameter("content");
		int userNo= ((Member) request.getSession().getAttribute("loginMember")).getMemberNo() ;
		//int userNo = Integer.parseInt(request.getParameter("user"));
		

		
		
		
		
		Comments com = new Comments();
		
		com.setBoardNo(String.valueOf(cno));
		com.setCommentContent(content);
		com.setMemberNo(userNo);
		
		
		
		
		int result = new CourseService().insertCourseReply(com);
		
		
		// result는 숫자를 반환하기 때문에 인코딩할 필요없다고 함 
		response.getWriter().print(result);
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
