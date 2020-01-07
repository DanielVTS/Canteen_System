package cn.lingnan.services;

import cn.lingnan.pojo.Staff;

import java.util.List;

public interface StaffService {
    Staff getById(Integer staffId);
    Staff getByName(String staffName);
    List<Staff> query(Staff staff);
    List<Staff> queryAll();
    boolean add(Staff staff);
    boolean delete(Staff staff);
    boolean update(Staff staff);
}
