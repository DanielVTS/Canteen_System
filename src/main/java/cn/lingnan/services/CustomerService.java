package cn.lingnan.services;

import cn.lingnan.pojo.Customer;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CustomerService {
    boolean update(Customer customer);
    boolean delete(Integer customerId);
    List<Customer> queryAll();
    List<Customer> query(Customer customer);
    List<Customer> check(Customer customer);
    Customer loginById(Integer customerId,String customerPassword);
    Customer loginByEmail(String email,String customerPassword);
    Customer getByName(String customerName);
    Customer getById(Integer customerId);
    Customer getByEmail(String email);
    Customer getByPhone(String phone);
    boolean register (Customer customer);

}
