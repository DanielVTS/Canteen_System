package cn.lingnan.services.Impl;

import cn.lingnan.mapper.OrderListMapper;
import cn.lingnan.pojo.OrderList;
import cn.lingnan.services.OrderListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("orderListService")
public class OrderListServiceImpl implements OrderListService {
    @Autowired
    private OrderListMapper orderListMapper;

    @Override
    public boolean update(OrderList orderList) {
        return orderListMapper.add(orderList);
    }

    @Override
    public boolean delete(Integer orderId) {
        return orderListMapper.delete(orderId);
    }

    @Override
    public boolean add(OrderList orderList) {
        return orderListMapper.add(orderList);
    }

    @Override
    public List<OrderList> queryAll() {
        return orderListMapper.queryAll();
    }

    @Override
    public List<OrderList> query(OrderList orderList) {
        return orderListMapper.query(orderList);
    }
}
