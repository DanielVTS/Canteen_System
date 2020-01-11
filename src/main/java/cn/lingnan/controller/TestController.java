package cn.lingnan.controller;

import cn.lingnan.services.CustomerService;
import cn.lingnan.services.StaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class TestController {


    @Autowired
    private StaffService staffService;

    @GetMapping("/index")
    public String mainPage(){
        return "success";
    }


}
