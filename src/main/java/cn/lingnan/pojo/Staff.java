package cn.lingnan.pojo;

import org.hibernate.validator.constraints.Length;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.util.Date;

public class Staff {
private Integer staffId;
@NotNull(message = "用户名不能为空")
@Length(message = "用户名长度必须{min}-{max}在之间", max = 20, min = 4)
private String staffName;
@Pattern(regexp = "^1([35789][0-9]|4[579]|66|7[0135678]|9[89])[0-9]{8}$", message = "手机号码不正确")
private String staffPhone;
@DateTimeFormat(pattern = "yyyy-MM-dd")
@Past(message = "生日日期不对")
private Date staffBirthday;
private Integer staffAge;
private String staffGender;
private String staffPosition;
@DateTimeFormat(pattern = "yyyy-MM-dd")
private Date staffRegister;
private Integer staffSalary;
@NotNull(message = "密码不能为空")
@Size(min = 6, message = "密码长度不能小于{min}")
private String staffPassword;

    public Staff() {

    }

    public Integer getStaffId() {
        return staffId;
    }

    public void setStaffId(Integer staffId) {
        this.staffId = staffId;
    }

    public String getStaffName() {
        return staffName;
    }

    public void setStaffName(String staffName) {
        this.staffName = staffName;
    }

    public String getStaffPhone() {
        return staffPhone;
    }

    public void setStaffPhone(String staffPhone) {
        this.staffPhone = staffPhone;
    }

    public Date getStaffBirthday() {
        return staffBirthday;
    }

    public void setStaffBirthday(Date staffBirthday) {
        this.staffBirthday = staffBirthday;
    }

    public Integer getStaffAge() {
        return staffAge;
    }

    public void setStaffAge(Integer staffAge) {
        this.staffAge = staffAge;
    }

    public String getStaffGender() {
        return staffGender;
    }

    public void setStaffGender(String staffGender) {
        this.staffGender = staffGender;
    }

    public String getStaffPosition() {
        return staffPosition;
    }

    public void setStaffPosition(String staff_position) {
        this.staffPosition = staff_position;
    }

    public Date getStaffRegister() {
        return staffRegister;
    }

    public void setStaffRegister(Date staffRegister) {
        this.staffRegister = staffRegister;
    }

    public Integer getStaffSalary() {
        return staffSalary;
    }

    public void setStaffSalary(Integer staffSalary) {
        this.staffSalary = staffSalary;
    }

    public String getStaffPassword() {
        return staffPassword;
    }

    public void setStaffPassword(String staffPassword) {
        this.staffPassword = staffPassword;
    }

    public Staff(Integer staffId, @NotNull(message = "用户名不能为空") @Length(message = "用户名长度必须{min}-{max}在之间", max = 20, min = 4) String staffName, @Pattern(regexp = "^1([35789][0-9]|4[579]|66|7[0135678]|9[89])[0-9]{8}$", message = "手机号码不正确") String staffPhone, @Past(message = "生日日期不对") Date staffBirthday, Integer staffAge, String staffGender, String staff_position, Date staffRegister, Integer staffSalary, @NotNull(message = "密码不能为空") @Size(min = 6, message = "密码长度不能小于{min}") String staffPassword) {
        this.staffId = staffId;
        this.staffName = staffName;
        this.staffPhone = staffPhone;
        this.staffBirthday = staffBirthday;
        this.staffAge = staffAge;
        this.staffGender = staffGender;
        this.staffPosition = staff_position;
        this.staffRegister = staffRegister;
        this.staffSalary = staffSalary;
        this.staffPassword = staffPassword;
    }

    @Override
    public String toString() {
        return "Staff{" +
                "staffId=" + staffId +
                ", staffName='" + staffName + '\'' +
                ", staffPhone='" + staffPhone + '\'' +
                ", staffBirthday=" + staffBirthday +
                ", staffAge=" + staffAge +
                ", staffGender='" + staffGender + '\'' +
                ", staff_position='" + staffPosition + '\'' +
                ", staffRegister=" + staffRegister +
                ", staffSalary=" + staffSalary +
                ", staffPassword='" + staffPassword + '\'' +
                '}';
    }
}
