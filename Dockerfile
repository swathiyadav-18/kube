# Use official Node.js image
FROM node:18

# Set working directory
WORKDIR /usr/src/app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm cache clean --force && npm install --legacy-peer-deps --production

# Copy rest of app files
COPY . .
# Expose port
EXPOSE 3000

# Start app
CMD ["node", "app.js"]
