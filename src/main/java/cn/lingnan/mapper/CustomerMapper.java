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
    List<Customer> queryAll();
    List<Customer> check(Customer customer);
//    Customer login(@Param("loginname") String loginname,@Param("password") String password);
    Customer login(Customer customer);
    List<Customer> query(Customer customer);
    Customer loginById(@Param("customerId") Integer customerId,@Param("customerPassword") String customerPassword);
    Customer loginByEmail(@Param("email") String email,@Param("customerPassword") String customerPassword);
    Customer getByName(String customerName);
    Customer getById(Integer customerId);
    Customer getByEmail(String email);
    Customer getByPhone(String phone);
    boolean register (Customer customer);

}
