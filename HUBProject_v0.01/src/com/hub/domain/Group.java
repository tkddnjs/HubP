package com.hub.domain;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class Group {
	private int groupId;
	private String groupName;
	private String managerId;
	private Date lastDay;
	private List<String> connChains;
	private String introduce;
	private String local;
	private List<String> joinPeople;
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

	public void setLastDay(String lastDay) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date lDay = null;
		try {
			lDay = new Date(dateFormat.parse(lastDay).getTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		this.lastDay = lDay;
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

	public List<String> getJoinPeople() {	
		return joinPeople;
	}

	public void setJoinPeople(List<String> joinPeople) {	
		this.joinPeople = joinPeople;
	}

	public int getMaxPeople() {
		return maxPeople;
	}

	public void setMaxPeople(int maxPeople) {
		this.maxPeople = maxPeople;
	}

	@Override
	public String toString() {
		return "[groupId=" + groupId + ", groupName=" + groupName + ", managerId=" + managerId + ", lastDay="
				+ lastDay + ", connChains=" + connChains + ", introduce=" + introduce + ", local=" + local
				+ ", joinPeople=" + joinPeople + ", maxPeople=" + maxPeople + "]";
	}
	
	
}
