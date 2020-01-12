package cn.lingnan.controller;


import cn.lingnan.pojo.Customer;
import cn.lingnan.pojo.Menu;
import cn.lingnan.pojo.Staff;
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
@RequestMapping("/staff")
public class StaffController {

    private StaffService staffService;
    @Autowired
    public void setStaffService(StaffService staffService) {
        this.staffService = staffService;
    }


    @RequestMapping(value = "/search",method = RequestMethod.POST)
//    @ResponseBody
    public String search (Staff staff,Model model) {
        System.out.println(staff);
        String staffName=staff.getStaffName();
//        String StaffCategory=staff.getStaffCategory();

        System.out.println(staffName);
//        System.out.println(s);
        model.addAttribute("locationurl","/staff/searchList");
        model.addAttribute("staffName",staffName);
//        model.addAttribute("StaffCategory",StaffCategory);
        return "forward:../tgls/staff/staff_list.jsp";
    }



    @RequestMapping(value = "/searchList",method = RequestMethod.POST)
    @ResponseBody
    public List<Staff> searchList (String staffName,Model model) {
        System.out.println(staffName);
        if(staffName.equals("")) {
            staffName = null;
        }
        System.out.println("searchList");
        Staff staff=new Staff();
        staff.setStaffName(staffName);
        System.out.println(staff);
        return staffService.query(staff);


    }




    @RequestMapping(value = "/getStaffList",method = RequestMethod.POST)
    @ResponseBody

    public List<Staff> getStaffList () {
        System.out.println("queryStaff");
        return staffService.queryAll();


    }




    @GetMapping("/update")
    public String update (Integer staffId, Model model){
        System.out.println("staff,staffId:"+staffId);
        model.addAttribute("staffId",staffId);
        return "forward:../tgls/staff/staff_update.jsp";
    }
    @RequestMapping(value = "/updateForm",method = RequestMethod.GET)
    public String updateForm (Staff staff,String staffId,Model model){
        System.out.println("updateFrom");
        System.out.println(staffId);
        System.out.println(staff.toString());
        System.out.println(staffService.update(staff));
        return "forward:../tgls/staff/staff_list.jsp";
    }

    @RequestMapping(value = "/addForm", method = RequestMethod.GET)
    public String addForm (Staff staff, Integer staffId, Model model) {
        System.out.println("addForm");
        System.out.println(staffId);
        System.out.println(staff.toString());
        String staffName=staff.getStaffName();
        if(staffService.getByName(staffName)==null)
        {

            System.out.println(staffService.add(staff));
        }
        else {
            model.addAttribute("msg", "information error!");
        }

        return "forward:../tgls/staff/staff_list.jsp";

    }

}
