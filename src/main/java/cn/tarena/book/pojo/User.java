package cn.tarena.book.pojo;

public class User {
	private String id;
	private String username;
	private String password;
	private Integer state;
	private String role;
	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	private UserInfo userInfo;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", state=" + state + ", role="
				+ role + ", userInfo=" + userInfo + "]";
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}


	public UserInfo getUserInfo() {
		return userInfo;

	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

}
