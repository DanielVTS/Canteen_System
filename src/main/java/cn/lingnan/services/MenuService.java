package cn.lingnan.services;

import cn.lingnan.pojo.Menu;

import java.util.List;

public interface MenuService {
    Menu getById(Integer menuId);
    Menu getByName(String menuName);
    List<Menu> queryAll();
    List<Menu> query(Menu menu);
    boolean add(Menu menu);
    boolean delete(Menu menu);
    boolean update(Menu menu);
}
