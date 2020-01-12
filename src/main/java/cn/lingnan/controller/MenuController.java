package cn.lingnan.controller;

import cn.lingnan.pojo.Customer;
import cn.lingnan.pojo.Menu;
import cn.lingnan.pojo.Staff;
import cn.lingnan.services.MenuService;
import cn.lingnan.services.StaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@Controller
@RequestMapping("/menu")
public class MenuController {

    private MenuService menuService;
    @Autowired
    public void setMenuService(MenuService menuService) {
        this.menuService = menuService;
    }



    @RequestMapping(value = "/search",method = RequestMethod.POST)
//    @ResponseBody
    public String search (Menu menu,Model model) {
        System.out.println(menu);
        String menuName=menu.getMenuName();
        String menuCategory=menu.getMenuCategory();

        System.out.println(menuName);
        System.out.println(menuCategory);
        model.addAttribute("locationurl","/menu/searchList");
        model.addAttribute("menuName",menuName);
        model.addAttribute("menuCategory",menuCategory);

        return "forward:../tgls/menu/menu_list.jsp";
    }





    @RequestMapping(value = "/getMenuList",method = RequestMethod.POST)
        @ResponseBody

    public List<Menu> getMenuList () {
        System.out.println("queryMenu");
       return menuService.queryAll();


    }

    @RequestMapping(value = "/searchList",method = RequestMethod.POST)
        @ResponseBody
    public List<Menu> searchList (String menuName,String menuCategory,Model model) {
        if(menuName.equals("")) {
            menuName = null;
        }
        if(menuCategory.equals("")) {
            menuCategory = null;
        }
        System.out.println("searchList");
        Menu menu=new Menu();
        menu.setMenuName(menuName);
        menu.setMenuCategory(menuCategory);
        System.out.println(menu);
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
