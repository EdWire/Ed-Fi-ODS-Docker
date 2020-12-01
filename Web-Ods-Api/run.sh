#!/bin/bash
# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

envsubst < /app/appsettings.template.json > /app/appsettings.json

until PGPASSWORD=$POSTGRES_PASSWORD psql -h $ODS_DB -U $POSTGRES_USER -c '\q'; 
do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 30
done
  
>&2 echo "Postgres is up - executing command"
exec $cmd

dotnet EdFi.Ods.WebApi.dll