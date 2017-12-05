FROM ubuntu
RUN apt-get update && apt-get -y install sqlite3 wget python git
RUN mkdir /runner
COPY data-obtain.sh /runner/data-obtain.sh
RUN chmod 777 /runner/data-obtain.sh
WORKDIR /runner
RUN git clone https://github.com/tobimensch/termsql /runner/termsql
RUN /runner/termsql/termsql --help
