function check(){
    if (form.sId.value==""){
        alert("学生ID不能为空！")
        form.sId.focus();
        return false;
    }
    if (form.sName.value==""){
        alert("学生名不能为空！")
        form.sName.focus();
        return false;
    }
    var regm=/^[a-z0-9]+$/;//小写字母+数字
    if(form.sName.value!=""&&!form.sName.value.match(regm)){
        alert("学生名格式不对，检查后重新输入！");
        form.sName.focus();
        return false;
    }
    if (form.sPassword1.value==""){
        alert("密码不能为空！")
        form.sPassword1.focus();
        return false;
    }
    if (form.sPassword2.value==""){
        alert("请再次输入密码！")
        form.sPassword2.focus();
        return false;
    }
    if (form.sPassword2.value!=form.sPassword1.value){
        alert("两次输入的密码不一致！")
        form.sPassword2.focus();
        return false;
    }

}