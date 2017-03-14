package com.spring.coffee.admin.service;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.coffee.admin.dao.AdminDao;
import com.spring.coffee.event.dto.EventDto;
import com.spring.coffee.users.dto.UsersDto;

@Component
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao adminDao;
	
	@Override
	public boolean suspended(UsersDto dto, boolean isChecked) {
		
		if(isChecked) {
			dto.setSuspended(1);
			adminDao.suspended(dto);
		} else {
			dto.setSuspended(0);
			adminDao.suspended(dto);
		}
		
		return false;
	}
	
	@Override
	public boolean endEvent(EventDto dto, boolean isChecked) {
		
		if(isChecked) {
			dto.setEnd_event("1");
			adminDao.endEvent(dto);
		} else {
			dto.setEnd_event("0");
			adminDao.endEvent(dto);
		}
		return false;
	}

	@Override
	public void eventUpdate(HttpServletRequest request, EventDto dto) {
		// 파일을 저장할 폴더의 절대 경로를 얻어온다.
		String realPath = request.getSession().getServletContext().getRealPath("/upload");
		// MultipartFile 객체의 참조값 얻어오기
		MultipartFile mFile = dto.getFile();
		// 전송된 파일이 있는지 확인해보고
		if(!mFile.isEmpty()) { // 새로 입력 받은 파일이 있을 경우
			ServletContext application = request.getServletContext();
			// 삭제할 파일 이름을 불러온다.
			String saveFileName = adminDao.getEventData(dto.getNum()).getImg_name();
			// 삭제할 파일의 실제 경로를 얻어온다.
			String path = application.getRealPath("/upload") + File.separator+saveFileName;
			// 파일객체 생성해서 삭제한다. 
			new File(path).delete();
			// 원본 파일명
			String orgFileName = mFile.getOriginalFilename();
			// 저장할 파일의 상세 경로
			String filePath = realPath + File.separator;
			// 디렉토리를 만들 파일 객체 생성
			File file = new File(filePath);
			if(!file.exists()){ // 디렉토리가 존재하지 않는다면
				file.mkdir(); // 디렉토리를 만든다.
			}
			
			// 파일 시스템에 저장할 파일명을 만든다. (겹치치 않게)
			String imgName = System.currentTimeMillis() + orgFileName;
			try {
				// upload 폴더에 파일을 저장한다.
				mFile.transferTo(new File(filePath + imgName));
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			// AdminDto 객체에 추가 정보를 담는다.
			dto.setImg_name(imgName);
		}

		// AdminDao 객체를 이용해서 DB 에 저장하기
		adminDao.eventUpdate(dto);
	}

	@Override
	public ModelAndView getEventList() {
		List<EventDto> list = adminDao.getEventList();
		ModelAndView mView = new ModelAndView();
		mView.addObject("list", list);
		return mView;
	}

	@Override
	public ModelAndView getEventData(int num) {
		EventDto dto = adminDao.getEventData(num);
		ModelAndView mView = new ModelAndView();
		mView.addObject("dto", dto);
		return mView;
	}

	
}
