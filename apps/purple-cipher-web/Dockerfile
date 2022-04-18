FROM nginx:1.21.6
COPY . /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
RUN rm /usr/share/nginx/html/nginx.conf && rm /usr/share/nginx/html/Dockerfile


