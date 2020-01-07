package cn.lingnan.services.Impl;

import cn.lingnan.mapper.CustomerMapper;
import cn.lingnan.mapper.StaffMapper;
import cn.lingnan.pojo.Staff;
import cn.lingnan.services.StaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("staffService")
public class StaffServiceImpl implements StaffService {

    private StaffMapper staffMapper;
    @Autowired
    public void StaffMapper(StaffMapper staffMapper) {
        this.staffMapper = staffMapper;
    }

    @Override
    public Staff getById(Integer staffId) {
        return staffMapper.getById(staffId);
    }

    @Override
    public Staff getByName(String staffName) {
        return staffMapper.getByName(staffName);
    }

    @Override
    public List<Staff> query(Staff staff) {
        return staffMapper.query(staff);
    }

    @Override
    public List<Staff> queryAll() {
        return staffMapper.queryAll();
    }

    @Override
    public boolean add(Staff staff) {
        return staffMapper.add(staff);
    }

    @Override
    public boolean delete(Staff staff) {
        return staffMapper.delete(staff);
    }

    @Override
    public boolean update(Staff staff) {
        return staffMapper.update(staff);
    }
}
