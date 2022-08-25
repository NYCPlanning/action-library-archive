FROM nycplanning/library:ubuntu-pluto_templates

COPY script.py script.py

CMD ["python", "script.py"]