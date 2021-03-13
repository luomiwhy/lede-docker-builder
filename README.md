# lede 的 docker 编译环境

### clone docker and build image

```
export ALL_PROXY=http://192.168.*.*:*/
git clone https://github.com/luomiwhy/lede-docker-builder.git
cd lede-docker-builder
docker build -t lede .
```

### run container and clone lede code

```
cd 
cd lede-docker-builder/
git checkout . &&  git pull
chmod +x *.sh
git clone --depth 1 -b 21.02 --single-branch https://github.com/Lienol/openwrt openwrt
docker run --rm -it -v $(pwd)/lede-docker-builder/:/home/build/ -v /data/lede/dl:/home/build/openwrt/dl lede


./build-lede1.sh
./build-lede2.sh
```

### clean when done
```
docker container prune -f
docker image prune -f
```
