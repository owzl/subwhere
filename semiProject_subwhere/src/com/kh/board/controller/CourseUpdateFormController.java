package com.kh.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.service.CourseService;
import com.kh.board.model.vo.Course;
import com.kh.board.model.vo.Uploadfile;



/**
 * Servlet implementation class CourseUpdateFormController
 */
@WebServlet("/updateForm.co")
public class CourseUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CourseUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		// 해당 게시글의 정보를 조회해서 가져가기 
		// station, course, uploadfile 조회하기
		// selectCourseDetail -> 역과 작성한 글 정보가 모두 담겨있음 
		// selectCourseFile -> 첨부한 파일에 대한 정보 담겨있음 
		// 재활용하자 
		
		int cno = Integer.parseInt(request.getParameter("cno"));
		
		
		// station, course에 대한 모든 조회함
		Course c = new CourseService().selectCourseDetail(cno);
		
		// 첨부파일 조회하자
		// 사진은 여러개라 arraylist에 담기!
		ArrayList<Uploadfile> list = new CourseService().selectCourseFile(cno);
		
		
		request.setAttribute("c", c);
		request.setAttribute("list", list);
		
		
		
		request.getRequestDispatcher("views/course/courseUpdateForm.jsp").forward(request, response);
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
