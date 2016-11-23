package com.hub.domain;

import java.sql.Date;

public class Post {
	private int postId;
	private String senderId;
	private String receiverId;
	private Date transDT;
	private String content;

	public Post() {
	}

	public int getPostId() {
		return postId;
	}

	public void setPostId(int postId) {
		this.postId = postId;
	}

	public String getSenderId() {
		return senderId;
	}

	public void setSenderId(String senderId) {
		this.senderId = senderId;
	}

	public String getReceiverId() {
		return receiverId;
	}

	public void setReceiverId(String receiverId) {
		this.receiverId = receiverId;
	}

	public Date getTransDT() {
		return transDT;
	}

	public void setTransDT(Date transDT) {
		this.transDT = transDT;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
