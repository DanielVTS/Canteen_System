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
    public List<Customer> QueryAll() {
        return customerMapper.QueryAll();
    }

    @Override
    public Customer loginById(Integer customerId, String customerPassword) {
        return customerMapper.loginById(customerId,customerPassword);
    }

    @Override
    public Customer loginByEmail(String customerEmail, String customerPassword) {
        return customerMapper.loginByEmail(customerEmail,customerPassword);
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
    public Customer getByEmail(String customerEmail) {
        return customerMapper.getByEmail(customerEmail);
    }

    @Override
    public Customer getByPhone(String customerPhone) {
        return customerMapper.getByPhone(customerPhone);
    }

    @Override
    public boolean register(Customer customer) {
        return customerMapper.register(customer);
    }
}
