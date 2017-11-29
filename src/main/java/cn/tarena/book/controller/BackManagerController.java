package cn.tarena.book.controller;



import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import cn.tarena.book.pojo.Module;
import cn.tarena.book.pojo.Role;
import cn.tarena.book.pojo.User;
import cn.tarena.book.service.BackUserService;


@Controller
public class BackManagerController extends BaseController{

	@Autowired
	private BackUserService backUserService;
	@RequestMapping("backmanager")
	public String back(){
		return "manage";
		
	}
	/**
	 * 后台:查询所有用户
	 * @param model
	 * @return
	 */
	@RequestMapping("backfindAllUser.action")
	public String backto(Model model){
		List<User> user=backUserService.findBackAllUser();
		model.addAttribute("userList", user);
		return "backmanager/user/bUserList";
		
	}
	/**
	 * 后台:改变用户状态
	 * @param ids  用户的id
	 * @param model 
	 * @return
	 */
	@RequestMapping("/start")
	public String stopStation(@RequestParam(value="id",required=false)String[] ids,Model model){
		
		backUserService.changeState(1,ids);
		 return "redirect:backfindAllUser.action";
	}
	@RequestMapping("/stop")
	public String startStation(@RequestParam(value="id",required=false)String[] ids,Model model){
		
		backUserService.changeState(0,ids);
		 return "redirect:backfindAllUser.action";
	}
	/**
	 * 删除用户
	 * @param ids
	 * @return
	 */
	@RequestMapping("/backdelete")
	public String delete(@RequestParam(value="id")String [] ids){
		if(ids!=null){
			backUserService.delete(ids);
		}
		
		return "redirect:backfindAllUser.action";
	}
	/**
	 * 新增用户
	 * @param model
	 * @return
	 */
	@RequestMapping("/backtocreate")
	public String tocreate(Model model){
		List<User> userList=backUserService.findBackAllUser();
		model.addAttribute("userList", userList);
		
		return "backmanager/user/bUserCreate";
	   
   }
	/**
	 * 保存用户
	 * @param user
	 * @return
	 */
	@RequestMapping("/backtosave")
	public String tosave(User user){
		  backUserService.save(user);
		
		return "redirect:backfindAllUser.action";
	}
	
	/**
	 * 后台:查询某个用户返回修改用户页面
	 * @param userId
	 * @param model
	 * @return
	 */
	@RequestMapping("/backtoupdate")
	public String toupdate(String id,Model model){
		if(id!=null){
		  User user=backUserService.findOne(id);
		  model.addAttribute("user", user);
		  return "backmanager/user/bUserUpdate";
		}
		
		return "redirect:backfindAllUser.action";
	}
	/**
	 * 后台:保存对用户的修改
	 * @param user
	 * @return
	 */
	@RequestMapping("/update")
	public String update(User user){
		backUserService.update(user);
		
		return "redirect:backfindAllUser.action";
	}
	
	/**
	 * 查看用户
	 * @param id
	 * @return
	 */
	@RequestMapping("/backtoview")
	public String backView(String id){
		if(id!=null){
			User user=backUserService.findOneUser(id);
			return "backmanager/user/bUserView";
		}
		return "redirect:backfindAllUser.action";
	}
	
	
	
	@RequestMapping("/role")
	public String toRole(String id,Model model) throws JsonProcessingException{
		if(id!=null){
			//获取用户所对应的所有角色
			List<Role>userroles=backUserService.findRolesByUid(id);
			//获取所有的角色
			List<Role>roles=backUserService.findAllRole();
			//遍历匹配
			for (Role role : roles) {
				if(userroles.contains(role.getId())){
					role.setChecked(true);
				}
				
			}
			ObjectMapper mapper=new ObjectMapper();
			String rolesString=mapper.writeValueAsString(roles);
			model.addAttribute("zTreeJson", rolesString);
			model.addAttribute("id", id);
			
			return "backmanager/user/bUserRole";
		}
		return "redirect:backfindAllUser.action";
		
		
	}
	/**
	 * 后台:查看用户的所有角色
	 * @param userId
	 * @param roleIds
	 * @param model
	 * @return
	 */
	@RequestMapping("/saveUserRole")
	public String saveUserRole(String id,@RequestParam(required=false) String[] roleIds,Model model) throws JsonProcessingException{
		
		if (roleIds!=null) {
			//把用户和角色的关系保存到中间关系表中
			backUserService.saveUserAndRole(id,roleIds);
			
		}
		
		return "redirect:backfindAllUser.action";
	}
	
	
	
