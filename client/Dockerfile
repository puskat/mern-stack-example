# Stage 1: Build the React application
FROM node:20 AS build

WORKDIR /app
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy the rest of the code
COPY . .

# Build the application
RUN npm run build

# Stage 2: Serve the application with Nginx
FROM nginx:stable

# Create a directory for SSL certificates
RUN mkdir /etc/nginx/ssl

# Copy the SSL certificate and key
COPY ./nginx/mern.crt /etc/nginx/ssl/
COPY ./nginx/mern.key /etc/nginx/ssl/

# Copy the Nginx configuration file
COPY ./nginx/nginx.conf /etc/nginx/conf.d/default.conf

# Copy the build from the previous stage
COPY --from=build /app/build /usr/share/nginx/html

EXPOSE 80
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
