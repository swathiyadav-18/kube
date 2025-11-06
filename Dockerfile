FROM node:18

WORKDIR /usr/src/app

# Copy package files first
COPY package*.json ./

# Clean npm cache and force a fresh install with retries
RUN npm cache clean --force \
 && npm config set fetch-retries 5 \
 && npm config set fetch-retry-factor 2 \
 && npm config set fetch-retry-mintimeout 20000 \
 && npm config set fetch-retry-maxtimeout 120000 \
 && npm install --legacy-peer-deps --production

# Copy rest of app
COPY . .

EXPOSE 3000

CMD ["node", "app.js"]
