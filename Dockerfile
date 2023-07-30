FROM jenkins
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt


FROM node:19-alpine

# Create app directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy source code 
COPY . .

# Expose port 3000
EXPOSE 3000

# Run the app
CMD [ "node", "index.js" ]


