
CodeQL
docker build -f docker/codeql.Dockerfile -t codeql-python app/
docker run --rm codeql-python

Snyk
snyk auth
docker build -f docker/snyk.Dockerfile -t snyk-python app/
docker run --rm snyk-python

Veracode
docker build -f docker/veracode.Dockerfile -t veracode-python app/
docker run --rm veracode-python

Checkmarx
docker build -f docker/checkmarx.Dockerfile -t checkmarx-python app/
docker run --rm checkmarx-python


USER=user
PASSWORD=pass
