package com.kh.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.board.model.service.ReviewService;
import com.kh.board.model.vo.Review;
import com.kh.board.model.vo.Station;
import com.kh.board.model.vo.Uploadfile;
import com.kh.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class ReviewUpdateController
 */
@WebServlet("/update.re")
public class ReviewUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		if(ServletFileUpload.isMultipartContent(request)) { // 실제로 enctype="multipart/form-data" 가 맞는지 확인
			
			// 1_1. 전송용량제한
			int maxSize = 10 * 1024 * 1024;
			
			// 2_2. 저장시킬 폴더의 물리적인 경로
			// application == request.getSession().getServletContext()
			String savePath = request.getSession().getServletContext().getRealPath("/resources/review_upfiles/"); // '/' 
			
			// 2. 전달된 파일 업로드 == 이 한줄로 thumbnail_upfiles 폴더에 (originName => changeName)이름변경된채로 저장됨
			// MultipartRequest multiRequest = new MultipartRequest(request, 저장경로, 용량제한, 인코딩, 이름변경객체);
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "utf-8", new MyFileRenamePolicy());
			
			// 3. db에 기록할 값 뽑기(뽑기 == 전 화면에서 값 받기) ***
			// 호선, 역명 | 제목, 주소, 내용, 꿀팁 // 첨부파일(대표1, 상세3)
			// 3_1. Review Insert (Review 객체에 받은 값 셋팅)
		
			
			
			// * 역 관련 update
//			int stationNo = Integer.parseInt(multiRequest.getParameter("stationNo"));
//			String stationName = multiRequest.getParameter("SJ-stationName");
//			int line = 0;
//			
//			if(!multiRequest.getParameter("SJ-stationLine").equals("호선 번호 선택")) {
//				line = Integer.parseInt(multiRequest.getParameter("SJ-stationLine"));				
//			}
//			
//		
//			
//			Station s = new Station();
//			s.setStationNo(stationNo);
//			s.setStationName(stationName);
//			s.setLine(line);
			
			
			
			// * 글 관련 update
			String boardNo = multiRequest.getParameter("bno");  // *** 전 화면에서 hidden으로 가져온것. 우리는 BoardNo이 String형임
			String stationNo = multiRequest.getParameter("SJ-stationName");
			String title = multiRequest.getParameter("title");
			String address = multiRequest.getParameter("address");
			String content = multiRequest.getParameter("content");
			String tip = multiRequest.getParameter("tip");
			
			Review r = new Review();
			r.setBoardNo(boardNo); 
			r.setStationNo(stationNo);
			r.setTitle(title);
			r.setAddress(address);
			r.setContent(content);
			r.setTip(tip);

			
			
			// * 첨부파일 관련 update
			ArrayList<Uploadfile> list = new ArrayList<Uploadfile>();

			for (int i=1; i<=4; i++) { // 1 2 3 4

				String key = "file" + i;

				if (multiRequest.getOriginalFileName(key) != null) { // name="file1 2 3 4" / 첨부한 파일이 있으면 원본명뱉거나, 없으면 null뱉거나
					// 객채생성 <= 원본명, 수정명, 폴더경로, 파일레벨, 파일번호 담아서.. list에 추가
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
					
					// * 파일번호
					//if(multiRequest.getParameter("fileNo" + i) != null) {
					//}
					up.setFileNo(Integer.parseInt(multiRequest.getParameter("fileNo" + i)));						
									
					
					list.add(up);
					// 내가 올린 첨부파일 수 만큼 for문 돌면서 list에 추가됨
					
				}
			}
			
			
			
			// ----------------------------------------------------
			// 위 셋팅 다시 수정하고 일단 s,d만들어보자...;
			int result = new ReviewService().updateReview(r, list);
			
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "여행 후기 게시글이 성공적으로 수정되었습니다.");
				response.sendRedirect(request.getContextPath()+"/detail.re?bno="+boardNo);
			}else {
				request.setAttribute("errorMsg", "여행 후기 게시글 수정에 실패했습니다.");
				RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
				view.forward(request, response);
			}
	
			
		} // if끝
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
