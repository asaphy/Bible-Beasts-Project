# Start from the official Node.js LTS base image
FROM node:18-alpine

# Add the time to the build
RUN date -u +"%Y-%m-%dT%H:%M:%SZ" > /build-time.txt

# Set the working directory to /app
WORKDIR /app

# Copy in package.json and lock file first,then project files
COPY package.json package-lock.json ./

# Install project dependencies
RUN npm install

# Copy the project files to the working directory
COPY . .

# Build the Next.js app
RUN npm run build

# Expose port 3000 for the Next.js app to be accessible
EXPOSE 3000

# Start the Next.js app
CMD ["npm", "start"]