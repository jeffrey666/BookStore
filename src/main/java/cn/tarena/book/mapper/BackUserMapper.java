package cn.tarena.book.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import cn.tarena.book.pojo.Module;
import cn.tarena.book.pojo.Role;
import cn.tarena.book.pojo.User;
import cn.tarena.book.pojo.UserInfo;

public interface BackUserMapper {
	/**
	 * 后台:查询所有用户
	 * @return
	 */
	public List<User> findBackAllUser();
	/**
	 * 后台:改变用户状态
	 * @param i   状态
	 * @param ids 用户id
	 */
	public void changeState(@Param("state")int i, @Param("ids")String[] ids);
	/**
	 * 后台:删除用户
	 * @param ids
	 */
	public void delete(String[] ids);
	/**
	 * 后台:删除用户详情
	 * @param ids
	 */
	public void deleteUserInfo(String[] ids);
	/**
	 * 后台:新增用户(员工)
	 */
	public void save(User user);
	/**
	 * 后台:新增用户详情
	 * @param userInfo
	 */
	public void saveUserInfo(UserInfo userInfo);
	/**
	 * 后台:查询某个用户
	 * @param id
	 * @return
	 */
	public User findOne(String id);
	/**
	 * 后台:修改用户信息
	 * @param user
	 */
	public void update(User user);
	/**
	 * 后台:修改用户详情
	 * @param userInfo
	 */
	public void updateUserInfo(UserInfo userInfo);
	/**
	 * 后台:查看用户信息
	 * @param id
	 */
	public User findOneUser(String id);
	

	/**
	 * 后台:查看所有角色
	 * @return
	 */
	@Select("select * from role_p")
	public List<Role> findAllRole();
	/**
	 * 后台:删除角色
	 * @param ids
	 */
	public void roledelete(String[] ids);
	/**
	 * 后台:新增角色
	 * @param role
	 */
	@Insert("insert into role_p (role_id,name,remarks,order_no,create_time) values (#{roleId},#{name},#{remarks},#{orderNo},#{createTime})")
	public void rolesave(Role role);
	/**
	 * 后台:查询角色
	 * @param roleId
	 * @return
	 */
	@Select("select * from role_p where role_id=#{roleId}")
	public Role findRoleOne(String roleId);
	/**
	 * 后台:修改角色
	 * @param role
	 */
	@Update("update role_p set name=#{name},remarks=#{remarks},order_no=#{orderNo} where role_id=#{roleId}")
	public void roleupdate(Role role);
	
	
	/**
	 * 后台:查询所有模块
	 * @return
	 */
	public List<Module> findModuleAll();
	/**
	 * 后台:新增模块
	 * @param module
	 */
	@Insert("insert into module_p (module_id,name,parent_id,ctype,state,remark,order_no) values (#{moduleId},#{name},#{parentModule.moduleId},#{ctype},#{state},#{remark},#{orderNo})")
	public void modulesave(Module module);
	/**
	 * 后台:删除模块
	 * @param moduleIds
	 */
	public void moduledelete(String[] moduleIds);
	/**
	 * 后台:修改模块状态
	 * @param i
	 * @param moduleIds
	 */
	public void modulechangeState(@Param("state")int i, @Param("moduleIds")String[] moduleIds);
	/**
	 * 后台:查询某个模块
	 * @param moduleId
	 * @return
	 */
	public Module findModuleOne(String moduleId);
	/**
	 * 后台:保存模块的修改
	 * @param module
	 */
	@Update("update module_p set name=#{name},parent_id=#{parentModule.moduleId},ctype=#{ctype},state=#{state},remark=#{remark},order_no=#{orderNo} where module_id=#{moduleId}")
	public void moduleupdate(Module module);
	/**
	 * 后台：查询用户所对应的角色
	 * @param id
	 * @return
	 */
	@Select("select role_id from role_user_p where user_id=#{id}")
	public List<Role> findRolesByUid(String id);
	/**
	 * 后台:删除所有的角色
	 * @param id
	 */
	@Delete("delete from role_user_p where user_id=#{id}")
	public void deleteRoles(String id);
	/**
	 * 保存用户的角色
	 * @param id
	 * @param roleIds
	 */
	public void saveUserAndRole(String id, String[] roleIds);
	/**
	 * 查询角色对应的模块
	 * @param roleId
	 * @return
	 */
	@Select("select module_id from role_module_p where role_id=#{roleId}")
	public List<String> findModuleByRoleId(String roleId);
	/**
	 * 后台:删除模块
	 * @param roleId
	 */
	@Delete("delete from role_module_p where role_id=#{roleId}")
	public void deleteModules(String roleId);
	
	public void saveRoleModule(@Param("roleId")String roleId, @Param("moduleIds")String[] moduleIds);
	/**
	 * 删除用户对应的角色
	 * @param ids
	 */
	public void deleteRoleByUserIds(String[] ids);
	/**
	 * 删除用户和角色的关联关系
	 * @param ids
	 */
	public void deleteUserRole(String[] ids);
	/**
	 * 删除角色和模块的关系
	 * @param ids
	 */
	
	public void deleteRoleModules(String[] ids);
	/**
	 * 删除模块和角色的关系
	 * @param moduleIds
	 */
	public void deleteModuleRole(String[] moduleIds);
	

}
