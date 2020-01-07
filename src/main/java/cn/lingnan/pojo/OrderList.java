package cn.lingnan.pojo;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import javax.validation.constraints.Pattern;
import java.util.Date;

@Component("orderlist")
public class OrderList {
    private Integer orderId;
    private String orderNo;
    private Integer customerId;
    private String customerName;
    @Pattern(regexp = "^1([358][0-9]|4[579]|66|7[0135678]|9[89])[0-9]{8}$", message = "手机号码不正确")
    private String phone;
    private Integer tableId;
    private Integer tableName;
    private Integer orderStatus;
    private double orderPrice;
    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    private Date tableTime;
    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    private Date endTime;
    private String ps;

    public OrderList() {
    }

    public OrderList(Integer orderId, String orderNo, Integer customerId, String customerName, @Pattern(regexp = "^1([358][0-9]|4[579]|66|7[0135678]|9[89])[0-9]{8}$", message = "手机号码不正确") String phone, Integer tableId, Integer tableName, Integer orderStatus, double orderPrice, Date tableTime, Date endTime, String ps) {
        this.orderId = orderId;
        this.orderNo = orderNo;
        this.customerId = customerId;
        this.customerName = customerName;
        this.phone = phone;
        this.tableId = tableId;
        this.tableName = tableName;
        this.orderStatus = orderStatus;
        this.orderPrice = orderPrice;
        this.tableTime = tableTime;
        this.endTime = endTime;
        this.ps = ps;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

    public Integer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Integer getTableId() {
        return tableId;
    }

    public void setTableId(Integer tableId) {
        this.tableId = tableId;
    }

    public Integer getTableName() {
        return tableName;
    }

    public void setTableName(Integer tableName) {
        this.tableName = tableName;
    }

    public Integer getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(Integer orderStatus) {
        this.orderStatus = orderStatus;
    }

    public double getOrderPrice() {
        return orderPrice;
    }

    public void setOrderPrice(double orderPrice) {
        this.orderPrice = orderPrice;
    }

    public Date getTableTime() {
        return tableTime;
    }

    public void setTableTime(Date tableTime) {
        this.tableTime = tableTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public String getPs() {
        return ps;
    }

    public void setPs(String ps) {
        this.ps = ps;
    }

    @Override
    public String toString() {
        return "OrderList{" +
                "orderId=" + orderId +
                ", orderNo='" + orderNo + '\'' +
                ", customerId=" + customerId +
                ", customerName='" + customerName + '\'' +
                ", phone='" + phone + '\'' +
                ", tableId=" + tableId +
                ", tableName=" + tableName +
                ", orderStatus=" + orderStatus +
                ", orderPrice=" + orderPrice +
                ", tableTime=" + tableTime +
                ", endTime=" + endTime +
                ", ps='" + ps + '\'' +
                '}';
    }
}
