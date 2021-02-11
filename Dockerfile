# Container image that runs your code
FROM nycplanning/library:ubuntu-latest

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
CMD ["python", "script.py"]