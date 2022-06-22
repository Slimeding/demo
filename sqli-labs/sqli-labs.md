
# sqli-labs
<hr>
## 1.注入的分类 ##


### 1.基于从服务器接收到的响应

+ 基于错误的 SQL 注入

+ 联合查询的类型

+ 堆查询注射

+ SQL 盲注

	+ 基于布尔 SQL 盲注

	+ 基于时间的 SQL 盲注

	+ 基于报错的 SQL 盲注


### 2.基于如何处理输入的 SQL 查询（数据类型） ###
+ 基于字符串
+ 数字或整数为基础的


### 3.基于程度和顺序的注入(哪里发生了影响) ###
★一阶注射

★二阶注射

一阶注射是指输入的注射语句对 WEB 直接产生了影响，出现了结果；

二阶注入类似存储型 XSS，是指输入提交的语句，无法直接对 WEB 应用程序产生影响，通过其它的辅助间
接的对 WEB 产生危害，这样的就被称为是二阶注入.
### 4.基于注入点的位置上的 ###
▲通过用户输入的表单域的注射。

▲通过 cookie 注射。

▲通过服务器变量注射。（基于头部信息的注射）



### 函数
1. 
`version()`  ——MySQL 版本
2. `user()`  ——数据库用户名
3. `database()`——数据库名
4. `@@datadir`——数据库路径
5. `@@version_compile_os`   ——操作系统版本



**<a src="https://www.cnblogs.com/lcamry/p/5715634.html">sql的三大函数</a>**


1. concat(str1,str2,...)——没有分隔符地连接字符串
2. concat_ws(separator,str1,str2,...)——含有分隔符地连接字符串
3. group_concat(str1,str2,...)——连接一个组的所有字符串，并以逗号分隔每一条数据




#### 一般用于尝试的语句
Ps:--+可以用#替换，url 提交过程中 Url 编码后的#为%23

or 1=1--+

'or 1=1--+

"or 1=1--+

)or 1=1--+

')or 1=1--+

") or 1=1--+

"))or 1=1--+

一般的代码为：
$id=$_GET['id'];
$sql="SELECT * FROM users WHERE id='$id' LIMIT 0,1";
此处考虑两个点，一个是闭合前面你的 ‘
另一个是处理后面的
‘
，一般采用两种思
路，闭合后面的引号或者注释掉，注释掉采用--+ 或者 #（%23）








<hr>




## 盲注 ##

+ 基于布尔 SQL 盲注
+ 基于时间的 SQL 盲注
+ 基于报错的 SQL 盲注


### 布尔 ###
三大函数

mid(),substr(),left()

#### mid() ####

mid(str,start,lengh)
start 开始的位置  （min start = 1)

lengh = 返回字段的数量

str = "asdfg"

mid(str,2,1)



mid(database(),1,1)>'a'
查看第一位的字符

mid(database(),2,1)>'a'
第二位


> MID((SELECT table_name FROM INFORMATION_SCHEMA.TABLES WHERE T table_schema=0xxxxxxx LIMIT 0,1),1,1)>’a’此处column_name参数可以为sql语句，可自行构造sql语句进行注入

### substr()

截取字符串
substr(str,2,1)


截取自字符串


### left() ###
Left()得到字符串左部指定个数的字符

Left ( string, n )        string为要截取的字符串，n为长度。

str,2  截取前两位


ord asc||