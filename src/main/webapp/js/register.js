function check(){
	if (form.sId.value==""){
		alert("ѧ��ID����Ϊ�գ�")
		form.sId.focus();
		return false;
	}
	if (form.sName.value==""){
		alert("ѧ��������Ϊ�գ�")
		form.sName.focus();
		return false;
	}
	var regm=/^[a-z0-9]+$/;//Сд��ĸ+����
	if(form.sName.value!=""&&!form.sName.value.match(regm)){
		alert("ѧ������ʽ���ԣ������������룡");
		form.sName.focus();
		return false;
	}
	if (form.sPassword1.value==""){
		alert("���벻��Ϊ�գ�")
		form.sPassword1.focus();
		return false;
	}
	if (form.sPassword2.value==""){
		alert("���ٴ��������룡")
		form.sPassword2.focus();
		return false;
	}
	if (form.sPassword2.value!=form.sPassword1.value){
		alert("������������벻һ�£�")
		form.sPassword2.focus();
		return false;
	}
	
}