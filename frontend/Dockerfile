FROM nginx

COPY index.html /usr/share/nginx/html
RUN rm /etc/nginx/conf.d/default.conf
COPY ./templates/default.conf.template /etc/nginx/conf.d
# COPY nginx-default /etc/nginx/sites-available/default