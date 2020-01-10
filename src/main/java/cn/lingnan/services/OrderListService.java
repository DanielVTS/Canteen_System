package cn.lingnan.services;

import cn.lingnan.pojo.OrderList;

import java.util.List;

public interface OrderListService {
    boolean update(OrderList orderList);
    boolean delete(Integer orderId);
    boolean add (OrderList orderList);
    List<OrderList> queryAll();
    List<OrderList> query(OrderList orderList);
    OrderList queryNo(String OrderNo);
}
