package cn.lingnan.controller;

import cn.lingnan.pojo.Menu;
import cn.lingnan.pojo.OrderList;
import cn.lingnan.pojo.Table;
import cn.lingnan.services.MenuService;
import cn.lingnan.services.OrderItemService;
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
@RequestMapping("/shoppingCar")



public class ShoppingCarController {
    @Autowired
    private OrderItemService orderItemService;
    @Autowired
    private MenuService menuService;
    @Autowired
    private OrderListService orderListService;
    @Autowired
    private TableService tableService;

//    @RequestMapping(value = "/getTotalPrice", method = RequestMethod.POST)
//    public String deleteOrderList(List menuList, Model model) {
//
//        List<Table> list=tableService.getByStaus(1);
//        List tableIdList=new ArrayList();
//        int length=list.size();
//        int[] tableArray=new int[length];
//        for(int i=0;i<list.size();i++)
//        {
//            tableArray[i]=list.get(i).getTableId();
//        }
//        model.addAttribute("tableArray",tableArray);
//
//
//
//        System.out.println("MenuList" + menuList);
//        return "success";
//    }

    @RequestMapping(value = "setList",method =RequestMethod.POST)
            public String setList(Integer customerId)
    {

            return "${ctx}/CustomerManagement/addOrder";
    }









    @RequestMapping(value = "addList" ,method =RequestMethod.POST)
    public String addList(OrderList orderList)
    {
        Long time=System.currentTimeMillis();
        String orderNo=time.toString();
        orderList.setOrderNo(orderNo);
        String tableName=orderList.getTableName();
        Table table=new Table();
        table=tableService.getByName(tableName);
        orderList.setTableId(table.getTableId());
        orderListService.update(orderList);
        return "${ctx}/CustomerManagement/OrderList";

    }

}
