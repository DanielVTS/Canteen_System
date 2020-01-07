package cn.lingnan.pojo;

import org.hibernate.validator.constraints.Length;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.util.Date;

@Component("staff")
public class Staff {
private Integer staffId;
@NotNull(message = "用户名不能为空")
@Length(message = "用户名长度必须{min}-{max}在之间", max = 20, min = 4)
private String staffName;
@NotNull(message = "密码不能为空")
@Size(min = 6, message = "密码长度不能小于{min}")
private String staffPassword;

    public Staff() {

    }

    public Staff(Integer staffId, @NotNull(message = "用户名不能为空") @Length(message = "用户名长度必须{min}-{max}在之间", max = 20, min = 4) String staffName, @NotNull(message = "密码不能为空") @Size(min = 6, message = "密码长度不能小于{min}") String staffPassword) {
        this.staffId = staffId;
        this.staffName = staffName;
        this.staffPassword = staffPassword;
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

    public String getStaffPassword() {
        return staffPassword;
    }

    public void setStaffPassword(String staffPassword) {
        this.staffPassword = staffPassword;
    }

    @Override
    public String toString() {
        return "Staff{" +
                "staffId=" + staffId +
                ", staffName='" + staffName + '\'' +
                ", staffPassword='" + staffPassword + '\'' +
                '}';
    }
}
