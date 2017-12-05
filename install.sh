#apt-get update
git clone https://github.com/simonw/datasette.git datasette
docker-compose down
docker-compose build datasette getdata
docker-compose up getdata
docker-compose up datasette
