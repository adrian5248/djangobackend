#!/bin/sh

if ["$DATABASE" = "postgres" ]
    echo "Check if database is  running..."


    while ! nc -z $SQL_HOST $SQL_PORT; do
        sleep 0.1
    done

    echo "The  database is up and runnig :-D"
fi


python manage.py makemigrations
python manage.py migrate

exec "$@"