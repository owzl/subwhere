package com.kh.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.board.model.service.ReviewService;
import com.kh.board.model.vo.Review;
import com.kh.board.model.vo.Uploadfile;
import com.kh.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class ReviewInsertController
 */
@WebServlet("/insert.re")
public class ReviewInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ReviewInsertController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		if (ServletFileUpload.isMultipartContent(request)) { // if(enctype="multipart/form-data" 잘썼다면,) 전체가 if문 속

			int maxSize = 10 * 1024 * 1024;

			String savePath = request.getSession().getServletContext().getRealPath("resources/review_upfiles/");

			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());

			// 넘어온 첨부파일 정보(name키값)들고 INSERT하러 기기!!

			// 1. REVIEW에 INSERT할것들
			Review r = new Review();
			r.setBoardWriter(multiRequest.getParameter("userNo"));		 // hidden으로 가져옴
			r.setStationNo(multiRequest.getParameter("SJ-stationName")); // (전 화면) name="SJ-stationName"인 select의 value값이 넘어오니까 => 101 용산역?
			r.setTitle(multiRequest.getParameter("title"));
			r.setAddress(multiRequest.getParameter("address"));
			r.setContent(multiRequest.getParameter("content"));
			r.setTip(multiRequest.getParameter("tip"));

			// 2. UPLOADFILE에 INSERT할것들
			ArrayList<Uploadfile> list = new ArrayList<Uploadfile>();

			for (int i=1; i<=4; i++) { // 1 2 3 4

				String key = "file" + i;

				if (multiRequest.getOriginalFileName(key) != null) { // name="file1 2 3 4" / 첨부한 파일이 있으면 원본명뱉거나, 없으면 null뱉거나
					// 객채생성 <= 원본명, 수정명, 폴더경로, 파일레벨 담아서.. list에 추가
					Uploadfile up = new Uploadfile();
					up.setOriginName(multiRequest.getOriginalFileName(key));
					up.setChangeName(multiRequest.getFilesystemName(key));
					up.setFilePath("resources/review_upfiles");
					// * 파일레벨
					if (i == 1) { // 대표이미지(1) 일 경우 => FileLevel : 1
						up.setFileLevel(1);
					} else { // 상세이미지(2,3,4) 일 경우 => FileLevel : 2
						up.setFileLevel(2);
					}

					list.add(up);
					// 내가 올린 첨부파일 수 만큼 for문 돌면서 list에 추가됨
				}
			}
			
			// *** for문 밖에서!!
			int result = new ReviewService().insertReview(r, list);
			
			if (result > 0) {
				
				HttpSession session = request.getSession();
				session.setAttribute("alertMsg", "성공적으로 게시글 등록이 되었습니다."); 
				
				response.sendRedirect(request.getContextPath()+"/list.re?cpage=1"); /* 기억해!! */
			
			} else {
				request.setAttribute("errorMsg", "사진게시판 등록에 실패했습니다.");
				RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
				view.forward(request, response);
			}
			
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
