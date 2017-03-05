package com.spring.coffee.comment.dto;

public class CommentDto {
	private int num;
	private String writer;
	private String content;
	private String target_id; //덧글의 대상이 되는 아이디
	private int ref_group; //덧글의 그룹
	private int comment_group; //덧글 내에서의 그룹
	private int deleteContent;
	private String regdate;
	
	private boolean myCommnet; // 자신이 쓴 덧글인지 확인
	
	public CommentDto(){}

	public CommentDto(int num, String writer, String content, String target_id, int ref_group, int comment_group,
			int deleteContent, String regdate, boolean myCommnet) {
		super();
		this.num = num;
		this.writer = writer;
		this.content = content;
		this.target_id = target_id;
		this.ref_group = ref_group;
		this.comment_group = comment_group;
		this.deleteContent = deleteContent;
		this.regdate = regdate;
		this.myCommnet = myCommnet;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTarget_id() {
		return target_id;
	}

	public void setTarget_id(String target_id) {
		this.target_id = target_id;
	}

	public int getRef_group() {
		return ref_group;
	}

	public void setRef_group(int ref_group) {
		this.ref_group = ref_group;
	}

	public int getComment_group() {
		return comment_group;
	}

	public void setComment_group(int comment_group) {
		this.comment_group = comment_group;
	}

	public int getDeleteContent() {
		return deleteContent;
	}

	public void setDeleteContent(int deleteContent) {
		this.deleteContent = deleteContent;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public boolean isMyCommnet() {
		return myCommnet;
	}

	public void setMyCommnet(boolean myCommnet) {
		this.myCommnet = myCommnet;
	}

}
