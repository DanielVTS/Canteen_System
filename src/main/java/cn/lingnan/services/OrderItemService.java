package cn.lingnan.services;

import cn.lingnan.pojo.OrderItem;

import java.util.List;

public interface OrderItemService {
    boolean update(OrderItem orderItem);
    boolean delete(Integer id);
    boolean add (OrderItem orderItem);
    List<OrderItem> queryAll();
    List<OrderItem> query(OrderItem orderItem);
}
