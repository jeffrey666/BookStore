

/*注册表单的js校验*/
function checkForm(){
	//>>非空校验
	var res1=checkNull("bookName","书籍名称不能为空");
	var res2=checkNull("bookInfo.author","书籍作者不能为空");
	var res3=checkNull("bookInfo.bookPub","书籍出版社不能为空");
	var res4=checkNull("bookInfo.pubDate","书籍出版日期不能为空");
	var res5=checkNull("picFile","上传图片不能为空!");
	return res4 && res1 && res2 && res3 && res5;

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
