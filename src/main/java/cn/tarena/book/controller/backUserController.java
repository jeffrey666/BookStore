package cn.tarena.book.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.tarena.book.pojo.User;
import cn.tarena.book.service.UserService;


@Controller
public class backUserController  extends BaseController{
	
    @Autowired
	private UserService userService;
    /**
     * 后台:查询所有用户
     * @param model
     * @return
     */
	@RequestMapping("/findAllUser.action")
	public String findAll(Model model){
		List<User> userList=userService.findBackAllUser();
		model.addAttribute("userList", userList);
		
		return "/backmanager/user/bUserList";
	}
	
	/**
	 * 后台:修改用户状态
	 * @param ids
	 * @param model
	 * @return
	 */
	@RequestMapping("/start")
	public String stopStation(@RequestParam(value="id",required=false)String[] ids,Model model){
		
		  userService.changeState(1,ids);
		 return "redirect:/findAllUser.action";
	}
	/**
	 * 后台:修改用户状态
	 * @param ids
	 * @param model
	 * @return
	 */
	@RequestMapping("/stop")
	public String startStation(@RequestParam(value="id",required=false)String[] ids,Model model){
		
		  userService.changeState(0,ids);
		  return "redirect:/findAllUser.action";
	}
	
	/**
	 * 删除用户
	 * @param ids
	 * @return
	 */
	@RequestMapping("backdelete")
	public String delete(@RequestParam(value="id")String [] ids){
		if(ids!=null){
			System.out.println("1111");
			userService.delete(ids);
		}
		
		return "redirect:/findAllUser.action";
	}
	
	/**
	 * 新增用户
	 * @param model
	 * @return
	 */
	@RequestMapping("/tocreate")
	public String tocreate(Model model){
		List<User> userList=userService.findBackAllUser();
		model.addAttribute("userList", userList);
		return "/backmanager/user/bUserCreate";
	   
   }
	
	
	
	
	
	/*@RequestMapping("/tosave")
	public String tosave(User user){
		  userService.save(user);
		
		return "redirect:/sysadmin/user/list";
	}*/
	
}
