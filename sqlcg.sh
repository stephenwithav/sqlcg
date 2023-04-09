#/bin/sh

if [ $# == 0 ]; then
  echo "Usage: sqlcg [databaseName]"
  exit
fi

docker run -e MYSQL_ROOT_PASSWORD=pw --rm --name=db -p 3306:3306 -d mysql:5.7
DB_IP=$(docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' db)
DATABASE_URL="mysql://root:pw@${DB_IP}:3306/$1"
dbmate wait
dbmate up
sqlc generate

if [ $# -gt 1 ]; then
  echo Opening mysql shell.
  mysql -h $DB_IP -u root -ppw $1
fi

docker stop db
