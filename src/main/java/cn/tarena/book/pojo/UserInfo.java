package cn.tarena.book.pojo;

import java.util.Date;

public class UserInfo {

	private String userInfoId;
	private String nickname;
	private String email;
	private String address;
	private String cardNo;
	private Integer score;
	private String telephone;
	private String gender;
	private Date birthday;
	private String userLevel;

	public UserInfo(String userInfoId, String nickname,
			String email, String address, String cardNo,
			Integer score, String telephone, String gender,
			Date birthday,String userLevel) {
		super();
		this.userInfoId = userInfoId;
		this.nickname = nickname;
		this.email = email;
		this.address = address;
		this.cardNo = cardNo;
		this.score = score;
		this.telephone = telephone;
		this.gender = gender;
		this.birthday=birthday;
		this.userLevel=userLevel;
	}

	public UserInfo() {
		super();
	}



	public String getUserInfoId() {
		return userInfoId;
	}

	public void setUserInfoId(String userInfoId) {
		this.userInfoId = userInfoId;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCardNo() {
		return cardNo;
	}

	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}

	public Integer getScore() {
		return score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	
	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	
	public String getUserLevel() {
		return userLevel;
	}

	public void setUserLevel(String userLevel) {
		this.userLevel = userLevel;
	}

	@Override
	public String toString() {
		return "UserInfo [userInfoId=" + userInfoId + ", nickname=" + nickname + ", email=" + email + ", address="
				+ address + ", cardNo=" + cardNo + ", score=" + score + ", telephone=" + telephone + ", gender="
				+ gender + ", birthday=" + birthday + ", userLevel=" + userLevel + "]";
	}

	

	

	
}
