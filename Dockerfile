FROM python:3.10.8-slim

# Install dependencies:
COPY requirements.txt .
RUN pip install -r requirements.txt
RUN python -m spacy download en_core_web_sm

# Run the application:
COPY . app/
EXPOSE 8501

WORKDIR /app

# For running on Heroku
CMD streamlit run app.py --server.port $PORT

# For running locally, comment the line above and uncomment the line below
# CMD streamlit run app.py