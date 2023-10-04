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
import com.kh.board.model.vo.Uploadfile;
import com.kh.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class SightUpdateController
 */
@WebServlet("/update.si")
public class SightUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SightUpdateController() {
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
			s.setStationNo(Integer.parseInt(multiRequest.getParameter("stationNameNAME")));
			s.setContent(multiRequest.getParameter("ir1"));
			s.setDtnName(multiRequest.getParameter("dtn"));
			s.setAddress(multiRequest.getParameter("address"));
			s.setHashtag(multiRequest.getParameter("tag"));
			s.setHoliday(multiRequest.getParameter("holiday"));
			s.setRuntime(multiRequest.getParameter("time"));
			s.setTransport(multiRequest.getParameter("transportation"));
			
			int listSize = Integer.parseInt(multiRequest.getParameter("imgLength"));
			int uploadfileNum = Integer.parseInt(multiRequest.getParameter("uploadfileNum"));
			int originUploadfileNum = Integer.parseInt(multiRequest.getParameter("originUploadFileNum"));
			String bno = multiRequest.getParameter("bno");
			
			
			s.setBoardNo(bno);
			
			int changeResult = new SightService().changeUploadfileStatus(bno);
			
			int[] notNull = new int[uploadfileNum];
			int notNullCount = 0;
			int n = 0;
			
			ArrayList<Uploadfile> list = new ArrayList<Uploadfile>();
			
			
			for(int i =0; i<originUploadfileNum; i++) {
				if(multiRequest.getParameter("uploadFiles["+i+"]")!= null){
					notNull[notNullCount] = i; 
					notNullCount++;
				}
			}
			
			
			
			
			for(int i = 0; i<listSize+uploadfileNum; i++) {
				String key = null;
				
				
			
				
				
				
				if(i<uploadfileNum) {
					//int uploadfileNo = Integer.parseInt(multiRequest.getParameter("uploadNo["+i+"]"));
					
					
					
					
					
					
					 key = "upload["+notNull[n]+"]";
					
					 n++;
					 if(multiRequest.getParameter(key) != null) {
						 Uploadfile uf = new Uploadfile();
						 uf.setRefdBoardNo(bno);
						 uf.setOriginName(multiRequest.getParameter(key));
						 uf.setChangeName(multiRequest.getParameter(key));
						 uf.setFilePath("resources/images");
						 if(i==0) {
							 uf.setFileLevel(1);
						 }else {
							 uf.setFileLevel(2);
						 }
						 list.add(uf);
					 }
					 
				}else {
					 key = "images["+(i-uploadfileNum)+"]";
						if(multiRequest.getOriginalFileName(key) != null) {
							Uploadfile uf = new Uploadfile();
							uf.setRefdBoardNo(bno);
							uf.setOriginName(multiRequest.getOriginalFileName(key));
							uf.setChangeName(multiRequest.getFilesystemName(key));
							uf.setFilePath("resources/images");
							if(i==0) {
								uf.setFileLevel(1);
							}else {
								uf.setFileLevel(2);
							}
							list.add(uf);
						}
					 
				}
				
			
			}
			
			
			
			int result = new SightService().updateSightBoard(s, list);
		
			  if(result > 0) {
		            
		            request.getSession().setAttribute("alertMsg", "성공적으로 수정되었습니다.");
		            response.sendRedirect(request.getContextPath()+ "/read.si?bno=" + bno); 
		         } else {
		            // 실패
		            request.setAttribute("errorMsg", "일반게시판 수정에 실패했습니다.");
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
