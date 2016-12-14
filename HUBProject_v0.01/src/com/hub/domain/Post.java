package com.hub.domain;

import java.sql.Timestamp;


public class Post {
	private int postId;
	private String senderId;
	private String receiverId;
	private Timestamp sendTime;
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

	public Timestamp getSendTime() {
		return sendTime;
	}

	public void setSendTime(Timestamp sendTime) {
//		String time = "1351504294";
//		long t = Long.parseLong(time);
//		sendTime = new Timestamp(t*1000);
//		String date = new SimpleDateFormat("YYYY-MM-dd hh:mm:ss").format(sendTime);
		this.sendTime = sendTime;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
