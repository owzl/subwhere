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
 * Servlet implementation class CourseListSelectLineListController
 */
@WebServlet("/selectline.co")
public class CourseListSelectLineListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CourseListSelectLineListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		   
	      int line = Integer.parseInt(request.getParameter("line"));
	      

	      int currentPage = Integer.parseInt(request.getParameter("cpage"));
	      
	      int boardLimit = 5;
	      int pageLimit = 5;
	      
	      // 여행 코스의 총 게시글 개수를 알아옴 
	      
	      int listCount = new CourseService().courseAllCount();
	      
	      
	      // 페이징바 시작 수, 페이징 바 최대 개수, 페이징 바 마지막 수
	      int startPage ;
	      int maxPage;
	      int endPage;
	      
	      startPage = ((currentPage - 1) / pageLimit) * pageLimit + 1;
	       maxPage = (int)Math.ceil((double)listCount / boardLimit);
	       endPage = startPage + pageLimit - 1;
	       
	       if(endPage > maxPage) {
	          endPage = maxPage;
	       }
	       
	       PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
	       
	       
	   
	      
	      
	      ArrayList<Course> list = new CourseService().selectLineList(line, pi);
	      
	      
	      System.out.println(list);
	      
	      
	      response.setContentType("application/json; charset=utf-8");
	      new Gson().toJson(list,response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
