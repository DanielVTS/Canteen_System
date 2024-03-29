package cn.lingnan.controller;

import cn.lingnan.pojo.Menu;
import cn.lingnan.pojo.OrderItem;
import cn.lingnan.pojo.OrderList;
import cn.lingnan.pojo.Table;
import cn.lingnan.services.MenuService;
import cn.lingnan.services.OrderItemService;
import cn.lingnan.services.OrderListService;
import cn.lingnan.services.TableService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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

    private OrderItemService orderItemService;
    @Autowired
    public void setOrderItemService(OrderItemService orderItemService) {
        this.orderItemService = orderItemService;
    }

    @Autowired
    private TableService tableService;
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
    @RequestMapping(value ="/getCustomerOrderList",method = RequestMethod.POST)
    @ResponseBody
    public List<OrderList> CustomerGetOrderList (Integer id) {
        List<OrderList> list=orderListService.queryAll();
        System.out.println(id);
        for(OrderList item: list){
            if(item.getCustomerId()!=id) list.remove(item);
        }
        System.out.println("getOrderList");
        return list;
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
        Integer tableId=orderList.getTableId();
        Table table=new Table();

        table.setTableStatus(1);
        table.setTableId(tableId);
        table.setTableTime(null);
        table.setPhone(null);
        System.out.println(tableId);
        tableService.update(table);

        System.out.println(table);
        if (orderList.getOrderStatus()==2)
        {
            return  "forward:../tgls/agent/order_list.jsp";
        }
        orderList.setOrderStatus(2);

        orderList.setEndTime(new java.sql.Date(new Date().getTime()));
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

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

    @RequestMapping(value = "/addForm", method = RequestMethod.POST)
    public String addForm (OrderList orderList,String orderId,Model model) {
        //public void addForm (OrderList orderList,String orderId,Model model) {
        System.out.println("addForm");
        System.out.println(orderId);
        //System.out.println(tableTime);
        System.out.println(orderList.toString());
        System.out.println(orderListService.add(orderList));
        return "CustomerManagement/menuList";
//        return ;
    }


    // TODO: 2020/1/13
    @RequestMapping(value = "/customerAddForm", method = RequestMethod.GET)
    public String customerAddForm (                     String orderId,Model model) {
//        System.out.println("customerAddForm");
//        System.out.println(orderId);
//        System.out.println(orderList.toString());


        //前端数据解析



        //后端传值
        List<OrderItem> cart=new ArrayList<>();
        OrderList order=new OrderList();
        System.out.println(orderListService.add(order));
        for(OrderItem item:cart){
            System.out.println(orderItemService.add(item));
        }
        return "/CustomerManagement/myOrderList";
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
