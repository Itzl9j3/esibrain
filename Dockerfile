# Use the official Node.js 
FROM node:21.7.2

# Set the working directory inside the container
WORKDIR /app

# Install dependencies
COPY package.json .
COPY package-lock.json .
RUN npm install

# Copy the rest of the application code
COPY . .

# Run the convex server
RUN npx convex dev

# Build the Next.js app
RUN npm run build

# Expose the port Next.js is running on
EXPOSE 3000

# Start the Next.js app
CMD ["npm", "start"]
