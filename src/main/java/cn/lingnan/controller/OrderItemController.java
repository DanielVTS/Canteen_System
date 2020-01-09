package cn.lingnan.controller;

import cn.lingnan.pojo.OrderItem;
import cn.lingnan.pojo.OrderList;
import cn.lingnan.services.OrderItemService;
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
@RequestMapping("/orderItem")
public class OrderItemController {
    private OrderItemService orderItemService;
    @Autowired
    public void setOrderItemService(OrderItemService orderItemService) {
        this.orderItemService = orderItemService;
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addOrderItem(String orderNo, Integer menuId, String menuName, Integer price, Integer quantity){
        System.out.println("add a orderList:::orderNo:::" + orderNo + ", menuId" + menuId + ", menuName" + menuName + ", price" + price + ", quantity" + quantity);
        OrderItem orderItem=new OrderItem();
        orderItem.setOrderNo(orderNo);
        orderItem.setMenuId(menuId);
        orderItem.setMenuName(menuName);
        orderItem.setPrice(price);
        orderItem.setQuantity(quantity);
        orderItem.setTotalPrice((double) (quantity*price));


        if(orderItemService.add(orderItem)){
            return "success";
        }
        else return "forward:../add.jsp";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String deleteOrderItem(Integer id){
        System.out.println("delete a orderItem:::id:::" + id);
        if(orderItemService.delete(id)){
            return "success";
        }
        else return "forward:../delete.jsp";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String updateOrderItem(String orderNo, Integer menuId, String menuName, Integer price, Integer quantity){
        System.out.println("update a orderList:::orderNo:::" + orderNo + ", menuId" + menuId + ", menuName" + menuName + ", price" + price + ", quantity" + quantity);
        OrderItem orderItem=new OrderItem();
        orderItem.setOrderNo(orderNo);
        orderItem.setMenuId(menuId);
        orderItem.setMenuName(menuName);
        orderItem.setPrice(price);
        orderItem.setQuantity(quantity);
        orderItem.setTotalPrice((double) (quantity*price));
        if(orderItemService.update(orderItem)){
            return "success";
        }
        else return "forward:../update.jsp";
    }

    @GetMapping("/getListJson")
    @ResponseBody
    public List<OrderItem> getListJson () {
        System.out.println("getListJson");
        return orderItemService.queryAll();
    }
}
