# Price Paid > Datasette API

Using Simon Willison's ```datasette``` this process brings in the latest price paid for housing from the data.gov.uk site, converts to (sqlite) .db file and then boots a Docker instance running ```datasette```.

Simon has setup the complete process so it's great - this is simply a test to see about auto-importing data, converting and then running a container.  

https://github.com/simonw/datasette

### Process

##### Installation

Builds each instance.

```
docker-compose build getdata
docker-compose build datasette
```

##### Running

We want to run getdata first, to download and prepare the conversion of the .db
file.  Once that's complete we boot up datasette.  See ```docker-compose.yml```
for more information.  I also removed the datasette call from docker and made
that part of compose.

```
docker-compose up getdata && docker-compose up datasette
```

Now you should be able to visit

```
http://localhost/
```
