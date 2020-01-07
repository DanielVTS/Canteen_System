package cn.lingnan.services.Impl;

import cn.lingnan.mapper.CustomerMapper;
import cn.lingnan.pojo.Customer;
import cn.lingnan.services.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("customerService")
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    private CustomerMapper customerMapper;


    @Override
    public boolean update(Customer customer) {
        return customerMapper.update(customer);
    }

    @Override
    public boolean delete(Integer customerId) {
        return customerMapper.delete(customerId);
    }

    @Override
    public List<Customer> queryAll() {
        return customerMapper.queryAll();
    }

    @Override
    public List<Customer> query(Customer customer) {
        return customerMapper.query(customer);
    }

    @Override
    public List<Customer> check(Customer customer) {
        return customerMapper.check(customer);
    }

    @Override
    public Customer login(Customer customer) {
        return customerMapper.login(customer);
    }

    @Override
    public Customer loginById(Integer customerId, String customerPassword) {
        return customerMapper.loginById(customerId,customerPassword);
    }

    @Override
    public Customer loginByEmail(String email, String customerPassword) {
        return customerMapper.loginByEmail(email,customerPassword);
    }

    @Override
    public Customer getByName(String customerName) {
        return customerMapper.getByName(customerName);
    }

    @Override
    public Customer getById(Integer customerId) {
        return customerMapper.getById(customerId);
    }

    @Override
    public Customer getByEmail(String email) {
        return customerMapper.getByEmail(email);
    }

    @Override
    public Customer getByPhone(String phone) {
        return customerMapper.getByPhone(phone);
    }

    @Override
    public boolean register(Customer customer) {
        return customerMapper.register(customer);
    }
}
