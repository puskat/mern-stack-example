# Use an official Node.js runtime as a base image
FROM node:20

# Set the working directory inside the container
WORKDIR /app/server

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the remaining server files to the container
COPY . .

# Expose the port that the server will run on
EXPOSE 5000

# Define the command to run your server
CMD ["npm", "start"]
