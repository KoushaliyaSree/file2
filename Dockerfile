# Stage 1: Build th React application
FROM node:18.2 as build

# Set the working directory
WORKDIR /home/dell/file2

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the application code
COPY . .

# Build the React application
RUN npm run build

# Stage 2: Serve the built application using Nginx
FROM nginx:alpine

# Copy the built app from Stage 1 into the Nginx image
COPY --from=build /home/dell/file2 /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
