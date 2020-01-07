package cn.lingnan.mapper;

import cn.lingnan.pojo.Menu;
import cn.lingnan.pojo.Table;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface TableMapper {
    Table getById(Integer tableId);
    Table getByName(String tableName);
    Table getBySeat(String tableSeat);
    Table getByStaus(String tableStaus);
    List<Table> query(Table table);
    List<Table> queryAll();
    boolean add(Table table);
    boolean delete(Table table);
    boolean update(Table table);
}
