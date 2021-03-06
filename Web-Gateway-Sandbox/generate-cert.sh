#!/bin/bash
# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

set -e
set -x

if [[ `basename "${PWD}"` == "Web-Gateway-Sandbox" ]];
then
    mkdir -p ssl
    openssl dhparam -out ssl/dhparam.pem 4096
    openssl req -subj '/CN=localhost' -x509 -newkey rsa:4096 -nodes -keyout ssl/server.key -out ssl/server.crt -days 365
else
    echo "NOT in Gateway folder"
    exit -1
fi
