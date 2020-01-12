package cn.lingnan.mapper;

import cn.lingnan.pojo.OrderItem;
import cn.lingnan.pojo.OrderList;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface OrderItemMapper {
    boolean update(OrderItem orderItem);
    boolean delete(Integer id);
    boolean add (OrderItem orderItem);
    List<OrderItem> queryAll();
    List<OrderItem> query(OrderItem orderItem);
    OrderItem getById(Integer id);
    List<OrderItem> getByNo(String orderNo);

}
