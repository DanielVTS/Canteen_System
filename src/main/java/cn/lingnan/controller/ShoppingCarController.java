package cn.lingnan.controller;

import cn.lingnan.pojo.Menu;
import cn.lingnan.services.MenuService;
import cn.lingnan.services.OrderItemService;
import cn.lingnan.services.OrderListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
@RequestMapping("/shoppingCar")



public class ShoppingCarController {
    @Autowired
    private OrderItemService orderItemService;
    @Autowired
    private MenuService service;
    @Autowired
    private OrderListService listService;

    @RequestMapping(value = "/getTotalPrice", method = RequestMethod.POST)
    public String deleteOrderList(List menu) {
        System.out.println("MenuList" + menu);
        return "success";
    }

}
