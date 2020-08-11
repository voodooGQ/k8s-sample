docker build -t voodoogq/complex-client:latest -t voodoogq/complex-client:$SHA -f ./client/Dockerfile ./client
docker build -t voodoogq/complex-server:latest -t voodoogq/complex-server:$SHA -f ./server/Dockerfile ./server
docker build -t voodoogq/complex-worker:latest -t voodoogq/complex-worker:$SHA -f ./worker/Dockerfile ./worker
docker push voodoogq/complex-client:latest
docker push voodoogq/complex-client:$SHA
docker push voodoogq/complex-server:latest
docker push voodoogq/complex-server:$SHA
docker push voodoogq/complex-worker:latest
docker push voodoogq/complex-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/client-deployment client=voodoogq/complex-client:$SHA
kubectl set image deployments/server-deployment server=voodoogq/complex-server:$SHA
kubectl set image deployments/worker-deployment worker=voodoogq/complex-worker:$SHA
