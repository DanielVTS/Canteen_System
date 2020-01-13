package cn.lingnan.controller;


import cn.lingnan.pojo.Customer;
import cn.lingnan.pojo.Table;
import cn.lingnan.services.CustomerService;
import cn.lingnan.services.OrderListService;
import cn.lingnan.services.TableService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/CustomerManagement")




public class CustomerManagementController {

    @Autowired
    private CustomerService customerService;
    @Autowired
    private OrderListService orderListService;
    @Autowired
    private TableService tableService;


    @RequestMapping("/")
    public String defaultPage(){
        System.out.println("defaultPage");
        return "/CustomerManagement/customerManagement";
    }

    @RequestMapping("/OrderList")
    public String orderListPage(){
        System.out.println("orderListPage");
        return "/CustomerManagement/myOrderList";
    }



    @GetMapping("/showOrderItem")
    public String showOrderItem (String orderNo,Model model) {
        System.out.println("orderList,orderNo:"+orderNo);
        model.addAttribute("orderNo", orderNo);
        return "/CustomerManagement/myOrderItem";
    }

    @GetMapping("/CustomerEditOrderItem")
//    @ResponseBody
    public String CustomerEditOrderItem (String orderNo,Model model) {
        System.out.println("orderList,orderNo:"+orderNo);
        model.addAttribute("orderNo", orderNo);
        return "/CustomerManagement/myOrderItem";
    }


    @RequestMapping("/addOrder")
    public String bookTablePage(Model model){
        System.out.println("bookTablePage");

        List<Table> list=tableService.getByStatus(1);
        List tableIdList=new ArrayList();
        int length=list.size();
        int[] tableArray=new int[length];
        for(int i=0;i<list.size();i++)
        {
            tableArray[i]=list.get(i).getTableId();
        }
        model.addAttribute("tableArray",tableArray);


        return "CustomerManagement/addOrder";
    }

    @RequestMapping("/bookMenu")
    public String bookMenuPage(){
        System.out.println("bookMenuPage");
        return "book_menu";
    }

    @RequestMapping("/personalInformation")
    public String personalInformationPage(){
        System.out.println("personalInformationPage");
        return "CustomerManagement/personalInformation";
    }

    @RequestMapping("/menuList")
    public String menuList(){
        System.out.println("personalInformationPage");
        return "CustomerManagement/menuList";
    }





    @RequestMapping(value = "/updateForm", method = RequestMethod.GET)
    public String updateForm (Customer customer, Integer customerId, Model model) {
        System.out.println("Customer updateForm");
        System.out.println(customerId);
        System.out.println(customer.toString());
        System.out.println(customerService.update(customer));
        return "/CustomerManagement/personalInformation";
    }





}
