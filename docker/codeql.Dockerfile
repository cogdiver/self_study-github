FROM ubuntu:latest

# Instalar dependencias
RUN apt-get update && apt-get install -y \
    curl unzip git openjdk-11-jdk python3 python3-pip

# Descargar CodeQL CLI
RUN curl -L -o codeql.zip https://github.com/github/codeql-cli-binaries/releases/latest/download/codeql-linux64.zip \
    && unzip codeql.zip -d /opt \
    && rm codeql.zip

# Añadir CodeQL al PATH
ENV PATH="/opt/codeql:${PATH}"

# Copiar el código fuente
WORKDIR /app
COPY . .

# Crear la base de datos y ejecutar el análisis
CMD ["sh", "-c", "codeql database create db --language=python --source-root . && codeql database analyze db python-queries.ql --format=sarifv2.1.0 --output /app/results.sarif"]
