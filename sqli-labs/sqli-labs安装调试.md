## sqli-labs安装 ##
在

注意此处的mysql的版本过高需要使用高版本的重置版





<br	>




参数的传递

sql语句

参数的传递恶意的代码写入sql语句中，对其产生危害



## php语言

定义id变量


	$id=$_GET['id'];

寻找id变量

	$sql="SELECT * FROM users WHERE id='$id' LIMIT 0,1";
