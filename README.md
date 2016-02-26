# Deploy an interactive data science environment with JupyterHub on Docker Swarm

A workshop to deploy an interactive data science environment and share documents that contain live code by taking advantage of Docker and Docker Swarm to deploy Jupyter Notebook servers with JupyterHub.

Docker allows you to package an application and its dependencies into an image that can run in containers on any Linux server. You can use Docker Swarm to run containers across a distributed cluster, which allows you to scale out your application as if it were running on a single, huge computer. To get up and running in minutes we'll be using [Carina by Rackspace](https://getcarina.com/), a hosted Docker Swarm environment.

We'll deploy Jupyter Notebook servers with JupyterHub to put this distributed development stack into practice.

The Jupyter Notebook server is a web application that allows you to create and share documents that contain live code, equations, visualizations, and explanatory text. That makes it an excellent environment for teaching without requiring students to install anything. Uses include: data cleaning and transformation, numerical simulation, statistical modeling, machine learning, and much more. JupyterHub is a multi-user server that manages and proxies multiple instances the Notebook server enabling centralized deployments in companies, university classrooms, and research labs.

[Slides](http://getcarina.github.io/jupyterhub-tutorial/slides/)

## Timeline

```
Total Time: 3 hours

Setup - 15 minutes
Docker - 40 minutes
Docker Swarm and Carina - 45 minutes
Break - 30 minutes (15 minutes of break intended, 15 minutes for catch up)
Notebook - 10 minutes
JupyterHub on Carina - 50 minutes
Wrap up - 5 minutes
```
