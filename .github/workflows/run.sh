# run.sh
# 切换到jar包目录下
cd /vdb/soft/api
# 杀死之前的项目进程。这里的cut -c9-14是截取进程id，不一定都是-c9-14
# 可以先运行ps -ef|grep java|grep GitHub_Action-0.0.1-SNAPSHOT.jar看一下进程id是第几位到第几位
ps -ef|grep java|grep demo1-0.0.1-SNAPSHOT.jar|cut -c9-16|xargs kill -9
# 停5秒
sleep 5s
# 使环境变量生效
source /root/.bash_profile
# 运行项目
nohup java -jar demo1-0.0.1-SNAPSHOT.jar >/vdb/soft/api/cicd.log 2>&1 &