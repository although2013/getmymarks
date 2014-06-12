#What is it
获取 黑龙江xx大学 的教务处网站上的本学期成绩  
网址写死在了代码中( /res/web_get.rb )  
不然应该差不多可以支持别的 **URP教务系统**  
刚学 Ruby 时写的，代码就惨不忍睹了，  
可以运行
#How to use
- linux:
 - 首先要安装好 Ruby  
 - $ `git clone https://github.com/although2013/getmymarks.git`  
 - $ `cd getmymarks/`  
 - $ `ruby getMyMarks.rb`
- windows:
 - 我不知道，没试过

#Feature
会不重复保存查询过的人  
由于很多同学不修改默认密码，可以遍历全校  
#Renderings
```
ccc-yyy:~/Desktop/get_my_marks$ ruby getMyMarks.rb  
   1  201xxxxxxx XX  
   2  201xxxxxxx XXX  
   3  201xxxxxxx XXXX  
输入上面的序号或者直接输入需要查询的学号:2
输入密码（密码不会显示于屏幕上）:
                       Welcome XXX 201xxxxxxx
 课程号 序号       课程名                 学分     属性    成绩
----------------------------------------------------------------
1301001	01	电路原理                     4.5     必修    83  
2601068	04	体育                        1       必修	88
3901002	02	安全教育                     1       必修	   78
2801003	05	中国近现代史纲要              2       必修	82
2501003	26	大学英语                     4       必修	  68
2701002	01	大学物理实验                 1.5     必修	 79
1303010	01	通信网络基础                 2       选修	 72
1303001	01	学科专业导论                 .5      必修	 68
1301005	01	现代数字逻辑                 3.5     必修	 61
2401016	04	概率论与数理统计              3       必修	76
2401010	07	大学物理                    2       必修	  78
```
