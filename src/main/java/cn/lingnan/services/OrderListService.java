package cn.lingnan.services;

import cn.lingnan.pojo.OrderList;

import java.util.List;

public interface OrderListService {
    List<OrderList> query(OrderList orderList);

}
