package cn.lingnan.mapper;

import cn.lingnan.pojo.Customer;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
@Mapper
@Repository
public interface CustomerMapper {
    boolean update(Customer customer);
    boolean delete(Integer customerId);
    List<Customer> QueryAll();
    Customer loginById(@Param("customerId") Integer customerId,@Param("customerPassword") String customerPassword);
    Customer loginByEmail(@Param("customerEmail") String customerEmail,@Param("customerPassword") String customerPassword);
    Customer getByName(String customerName);
    Customer getById(Integer customerId);
    Customer getByEmail(String customerEmail);
    Customer getByPhone(String customerPhone);
    boolean register (Customer customer);
}
