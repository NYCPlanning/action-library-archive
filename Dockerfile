FROM nycplanning/library:ubuntu-5f514f801976479945dfbdc3fc0b9ec864e2e810

COPY script.py script.py

CMD ["python", "script.py"]