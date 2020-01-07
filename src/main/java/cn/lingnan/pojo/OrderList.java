package cn.lingnan.pojo;

import java.util.Date;

public class OrderList {
    private Integer order_id;
    private String order_no;
    private Integer customer_id;
    private String customer_name;
    private String customer_phone;
    private String customer_location;
    private Integer order_postage;
    private Double order_pay;
    private Integer order_status;
    private Date order_paytime;
    private Date order_opentime;
    private Date order_closetime;

    public OrderList() {
    }

    public OrderList(Integer order_id, String order_no, Integer customer_id, String customer_name, String customer_phone, String customer_location, Integer order_postage, Double order_pay, Integer order_status, Date order_paytime, Date order_opentime, Date order_closetime) {
        this.order_id = order_id;
        this.order_no = order_no;
        this.customer_id = customer_id;
        this.customer_name = customer_name;
        this.customer_phone = customer_phone;
        this.customer_location = customer_location;
        this.order_postage = order_postage;
        this.order_pay = order_pay;
        this.order_status = order_status;
        this.order_paytime = order_paytime;
        this.order_opentime = order_opentime;
        this.order_closetime = order_closetime;
    }

    public Integer getOrder_id() {
        return order_id;
    }

    public void setOrder_id(Integer order_id) {
        this.order_id = order_id;
    }

    public String getOrder_no() {
        return order_no;
    }

    public void setOrder_no(String order_no) {
        this.order_no = order_no;
    }

    public Integer getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(Integer customer_id) {
        this.customer_id = customer_id;
    }

    public String getCustomer_name() {
        return customer_name;
    }

    public void setCustomer_name(String customer_name) {
        this.customer_name = customer_name;
    }

    public String getCustomer_phone() {
        return customer_phone;
    }

    public void setCustomer_phone(String customer_phone) {
        this.customer_phone = customer_phone;
    }

    public String getCustomer_location() {
        return customer_location;
    }

    public void setCustomer_location(String customer_location) {
        this.customer_location = customer_location;
    }

    public Integer getOrder_postage() {
        return order_postage;
    }

    public void setOrder_postage(Integer order_postage) {
        this.order_postage = order_postage;
    }

    public Double getOrder_pay() {
        return order_pay;
    }

    public void setOrder_pay(Double order_pay) {
        this.order_pay = order_pay;
    }

    public Integer getOrder_status() {
        return order_status;
    }

    public void setOrder_status(Integer order_status) {
        this.order_status = order_status;
    }

    public Date getOrder_paytime() {
        return order_paytime;
    }

    public void setOrder_paytime(Date order_paytime) {
        this.order_paytime = order_paytime;
    }

    public Date getOrder_opentime() {
        return order_opentime;
    }

    public void setOrder_opentime(Date order_opentime) {
        this.order_opentime = order_opentime;
    }

    public Date getOrder_closetime() {
        return order_closetime;
    }

    public void setOrder_closetime(Date order_closetime) {
        this.order_closetime = order_closetime;
    }

    @Override
    public String toString() {
        return "OrderList{" +
                "order_id=" + order_id +
                ", order_no='" + order_no + '\'' +
                ", customer_id=" + customer_id +
                ", customer_name='" + customer_name + '\'' +
                ", customer_phone='" + customer_phone + '\'' +
                ", customer_location='" + customer_location + '\'' +
                ", order_postage=" + order_postage +
                ", order_pay=" + order_pay +
                ", order_status=" + order_status +
                ", order_paytime=" + order_paytime +
                ", order_opentime=" + order_opentime +
                ", order_closetime=" + order_closetime +
                '}';
    }
}
