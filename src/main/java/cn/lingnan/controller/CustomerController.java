package cn.lingnan.controller;

import cn.lingnan.pojo.Customer;
import cn.lingnan.pojo.Menu;
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
import java.util.*;

@Controller
@RequestMapping("/customer")
public class CustomerController {

    @Autowired
    private CustomerService customerService;


    @Autowired
    public void setCustomerService(CustomerService customerService) {

        this.customerService = customerService;
    }

    

    @RequestMapping(value = "/search",method = RequestMethod.POST)
//    @ResponseBody
    public String search (Customer customer,Model model) {
        System.out.println(customer);
        String customerName=customer.getCustomerName();
        String email=customer.getEmail();
        String phone=customer.getPhone();

        System.out.println(customerName);
        System.out.println(email);
        System.out.println(phone);
        
        model.addAttribute("locationurl","/customer/searchList");
        model.addAttribute("customerName",customerName);
        model.addAttribute("email",email);
        model.addAttribute("phone",phone);

        return "forward:../tgls/customer/customer_list.jsp";
    }





    @RequestMapping(value = "/getCustomerList",method = RequestMethod.POST)
    @ResponseBody

    public List<Customer> getcustomerList () {
        System.out.println("querycustomer");
        return customerService.queryAll();
    }

    @RequestMapping(value = "/getCustomerById",method = RequestMethod.POST)
    @ResponseBody
    public List<Customer> getCustomerById (Integer Id) {
        System.out.println("getCustomerById:::"+Id);
        List<Customer> list=new ArrayList<>();
        list.add(customerService.getById(Id));
        return list;
    }


    @RequestMapping(value = "/searchList",method = RequestMethod.POST)
    @ResponseBody
    public List<Customer> searchList (String customerName,String email,String phone,Model model) {
        if(customerName.equals("")) {
            customerName = null;
        }
        if(email.equals("")) {
            email = null;
        }
        if(phone.equals("")) {
            phone = null;
        }
        System.out.println("searchList");
        Customer customer=new Customer();
        customer.setCustomerName(customerName);
        customer.setEmail(email);
        customer.setPhone(phone);
        System.out.println(customer);
        return customerService.query(customer);


    }


    @GetMapping("/update")
//    @ResponseBody
    public String update (Integer customerId,Model model) {
        System.out.println("customer,customerId:"+customerId);
        model.addAttribute("customerId", customerId);
        return "forward:../tgls/customer/customer_update.jsp";
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

    @RequestMapping(value = "/addForm", method = RequestMethod.GET)
    public String addForm (Customer customer, Integer customerId, Model model) {
        System.out.println("addForm");
        System.out.println(customerId);
        System.out.println(customer.toString());
        String email=customer.getEmail();
        customer.setRegisterTime(new java.sql.Date(new Date().getTime()));
        if(customerService.getByEmail(email)==null)
        {

            System.out.println(customerService.register(customer));
        }
        else {
            model.addAttribute("msg", "information error!");
        }

        return "forward:../tgls/customer/customer_list.jsp";

    }





}
