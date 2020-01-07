function allcheck(){
	var oBtn1 =document.getElementById('btn1');
	var oCheck=document.getElementsByName('check');
	for(var i=0;i<oCheck.length;i++){
		oCheck[i].checked=true;
	}		
}

function delAll(){
	var allmixId=new Array();
	var flag=false;
	var oCheck=document.getElementsByName('check');
	for(var i=0;i<oCheck.length;i++){
		if(oCheck[i].checked){
			allmixId.push(oCheck[i].value);
			flag=true;
		} 
		
	}
	if(flag){
		if(confirm("确认删除?")){
			location.href="deleteAttendTime?mixId="+allmixId;
		}else;
	}else{
		alert("至少选择一条记录！");
	}
}