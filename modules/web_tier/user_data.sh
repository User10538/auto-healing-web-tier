#!/bin/bash
set -euo pipefail

dnf install -y nginx

cat >/usr/share/nginx/html/index.html <<HTML
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Auto-healing web tier Website</title>
  </head>
  <body>
    <h1>Welcome to nginx</h1>
    <p>Served by $(hostname -f)</p>
  </body>
</html>
HTML

systemctl enable nginx
systemctl start nginx
