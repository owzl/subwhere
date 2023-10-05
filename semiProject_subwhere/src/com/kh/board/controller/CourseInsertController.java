package com.kh.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.board.model.service.CourseService;
import com.kh.board.model.vo.Course;
import com.kh.board.model.vo.Uploadfile;

import com.kh.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class CourseInsertController
 */
@WebServlet("/insert.co")
public class CourseInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CourseInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			
			int maxSize = 10*1024*1024;
			
			String savePath = request.getSession().getServletContext().getRealPath("resources/board_upfiles/");
			
			
			// new MultipartRequest(request,savePath,용량제한,인코딩, 이름변경객체)
			MultipartRequest multiRequest = new MultipartRequest(request, savePath,maxSize,"UTF-8", new MyFileRenamePolicy());
			
			
			
			Course c = new Course();
			
			c.setMemberNo(multiRequest.getParameter("userNo"));
			c.setCourseTitle(multiRequest.getParameter("courseTitle"));
			c.setStationNo(multiRequest.getParameter("UJ-stationName"));
			c.setDtn1(multiRequest.getParameter("DTN_1"));
			c.setDtn2(multiRequest.getParameter("DTN_2"));
			c.setDtn3(multiRequest.getParameter("DTN_3"));
			c.setDtn4(multiRequest.getParameter("DTN_4"));
			c.setCourseContent(multiRequest.getParameter("courseContent"));
			c.setCourseTip(multiRequest.getParameter("courseTip"));
			
			
			
			// 사진을 첨부할 때 여러개라 arraylist에 담아감 
			ArrayList<Uploadfile> list = new ArrayList<Uploadfile>();
			
			
			
			
			for(int i=1; i<=4; i++) {
				
				String key = "file" + i;
				
				if(multiRequest.getOriginalFileName(key) != null) {
					
					Uploadfile upf = new Uploadfile();
					
					upf.setOriginName(multiRequest.getOriginalFileName(key));
					upf.setChangeName(multiRequest.getFilesystemName(key));
					upf.setFilePath("resources/board_upfiles");
					
					if(i==1) {
						upf.setFileLevel(1);
					}else {
						upf.setFileLevel(2);
					}
					
					
					
					
					
				 list.add(upf);	
					
				}
				
				
				
			} // for문 끝 
			
			
			int result = new CourseService().insertCourse(c, list);
			
			
			
			
			HttpSession session =  request.getSession();
			
			if(result > 0 ) {
				// 성공했을 경우 
				// 여행 목록 리스트로 가기 -> url 재요청하기 
				// 이건 loginmember 세션이 생겼을 때 작성자 userNo도 제대로 넘겨서 다시 하기 
				
				session.setAttribute("alertMsg", "성공적으로 여행 코스를 등록했습니다.");
				response.sendRedirect(request.getContextPath() + "/list.co?cpage=1" );
				
				
			}else {
				// 여행 코스 작성을 실패했을 경우 
				// 실패했다는 메시지만 뜨게하고 아무 주소로 쏘지 않기 
				session.setAttribute("alertMsg", "여행 코스 등록을 실패했습니다.");
				response.sendRedirect(request.getContextPath() );
				
			}
			
			
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
