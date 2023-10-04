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

import com.kh.board.model.service.SightService;
import com.kh.board.model.vo.Sight;
import com.kh.board.model.vo.Station;
import com.kh.board.model.vo.Uploadfile;
import com.kh.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class SightInsertController
 */
@WebServlet("/insert.si")
public class SightInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SightInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10 * 1024 * 1024;
			String savePath = request.getSession().getServletContext().getRealPath("/resources/images/");
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
		
			
			
			
			
			
			Sight s = new Sight();
			s.setBoardWriter(Integer.parseInt(multiRequest.getParameter("userNo")));
			s.setTitle(multiRequest.getParameter("writeTitle"));
			s.setStationNo(Integer.parseInt(multiRequest.getParameter("stationName")));
			s.setContent(multiRequest.getParameter("ir1"));
			s.setDtnName(multiRequest.getParameter("dtn"));
			s.setAddress(multiRequest.getParameter("address"));
			s.setHashtag(multiRequest.getParameter("tag"));
			s.setHoliday(multiRequest.getParameter("holiday"));
			s.setRuntime(multiRequest.getParameter("time"));
			s.setTransport(multiRequest.getParameter("transportation"));
			int listSize = Integer.parseInt(multiRequest.getParameter("imgLength"));
			
			
			
			
			
			ArrayList<Uploadfile> list = new ArrayList<Uploadfile>();
			
			
			for(int i = 0; i<listSize; i++) {
				String key = "images["+i+"]";
				if(multiRequest.getOriginalFileName(key) != null) {
					Uploadfile uf = new Uploadfile();
					uf.setOriginName(multiRequest.getOriginalFileName(key));
					uf.setChangeName(multiRequest.getFilesystemName(key));
					uf.setFilePath("resources/images");
					if(i==0) {
						uf.setFileLevel(1);
					}else {
						uf.setFileLevel(2);
					}
					list.add(uf); // --------
				}
			}
			
			
			
			
			int result = new SightService().insertSightBoard(s,list);
			
			if(result>0) {
				request.getSession().setAttribute("alertMsg", "성공적으로 게시글 등록했습니다.");
				response.sendRedirect(request.getContextPath()+"/list.si?cpage=1");
				
			}else {
				request.setAttribute("errorMsg", "게시판 등록에 실패했습니다.");
				RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
				view.forward(request, response);
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
