package com.hub.domain;

import java.sql.Date;
import java.util.List;

public class Group {
	private int groupId;
	private String groupName;
	private String managerId;
	private Date lastDay;
	private List<String> connChains;
	private String introduce;
	private String local;
	private List<User> joinPeople;
	private int maxPeople;

	public Group() {
	}

	public int getGroupId() {
		return groupId;
	}

	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public String getManagerId() {
		return managerId;
	}

	public void setManagerId(String managerId) {
		this.managerId = managerId;
	}

	public Date getLastDay() {
		return lastDay;
	}

	public void setLastDay(Date lastDay) {
		this.lastDay = lastDay;
	}

	public List<String> getConnChains() {
		return connChains;
	}

	public void setConnChains(List<String> connChains) {
		this.connChains = connChains;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public String getLocal() {
		return local;
	}

	public void setLocal(String local) {
		this.local = local;
	}

	public List<User> getJoinPeople() {
		return joinPeople;
	}

	public void setJoinPeople(List<User> joinPeople) {
		this.joinPeople = joinPeople;
	}

	public int getMaxPeople() {
		return maxPeople;
	}

	public void setMaxPeople(int maxPeople) {
		this.maxPeople = maxPeople;
	}
}
