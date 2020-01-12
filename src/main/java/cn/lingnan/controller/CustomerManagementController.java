package cn.lingnan.controller;


import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/CustomerManagement")
public class CustomerManagementController {

    @RequestMapping("/")


    public String defaultPage(){
        return "management";
    }

    @RequestMapping("/orderlist")

    public String orderListPage(){
        return "my_orderlist";
    }

    @RequestMapping("/orderItem")

    public String orderItemPage(){
        return "my_orderitem";
    }




}
