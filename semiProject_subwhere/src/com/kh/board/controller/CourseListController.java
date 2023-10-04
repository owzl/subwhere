package com.kh.board.controller;


import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.board.model.service.CourseService;
import com.kh.board.model.vo.Course;
import com.kh.common.model.vo.PageInfo;


/**
 * Servlet implementation class CourseListController
 */
@WebServlet("/list.co")
public class CourseListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CourseListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 페이징 처리 가자!
		
		// 현재 페이지, 한번에 몇개의 게시물 보여줄지, 페이징바 몇개보여줄건지, 총 페이지 수 
		
		
		
		
		int currentPage = Integer.parseInt(request.getParameter("cpage"));
		
		
		
		
		int boardLimit = 5;
		int pageLimit = 5;
		
		// 여행 코스의 총 게시글 개수를 알아옴 
		
		int listCount = new CourseService().courseAllCount();
		
		
		// 페이징바 시작 수, 페이징 바 최대 개수, 페이징 바 마지막 수
		int startPage ;
		int maxPage;
		int endPage;
		
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
	    maxPage = (int)Math.ceil((double)listCount / boardLimit);
	    endPage = startPage + pageLimit - 1;
	    
	    if(endPage > maxPage) {
	    	endPage = maxPage;
	    }
	    
	    PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
	    
	    
		ArrayList<Course> list = new CourseService().selectCourseList(pi);
		
		
		String kind = request.getParameter("kind");
		

		
		
		
		// 여행 코스 추천 버튼을 누른 후 호선 버튼을 클릭했을 경우는 kind가 null이 아님
		if(kind != null ) {
			response.setContentType("application/json; charset=utf-8");
			new Gson().toJson(list,response.getWriter());
			
			
			
		}else {   // 헤더에서 '여행코스추천' 버튼을 눌렀을 경우에는 kind가 null임!
			request.setAttribute("pi", pi);
			request.setAttribute("list", list);
		
			
			
		   request.getRequestDispatcher("views/course/courseListForm.jsp").forward(request, response);
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
