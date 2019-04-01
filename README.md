# mininmal-nodejs-kubernetes-example
A minimal example on how to deploy a NodeJS (Koa) webserver to Kubernetes

### Installation

If you don't have access to a Kubernetes cluster already, see [this TechOverflow post](https://techoverflow.net/2019/04/01/how-to-install-microk8s-microkubernetes-on-ubuntu-in-30-seconds/) on how to install MicroK8S (MicroKubernetes), a local Kubernetes installation for development purposes.

```sh
git clone https://github.com/ulikoehler/minimal-nodejs-kubernetes-example.git
cd minimal-nodejs-kubernetes-example
kubectl create -f kubernetes-deployment.yaml
kubectl create -f kubernetes-service.yaml
```

Now you can find out the IP address of the loadbalancer:

```sh
kubectl describe service/minimal-nodejs-kubernetes-example | grep "IP:" | awk -F' ' '{print $NF}'
```

This will, for example, output `10.152.183.49`. In case the output is not an IP address, try `kubectl describe service/minimal-nodejs-kubernetes-example` or `kubectl describe minimal-nodejs-kubernetes-example` to find out where the problem originates.

Now we can test if we can access the server using the load balancer running at aforementioned IP address:

```sh
wget -qO- http://$(kubectl describe service/minimal-nodejs-kubernetes-example | grep "IP:" | awk -F' ' '{print $NF}')/
```
which, when successful, will print `{"status":"success"}`.
That is the response our example server will send if it's running properly.
Therefore this means out Kubernetes example is up and running.


### How to build docker image

The docker image is available pre-build from dockerhub.
In case you want to do it yourself, here's how I do it:

```sh
docker build -t ulikoehler/minimal-nodejs-kubernetes-example:v1.0 .
docker push ulikoehler/minimal-nodejs-kubernetes-example:v1.0
```
