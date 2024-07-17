#!/bin/bash

cat << EOF > db_init.env
DB_HOST=$DB_HOST
DB_PORT=$DB_PORT
DB_USER=$DB_USER
DB_PASSWORD=$DB_PASSWORD
EOF


# 读取 db_init.env 文件中的环境变量
export $(grep -v '^#' db_init.env | xargs)

# 使用 mysql 命令导入 dump-nacos.sql 文件的内容
mysql -h$DB_HOST -P$DB_PORT -u$DB_USER -p$DB_PASSWORD < dump-nacos.sql

# 检查导入是否成功
if [ $? -eq 0 ]; then
    echo "Database initialization successful."
else
    echo "Database initialization failed."
    exit 1
fi
