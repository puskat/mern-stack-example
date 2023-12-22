# Use an official Node.js runtime as a base image
FROM node:20

# Set the working directory inside the container
WORKDIR /app/client

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the remaining client files to the container
COPY . .

# Build the React app
RUN npm run build

# Expose the port that the app will run on
EXPOSE 3000

# Define the command to run your app
CMD ["npm", "start"]
