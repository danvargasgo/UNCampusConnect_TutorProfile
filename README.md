# UNCampusConnect_TutorProfile

## Base de datos
1. Ingresar al directorio \uncampusconnect_tutorprofile_db
2. docker build -t uncampusconnect_tutorprofile_db .
3. docker run -d -t -i -p 5432:5432 --name uncampusconnect_tutorprofile_db uncampusconnect_tutorprofile_db

## Microservicio
1. Ingresar al directorio \uncampusconnect_tutorprofile_ms
2. docker build -t uncampusconnect_tutorprofile_ms .
3. docker run -p 3004:3004 -e DB_HOST=host.docker.internal -e DB_PORT=5432 -e DB_USER=postgres -e DB_PASSWORD=1234 -e DB_NAME=uncampusconnect_tutorprofile_db -e URL=0.0.0.0:3004 uncampusconnect_tutorprofile_ms
4. docker exec -it <nombre_contenedor> bash
5. rails db:create
6. rails db:migrate
7. exit (Para salir del shell del contenedor)
