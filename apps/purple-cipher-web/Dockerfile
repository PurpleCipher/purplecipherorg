FROM nginx:1.21.6
WORKDIR /app
COPY dist/apps/purple-cipher-web /usr/share/nginx/html
COPY tools/extra/nginx.conf /etc/nginx/conf.d/default.conf
RUN ls -la


