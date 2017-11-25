package cn.tarena.book.pojo;

public class User {
	private String id;
	private String username;
	private String password;
	private Integer state;

	public User(String id, String username, String password,
			Integer state) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.state = state;
	}

	public User() {
		super();
	}



	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", state=" + state + "]";
	}



}
