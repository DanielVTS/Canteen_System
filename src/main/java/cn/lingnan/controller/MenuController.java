package cn.lingnan.controller;

import cn.lingnan.pojo.Menu;
import cn.lingnan.pojo.Staff;
import cn.lingnan.services.MenuService;
import cn.lingnan.services.StaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;


@Controller
@RequestMapping("/Menu")
public class MenuController {

    private MenuService menuService;
    @Autowired
    public void setMenuService(MenuService menuService) {
        this.menuService = menuService;
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addMenu(String name, String category, Integer status,Integer price, String picture){
        System.out.println("add a menu:::name:::" + name + ", category" + category + ", staus" + status + ", price" + price + ", picture" + picture);
        Menu menu=new Menu();
        menu.setMenuName(name);
        menu.setMenuCategory(category);
        menu.setMenuStatus(status);
        menu.setPrice(price);
        menu.setPicture(picture);
        if(menuService.add(menu)){
            return "success";
        }
        else return "forward:../add.jsp";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String deleteMenu(Integer id){
        System.out.println("delete a menu:::id:::" + id);
        Menu menu=new Menu();
        menu.setMenuId(id);
        if(menuService.delete(menu)){
            return "success";
        }
        else return "forward:../delete.jsp";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String updateMenu(String name, String category, Integer status,Integer price, String picture){
        System.out.println("update a menu:::name:::" + name + ", category" + category + ", staus" + status + ", price" + price + ", picture" + picture);
        Menu menu=new Menu();
        menu.setMenuName(name);
        menu.setMenuCategory(category);
        menu.setMenuStatus(status);
        menu.setPrice(price);
        menu.setPicture(picture);
        if(menuService.update(menu)){
            return "success";
        }
        else return "forward:../update.jsp";
    }

    @GetMapping("/getListJson")
    @ResponseBody
    public List<Menu> getListJson () {
        System.out.println("getListJson");
        return menuService.queryAll();
    }
}
