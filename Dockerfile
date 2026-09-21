FROM nginxinc/nginx-unprivileged:1.30.5

# Install the HTTP client used by the Compose health check.
USER root
RUN apt-get update \
    && apt-get install -y --no-install-recommends wget \
    && rm -rf /var/lib/apt/lists/*
USER nginx

# Replace default nginx configuration.
COPY --chown=nginx:nginx nginx.conf /etc/nginx/nginx.conf

COPY --chown=nginx:nginx sources /usr/share/nginx/html

EXPOSE 8080
