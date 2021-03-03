# lede 的 docker 编译环境

### clone docker and build image

```
git clone https://github.com/luomiwhy/lede-docker-builder.git
cd lede-docker-builder
docker build -t lede .
```

### run container and clone lede code

```
cd 
docker run --rm -it -v $(pwd)/:/home/build/ lede

export ALL_PROXY=http://192.168.*.*:*/
```

### clean when done
```
docker container prune -f
docker image prune -f
```
