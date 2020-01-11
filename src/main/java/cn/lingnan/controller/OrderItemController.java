package cn.lingnan.controller;

import cn.lingnan.pojo.OrderItem;
import cn.lingnan.pojo.OrderList;
import cn.lingnan.services.OrderItemService;
import cn.lingnan.services.OrderListService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/orderItem")
public class OrderItemController {
    private OrderItemService orderItemService;
    @Autowired
    public void setOrderItemService(OrderItemService orderItemService) {
        this.orderItemService = orderItemService;
    }


    @GetMapping("/showOrderItem")
//    @ResponseBody
    public String showOrderItem (String orderNo,Model model) {
        System.out.println("orderList,orderNo:"+orderNo);
        model.addAttribute("orderNo", orderNo);
        return "forward:../tgls/agent/order_item.jsp";
    }



    @RequestMapping(value="/getOrderItem",method = RequestMethod.POST)
    @ResponseBody
    public List<OrderItem> getOrderItem (String orderNo, Model model) {
        System.out.println("getOrderItem");
        System.out.println(orderNo);
        if(orderNo=="") return orderItemService.queryAll();
        OrderItem orderItem=new OrderItem();
        orderItem.setOrderNo(orderNo);
        return orderItemService.query(orderItem);


    }







}
