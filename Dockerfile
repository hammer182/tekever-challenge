FROM python:3.10.5-alpine
WORKDIR /code

ENV FLASK_APP=challenge.py
ENV FLASK_RUN_HOST=0.0.0.0

RUN apk add --no-cache gcc musl-dev linux-headers
RUN pip install flask

EXPOSE 5000
COPY . .

CMD ["flask", "run"]