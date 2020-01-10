package cn.lingnan.mapper;

import cn.lingnan.pojo.Staff;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
@Mapper
@Repository
public interface StaffMapper {
    Staff getById(Integer staffId);
    Staff getByName(String staffName);
    List<Staff> query(Staff staff);
    List<Staff> queryAll();
    boolean add(Staff staff);
    boolean delete(Staff staff);
    boolean update(Staff staff);
    Staff login(Staff staff);

}
