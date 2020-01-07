package cn.lingnan.pojo;


import org.hibernate.validator.constraints.Length;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import javax.validation.constraints.*;
import java.util.Date;
@Component("customer")
public class Customer {
    private Integer customerId;
    @NotNull(message = "用户名不能为空")
    @Length(message = "用户名长度必须{min}-{max}在之间", max = 20, min = 4)
    private String customerName;
    @Pattern(regexp = "^1([358][0-9]|4[579]|66|7[0135678]|9[89])[0-9]{8}$", message = "手机号码不正确")
    private String customerPhone;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Past(message = "生日日期不对")
    private Date customerBrithday;
    private String customerAge;
    private String customerGender;
    @Email(message = "邮箱格式不对")
    private String customerEmail;
    private String customerLocation;
    private Integer customerIntegrate;
    private String customerRank;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date customerRegister;
    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    private Date customerLastLogin;
    @NotNull(message = "密码不能为空")
    @Size(min = 6, message = "密码长度不能小于{min}")
    private String customerPassword;

    public Customer() {
    }

    public Customer(Integer customerId, String customerName, String customerPhone, Date customerBrithday, String customerAge, String customerGender, String customerEmail, String customerLocation, Integer customerIntegrate, String customerRank, Date customerRegister, Date customerLastLogin, String customerPassword) {
        this.customerId = customerId;
        this.customerName = customerName;
        this.customerPhone = customerPhone;
        this.customerBrithday = customerBrithday;
        this.customerAge = customerAge;
        this.customerGender = customerGender;
        this.customerEmail = customerEmail;
        this.customerLocation = customerLocation;
        this.customerIntegrate = customerIntegrate;
        this.customerRank = customerRank;
        this.customerRegister = customerRegister;
        this.customerLastLogin = customerLastLogin;
        this.customerPassword = customerPassword;
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

    public String getCustomerPhone() {
        return customerPhone;
    }

    public void setCustomerPhone(String customerPhone) {
        this.customerPhone = customerPhone;
    }

    public Date getCustomerBrithday() {
        return customerBrithday;
    }

    public void setCustomerBrithday(Date customerBrithday) {
        this.customerBrithday = customerBrithday;
    }

    public String getCustomerAge() {
        return customerAge;
    }

    public void setCustomerAge(String customerAge) {
        this.customerAge = customerAge;
    }

    public String getCustomerGender() {
        return customerGender;
    }

    public void setCustomerGender(String customerGender) {
        this.customerGender = customerGender;
    }

    public String getCustomerEmail() {
        return customerEmail;
    }

    public void setCustomerEmail(String customerEmail) {
        this.customerEmail = customerEmail;
    }

    public String getCustomerLocation() {
        return customerLocation;
    }

    public void setCustomerLocation(String customerLocation) {
        this.customerLocation = customerLocation;
    }

    public Integer getCustomerIntegrate() {
        return customerIntegrate;
    }

    public void setCustomerIntegrate(Integer customerIntegrate) {
        this.customerIntegrate = customerIntegrate;
    }

    public String getCustomerRank() {
        return customerRank;
    }

    public void setCustomerRank(String customerRank) {
        this.customerRank = customerRank;
    }

    public Date getCustomerRegister() {
        return customerRegister;
    }

    public void setCustomerRegister(Date customerRegister) {
        this.customerRegister = customerRegister;
    }

    public Date getCustomerLastLogin() {
        return customerLastLogin;
    }

    public void setCustomerLastLogin(Date customerLastLogin) {
        this.customerLastLogin = customerLastLogin;
    }

    public String getCustomerPassword() {
        return customerPassword;
    }

    public void setCustomerPassword(String customerPassword) {
        this.customerPassword = customerPassword;
    }

    @Override
    public String toString() {
        return "Customer{" +
                "customerId=" + customerId +
                ", customerName='" + customerName + '\'' +
                ", customerPhone='" + customerPhone + '\'' +
                ", customerBrithday=" + customerBrithday +
                ", customerAge='" + customerAge + '\'' +
                ", customerGender='" + customerGender + '\'' +
                ", customerEmail='" + customerEmail + '\'' +
                ", customerLocation='" + customerLocation + '\'' +
                ", customerIntegrate=" + customerIntegrate +
                ", customerRank='" + customerRank + '\'' +
                ", customerRegister=" + customerRegister +
                ", customerLastLogin='" + customerLastLogin + '\'' +
                ", customerPassword='" + customerPassword + '\'' +
                '}';
    }
}

