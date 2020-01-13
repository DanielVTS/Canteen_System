package cn.lingnan.services;

import cn.lingnan.pojo.Menu;
import cn.lingnan.pojo.Table;

import java.util.List;

public interface TableService {
    Table getById(Integer tableId);
    Table getByName(String tableName);
    Table getBySeat(String tableSeat);
    List<Table> getByStatus(Integer tableStaus);
    List<Table> query(Table table);
    List<Table> queryAll();
    boolean add(Table table);
    boolean delete(Table table);
    boolean update(Table table);
}
