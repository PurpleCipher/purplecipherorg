FROM nginx:1.21.6
LABEL org.opencontainers.image.source https://github.com/PurpleCipher/purplecipherorg
COPY . /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
RUN rm /usr/share/nginx/html/nginx.conf && rm /usr/share/nginx/html/Dockerfile


