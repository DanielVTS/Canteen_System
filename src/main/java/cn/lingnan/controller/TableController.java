package cn.lingnan.controller;


import cn.lingnan.pojo.Menu;
import cn.lingnan.pojo.Table;
import cn.lingnan.services.TableService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/table")
public class TableController {

    private TableService tableService;
    @Autowired
    private void setTableService(TableService tableService){
        this.tableService = tableService;
    }


    @GetMapping("/getTableList")
    @ResponseBody
    public List<Table> getTableList () {
        System.out.println("getTableList");
        return tableService.queryAll();
    }


    @GetMapping("/update")
    public String update (Integer tableId, Model model){
        System.out.println("table,tableId:"+tableId);
        model.addAttribute("tableId",tableId);
        return "forward:../tgls/table/table_update.jsp";
    }

    @GetMapping("/dalete")
    public String delete (Integer tableId,Model model){
        System.out.println("table,tableId:"+tableId);
        model.addAttribute("tableId",tableId);
        return "forward:../tgls/table/table_list.jsp";
    }

    @GetMapping("/up")
//    @ResponseBody
    public String up (Integer tableId,Model model) {
        System.out.println("table,tableId:"+tableId);
        model.addAttribute("tableId", tableId);
        Table table=tableService.getById(tableId);
        table.setTableStatus(1);
        tableService.update(table);
        return "forward:../tgls/table/table_list.jsp";

    }
    @GetMapping("/down")
//    @ResponseBody
    public String down (Integer tableId,Model model) {
        System.out.println("table,tableId:"+tableId);
        model.addAttribute("tableId", tableId);
        Table table=tableService.getById(tableId);
        table.setTableStatus(2);
        tableService.update(table);
        return "forward:../tgls/table/table_list.jsp";
    }


    @RequestMapping(value = "/updateForm", method = RequestMethod.GET)
    public String updateForm (Table table, Integer tableId, Model model) {
        System.out.println("updateForm");
        System.out.println(tableId);
        System.out.println(table.toString());
        System.out.println(tableService.update(table));
        return "forward:../tgls/table/table_list.jsp";
    }

    @RequestMapping(value = "/addForm", method = RequestMethod.GET)
    public String addForm (Table table, Integer tableId, Model model) {
        System.out.println("addForm");
        System.out.println(tableId);
        System.out.println(table.toString());
        String tableName=table.getTableName();
        if(tableService.getByName(tableName)==null)
        {

            System.out.println(tableService.add(table));
        }
        else {
            model.addAttribute("msg", "information error!");
        }

        return "forward:../tgls/table/table_list.jsp";

    }
    @GetMapping("/chooseTable")
    public String chooseTable (Integer tableId,Integer tableTime, Model model){
        System.out.println("table,tableId:"+tableId);
        System.out.println("table,tableTime:"+tableTime);

        model.addAttribute("tableId",tableId);
        model.addAttribute("tableTime",tableTime);
        return "forward:../tgls/table/table_update.jsp";
    }


    @PostMapping("/customerGetTable")
    public List<Table> customerGetTable(Integer tableId){
        tableService.getById(tableId);
        List<Table> list=new ArrayList<>();
        return list;
    }

}