	/*角色=========================*/
	
	
	
	
	/**
	 * 后台:查看所有的角色
	 * @param model
	 * @return
	 */
	@RequestMapping("/backfindAllRole.action")
	public String List(Model model){
		List<Role> roles=backUserService.findAllRole();
		model.addAttribute("roles", roles);
		return "backmanager/role/bRoleList";
		
	}
	@RequestMapping("/roledelete")
	public String roledelete(@RequestParam(value="roleId",required=false)String []ids,Model model){
		if(ids!=null){
			backUserService.roledelete(ids);
		}
		return "redirect:backfindAllRole.action";
	}
	@RequestMapping("/roletocreate")
	public String tocreate(){
		
		return "backmanager/role/bRoleCreate";
	}
	@RequestMapping("roletosave")
	public String tosave(Role role){
		if(role!=null){
			role.setRoleId(UUID.randomUUID().toString());
			backUserService.rolesave(role);
		}
	
		return "redirect:backfindAllRole.action";
	}
	@RequestMapping("/roletoupdate")
	public String roletoUpdate(String roleId,Model model){
		if(roleId!=null){
		Role role=backUserService.findRoleOne(roleId);
		model.addAttribute("roles", role);
		return "backmanager/role/bRoleUpdate";
		}
		return "redirect:backfindAllRole.action";
		
	}
	@RequestMapping("roleupdate")
	public String roleupdate(Role role){
		backUserService.roleupdate(role);
		
		return "redirect:backfindAllRole.action";
	}
	@RequestMapping("/roletoview")
	public String roletoview(String roleId,Model model){
		if(roleId!=null){
			Role role=backUserService.findRoleOne(roleId);
			model.addAttribute("roles",role );
			return "backmanager/role/bRoleView";
		}
		return "redirect:backfindAllRole.action";
	}
	
	
	
	
	
	
	
	
	
	//backfindAllModule.action
	
	
	@RequestMapping("/backfindAllModule.action")
	public String list(Model model){
		List<Module>modules=backUserService.findModuleAll();
		model.addAttribute("modules", modules);
	   return "backmanager/module/bModuleList";
	}
	
	@RequestMapping("/modulestop")
	public String stopStation(@RequestParam(value="moduleId",required=false)String [] moduleIds){
		if(moduleIds!=null){
		backUserService.changeState(0,moduleIds);
		}
		return "redirect:backfindAllModule.action";
		
	}
	@RequestMapping("/modulestart")
	public String startStation(@RequestParam(value="moduleId",required=false)String [] moduleIds){
		if(moduleIds!=null){
		backUserService.modulechangeState(1,moduleIds);
		}
		return "redirect:/backfindAllModule.action";
		
	}
	@RequestMapping("/moduledelete")
	public String moduledelete(@RequestParam(value="moduleId",required=false)String [] moduleIds){
		if(moduleIds!=null){
		backUserService.moduledelete(moduleIds);
		}
		 return "redirect:/backfindAllModule.action";
	}
	@RequestMapping("/moduletocreate")
	public String moduletocreate(Model model){
		List<Module>modules=backUserService.findModuleAll();
		model.addAttribute("modules", modules);
		return "backmanager/module/bModuleCreate";
	}
	@RequestMapping("/moduletosave")
	public String modulesave(Module module){
		module.setModuleId(UUID.randomUUID().toString());
		backUserService.modulesave(module);
		return "redirect:/backfindAllModule.action";
	}

	@RequestMapping("/moduletoupdate")
	public String moduletoUpdate(String moduleId,Model model){
		Module module=backUserService.findModuleOne(moduleId);
		model.addAttribute("module", module);
		
		List<Module> modules=backUserService.findModuleAll();
		model.addAttribute("modules", modules);
		return "backmanager/module/bModuleUpdate";
	}
	@RequestMapping("/moduleupdate")
	public String moduleupdate(Module module){
		backUserService.moduleupdate(module);
		return "redirect:/backfindAllModule.action";
	}
	@RequestMapping("moduletoview")
	public String tmoduleoview(String moduleId,Model model){
		Module module=backUserService.findModuleOne(moduleId);
		model.addAttribute("module", module);
		return "backmanager/module/bModuleView";
	}
	
	@RequestMapping("/roletomodule")
	public String toModule(String roleId, Model model) throws JsonProcessingException{
		if(roleId!=null){
		//查询所有的模块信息
		List<Module> modules = backUserService.findModuleAll();
		
		//查询当前角色所对应的所有的模块
		List<String> roleModules = backUserService.findModulesByRoleId(roleId);
		
		//遍历所有的模块
		for (Module module : modules) {
			//判断角色拥有的模块id是否包含当前遍历的模块 如果包含则让
			if (roleModules.contains(module.getModuleId())) {
				module.setChecked(true);
			}
		}
		
//		给页面传递 zTree格式的json字符串
		ObjectMapper mapper = new ObjectMapper();
		
		String zTreeJson = mapper.writeValueAsString(modules);
		
		model.addAttribute("zTreeJson",zTreeJson);
		
		model.addAttribute("id",roleId);
		
		return "backmanager/role/bRoleModule";
	}
		return "redirect:backfindAllRole.action";
}
	
	
	@RequestMapping("/saveRoleModule")
	public String saveRoleModule(String roleId,String[] moduleIds){
		
		backUserService.saveRoleModule(roleId,moduleIds);
		
		return "redirect:backfindAllRole.action";
	}
	
}
