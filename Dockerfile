FROM continuumio/anaconda3:4.4.0
# Install dependencies
RUN pip install -r requirements.txt

# Add our code
ADD ./flask_demo /var/www/flask_predict_api/
WORKDIR /var/www/flask_predict_api/

# Expose is NOT supported by Heroku
# EXPOSE 5000 		

# Run the image as a non-root user
RUN adduser -D myuser
USER myuser

# Run the app.  CMD is required to run on Heroku
# $PORT is set by Heroku			
CMD gunicorn --bind 0.0.0.0:$PORT wsgi 
