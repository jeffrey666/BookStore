package cn.tarena.book.mapper;

import java.util.Date;

import org.apache.ibatis.annotations.Param;

import cn.tarena.book.pojo.VerifyEmail;

public interface VerifyEmailMapper {

	public abstract void addRecord(
			@Param("verify_email_id") String emailValidateId,
			@Param("user_id") String user_id,
			@Param("new_email") String new_email);

	public abstract void verifyEmail(
			@Param("verify_email_id") String verify_email_id,
			@Param("update_time") Date update_time);

	public abstract VerifyEmail findPojoByVerifyEmailId(
			String verify_email_id);

}
