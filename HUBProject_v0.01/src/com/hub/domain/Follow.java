package com.hub.domain;

public class Follow {
	private String userId;
	private String followId;
	private int relation;
	private boolean confirm;

	public Follow() {
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getFollowId() {
		return followId;
	}

	public void setFollowId(String friendId) {
		this.followId = friendId;
	}

	public int getRelation() {
		return relation;
	}

	public void setRelation(int relation) {
		this.relation = relation;
	}

	public boolean getConfirm() {
		return confirm;
	}

	public void setConfirm(boolean confirm) {
		this.confirm = confirm;
	}

	@Override
	public String toString() {
		return "(" + userId + "/" + followId + "/" + relation + "/" + confirm + ")";
	}
	
	

}
