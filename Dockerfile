FROM nginx:alpine

COPY index.html styles.css health /usr/share/nginx/html/

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget -qO- http://127.0.0.1/health | grep -q '^OK$' || exit 1
