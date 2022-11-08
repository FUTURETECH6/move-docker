# move docker

Providing a [Dockerfile](/Dockerfile) to help you build an image to run [move](https://github.com/move-language/move) in.

```bash
# build
sudo docker build -t move .

# run
sudo docker run --name move -it move bash

# exec
sudo docker start move
sudo docker exec -it move bash
```