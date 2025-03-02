# Use Node.js as the base image
FROM node:18

# Set the working directory inside the container
WORKDIR /usr/src/app

# Install nodemon globally
RUN npm install -g nodemon

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Generate Prisma client during build
RUN npx prisma generate

# Expose the port your app runs on
EXPOSE 3000

# Command to run your app
CMD ["npm", "start"]