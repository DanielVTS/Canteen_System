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
    private OrderListMapper orderListMpeer;
    @Override
    public List<OrderList> query(OrderList orderList) {
        return orderListMpeer.query(orderList);
    }
}
