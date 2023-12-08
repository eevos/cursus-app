# Use the official Node image as the base image
FROM node:20.10.0

# Set the working directory inside the container
WORKDIR /app

RUN npm install -g @angular/cli@13

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Copy the rest of the app files to the working directory
COPY . .

# Install npm dependencies
RUN npm install

# i cant use the node_modules from windows so i need to run this
RUN npm ci

# Expose port 4200 for Angular dev server
EXPOSE 4200

# Command to start the Angular development server
CMD ["ng", "serve","--host", "0.0.0.0"]
