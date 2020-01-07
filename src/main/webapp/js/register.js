function check(){
    if (form.Email.value==""){
        alert("Email不能为空！")
        form.Email.focus();
        return false;
    }
    if (form.Phone.value == ""){
        alert("电话号码不能为空！")
        form.Phone.focus();
        return false;
    }
    var regm=/^[a-z0-9]+$/;//小写字母+数字
    if(form.customerName.value==""||!form.customerName.value.match(regm)){
        alert("用户名格式不对，检查后重新输入！\n（只能输入小写字母或数字！)");
        form.customerName.focus();
        return false;
    }

    if (form.customerPassword1.value==""){
        alert("密码不能为空！")
        form.customerPassword1.focus();
        return false;
    }
    if (form.customerPassword2.value==""){
        alert("请再次输入密码！")
        form.customerPassword2.focus();
        return false;
    }
    if (form.customerPassword2.value!=form.customerPassword1.value){
        alert("两次输入的密码不一致！")
        form.customerPassword2.focus();
        return false;
    }

}