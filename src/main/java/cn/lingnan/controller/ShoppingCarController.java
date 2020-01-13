package cn.lingnan.controller;

import cn.lingnan.pojo.Menu;
import cn.lingnan.pojo.ShoppingCar;
import cn.lingnan.services.MenuService;
import cn.lingnan.services.OrderItemService;
import cn.lingnan.services.OrderListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

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
    @ResponseBody
    public String getTotalPrice(@RequestBody List<ShoppingCar> items, @RequestBody String id, Model model) {
        System.out.println(" receive getTotalPrice request");

        if(id!=null) System.out.println("id::"+id);
        if(items!=null){
            for(ShoppingCar item:items){
                System.out.println(item.toString());
            }
            return "success";
        }else return "error";

    }

//    public String getTotalPrice(@RequestBody Map<String,String> items,@RequestBody String id, Model model) {
//        System.out.println(" receive getTotalPrice request");
//        if(id!=null) System.out.println("id::"+id);
//        System.out.println(items.isEmpty());
//        return "success";
//    }

//    public String getTotalPrice(String[] items) {
//        System.out.println(" receive getTotalPrice ");
//        if(items!=null){
//            for(String item:items){
//                System.out.println(item);
//            }
//            return "success";
//        }else return "error";
//    }
//    public String getTotalPrice(@RequestBody String id) {
//        System.out.println(" receive getTotalPrice ");
//        if(id!=null){
//            System.out.println(id);
//            return "success";
//        }else return "error";
//    }
//    public String getTotalPrice(@RequestBody String id,@RequestBody String ShoppingCar) {
//        System.out.println(" receive getTotalPrice ");
//        if (id != null) {
//            System.out.println(id);
//        }
//        if (ShoppingCar != null) {
//            System.out.println(ShoppingCar);
//        }
//        return "sth";
//    }
//    public String getTotalPrice(@RequestBody Map item) {
//        if(item!=null){
//            System.out.println(item.toString());
//            return "success";
//        }else return "error";
//    }

}
