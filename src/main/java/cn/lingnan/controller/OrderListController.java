package cn.lingnan.controller;

import cn.lingnan.pojo.Menu;
import cn.lingnan.pojo.OrderList;
import cn.lingnan.services.MenuService;
import cn.lingnan.services.OrderListService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/orderList")
public class OrderListController {

    private OrderListService orderListService;
    @Autowired
    public void setOrderListService(OrderListService orderListService) {
        this.orderListService = orderListService;
    }
//
//    @RequestMapping(value = "/add", method = RequestMethod.POST)
//    public String addOrderList(String orderNo, Integer customerId, String customerName, String phone, Integer tableId, String tableName, Integer orderStatus, Integer orderPrice, Date tableTime, Date endTime, String ps){
//        System.out.println("add a orderList:::orderNo:::" + orderNo + ", customerId" + customerId + ", customerName" + customerName + ", phone" + phone + ", tableId" + tableId + ", tableName" + tableName + ", orderStatus" + orderStatus + ", tableTime" + tableTime + ", endTime" + endTime + ", ps" + ps);
//        OrderList orderList=new OrderList();
//        orderList.setOrderNo(orderNo);
//        orderList.setCustomerId(customerId);
//        orderList.setCustomerName(customerName);
//        orderList.setPhone(phone);
//        orderList.setTableId(tableId);
//        orderList.setTableName(tableName);
//        orderList.setOrderStatus(orderStatus);
//        orderList.setOrderPrice(orderPrice);
//        orderList.setTableTime(tableTime);
//        orderList.setEndTime(endTime);
//
//        if(orderListService.add(orderList)){
//            return "success";
//        }
//        else return "forward:../add.jsp";
//    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String deleteOrderList(Integer id){
        System.out.println("delete a orderList:::id:::" + id);
//        OrderList orderList=new OrderList();
//        orderList.setOrderId(id);
        if(orderListService.delete(id)){
            return "success";
        }
        else return "forward:../delete.jsp";
    }



    @GetMapping("/getOrderList")
    @ResponseBody
    public List<OrderList> getOrderList () {
        System.out.println("getOrderList");
        return orderListService.queryAll();
    }

    @GetMapping("/getStatus")
    @ResponseBody
    public List<OrderList> getStatus (OrderList orderList) {
        System.out.println("getStatus");
        return orderListService.query(orderList);
    }

    @GetMapping("/update")
//    @ResponseBody
    public String update (String orderNo,Model model) {
        System.out.println("orderList,orderNo:"+orderNo);
        model.addAttribute("orderNo", orderNo);
        return "forward:../tgls/agent/orderlist_add.jsp";
    }

    @GetMapping("/finish")
//    @ResponseBody
    public String finish (String orderNo,Model model) {
        System.out.println("orderList,orderNo:"+orderNo);
        model.addAttribute("orderNo", orderNo);
        OrderList orderList=new OrderList();
        orderList=orderListService.queryNo(orderNo);
        orderList.setOrderStatus(2);
        System.out.println(orderListService.update(orderList));
        return "forward:../tgls/agent/order_list.jsp";
    }


    @GetMapping("/showList")
//    @ResponseBody
    public String showList (String orderNo,Model model) {
        System.out.println("orderList,orderNo:"+orderNo);
        model.addAttribute("orderNo", orderNo);
        System.out.println(orderNo);
        String url="forward:../tgls/agent/order_item.jsp";
        return url;
    }



    @RequestMapping(value = "/updateForm", method = RequestMethod.GET)
    public String updateForm (OrderList orderList, String orderId,Model model) {
        System.out.println("updateForm");
        System.out.println(orderId);
        System.out.println(orderList.toString());
        System.out.println(orderListService.update(orderList));

        return "forward:../tgls/agent/order_list.jsp";
    }

    @RequestMapping(value = "/getOrderNo", method = RequestMethod.GET)
    public String getOrderNo (OrderList orderList, String orderId,Model model) {
        System.out.println("updateForm");
        System.out.println(orderId);
        System.out.println(orderList.toString());
        System.out.println(orderListService.update(orderList));

        return "forward:../tgls/agent/order_list.jsp";
    }




}
