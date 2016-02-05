import os
import re

c = get_config()

c.JupyterHub.hub_ip = "0.0.0.0"

c.JupyterHub.spawner_class = "dockerspawner.DockerSpawner"
c.DockerSpawner.tls_verify = True
c.DockerSpawner.tls_ca = "/etc/docker/ca.pem"
c.DockerSpawner.tls_cert = "/etc/docker/server-cert.pem"
c.DockerSpawner.tls_key = "/etc/docker/server-key.pem"
c.DockerSpawner.use_internal_ip = True
c.DockerSpawner.hub_ip_connect = os.environ["HUB_IP_CONNECT"]

c.JupyterHub.authenticator_class = "oauthenticator.GitHubOAuthenticator"

c.JupyterHub.login_url = "/hub/oauth_login"

def userlist(varname):
    """
    Interept an environment variable as a whitespace-separated list of GitHub
    usernames.
    """

    parts = re.split("\s*,\s*", os.environ[varname])
    return set([part for part in parts if len(part) > 0])

c.Authenticator.whitelist = userlist("JUPYTERHUB_USERS")
c.Authenticator.admin_users = userlist("JUPYTERHUB_ADMINS")

c.GitHubOAuthenticator.oauth_callback_url = os.environ["OAUTH_CALLBACK_URL"]
c.GitHubOAuthenticator.client_id = os.environ["GITHUB_CLIENT_ID"]
c.GitHubOAuthenticator.client_secret = os.environ["GITHUB_CLIENT_SECRET"]
