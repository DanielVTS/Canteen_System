package cn.lingnan.pojo;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import javax.validation.constraints.Pattern;
import java.util.Date;

@Component("table")
public class Table {
    private Integer tableId;
    private String tableName;
    private String tableSeat;
    private Integer tableStatus;
    @Pattern(regexp = "^1([358][0-9]|4[579]|66|7[0135678]|9[89])[0-9]{8}$", message = "手机号码不正确")
    private String phone;
    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    private Date tableTime;

    public Table(){

    }

    public Table(Integer tableId, String tableName, String tableSeat, Integer tableStatus, @Pattern(regexp = "^1([358][0-9]|4[579]|66|7[0135678]|9[89])[0-9]{8}$", message = "手机号码不正确") String phone, Date tableTime) {
        this.tableId = tableId;
        this.tableName = tableName;
        this.tableSeat = tableSeat;
        this.tableStatus = tableStatus;
        this.phone = phone;
        this.tableTime = tableTime;
    }

    public Integer getTableId() {
        return tableId;
    }

    public void setTableId(Integer tableId) {
        this.tableId = tableId;
    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public String getTableSeat() {
        return tableSeat;
    }

    public void setTableSeat(String tableSeat) {
        this.tableSeat = tableSeat;
    }

    public Integer getTableStatus() {
        return tableStatus;
    }

    public void setTableStatus(Integer tableStatus) {
        this.tableStatus = tableStatus;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getTableTime() {
        return tableTime;
    }

    public void setTableTime(Date tableTime) {
        this.tableTime = tableTime;
    }
}
