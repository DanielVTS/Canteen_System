package cn.lingnan.mapper;

import cn.lingnan.pojo.Menu;
import cn.lingnan.pojo.OrderList;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface MenuMapper {
    Menu getById(Integer menuId);
    Menu getByName(String menuName);
    List<Menu> queryAll();
    List<Menu> query(Menu menu);
    boolean add(Menu menu);
    boolean delete(Menu menu);
    boolean update(Menu menu);
}
