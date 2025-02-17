# Use an official lightweight Python image
FROM python:3.10

# Set the working directory for installing dependencies
WORKDIR /app

# Copy only the requirements.txt first (for better caching)
COPY requirements.txt /app/

# Install dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Now copy the rest of the project files into the container
COPY . /app/

# Set the working directory to your Django project folder
WORKDIR /app/mytodo

# Expose the port that Django runs on
EXPOSE 8000

# Command to start Django server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
