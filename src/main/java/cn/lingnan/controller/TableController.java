package cn.lingnan.controller;


import cn.lingnan.pojo.Table;
import cn.lingnan.services.TableService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
        return "forward:../tgls/table/table_add.jsp";
    }

    @GetMapping("/dalete")
    public String delete (Integer tableId,Model model){
        System.out.println("table,tableId:"+tableId);
        model.addAttribute("tableId",tableId);
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
        if(tableService.getByName(tableName).equals(""))
        {

            System.out.println(tableService.add(table));
        }
        else {
            model.addAttribute("msg", "information error!");
        }

        return "forward:../tgls/table/table_list.jsp";

    }
}
