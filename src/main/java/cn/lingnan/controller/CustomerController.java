package cn.lingnan.controller;

import cn.lingnan.pojo.Customer;
import cn.lingnan.services.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/customer")
public class CustomerController {

    private CustomerService customerService;

    @Autowired
    public void setCustomerService(CustomerService customerService) {
        this.customerService = customerService;
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(String loginname, String password, Model model, HttpSession session) {

        System.out.println("login:::name:::" + loginname + ", password" + password);
        Customer bean = new Customer();
        bean.setEmail(loginname);
        bean.setCustomerName(loginname);
        bean.setPhone(loginname);
        bean.setCustomerPassword(password);
//        bean = customerService.login(loginname, password);
        bean = customerService.login(bean);
        if (bean != null) {
            //登录成功
            //session保存
            bean.setLoginTime(new java.sql.Date(new Date().getTime()));
            customerService.update(bean);
            session.setAttribute("loginUser", bean);
            System.out.println("登陆成功");
            return "success";
            //记住密码，使用Cookie

        } else {
            //登录失败
            model.addAttribute("msg", "用户名或密码错误");
            System.out.println("登陆失败");
            //return "forward:login.jsp";//http://localhost:8080/ssm-02/user/login.jsp
            return "forward:../login.jsp";
        }
//        return "index";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(String Email, String Phone, String customerName, String customerPassword2, Model model) {
        System.out.println("login:::email:::" + Email + ", password: " + customerPassword2 + ",phone: " + Phone + ",name: " + customerName);
        Customer bean = new Customer();
        bean.setCustomerName(customerName);
        bean.setEmail(Email);
        bean.setPhone(Phone);
        bean.setCustomerPassword(customerPassword2);
        if (customerService.check(bean).isEmpty()) {
            bean.setRegisterTime(new java.sql.Date(new Date().getTime()));
            if (customerService.register(bean)) {
                return "success";
            } else {
                model.addAttribute("msg", "注册失败");
                return "forward:../login.jsp";
            }
        }
        else{
                model.addAttribute("msg", "注册失败，该用户名或邮箱，电话已经被使用");
                return "forward:../login.jsp";
            }

    }

    @GetMapping("/getListJson")
    @ResponseBody
    public List<Customer> getListJson () {
        System.out.println("getListJson");
        return customerService.queryAll();
    }
}