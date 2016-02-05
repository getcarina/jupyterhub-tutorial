This is an example setup for launching JupyterHub.

```bash
$ eval "$( carina env jupyterhub )"
$ DNSNAME=jub.fict.io \
  JUPYTERHUB_USERS=rgbkrk \
  JUPYTERHUB_ADMINS=$JUPYTERHUB_USERS \
  GITHUB_CLIENT_ID=XYZ \
  GITHUB_CLIENT_SECRET=ABC \
  ./launch.sh
```
