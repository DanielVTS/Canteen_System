package cn.lingnan.services.Impl;

import cn.lingnan.mapper.MenuMapper;
import cn.lingnan.pojo.Menu;
import cn.lingnan.services.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("menuService")
public class MenuServiceImpl implements MenuService {

    @Autowired
    private MenuMapper menuMapper;

    @Override
    public Menu getById(Integer menuId) {
        return menuMapper.getById(menuId);
    }

    @Override
    public Menu getByName(String menuName) {
        return menuMapper.getByName(menuName);
    }

    @Override
    public List<Menu> queryAll() {
        return menuMapper.queryAll();
    }

    @Override
    public List<Menu> query(Menu menu) {
        return menuMapper.query(menu);
    }

    @Override
    public boolean add(Menu menu) {
        return menuMapper.add(menu);
    }

    @Override
    public boolean delete(Menu menu) {
        return menuMapper.delete(menu);
    }

    @Override
    public boolean update(Menu menu) {
        return menuMapper.update(menu);
    }
}
