package cn.lingnan.controller;

import cn.lingnan.pojo.Customer;
import cn.lingnan.pojo.Menu;
import cn.lingnan.pojo.Staff;
import cn.lingnan.services.MenuService;
import cn.lingnan.services.StaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;


@Controller
@RequestMapping("/menu")
public class MenuController {

    private MenuService menuService;
    @Autowired
    public void setMenuService(MenuService menuService) {
        this.menuService = menuService;
    }



    @GetMapping("/getMenuList")
    @ResponseBody
    public List<Menu> getListJson () {
        System.out.println("getListJson");
        return menuService.queryAll();
    }

    @GetMapping("/update")
//    @ResponseBodyp
    public String update (Integer menuId, Model model) {
        System.out.println("menu,menuId:"+menuId);
        model.addAttribute("menuId", menuId);
        return "forward:../tgls/customer/menu_update.jsp";
    }


    @GetMapping("/delete")
//    @ResponseBody
    public String delete (Integer menuId,Model model) {
        System.out.println("menu,menuId:"+menuId);
        model.addAttribute("menuId", menuId);
        menuService.delete(menuId);
        return "forward:../tgls/customer/customer_list.jsp";
    }



    @RequestMapping(value = "/updateForm", method = RequestMethod.GET)
    public String updateForm (Menu menu, Integer menuId, Model model) {
        System.out.println("updateForm");
        System.out.println(menuId);
        System.out.println(menu.toString());
        System.out.println(menuService.update(menu));
        return "forward:../tgls/customer/customer_list.jsp";

    }

    @RequestMapping(value = "/addForm", method = RequestMethod.GET)
    public String addForm (Menu menu, Integer menuId, Model model) {
        System.out.println("addForm");
        System.out.println(menuId);
        System.out.println(menu.toString());
        String menuName=menu.getMenuName();
        if(menuService.getByName(menuName).equals(""))
        {

            System.out.println(menuService.add(menu));
        }
        else {
            model.addAttribute("msg", "information error!");
        }
        
        return "forward:../tgls/customer/customer_list.jsp";

    }



}
