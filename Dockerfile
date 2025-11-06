# Use the official Node.js LTS image
FROM node:18

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install --production

# Copy the rest of your app files
COPY . .

# Expose the port
EXPOSE 3000

# Command to run the app
CMD ["node", "app.js"]
