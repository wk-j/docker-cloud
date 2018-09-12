## Commands

```bash
docker build -t docker-cloud .

docker stop docker-cloud
docker rm   docker-cloud

docker run -p 8080:80 --name docker-cloud docker-cloud
```