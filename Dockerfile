FROM python:3.7.5-slim

# Install dependencies


# Add our code
ADD ./flask_demo /var/www/flask_predict_api/
WORKDIR /var/www/flask_predict_api/
RUN pip install -r requirements.txt
# Expose is NOT supported by Heroku
# EXPOSE 5000 		

# Run the image as a non-root user

# Run the app.  CMD is required to run on Heroku
# $PORT is set by Heroku			
CMD gunicorn --bind 0.0.0.0:$PORT wsgi 
