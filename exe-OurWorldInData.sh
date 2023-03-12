#!/bin/bash

# Correremos el comando para poder descargar el cvs



# Check the command line
if [ $# -ne 0 -a $# -ne 1 ]; 
then
    echo "Usage: $0 [wait]"
    exit 127
fi

if [ -e owid-covid-data.csv ];then
echo "Ya se encuentra descargado el archivo owid-covid-data"
else wget "https://covid.ourworldindata.org/data/owid-covid-data.csv"
fi

echo "Escriba el nombre de su servidor en caso de no escribir sera localhost"
echo -n "Server [localhost]: "
read SERVER

if [ "$SERVER" = "" ];
then
    SERVER="localhost"
fi



DATABASE="OurWorldInData-1510627-1210921";

echo "Escriba el nombre de su puerto en caso de no escribir sera 5432"
echo -n "Port [5432]: "
read PORT

if [ "$PORT" = "" ];
then
    PORT="5432"
fi

echo "Escriba el nombre de su puerto en caso de no escribir sera boondock"
echo -n "Username [postgres]: "
read USERNAME

if [ "$USERNAME" = "" ];
then
    USERNAME="boondock"
fi

dropdb -U $USERNAME -i -e $DATABASE
createdb -U $USERNAME -e $DATABASE
'psql' -U $USERNAME -d $DATABASE -a -f "OurWorldInData-psql.sql"
'psql' -U $USERNAME -d $DATABASE -a -f "Queries.sql"
"psql" -h $SERVER -p $PORT -U $USERNAME $DATABASE


RET=$?

if [ "$RET" != "0" ];
then
    echo
    echo -n "Press <return> to continue..."
    read dummy
fi

exit $RET