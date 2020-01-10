package cn.lingnan.controller;


import cn.lingnan.pojo.Customer;
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

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addStaff(String name, String password){
        System.out.println("add a staff:::name:::" + name + ", password" + password);
        Staff staff=new Staff();
        staff.setStaffName(name);
        staff.setStaffPassword(password);
        if(staffService.add(staff)){
            return "success";
        }
        else return "forward:../add.jsp";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String deleteStaff(Integer id){
        System.out.println("delete a staff:::id:::" + id);
        Staff staff=new Staff();
        staff.setStaffId(id);
        if(staffService.delete(staff)){
            return "success";
        }
        else return "forward:../delete.jsp";
    }

//    @RequestMapping(value = "/update", method = RequestMethod.POST)
//    public String updateStaff(String name, String password){
//        System.out.println("update a staff:::name:::" + name +",password:::" + password);
//        Staff staff=new Staff();
//        staff.setStaffName(name);
//        staff.setStaffPassword(password);
//        if(staffService.update(staff)){
//            return "success";
//        }
//        else return "forward:../update.jsp";
//    }

//    @RequestMapping(value = "/queryAll")
//    public String queryAllStaff(){
//        System.out.println("queryAll staff");
//        staffService.queryAll();
//    }

    @GetMapping("/getStaffList")
    @ResponseBody
    public List<Staff> getStaff () {
        System.out.println("getStaff");
        return staffService.queryAll();
    }




    @GetMapping("/update")
    public String update (String staffId, Model model){
        System.out.println("staff,staffId:"+staffId);
        model.addAttribute("staffId",staffId);
        return "forward:../tgls/staff/staff_add.jsp";
    }
    @RequestMapping(value = "/updateForm",method = RequestMethod.GET)
    public String updateForm (Staff staff,String staffId,Model model){
        System.out.println("updateFrom");
        System.out.println(staffId);
        System.out.println(staff.toString());
        return "success";
    }


}
