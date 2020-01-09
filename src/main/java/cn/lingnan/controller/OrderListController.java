package cn.lingnan.controller;

import cn.lingnan.pojo.Menu;
import cn.lingnan.pojo.OrderList;
import cn.lingnan.services.MenuService;
import cn.lingnan.services.OrderListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addOrderList(String orderNo, Integer customerId, String customerName, String phone, Integer tableId, String tableName, Integer orderStatus, Integer orderPrice, Date tableTime, Date endTime, String ps){
        System.out.println("add a orderList:::orderNo:::" + orderNo + ", customerId" + customerId + ", customerName" + customerName + ", phone" + phone + ", tableId" + tableId + ", tableName" + tableName + ", orderStatus" + orderStatus + ", tableTime" + tableTime + ", endTime" + endTime + ", ps" + ps);
        OrderList orderList=new OrderList();
        orderList.setOrderNo(orderNo);
        orderList.setCustomerId(customerId);
        orderList.setCustomerName(customerName);
        orderList.setPhone(phone);
        orderList.setTableId(tableId);
        orderList.setTableName(tableName);
        orderList.setOrderStatus(orderStatus);
        orderList.setOrderPrice(orderPrice);
        orderList.setTableTime(tableTime);
        orderList.setEndTime(endTime);

        if(orderListService.add(orderList)){
            return "success";
        }
        else return "forward:../add.jsp";
    }

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

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String updateOrderList(String orderNo, Integer customerId, String customerName, String phone, Integer tableId, String tableName, Integer orderStatus, Integer orderPrice, Date tableTime, Date endTime, String ps){
        System.out.println("update a orderList:::orderNo:::" + orderNo + ", customerId" + customerId + ", customerName" + customerName + ", phone" + phone + ", tableId" + tableId + ", tableName" + tableName + ", orderStatus" + orderStatus + ", tableTime" + tableTime + ", endTime" + endTime + ", ps" + ps);
        OrderList orderList=new OrderList();
        orderList.setOrderNo(orderNo);
        orderList.setCustomerId(customerId);
        orderList.setCustomerName(customerName);
        orderList.setPhone(phone);
        orderList.setTableId(tableId);
        orderList.setTableName(tableName);
        orderList.setOrderStatus(orderStatus);
        orderList.setOrderPrice(orderPrice);
        orderList.setTableTime(tableTime);
        orderList.setEndTime(endTime);
        if(orderListService.update(orderList)){
            return "success";
        }
        else return "forward:../update.jsp";
    }

    @GetMapping("/getListJson")
    @ResponseBody
    public List<OrderList> getListJson () {
        System.out.println("getListJson");
        return orderListService.queryAll();
    }

}
