# Use an official Ubuntu image as a parent image
FROM ubuntu

# Set metadata labels
LABEL AUTHOR="Chijioke"
ENV NODE_ENV='dev'
ENV PORT='5001'

# Update and install dependencies
RUN apt update -y && \
    apt install -y nano python3 python3-pip lsof curl

# Set the working directory in the container
WORKDIR /app

# Copy the rest of the application code to the working directory
COPY . .
# Install Python dependencies
RUN pip3 install --no-cache-dir -r requirements.txt



# Set Flask app environment variable
ENV FLASK_APP=hello.py

# Expose port for the Flask application
EXPOSE $PORT

# Command to run the Flask application
CMD ["flask", "run", "--host=0.0.0.0", "--port=5001"]

