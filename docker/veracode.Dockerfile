FROM openjdk:11-jdk-slim

# Configurar directorio de trabajo
WORKDIR /app

# Copiar proyecto y empaquetar en ZIP
COPY . .
RUN zip -r my_project.zip .

# Añadir credenciales de Veracode como variables de entorno
ENV VERACODE_API_ID=<your_api_id>
ENV VERACODE_API_KEY=<your_api_key>

# Ejecutar Veracode CLI
CMD ["sh", "-c", "veracode --action uploadandscan --appname 'PythonApp' --filepath my_project.zip"]
