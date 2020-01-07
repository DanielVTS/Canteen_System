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
    Staff getByGender(String staffGender);
    List<Staff> queryAll();
    boolean add(Staff staff);
    boolean delete(Staff staff);
    boolean update(Staff staff);

}
