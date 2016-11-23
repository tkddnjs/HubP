package com.hub.domain;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

public class Cooper {
	private int coId;
	private String coName;
	private String coBanner;
	private Date startDay;
	private Date lastDay;
	private List<String> connChains;

	public Cooper() {
	}

	public int getCoId() {
		return coId;
	}

	public void setCoId(int coId) {
		this.coId = coId;
	}

	public String getCoName() {
		return coName;
	}

	public void setCoName(String coName) {
		this.coName = coName;
	}

	public String getCoBanner() {
		return coBanner;
	}

	public void setCoBanner(String coBanner) {
		this.coBanner = coBanner;
	}

	public Date getStartDay() {
		return startDay;
	}

	public void setStartDay(Date startDay) {
		this.startDay = startDay;
	}

	public Date getLastDay() {
		return lastDay;
	}

	public void setLastDay(String lastDay) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyymmdd");
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
}
