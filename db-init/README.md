# db-init

nacos 初始化任务

## 开发

1、获取 docker 登录信息
```
cloudapp docker
```

2、构建镜像，变量换成实际值
```
docker build --platform linux/amd64 -t cloudapp.tencentcloudcr.com/${pkgId}/nacos-db-init:${tag}
```

3、推送镜像，变量换成实际值
```
docker push cloudapp.tencentcloudcr.com/${pkgId}/nacos-db-init:${tag}
```

4、修改 `.cloudapp/software/chart/templates/nacos/job.yaml` 中的镜像地址