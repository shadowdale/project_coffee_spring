package com.spring.coffee.board.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.coffee.board.dao.BoardDao;
import com.spring.coffee.board.dto.BoardDto;

@Component
public class BoardServiceImpl implements BoardService {
	//한 페이지에 나타낼 로우의 갯수
	private static final int PAGE_ROW_COUNT=6;
	
	//하단 디스플레이 페이지 갯수
	private static final int PAGE_DISPLAY_COUNT=5;
	
	@Autowired
	private BoardDao boardDao;
	
	@Override
	public ModelAndView getList(HttpServletRequest request, int pageNum) {
		
		String keyword = request.getParameter("keyword");
		String condition = request.getParameter("condition");
		
		// boardDto 객체를 생성해서
		BoardDto dto = new BoardDto();
		if(keyword != null) { // 검색어가 전달된경우
			if(condition.equals("titlecontent")) { // 제목+내용 검색
				dto.setTitle(keyword);
				dto.setContent(keyword);
			} else if(condition.equals("title")) { // 제목 검색
				dto.setTitle(keyword);
			} else if(condition.equals("writer")) { // 작성자 검색
				dto.setWriter(keyword);
			}
			request.setAttribute("condition", condition);
			request.setAttribute("keyword", keyword);
		}

		
		// 보여줄 페이지의 번호가 파라미터로 전달되는지 읽어온다.
		String strPageNum = request.getParameter("pageNum");
		if(strPageNum != null) { //페이지 번호가 파라미터로 넘어온다면
			pageNum = Integer.parseInt(strPageNum);
		}
		//보여줄 페이지 데이터의 시작 ResultSet row 번호
		int startRowNum = 1 + (pageNum - 1) * PAGE_ROW_COUNT;
		
		//보여줄 페이지 데이터의 끝 ResultSet row 번호
		int endRowNum = pageNum * PAGE_ROW_COUNT;
		
		//전체 row 의 갯수를 DB 에서 얻어온다.
		int totalRow = boardDao.getCount(dto);
		
		//전체 페이지의 갯수 구하기
		int totalPageCount = (int)Math.ceil(totalRow / (double)PAGE_ROW_COUNT);
		
		//시작 페이지 번호
		int startPageNum = 1 + ((pageNum - 1) / PAGE_DISPLAY_COUNT) * PAGE_DISPLAY_COUNT;
		
		//끝 페이지 번호
		int endPageNum = startPageNum + PAGE_DISPLAY_COUNT - 1;
		
		//끝 페이지 번호가 잘못된 값이라면 
		if(totalPageCount < endPageNum){
			endPageNum = totalPageCount; //보정해준다. 
		}
		
		//시작 row 번호와 끝 row 번호를 CafeDto 에 담는다.
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		
		//Dao 객체를 이용해서 글목록을 얻어온다. 
		List<BoardDto> list = boardDao.getList(dto);
		
		//ModelAndView 객체를 생성해서 글목록을 담는다.
		ModelAndView mView = new ModelAndView();
		mView.addObject("list", list);
		mView.addObject("pageNum", pageNum);
		mView.addObject("startPageNum", startPageNum);
		mView.addObject("endPageNum", endPageNum);
		mView.addObject("totalPageCount", totalPageCount);
		
		return mView;
	}

	@Override
	public ModelAndView getData(HttpServletRequest request, int num) {
		// 세션에서 id를 읽어 온다.
		String id = (String)request.getSession().getAttribute("id");
		
		// 검색과 관련된 파라미터를 읽어와 본다.
		String keyword = request.getParameter("keyword");
		String condition = request.getParameter("condition");
		
		// boardDto 객체를 생성해서
		BoardDto dto = new BoardDto();
		if(keyword != null) { // 검색어가 전달된경우
			if(condition.equals("titlecontent")) { // 제목+내용 검색
				dto.setTitle(keyword);
				dto.setContent(keyword);
			} else if(condition.equals("title")) { // 제목 검색
				dto.setTitle(keyword);
			} else if(condition.equals("writer")) { // 작성자 검색
				dto.setWriter(keyword);
			}
			request.setAttribute("condition", condition);
			request.setAttribute("keyword", keyword);
		}
		
		dto.setNum(num);
		
		ModelAndView mView = new ModelAndView();
		
		BoardDto resultDto = boardDao.getData(dto);

		// List<CafeCommentDto> commentList = CafeCommentDao.getInstance().getList(num);
		
		// 자신이 쓴 글인지 확인
		boolean isWriter = false;
		if(id != null && id.equals(resultDto.getWriter())) {
			isWriter = true;				
		}
		
		mView.addObject("dto", resultDto);
		mView.addObject("isWriter", isWriter);
		// request.setAttribute("commentList", commentList);
		
		boardDao.getData(dto);
		
		return mView;
	}

	@Override
	public void insert(HttpServletRequest request, BoardDto dto) {
		// 파일을 저장할 폴더의 절대 경로를 얻어온다.
		String realPath = request.getSession().getServletContext().getRealPath("/upload");
		System.out.println(realPath);
		
		// MultipartFile 객체의 참조값 얻어오기
		MultipartFile mFile = dto.getFile();
		// 원본 파일명
		String orgFileName = mFile.getOriginalFilename();
		// 파일 사이즈
		// 저장할 파일의 상세 경로
		String filePath = realPath + File.separator;
		// 디렉토리를 만들 파일 객체 생성
		File file = new File(filePath);
		if(!file.exists()){ // 디렉토리가 존재하지 않는다면
			file.mkdir(); // 디렉토리를 만든다.
		}
		// 파일 시스템에 저장할 파일명을 만든다. (겹치치 않게)
		String imgAddr = System.currentTimeMillis() + orgFileName;
		try {
			// upload 폴더에 파일을 저장한다.
			mFile.transferTo(new File(filePath + imgAddr));
		} catch (Exception e) {
			e.printStackTrace();
		}
		// FileDto 객체에 추가 정보를 담는다.
		dto.setImgAddr(imgAddr);
		
		//임의의 작성자 추가//
		dto.setWriter("gura");
		

		// FileDao 객체를 이용해서 DB 에 저장하기
		boardDao.insert(dto);
		
	}

	@Override
	public void delete(HttpServletRequest request, BoardDto dto) {
		ServletContext application = request.getServletContext();
		
		// 삭제할 파일 이름을 불러온다.
		String saveFileName = boardDao.getData(dto).getImgAddr();
		
		boardDao.delete(dto.getNum());
		// CafeCommentDao.deleteRefgroup(num);
		
		String path = application.getRealPath("/upload") + File.separator+saveFileName;
		//파일객체 생성해서 삭제한다. 
		new File(path).delete();
		
	}

}
