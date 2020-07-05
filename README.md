# sonos-control
Dedicated media controls for sonos

![image](https://user-images.githubusercontent.com/6363089/85253126-bbbb8700-b41a-11ea-9431-138c373e7fb0.png)



```
docker build -t sonos-control .
docker run -p 3000:3000 --net="host" sonos-control
```