#!/bin/bash
cd /data/hswg/appserver
git switch feature
retry=0
while [[ "$retry" -lt 10 ]]
do 
	echo '开始拉取代码'
	git pull
	if [ $? -eq 0 ]; then
		echo 'pull success'
		break
	fi
	retry=`expr $retry + 1 `
done
mvn clean package -Dmaven.test.skip=true -Dmaven.compile.fork=true -T 1C
cd ..
docker-compose up -d --build
time=$(date "+%Y-%m-%d %H:%M:%S")
echo "$time 执行完任务"


