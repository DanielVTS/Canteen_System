package cn.lingnan.controller;

import cn.lingnan.pojo.Customer;
import cn.lingnan.pojo.OrderList;
import cn.lingnan.pojo.Staff;
import cn.lingnan.services.CustomerService;
import cn.lingnan.services.StaffService;
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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/customer")
public class CustomerController {

    @Autowired
    private CustomerService customerService;


    @Autowired
    public void setCustomerService(CustomerService customerService) {

        this.customerService = customerService;
    }


    @GetMapping("/getCustomerList")
    @ResponseBody
    public List<Customer> getCustomerList () {
        System.out.println("getCustomerList");
        return customerService.queryAll();
    }


    @GetMapping("/update")
//    @ResponseBody
    public String update (Integer customerId,Model model) {
        System.out.println("customer,customerId:"+customerId);
        model.addAttribute("customerId", customerId);
        return "forward:../tgls/customer/customer_add.jsp";
    }


    @GetMapping("/delete")
//    @ResponseBody
    public String delete (Integer customerId,Model model) {
        System.out.println("customer,customerId:"+customerId);
        model.addAttribute("customerId", customerId);
        customerService.delete(customerId);
        return "forward:../tgls/customer/customer_list.jsp";
    }



    @RequestMapping(value = "/updateForm", method = RequestMethod.GET)
    public String updateForm (Customer customer, Integer customerId, Model model) {
        System.out.println("updateForm");
        System.out.println(customerId);
        System.out.println(customer.toString());
        System.out.println(customerService.update(customer));
        return "forward:../tgls/customer/customer_list.jsp";


    }






}
