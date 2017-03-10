package com.spring.coffee.event.dto;

import org.springframework.web.multipart.MultipartFile;

public class EventDto {
	private int num;
	private String title;
	private String imgName;
	private String eventDate;
	private String eventUrl;
	private String endEvent;
	private String regDate;
	private MultipartFile file;
	
	public EventDto(){}

	public EventDto(int num, String title, String imgName, String eventDate, String eventUrl, String endEvent,
			String regDate, MultipartFile file) {
		super();
		this.num = num;
		this.title = title;
		this.imgName = imgName;
		this.eventDate = eventDate;
		this.eventUrl = eventUrl;
		this.endEvent = endEvent;
		this.regDate = regDate;
		this.file = file;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getImgName() {
		return imgName;
	}

	public void setImgName(String imgName) {
		this.imgName = imgName;
	}

	public String getEventDate() {
		return eventDate;
	}

	public void setEventDate(String eventDate) {
		this.eventDate = eventDate;
	}

	public String getEventUrl() {
		return eventUrl;
	}

	public void setEventUrl(String eventUrl) {
		this.eventUrl = eventUrl;
	}

	public String getEndEvent() {
		return endEvent;
	}

	public void setEndEvent(String endEvent) {
		this.endEvent = endEvent;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

}
