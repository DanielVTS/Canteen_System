package cn.lingnan.services.Impl;

import cn.lingnan.mapper.OrderItemMapper;
import cn.lingnan.pojo.OrderItem;
import cn.lingnan.services.OrderItemService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("orderItemService")
public class OrderItemServiceImpl implements OrderItemService {
    private OrderItemMapper orderItemMapper;
    @Override
    public boolean update(OrderItem orderItem) {
        return orderItemMapper.update(orderItem);
    }

    @Override
    public boolean delete(Integer id) {
        return orderItemMapper.delete(id);
    }

    @Override
    public boolean add(OrderItem orderItem) {
        return orderItemMapper.add(orderItem);
    }

    @Override
    public List<OrderItem> queryAll() {
        return orderItemMapper.queryAll();
    }

    @Override
    public List<OrderItem> query(OrderItem orderItem) {
        return orderItemMapper.query(orderItem);
    }
}
