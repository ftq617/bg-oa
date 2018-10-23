package cn.bluegod.controller;

import cn.bluegod.base.BgResult;
import cn.bluegod.base.PageResult;
import cn.bluegod.pojo.User;
import cn.bluegod.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @description:
 * @author: Mr.Fu
 * @create: 2018-09-28 15:45
 * @Version V1.0
 */
@Controller
public class UserController {

    private String thisToken;

    @Autowired
    private UserService userService;

    @RequestMapping("/user/login")
    public String login(User user, Model model, HttpSession session){
        BgResult result= userService.login(user);
        if (result.getStatus()==200){
            User us=(User)result.getData();
            session.setAttribute("USER",result.getData());
            if (us.getType()==8){
                return "redirect:/admin/index";
            }else if (us.getType()==1){
                return "redirect:/visitor/index";
            }else {
                return "redirect:/users/index";
            }
        }
        if (result.getStatus()==400){
            model.addAttribute("phone",result.getMsg());
        }else {
            model.addAttribute("password",result.getMsg());
        }
        return "login";
    }

    @RequestMapping(value = "/user/layout")
    public String layout(HttpSession session){
        session.removeAttribute("USER");
        return "login";
    }


    @RequestMapping("/user/register")
    public String register(@Validated User user, String token, Model model, BindingResult bindingResult){
        if (bindingResult.hasErrors()){
            List<ObjectError> list=bindingResult.getAllErrors();
            ObjectError error=list.get(0);
            model.addAttribute("msg",error.toString());
            return "register";
        }
        BgResult result;
        if (thisToken==null||!thisToken.equals(token)) {
            thisToken=token;
             result = userService.register(user);
             if (result.getStatus()==200){
                 return "login";
             }
             else {
                 model.addAttribute("msg",result.getMsg());
                 return "register";
             }
        }else {
           model.addAttribute("msg","请不要重复提交");
            return "register";
        }
    }

    @RequestMapping("/user/checkphone")
    @ResponseBody
    public BgResult check(String phone){
        BgResult result= userService.check(phone);
        return result;
    }

    /**
     * @Description: 获得个人信息
     * @Param:
     * @return:
     * @Author: Mr.Fu
     * @Date: 2018/10/10
     **/
    @RequestMapping("/getUserInfo")
    @ResponseBody
    public BgResult getUserInfo(HttpSession session){
        User user=(User)session.getAttribute("USER");
        return userService.getUserInfo(user.getId());
    }


    /**
     * @Description: 修改个人信息
     * @Param:
     * @return:
     * @Author: Mr.Fu
     * @Date: 2018/10/10
     **/
    @RequestMapping("/updateUserInfo")
    @ResponseBody
    public BgResult updateUserInfo(HttpSession session,User user){
        User us=(User)session.getAttribute("USER");
        user.setId(us.getId());
        return userService.updateUserByUser(user);
    }

    @RequestMapping("/users/user/list")
    @ResponseBody
    public PageResult<User> getUser(Integer depId,Integer jobId){
        return  userService.getUserListUser(depId,jobId);
    }

}
