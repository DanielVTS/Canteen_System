function allcheck(){
	var oBtn1 =document.getElementById('btn1');
	var oCheck=document.getElementsByName('check');
	for(var i=0;i<oCheck.length;i++){
		oCheck[i].checked=true;
	}		
}

function delAll(){
	var alllId=new Array();
	var flag=false;
	var oCheck=document.getElementsByName('check');
	for(var i=0;i<oCheck.length;i++){
		if(oCheck[i].checked){
			alllId.push(oCheck[i].value);
			flag=true;
		} 
		
	}
	if(flag){
		if(confirm("ȷ��ɾ��?")){
			location.href="deleteLeague?lId="+alllId;
		}else;
	}else{
		alert("����ѡ��һ����¼��");
	}
}