package com.example.movie.model;

import java.util.Date;

public class User {
	private int id;
	private String username;
	private String email;
	private String password;
	private String avatarUrl;
	private String role;
	private boolean isPremium;
	private Date startPremium_date;
	private Date endPremium_date;

	public User() {
	}

	public User(int id, String username, String email, String password, String avatarUrl, String role, boolean isPremium, Date startPremium_date, Date endPremium_date) {
		this.id = id;
		this.username = username;
		this.email = email;
		this.password = password;
		this.avatarUrl = avatarUrl;
		this.role = role;
		this.isPremium = isPremium;
		this.startPremium_date = startPremium_date;
		this.endPremium_date = endPremium_date;
	}

	// --- GETTER & SETTER (Bạn nhớ Generate đủ nhé) ---
	public int getId() { return id; }
	public void setId(int id) { this.id = id; }

	public String getUsername() { return username; }
	public void setUsername(String username) { this.username = username; }

	public String getEmail() { return email; }
	public void setEmail(String email) { this.email = email; }

	public String getPassword() { return password; }
	public void setPassword(String password) { this.password = password; }

	public String getAvatarUrl() { return avatarUrl; }
	public void setAvatarUrl(String avatarUrl) { this.avatarUrl = avatarUrl; }

	public String getRole() { return role; }
	public void setRole(String role) { this.role = role; }

	public Date getStartPremium_date() {
		return startPremium_date;
	}

	public void setStartPremium_date(Date startPremium_date) {
		this.startPremium_date = startPremium_date;
	}

	public Date getEndPremium_date() {
		return endPremium_date;
	}

	public void setEndPremium_date(Date endPremium_date) {
		this.endPremium_date = endPremium_date;
	}

	public boolean isPremium() { return isPremium; }
	public void setPremium(boolean premium) { isPremium = premium; }

}

