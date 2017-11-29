package cn.tarena.book.service;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tarena.book.mapper.BackUserMapper;
import cn.tarena.book.pojo.Module;
import cn.tarena.book.pojo.Role;
import cn.tarena.book.pojo.User;
import cn.tarena.book.pojo.UserInfo;

@Service
public class BackUserServiceImpl  implements BackUserService{

	@Autowired
	private BackUserMapper backUserMapper;
	/**
	 * 查询所有用户
	 */
	@Override
	public List<User> findBackAllUser() {
		
		return backUserMapper.findBackAllUser();
	}
	/**
	 * 修改用户状态
	 */
	@Override
	public void changeState(int i, String[] ids) {
	           backUserMapper.changeState(i,ids);
		
	}
	/**
	 * 删除用户
	 */
	@Override
	public void delete(String[] ids) {
       backUserMapper.delete(ids);
		
//		删除用户信息表
       backUserMapper.deleteUserInfo(ids);
		
		//删除用户和角色的关系
       backUserMapper.deleteRoleByUserIds(ids);
       backUserMapper.delete(ids);
		
	}
	/**
	 * 新增用户
	 */
	@Override
	public void save(User user) {
		String id=UUID.randomUUID().toString();
		user.setId(id);
		backUserMapper.save(user);
		
		UserInfo userInfo=user.getUserInfo();
		userInfo.setUserInfoId(id);
		backUserMapper.saveUserInfo(userInfo);
		
	}
	/**
	 * 查询某个用户
	 */
	@Override
	public User findOne(String id) {
		
		return backUserMapper.findOne(id);
	}
	/**
	 * 后台:保存对用户的修改
	 */
	@Override
	public void update(User user) {
		backUserMapper.update(user);
		user.getUserInfo().setUserInfoId(user.getId());
		backUserMapper.updateUserInfo(user.getUserInfo());
		
	}
	/**
	 * 后台:查看用户的信息
	 */
	@Override
	public User findOneUser(String id) {
		return backUserMapper.findOneUser(id);
		
	}
	
	/**
	 * 后台:查看所有的角色
	 */
	@Override
	public List<Role> findAllRole() {
		
		return backUserMapper.findAllRole();
	}
	/**
	 * 后台：删除所有角色
	 */
	@Override
	public void roledelete(String[] ids) {
		
		//删除和用户的关联关系
		backUserMapper.deleteUserRole(ids);
				
		//删除和模块的关系
		backUserMapper.deleteRoleModules(ids);
		backUserMapper.roledelete(ids);
				
				
		
	}
	/**
	 * 后台:新增角色
	 */
	@Override
	public void rolesave(Role role) {
		backUserMapper.rolesave(role);
		
	}
	/**
	 * 后台:查询角色
	 */
	@Override
	public Role findRoleOne(String roleId) {
		return backUserMapper.findRoleOne(roleId);
	}
	/**
	 * 后台:修改角色
	 */
	@Override
	public void roleupdate(Role role) {

		backUserMapper.roleupdate(role);
	}
	
	
	
	/**
	 * 后台:查询所有的模块
	 */
	@Override
	public List<Module> findModuleAll() {
		
		return backUserMapper.findModuleAll();
	}
	/**
	 * 后台:新增模块
	 */
	@Override
	public void modulesave(Module module) {
		backUserMapper.modulesave(module);
		
	}
	/**
	 * 后台:删除模块
	 */
	@Override
	public void moduledelete(String[] moduleIds) {
		
           backUserMapper.deleteModuleRole(moduleIds);
           backUserMapper.moduledelete(moduleIds);
		
		
		
	}
	/**
	 * 后台:修改模块状态
	 */
	@Override
	public void modulechangeState(int i, String[] moduleIds) {
		backUserMapper.modulechangeState(i,moduleIds);
		
	}
	/**
	 * 后台:查询某个模块
	 */
	@Override
	public Module findModuleOne(String moduleId) {
		
		return backUserMapper.findModuleOne(moduleId);
	}
	/**
	 * 后台:保存模块的修改
	 */
	@Override
	public void moduleupdate(Module module) {
		backUserMapper.moduleupdate(module);
		
	}
	/**
	 * 后台：查看用户所对应的角色
	 */
	@Override
	public List<Role> findRolesByUid(String id) {
		
		return backUserMapper.findRolesByUid(id);
	}
	@Override
	public void saveUserAndRole(String id, String[] roleIds) {
				backUserMapper.deleteRoles(id);
				// 只有传递过来roleId的值的时候才做保存操作
				if (roleIds.length>0) {
					backUserMapper.saveUserAndRole(id,roleIds);

				}
		
	}
	@Override
	public List<String> findModulesByRoleId(String roleId) {
		
		return backUserMapper.findModuleByRoleId(roleId);
	}
	@Override
	public void saveRoleModule(String roleId, String[] moduleIds) {
		        //删除之前的关联关系
				backUserMapper.deleteModules(roleId);
				//判断只有当有模块时才保存 不然的话会报错
				if (moduleIds.length>0) {
					backUserMapper.saveRoleModule(roleId,moduleIds);
				}
		
	}

}
