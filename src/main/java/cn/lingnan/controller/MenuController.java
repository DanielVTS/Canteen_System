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



    @GetMapping("/search")
//    @ResponseBody
    public String search (Menu menu,Model model) {
        System.out.println(menu);
        model.addAttribute("menu", menu);
        return "forward:../tgls/menu/menu_list.jsp";
    }



    @RequestMapping(value="/getMenuList",method = RequestMethod.POST)
    @ResponseBody
    public List<Menu> getMenuList (String menuName,String menuCategory, Model model) {
        System.out.println("getMenuList");
        System.out.println(menuName);
        System.out.println(menuCategory);
        if(menuName.equals("") && menuCategory.equals(""))
        {
            return menuService.queryAll();
        }
        Menu menu=new Menu();
        menu.setMenuName(menuName);
        menu.setMenuCategory(menuCategory);
        return menuService.query(menu);


    }

//    @GetMapping("/getMenuList")
//    @ResponseBody
//    public List<Menu> getListJson () {
//        System.out.println("getListJson");
//        return menuService.queryAll();
//    }

    @GetMapping("/update")
//    @ResponseBodyp
    public String update (Integer menuId, Model model) {
        System.out.println("menu,menuId:"+menuId);
        model.addAttribute("menuId", menuId);
        return "forward:../tgls/menu/menu_update.jsp";
    }


    @GetMapping("/delete")
//    @ResponseBody
    public String delete (Integer menuId,Model model) {
        System.out.println("menu,menuId:"+menuId);
        model.addAttribute("menuId", menuId);
        menuService.delete(menuId);
        return "forward:../tgls/menu/menu_list.jsp";
    }

    @GetMapping("/up")
//    @ResponseBody
    public String up (Integer menuId,Model model) {
        System.out.println("menu,menuId:"+menuId);
        model.addAttribute("menuId", menuId);
        Menu menu=menuService.getById(menuId);
        menu.setMenuStatus(1);
        menuService.update(menu);
        return "forward:../tgls/menu/menu_list.jsp";

    }
    @GetMapping("/down")
//    @ResponseBody
    public String down (Integer menuId,Model model) {
        System.out.println("menu,menuId:"+menuId);
        model.addAttribute("menuId", menuId);
        Menu menu=menuService.getById(menuId);
        menu.setMenuStatus(2);
        menuService.update(menu);
        return "forward:../tgls/menu/menu_list.jsp";
    }



    @RequestMapping(value = "/updateForm", method = RequestMethod.GET)
    public String updateForm (Menu menu, Integer menuId, Model model) {
        System.out.println("updateForm");
        System.out.println(menuId);
        System.out.println(menu.toString());
        System.out.println(menuService.update(menu));
        return "forward:../tgls/menu/menu_list.jsp";

    }

    @RequestMapping(value = "/addForm", method = RequestMethod.GET)
    public String addForm (Menu menu, Integer menuId, Model model) {
        System.out.println("addForm");
        System.out.println(menuId);
        System.out.println(menu.toString());
        String menuName=menu.getMenuName();
        if(menuService.getByName(menuName)==null)
        {

            System.out.println(menuService.add(menu));
        }
        else {
            model.addAttribute("msg", "information error!");
        }

        return "forward:../tgls/menu/menu_list.jsp";

    }



}
