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
    @Autowired
    private OrderItemService orderItemService;
    @Autowired
    private OrderListService orderListService;

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



    @GetMapping("/update")
//    @ResponseBody
    public String update (String id,Model model) {
        System.out.println("orderItem,Id:"+id);
        model.addAttribute("id", id);
        return "forward:../tgls/agent/order_item_update.jsp";
    }



    @RequestMapping(value = "/updateForm", method = RequestMethod.GET)
    public String updateForm (OrderItem orderItem, String orderId,Model model) {
        System.out.println("updateForm");
        System.out.println(orderId);
        System.out.println(orderItem.toString());

        String orderNo=orderItem.getOrderNo();
        Integer Id=orderItem.getId();



        orderItem.setTotalPrice(orderItem.getPrice()*orderItem.getQuantity());

        System.out.println(orderItem.toString());
        orderItemService.update(orderItem);

        setOrderPrice(orderNo);

//        double price=0;
//
//        List<OrderItem> list=orderItemService.query(orderItem1);
//        for(int i=0;i<list.size();i++)
//        {
//            price = price +list.get(i).getTotalPrice();
//        }
//
//
//        OrderList orderList=orderListService.queryNo(orderNo);
//        orderList.setOrderPrice(price);

//        orderListService.update(orderList);

        System.out.println("111");

        return "forward:../tgls/agent/order_item.jsp";
    }




    @GetMapping(value = "/delete")
    public String deleteOrderItem(Integer id){
        System.out.println("delete a orderList:::id:::" + id);
        OrderItem orderItem=orderItemService.getById(id);
        String orderNo=orderItem.getOrderNo();
        orderItemService.delete(id);
        setOrderPrice(orderNo);


         return "forward:../tgls/agent/order_item.jsp";
    }

    @GetMapping(value = "/add")
    public String addOrderItem(Integer id){
        System.out.println("delete a orderList:::id:::" + id);
        OrderItem orderItem=orderItemService.getById(id);
        String orderNo=orderItem.getOrderNo();
        orderItemService.delete(id);
        setOrderPrice(orderNo);


         return "forward:../tgls/agent/order_item.jsp";
    }









    public void setOrderPrice(String orderNo)
    {
        List<OrderItem> list=orderItemService.getByNo(orderNo);

        System.out.println(list);
        double price=0;

        for(int i=0;i<list.size();i++)
        {
            System.out.println("price"+list.get(i).getTotalPrice());
            price = price +list.get(i).getTotalPrice();
        }

        OrderList orderList=orderListService.queryNo(orderNo);
        System.out.println(price);
        orderList.setOrderPrice(price);

        orderListService.update(orderList);

    }









}
