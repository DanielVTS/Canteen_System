package cn.lingnan.controller;

import cn.lingnan.pojo.Customer;
import cn.lingnan.services.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/customer")
public class LoginController {

    private CustomerService customerService;
    @Autowired
    public void setCustomerService(CustomerService customerService) {
        this.customerService = customerService;
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(String email, String password, Model model, HttpSession session){

        System.out.println("login:::name:::" + email + ", password" + password);
        Customer bean = customerService.loginByEmail(email, password);

        if (bean != null) {
            //登录成功
            //session保存
            session.setAttribute("loginUser", bean);
            System.out.println("登陆成功");
            return "success";

            //记住密码，使用Cookie

        }else {
            //登录失败
            model.addAttribute("msg", "用户名或密码错误");
            System.out.println("登陆失败");
            //return "forward:login.jsp";//http://localhost:8080/ssm-02/user/login.jsp
            return "forward:../login.jsp";
        }
//        return "index";
    }


}
