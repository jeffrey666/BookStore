package cn.tarena.jieshu.pojo;

public class User {
	private Integer id;
	private String name;
	private String password;
	private Integer state;

	public User(Integer id, String name, String password,
			Integer state) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
		this.state = state;
	}

	public User() {
		super();
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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
		return "User [id=" + id + ", name=" + name
				+ ", password=" + password + ", state=" + state
				+ "]";
	}

}
