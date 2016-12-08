package com.hub.domain;

import java.util.List;

public class Bucketlist {
	private int bucketlistId;
	private String title;
	private List<String> connChains;
	private String goal;
	private int star;
	private String memo;
	private String sos;
	private boolean lock;
	private String userId;
	
	private int progress;

	public int getProgress() {
		return progress;
	}

	public void setProgress(int progress) {
		this.progress = progress;
	}

	public Bucketlist() {
	}

	public int getBucketlistId() {
		return bucketlistId;
	}

	public void setBucketlistId(int bucketlistId) {
		this.bucketlistId = bucketlistId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public List<String> getConnChains() {
		return connChains;
	}

	public void setConnChains(List<String> connChains) {
		this.connChains = connChains;
	}

	public String getGoal() {
		return goal;
	}

	public void setGoal(String goal) {
		this.goal = goal;
	}

	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getSos() {
		return sos;
	}

	public void setSos(String sos) {
		this.sos = sos;
	}

	public boolean getLock() {
		return lock;
	}

	public void setLock(boolean lock) {
		this.lock = lock;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	

}
