FROM java:8

MAINTAINER Henadii Sychevskyi (sych74@gmail.com)

ENV TEAMCITY_VERSION 10.0.1
ENV TEAMCITY_DATA_PATH /var/lib/teamcity

ENV POSTGRES_CURRENT_VERSION 9.4.1209
ENV POSTGRES_OLD_VERSION 9.3-1103.jdbc41

# Get and install teamcity
RUN wget -qO- https://download.jetbrains.com/teamcity/TeamCity-$TEAMCITY_VERSION.tar.gz | tar xz -C /opt

# Enable the correct Valve when running behind a proxy
RUN sed -i -e "s/\.*<\/Host>.*$/<Valve className=\"org.apache.catalina.valves.RemoteIpValve\" protocolHeader=\"x-forwarded-proto\" \/><\/Host>/" /opt/TeamCity/conf/server.xml
RUN sed -i  's|port=\"8111\"|port=\"80\"|g' /opt/TeamCity/conf/server.xml

# Configure postgress JDBC driver
RUN mkdir -p $TEAMCITY_DATA_PATH/lib/jdbc $TEAMCITY_DATA_PATH/config
RUN wget -P $TEAMCITY_DATA_PATH/lib/jdbc https://jdbc.postgresql.org/download/postgresql-${POSTGRES_CURRENT_VERSION}.jar && \
    rm -f $TEAMCITY_DATA_PATH/lib/jdbc/postgresql-${POSTGRES_OLD_VERSION}.jar;

COPY entrypoint.sh /entrypoint.sh

VOLUME /var/lib/teamcity

ENTRYPOINT ["/entrypoint.sh"]
