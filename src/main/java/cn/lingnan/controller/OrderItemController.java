package cn.lingnan.controller;

import cn.lingnan.pojo.OrderItem;
import cn.lingnan.pojo.OrderList;
import cn.lingnan.services.OrderItemService;
import cn.lingnan.services.OrderListService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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






    @GetMapping("/getOrderItem")
    @ResponseBody
    public List<OrderItem> getOrderItem () {
        System.out.println("getOrderItem");
        System.out.println(orderItemService.queryAll());
        return orderItemService.queryAll();
    }


    @GetMapping("/showOrderItem")
    @ResponseBody
    public List<OrderItem> showOrderItem (String orderNo, Model model) {
        System.out.println("showOrderItem");
        System.out.println(orderNo);
        model.addAttribute("orderNo", orderNo);
        OrderItem orderItem=new OrderItem();
        orderItem.setOrderNo(orderNo);
        System.out.println(orderItem);
        return orderItemService.query(orderItem);
    }

    @GetMapping("/update")
//    @ResponseBody
    public String update (Integer id,Model model) {
        System.out.println("orderItem,id:"+id);
        model.addAttribute("id", id);
        return "forward:../tgls/agent/order_item_update.jsp";
    }

    @RequestMapping(value = "/updateForm", method = RequestMethod.GET)
    public String updateForm (OrderItem orderItem, Integer id,Model model) {
        System.out.println("updateForm");
        System.out.println(id);
        System.out.println(orderItem.toString());
        System.out.println(orderItemService.update(orderItem));

        return "forward:../tgls/agent/order_item.jsp";
    }
}
