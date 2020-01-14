package cn.lingnan.controller;

import cn.lingnan.pojo.Customer;
import cn.lingnan.pojo.Staff;
import cn.lingnan.services.CustomerService;
import cn.lingnan.services.StaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.Date;
@Controller
public class LoginController {

    private StaffService staffService;
    private CustomerService customerService;
    @Autowired
    public void setCustomerService(CustomerService customerService) {
        this.customerService = customerService;
    }
    @Autowired
    public void setStaffService(StaffService staffService) {
        this.staffService = staffService;
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(String username, String password, Model model, HttpSession session) {
        if (username.equals("admin")) {
            System.out.println("login:::name:::" + username + ", password:" + password);
            Staff bean = new Staff();
            bean.setStaffPassword(password);
            bean.setStaffName(username);
            bean = staffService.login(bean);
            if (bean != null) {
                System.out.println("管理员登陆成功");
                session.setAttribute("loginUser",bean);
                return "forward:management.jsp";

            } else {

                System.out.println("管理员登陆失败");
                model.addAttribute("msg", "login error!");
                //return "forward:login.jsp";//http://localhost:8080/ssm-02/user/login.jsp
                return "error";
            }
        }
        else {
            System.out.println("login:::name:::" + username + ", password:" + password);
            Customer bean = new Customer();
            bean.setEmail(username);
            bean.setCustomerName(username);
            bean.setPhone(username);
            bean.setCustomerPassword(password);
//        bean = customerService.login(loginname, password);
            bean = customerService.login(bean);
            if (bean != null) {
                //登录成功
                //session保存
                bean.setLoginTime(new java.sql.Date(new Date().getTime()));
                customerService.update(bean);
                session.setAttribute("loginUser",bean);
                model.addAttribute("loginUser", bean);
                model.addAttribute("customer",bean.getCustomerId());
                System.out.println("登陆成功");
                return "CustomerManagement/success";
                //记住密码，使用Cookie
            } else {
                //登录失败
                //model.addAttribute("msg", "用户名或密码错误");
                System.out.println("登陆失败");
                model.addAttribute("msg", "login error!");
                //return "forward:login.jsp";//http://localhost:8080/ssm-02/user/login.jsp
                return "error";
            }
//        return "index";
        }
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(Customer bean,String customerPassword1,Model model) {
        bean.setCustomerPassword(customerPassword1);
        System.out.println(bean.toString());
        if (customerService.check(bean).isEmpty()) {
            bean.setRegisterTime(new java.sql.Date(new Date().getTime()));
            if (customerService.register(bean)) {
                model.addAttribute("msg", "success");
                return "success";
            } else {
                model.addAttribute("msg", "server error!");
                return "error";
            }
        }
        else{
            model.addAttribute("msg", "information error!");
            return "error";
        }
    }

    @RequestMapping(value="/logout")
    public String logoutHandle(Model model, HttpSession session){
        session.removeAttribute("loginUser");
        System.out.println("receive logout request");
        model.addAttribute("msg", "logout success!");
        //其实按道理应该改一下页面的名字的（
        return "error";
    }





}
