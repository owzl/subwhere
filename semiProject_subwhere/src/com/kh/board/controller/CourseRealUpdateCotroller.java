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
 * Servlet implementation class CourseRealUpdateCotroller
 */
@WebServlet("/realUpdate.co")
public class CourseRealUpdateCotroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CourseRealUpdateCotroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		// post 인코딩 
		
		request.setCharacterEncoding("UTF-8");
		
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10* 1024 *1024;
			String savePath = request.getSession().getServletContext().getRealPath("/resources/board_upfiles/");
			
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath,maxSize,"UTF-8", new MyFileRenamePolicy());
			
			
			// int cno = Integer.parseInt(multiRequest.getParameter("cno"));
			
			
		
			
			
           Course c = new Course();
			
            c.setBoardNo(multiRequest.getParameter("cno"));
            
            c.setMemberNo(multiRequest.getParameter("userName"));
			c.setCourseTitle(multiRequest.getParameter("courseTitle"));
			c.setStationNo(multiRequest.getParameter("UJ-stationNo"));
			c.setDtn1(multiRequest.getParameter("DTN_1"));
			c.setDtn2(multiRequest.getParameter("DTN_2"));
			c.setDtn3(multiRequest.getParameter("DTN_3"));
			c.setDtn4(multiRequest.getParameter("DTN_4"));
			c.setCourseContent(multiRequest.getParameter("courseContent"));
			c.setCourseTip(multiRequest.getParameter("tip"));
			
			
			
			ArrayList<Uploadfile> list= new ArrayList<Uploadfile>();
			// 처음에는 null로 초기화하고 만약, 넘어온 첨부파일이 있을 경우 그때 생성할 예정 
			
			
			
			for(int i=1 ; i<=4; i++) {
				// 1 2 3 4 
				// 대표 사진부터 상세이미지까지 모두 가져가야 해서 for문 돌려서 list에 담기
				
				
				String key = "file" + i;
				
				
				
				if(multiRequest.getOriginalFileName(key) != null) {
					// 첨부파일이 존재할 때
					// 첨부파일이 있다면   uploadfile 객체 생성해서 원본명, 수정명, 폴더경로, 파일레벨을 담아서 
					//  list에 추가하기!
					
					Uploadfile upf = new Uploadfile();					

					upf.setOriginName(multiRequest.getOriginalFileName(key));
					// multiRequest.getOriginalFileName("upfile") 에 원본명이 들어있음 
					
					upf.setChangeName(multiRequest.getFilesystemName(key));
					// multiRequest.getFilesystemName("upfile") 에 수정명이 들어있음 
					
					upf.setFilePath("resources/board_upfiles");
					
					// 파일레벨은 대표사진인지 상세사진인지에 따라 달라짐 
					// 1은 대표이미지, 2는 상세사진 
					// file1 이면 대표이미지 
					// file2,3,4 면 상세사진
					
					if(i==1) {
						upf.setFileLevel(1);
					}else {
						upf.setFileLevel(2);
					}
					
					
				
					
					if (multiRequest.getParameter("dtn" + i + "_fileNo") != null) {
			
				        upf.setFileNo(Integer.parseInt(multiRequest.getParameter("dtn" + i + "_fileNo")));
					}else {
							// 원래 첨부파일이 없다가 수정할 때 추가하는 경우 
							// insertAttach하기 
							// 현재 refBno(현재 게시글 번호)
							
							upf.setRefdBoardNo((multiRequest.getParameter("cno")));
							
							
							
								
							
						}
					
				

					

				       list.add(upf);
					
				}
				
			
				
					
					
					
					
				}// for문 끝 
			
		
				
				
		
			
			
	
			
			
			// 이젠 update치러 가보장구 
			

			
			int result = new CourseService().updateCourse(c, list);
			
			
			
		
			
			HttpSession session = request.getSession();
			
			if(result>0) {
				// update성공하면 상세보기로 가기 
				session.setAttribute("alertMsg", "여행 코스 수정을 성공했습니다.");
			
				
//				
//			request.setAttribute("list", list);
//			request.setAttribute("c", c);
//			request.getRequestDispatcher("views/course/courseAfterUpdateForm.jsp").forward(request, response);
				
				
			}else {
				// 실패했을 경우 
				
				session.setAttribute("alertMsg", "여행 코스 수정을 실패했습니다");
				
				
				
			}
			
			response.sendRedirect(request.getContextPath() + "/detail.co?cno=" + multiRequest.getParameter("cno"));
			
			
			
		}	// if문 끝 
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
