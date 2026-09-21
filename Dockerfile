FROM nginxinc/nginx-unprivileged:1.30.5

# Replace default nginx configuration.
COPY --chown=nginx:nginx nginx.conf /etc/nginx/nginx.conf

COPY --chown=nginx:nginx sources /usr/share/nginx/html

EXPOSE 8888