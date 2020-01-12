package cn.lingnan.controller;

import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/Admin")
public class AdminManagementController {

    @RequestMapping("/")
    public String defaultPage(){
        System.out.println("defaultPage");
        return "management";
    }

    @RequestMapping("/orderList")
    public String orderListPage(){
        System.out.println("orderListPage");
        return "order_list";
    }

    @RequestMapping("/orderListAdd")
    public String orderListAddPage(){
        System.out.println("orderListAddPage");
        return "orderlist_add";
    }

    @RequestMapping("/orderlistUpdate")
    public String orderListUpdatePage(){
        System.out.println("orderListUpdatePage");
        return "orderlist_update";
    }

    @RequestMapping("/orderItem")
    public String orderItemPage(){
        System.out.println("orderItemPage");
        return "order_item";
    }

    @RequestMapping("/orderItemAdd")
    public String orderItemAddPage(){
        System.out.println("orderItemAddPage");
        return "order_item_add";
    }

    @RequestMapping("/orderItemUpdate")
    public String orderItemUpdatePage(){
        System.out.println("orderItemUpdatePage");
        return "order_item_update";
    }

    @RequestMapping("/customerList")
    public String customerListPage(){
        System.out.println("customerListPage");
        return "customer_list";
    }

    @RequestMapping("/customerAdd")
    public String customerAddPage(){
        System.out.println("customerAddPage");
        return "customer_add";
    }

    @RequestMapping("/customerUpdate")
    public String customerUpdatePage(){
        System.out.println("customerUpdatePage");
        return "customer_update";
    }

    @RequestMapping("/menuList")
    public String menuListPage(){
        System.out.println("menuListPage");
        return "menu_list";
    }

    @RequestMapping("/menuAdd")
    public String menuAddPage(){
        System.out.println("menuAddPage");
        return "menu_add";
    }

    @RequestMapping("/menuUpdate")
    public String menuUpdatePage(){
        System.out.println("menuUpdatePage");
        return "menu_update";
    }

    @RequestMapping("/staffList")
    public String staffListPage(){
        System.out.println("staffListPage");
        return "staff_list";
    }

    @RequestMapping("/staffAdd")
    public String staffAddPage(){
        System.out.println("staffAddPage");
        return "staff_add";
    }

    @RequestMapping("/staffUpdate")
    public String staffUpdatePage(){
        System.out.println("staffUpdatePage");
        return "staff_update";
    }

    @RequestMapping("/tableList")
    public String tableListPage(){
        System.out.println("tableListPage");
        return "table_list";
    }

    @RequestMapping("/tableAdd")
    public String tableAddPage(){
        System.out.println("tableAddPage");
        return "table_add";
    }

    @RequestMapping("/tableUpdate")
    public String tableUpdatePage(){
        System.out.println("tableUpdatePage");
        return "table_update";
    }


}
