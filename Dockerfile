# Use the official NGINX image as base
FROM nginx:1.27-alpine

# Copy custom static website files to NGINX's default content directory
COPY ./html /usr/share/nginx/html

# Optionally copy custom NGINX config
# COPY ./nginx.conf /etc/nginx/nginx.conf

# Expose port 80
EXPOSE 80

# Start NGINX server
CMD ["nginx", "-g", "daemon off;"]
