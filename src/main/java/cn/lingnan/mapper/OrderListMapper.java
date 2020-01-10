package cn.lingnan.mapper;

import cn.lingnan.pojo.Customer;
import cn.lingnan.pojo.OrderList;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Mapper
@Repository
public interface OrderListMapper {
    boolean update(OrderList orderList);
    boolean delete(Integer orderId);
    boolean add (OrderList orderList);
    List<OrderList> queryAll();
    List<OrderList> query(OrderList orderList);
    OrderList queryNo(String OrderNo);


}
