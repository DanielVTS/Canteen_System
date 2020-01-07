package cn.lingnan.services;

import cn.lingnan.pojo.Customer;

import java.util.List;

public interface CustomerService {
    boolean update(Customer customer);
    boolean delete(Integer customerId);
    List<Customer> QueryAll();
    Customer loginById(Integer customerId,String customerPassword);
    Customer loginByEmail(String customerEmail,String customerPassword);
    Customer getByName(String customerName);
    Customer getById(Integer customerId);
    Customer getByEmail(String customerEmail);
    Customer getByPhone(String customerPhone);
    boolean register (Customer customer);

}
