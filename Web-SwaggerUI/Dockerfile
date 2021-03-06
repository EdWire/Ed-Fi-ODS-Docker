# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-alpine
LABEL maintainer="Ed-Fi Alliance, LLC and Contributors <techsupport@ed-fi.org>"

ENV VERSION="5.2.14406"

WORKDIR /app
COPY appsettings.template.json /app/appsettings.template.json
COPY run.sh /app/run.sh

RUN apk --no-cache add unzip=6.0-r8 dos2unix=7.4.2-r0 bash=5.1.0-r0 gettext=0.20.2-r2 && \
    wget -O /app/SwaggerUI.zip https://www.myget.org/F/ed-fi/api/v2/package/EdFi.Suite3.Ods.SwaggerUI/${VERSION} && \
    unzip /app/SwaggerUI.zip -d /app && \
    rm -f /app/SwaggerUI.zip && \
    dos2unix /app/*.json && \
    dos2unix /app/*.sh && \
    chmod 700 /app/run.sh && \
    rm -f /app/*.exe

EXPOSE 80

ENTRYPOINT ["/app/run.sh"]
