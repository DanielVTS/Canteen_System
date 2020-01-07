package cn.lingnan.services.Impl;

import cn.lingnan.mapper.StaffMapper;
import cn.lingnan.mapper.TableMapper;
import cn.lingnan.pojo.Menu;
import cn.lingnan.pojo.Table;
import cn.lingnan.services.TableService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("tableService")
public class TableServiceImpl implements TableService {

    private TableMapper tableMapper;

    @Override
    public Table getById(Integer tableId) {
        return tableMapper.getById(tableId);
    }

    @Override
    public Table getByName(String tableName) {
        return tableMapper.getByName(tableName);
    }

    @Override
    public Table getBySeat(String tableSeat) {
        return tableMapper.getBySeat(tableSeat);
    }

    @Override
    public Table getByStaus(String tableStaus) {
        return tableMapper.getByStaus(tableStaus);
    }

    @Override
    public List<Table> query(Table table) {
        return tableMapper.query(table);
    }

    @Override
    public List<Table> queryAll() {
        return tableMapper.queryAll();
    }

    @Override
    public boolean add(Table table) {
        return tableMapper.add(table);
    }

    @Override
    public boolean delete(Table table) {
        return tableMapper.delete(table);
    }

    @Override
    public boolean update(Table table) {
        return tableMapper.update(table);
    }
}
