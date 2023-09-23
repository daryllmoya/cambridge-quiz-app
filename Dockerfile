# First stage: Build the Nuxt.js application
FROM node:18 AS build

WORKDIR /app

# Copy package.json and package-lock.json for efficient caching
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of your app's source code from your host to your image filesystem
COPY . .

# Build the Nuxt.js application
RUN npm run build

# Second stage: Serve the Nuxt.js application using a lightweight node image
FROM node:18-alpine

WORKDIR /app

# Copy the built app from the previous stage
COPY --from=build /app/.output ./.output

# Set the command to run your app using `npm start` which should be defined in your package.json scripts
CMD ["npm", "run", "prod"]
