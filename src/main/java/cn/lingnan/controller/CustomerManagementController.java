package cn.lingnan.controller;


import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/CustomerManagement")
public class CustomerManagementController {

    @RequestMapping("/")
    public String defaultPage(){
        System.out.println("defaultPage");
        return "CustomerManagement";
    }

    @RequestMapping("/orderlist")
    public String orderListPage(){
        System.out.println("orderListPage");
        return "my_orderlist";
    }

    @RequestMapping("/orderItem")

    public String orderItemPage(){
        System.out.println("orderItemPage");
        return "my_orderitem";
    }

    @RequestMapping("/bookTable")
    public String bookTablePage(){
        System.out.println("bookTablePage");
        return "book_table";
    }

    @RequestMapping("/bookMenu")
    public String bookMenuPage(){
        System.out.println("bookMenuPage");
        return "book_menu";
    }

    @RequestMapping("/personalInformation.jsp")
    public String personalInformationPage(){
        System.out.println("personalInformationPage");
        return "personal_information";
    }



}
