package com.spring.coffee.event.dto;

import org.springframework.web.multipart.MultipartFile;

public class EventDto {
	private int num;
	private String title;
	private String img_name;
	private String event_date;
	private String event_url;
	private String end_event;
	private MultipartFile file;
	
	public EventDto(){}

	public EventDto(int num, String title, String img_name, String event_date, String event_url, String end_event,
			MultipartFile file) {
		super();
		this.num = num;
		this.title = title;
		this.img_name = img_name;
		this.event_date = event_date;
		this.event_url = event_url;
		this.end_event = end_event;
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

	public String getImg_name() {
		return img_name;
	}

	public void setImg_name(String img_name) {
		this.img_name = img_name;
	}

	public String getEvent_date() {
		return event_date;
	}

	public void setEvent_date(String event_date) {
		this.event_date = event_date;
	}

	public String getEvent_url() {
		return event_url;
	}

	public void setEvent_url(String event_url) {
		this.event_url = event_url;
	}

	public String getEnd_event() {
		return end_event;
	}

	public void setEnd_event(String end_event) {
		this.end_event = end_event;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

}
