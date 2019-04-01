# mininmal-nodejs-kubernetes-example
A minimal example on how to deploy a NodeJS (Koa) webserver to Kubernetes

### Installation

If you don't have access to a Kubernetes cluster already, see [this TechOverflow post](https://techoverflow.net/2019/04/01/how-to-install-microk8s-microkubernetes-on-ubuntu-in-30-seconds/) on how to install MicroK8S (MicroKubernetes), a local Kubernetes installation for development purposes.



### How to build docker image

The docker image is available pre-build from dockerhub.
In case you want to do it yourself, here's how I do it:

```sh
docker build -t ulikoehler/minimal-nodejs-kubernetes-example:v1.0 .
docker push ulikoehler/minimal-nodejs-kubernetes-example:v1.0
```
