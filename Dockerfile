FROM python:3.9
LABEL authors="aman"
COPY main.py /app/main.py
COPY main.py /app/requirements.txt
RUN pip3 install -r /app/requirements.txt
WORKDIR /app
EXPOSE 5000
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "main:app"]