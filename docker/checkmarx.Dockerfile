FROM openjdk:11-jdk-slim

# Descargar CxConsole CLI
RUN curl -L -o CxConsole.zip https://download.checkmarx.com/CxConsole.zip \
    && unzip CxConsole.zip -d /opt \
    && rm CxConsole.zip

# Configurar directorio de trabajo
WORKDIR /app

# Copiar proyecto
COPY . .

# Ejecutar Checkmarx análisis
CMD ["sh", "-c", "/opt/CxConsole/CxConsole.exe Scan -v -ProjectName 'PythonProject' -LocationPath /app"]
