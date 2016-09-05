#!/bin/bash
set -e

if [ ! -f "$TEAMCITY_DATA_PATH/config/database.properties" ];
then
	echo "connectionUrl=jdbc\:postgresql\://$POSTGRES_PORT_5432_TCP_ADDR\:$POSTGRES_PORT_5432_TCP_PORT/$POSTGRES_POSTGRES_DB" > $TEAMCITY_DATA_PATH/config/database.properties
	echo "connectionProperties.user=$POSTGRES_POSTGRES_USER" >> $TEAMCITY_DATA_PATH/config/database.properties
	echo "connectionProperties.password=$POSTGRES_POSTGRES_PASSWORD" >> $TEAMCITY_DATA_PATH/config/database.properties
	echo "maxConnections=50" >> $TEAMCITY_DATA_PATH/config/database.properties
fi

echo "Starting teamcity..."
exec /opt/TeamCity/bin/teamcity-server.sh run
