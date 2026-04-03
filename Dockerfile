# Use TensorFlow image with Python 3.11 and CPU support
FROM tensorflow/tensorflow:2.17.0

# Set work directory
WORKDIR /app

# Copy requirements and install
COPY requirements.txt .
RUN pip install --no-cache-dir --ignore-installed -r requirements.txt

# Copy app + templates + static + model
COPY app.py .
COPY Handwritten_Character_Recognition_model.h5 .
COPY templates/ templates/
COPY static/ static/

# Expose service port
EXPOSE 5000

# Environment for Flask
ENV FLASK_APP=app.py
ENV FLASK_ENV=production
ENV PORT=5000

# Entrypoint
CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]
