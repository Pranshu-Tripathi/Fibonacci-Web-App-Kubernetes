docker build -t pranshu72001/fib-app-k8s-client:latest -t pranshu72001/fib-app-k8s-client:$SHA -f ./client/Dockerfile ./client
docker build -t pranshu72001/fib-app-k8s-server:latest -t pranshu72001/fib-app-k8s-server:$SHA -f ./server/Dockerfile ./server
docker build -t pranshu72001/fib-app-k8s-worker:latest -t pranshu72001/fib-app-k8s-worker:$SHA -f ./worker/Dockerfile ./worker

docker push pranshu72001/fib-app-k8s-client:latest
docker push pranshu72001/fib-app-k8s-server:latest
docker push pranshu72001/fib-app-k8s-worker:latest

docker push pranshu72001/fib-app-k8s-client:$SHA
docker push pranshu72001/fib-app-k8s-server:$SHA
docker push pranshu72001/fib-app-k8s-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=pranshu72001/fib-app-k8s-server:$SHA
kubectl set image deployments/client-deployment client=pranshu72001/fib-app-k8s-client:$SHA
kubectl set image deployments/worker-deployment worker=pranshu72001/fib-app-k8s-worker:$SHA