package cn.lingnan.pojo;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class OrderItem {
    private  Integer id;
    private  String orderNo;
    private  Integer menuId;
    private  String menuName;
    private  Integer price;
    private  Integer quantity;
    private  Double totalPrice;
    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    private Date tableTime;
    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    private Date endTime;

    public OrderItem() {
    }

    public OrderItem(Integer id, String orderNo, Integer menuId, String menuName, Integer price, Integer quantity, Double totalPrice, Date tableTime, Date endTime) {
        this.id = id;
        this.orderNo = orderNo;
        this.menuId = menuId;
        this.menuName = menuName;
        this.price = price;
        this.quantity = quantity;
        this.totalPrice = totalPrice;
        this.tableTime = tableTime;
        this.endTime = endTime;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

    public Integer getMenuId() {
        return menuId;
    }

    public void setMenuId(Integer menuId) {
        this.menuId = menuId;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Double totalPrice) {
        this.totalPrice = totalPrice;
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

    @Override
    public String toString() {
        return "OrderItem{" +
                "id=" + id +
                ", orderNo='" + orderNo + '\'' +
                ", menuId=" + menuId +
                ", menuName='" + menuName + '\'' +
                ", price=" + price +
                ", quantity=" + quantity +
                ", totalPrice=" + totalPrice +
                ", tableTime=" + tableTime +
                ", endTime=" + endTime +
                '}';
    }
}
