FROM python:3.9-slim

# Instalar npm y Snyk CLI
RUN apt-get update && apt-get install -y npm \
    && npm install -g snyk

# Configurar directorio de trabajo
WORKDIR /app

# Copiar archivos del proyecto
COPY . .

# Instalar dependencias del proyecto
RUN pip install -r requirements.txt

# Ejecutar Snyk para análisis de dependencias
CMD ["sh", "-c", "snyk test --file=requirements.txt"]
