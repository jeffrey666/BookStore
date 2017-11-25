

/*注册表单的js校验*/
function checkForm(){
	//>>非空校验
	var res1=checkNull("bookName","书籍名称不能为空");
	var res2=checkNull("bookAuthor","书籍作者不能为空");
	var res3=checkNull("press","书籍出版社不能为空");
	var res4=checkNull("createTime","书籍出版日期不能为空");
	
	
	return res1 && res2 && res3 && res4 ;
}


/*检查输入项是否为空*/
function checkNull(name,msg){
	var value=$("input=[name='"+name+"']").val().trim();
	//清空上一次的提示消息
	setMsg(name,"");
	if(value==""){
		//alert(msg);
		setMsg(name,msg);
		return false;
	}
	return true;
}
/*在校验失败时，设置错误提示消息*/
function setMsg(name,msg){
	var $oInp=$("input=[name='"+name+"']");
	var $oSpan=$oInp.nextAll("span");
	$oSpan.html(msg);
	$oSpan.css("color","red");
}





//文档就绪事件,在整个html文档加载完之后立即执行
$(function(){
	
});
