# Jenkins en Docker

Guia para montar un entorno Jenkins en Docker para pruebas locales

## PostgreSQL

Usando el runner de Docker podemos generar un contenedor que exponga el puerto 5432 con clave root s00npwd. y con enlace persistente.

```bash
docker run  -d  --rm \
    --name postgres \
    -p 5432:5432 \
    -e POSTGRES_PASSWORD=s00npwd. \
    -e PGDATA=/var/lib/postgresql/data/pgdata \
    -e POSTGRES_DB=sonar \
    -v $(pwd)/data:/var/lib/postgresql/data \
    --network postgresql \
    postgres:9.6
```

## PostgreSQL

Arrancamos nuestro contenedor de Jenkins para que se conecte a la red de postgresql exponiendo el puerto 9000 al host y configurando la conexion sql a nuestro postgre levantado anteriormente. También se crean los directorios con enlace persistente.

```bash
docker run -d --rm --name Jenkins \
    --network postgresql \
    -p 9000:9000 \
    -e SONAR_JDBC_URL=jdbc:postgresql://postgres:5432/sonar \
    -e SONAR_JDBC_USERNAME=postgres \
    -e SONAR_JDBC_PASSWORD=s00npwd. \
    -e SONAR_ES_BOOTSTRAP_CHECKS_DISABLE=true \
    -v $(pwd)/Jenkins/data:/opt/Jenkins/data \
    -v $(pwd)/Jenkins/extensions:/opt/Jenkins/extensions \
    -v $(pwd)/Jenkins/logs:/opt/Jenkins/logs \
    Jenkins:8.9.1-community
```

## Contribuciones
Es libre, sientete libre de compartir, editar y publicar tus propias versiones

## License
[GPL 3.0](https://choosealicense.com/licenses/gpl-3.0/)