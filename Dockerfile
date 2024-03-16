FROM python:3.10-slim-buster

WORKDIR /var/www/app/

COPY requirements.txt ./

RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5000

CMD ["python3", "manage.py", "runserver"]