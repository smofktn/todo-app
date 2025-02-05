# 開発環境用
FROM --platform=$BUILDPLATFORM nginx:1.27.3

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./dist /usr/share/nginx/dist

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
