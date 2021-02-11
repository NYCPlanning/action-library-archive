FROM nycplanning/library:ubuntu-latest

COPY script.py script.py

CMD ["python", "script.py"]