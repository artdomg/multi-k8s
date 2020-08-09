docker build -t artdomg/multi-client:latest -t artdomg/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t artdomg/multi-server:latest -t artdomg/multi-server:$SHA  -f ./server/Dockerfile ./server
docker build -t artdomg/multi-worker:latest -t artdomg/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push artdomg/multi-client:latest
docker push artdomg/multi-server:latest
docker push artdomg/multi-worker:latest

docker push artdomg/multi-client:$SHA
docker push artdomg/multi-server:$SHA
docker push artdomg/multi-worker:$SHA

kubectl apply -f ./k8s
kubectl set image deployments/client-deployment client=artdomg/multi-client:$SHA
kubectl set image deployments/server-deployment server=artdomg/multi-server:$SHA
kubectl set image deployments/worker-deployment worker=artdomg/multi-worker:$SHA