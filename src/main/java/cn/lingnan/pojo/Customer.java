package cn.lingnan.pojo;


import com.fasterxml.jackson.annotation.JsonFormat;
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
    private String phone;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Past(message = "生日日期不对")
    private Date birthday;
    @Email(message = "邮箱格式不对")
    private String email;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")
    private Date registerTime;
    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    @JsonFormat(pattern="yyyy-MM-dd hh:mm:ss",timezone = "GMT+8")
    private Date loginTime;
    @NotNull(message = "密码不能为空")
    @Size(min = 6, message = "密码长度不能小于{min}")
    private String customerPassword;

    public Customer() {

    }

    public Customer(Integer customerId, @NotNull(message = "用户名不能为空") @Length(message = "用户名长度必须{min}-{max}在之间", max = 20, min = 4) String customerName, @Pattern(regexp = "^1([358][0-9]|4[579]|66|7[0135678]|9[89])[0-9]{8}$", message = "手机号码不正确") String phone, @Past(message = "生日日期不对") Date birthday, @Email(message = "邮箱格式不对") String email, Date registerTime, Date loginTime, @NotNull(message = "密码不能为空") @Size(min = 6, message = "密码长度不能小于{min}") String customerPassword) {
        this.customerId = customerId;
        this.customerName = customerName;
        this.phone = phone;
        this.birthday = birthday;
        this.email = email;
        this.registerTime = registerTime;
        this.loginTime = loginTime;
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getRegisterTime() {
        return registerTime;
    }

    public void setRegisterTime(Date registerTime) {
        this.registerTime = registerTime;
    }

    public Date getLoginTime() {
        return loginTime;
    }

    public void setLoginTime(Date loginTime) {
        this.loginTime = loginTime;
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
                ", phone='" + phone + '\'' +
                ", birthday=" + birthday +
                ", email='" + email + '\'' +
                ", registerTime=" + registerTime +
                ", loginTime=" + loginTime +
                ", customerPassword='" + customerPassword + '\'' +
                '}';
    }
}

