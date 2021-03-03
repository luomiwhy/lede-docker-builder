# lede 的 docker 编译环境

### clone docker and build image

```
git clone https://github.com/luomiwhy/lede-docker-builder.git
cd lede-docker-builder
docker build -t lede .
```

### run container and clone lede code

```
sudo mkdir -p /data/dl
docker run --rm -it -v /data/dl:/home/build/openwrt/dl lede

export ALL_PROXY=http://192.168.*.*:*/
```

### clean when done
```
docker container prune -f
docker image prune -f
```
