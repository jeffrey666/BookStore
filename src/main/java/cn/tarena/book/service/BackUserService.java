package cn.tarena.book.service;

import java.util.List;

import cn.tarena.book.pojo.Module;
import cn.tarena.book.pojo.Role;
import cn.tarena.book.pojo.User;

public interface BackUserService {

	/**
	 * 后台:查询所有用户
	 * @return
	 */
	public  List<User> findBackAllUser();
	
	/**
	 * 后台:修改用户状态
	 * @param i
	 * @param ids
	 */
	public void changeState(int i, String[] ids);
	
	/**
	 * 后台:删除用户
	 * @param ids 用户id
	 */
	public void delete(String[] ids);
	
	/**
	 * 后台:新增用户
	 * @param user
	 */
	public void save(User user);
	
	/**
	 * 后台:查询某个用户
	 * @param id
	 * @return
	 */
	public User findOne(String id);
	
	/**
	 * 后台:保存对用户的修改
	 * @param user
	 */
	public void update(User user);
	
	/**
	 * 后台:查看用户的信息
	 * @param id
	 */
	public User findOneUser(String id);

	/**
	 * 后台:查看所有角色
	 * @return
	 */
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
	public void rolesave(Role role);

	/**
	 * 后台:查询角色
	 */
	public Role findRoleOne(String roleId);

	/**
	 * 后台:修改角色
	 * @param role
	 */
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
	public void modulechangeState(int i, String[] moduleIds);

	/**
	 * 后台:修改某个模块
	 * @param moduleId
	 * @return
	 */
	public Module findModuleOne(String moduleId);

	/**
	 * 后台:保存模块的修改
	 * @param module
	 */
	public void moduleupdate(Module module);

	/**
	 * 后台:查看用户所对应角色
	 * @param id
	 * @return
	 */
	public List<Role> findRolesByUid(String id);

	/**
	 * 保存用户保存的角色
	 * @param id
	 * @param roleIds
	 */
	public void saveUserAndRole(String id, String[] roleIds);

	/**
	 * 后台:获取角色对应的模块
	 * @param roleId
	 * @return
	 */
	public List<String> findModulesByRoleId(String roleId);

	/**
	 * 后台：保存角色与模块的关系
	 * @param roleId
	 * @param moduleIds
	 */
	public void saveRoleModule(String roleId, String[] moduleIds);
	
	
	
	
	

}
