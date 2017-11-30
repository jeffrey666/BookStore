package cn.tarena.book.pojo;

import java.util.Date;

public class VerifyEmail {

	private String verifyEmailId;
	private String userId;
	private String email;
	private Integer isVerified;
	private Date createTime;
	private Date verifiedTime;

	public VerifyEmail(String verifyEmailId, String userId,
			String email, Integer isVerified, Date createTime,
			Date verifiedTime) {
		super();
		this.verifyEmailId = verifyEmailId;
		this.userId = userId;
		this.email = email;
		this.isVerified = isVerified;
		this.createTime = createTime;
		this.verifiedTime = verifiedTime;
	}

	public VerifyEmail() {
		super();
	}

	public String getVerifyEmailId() {
		return verifyEmailId;
	}
	public void setVerifyEmailId(String verifyEmailId) {
		this.verifyEmailId = verifyEmailId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getIsVerified() {
		return isVerified;
	}

	public void setIsVerified(Integer isVerified) {
		this.isVerified = isVerified;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getVerifiedTime() {
		return verifiedTime;
	}

	public void setVerifiedTime(Date verifiedTime) {
		this.verifiedTime = verifiedTime;
	}

	@Override
	public String toString() {
		return "VerifyEmail [verifyEmailId=" + verifyEmailId
				+ ", userId=" + userId + ", email=" + email
				+ ", isVerified=" + isVerified + ", createTime="
				+ createTime + ", verifiedTime=" + verifiedTime
				+ "]";
	}

}
