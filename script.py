import os
import time
from library.archive import Archive

def _bool(string:str) -> bool:
    return string == 'true'

path=os.environ.get('INPUT_PATH', None)
latest=_bool(os.environ.get('INPUT_LATEST', 'false'))
push=_bool(os.environ.get('INPUT_S3', 'false'))
compress=_bool(os.environ.get('INPUT_COMPRESS', 'false'))
output_format=os.environ.get('INPUT_OUTPUT_FORMAT', 'pgdump').strip()
version=os.environ.get('INPUT_VERSION', None)
name=os.environ.get('INPUT_NAME', None)

a = Archive()
for _format in output_format.split(' '):
    assert name or path, "Please specify either NAME or PATH"
    _format = _format.strip()
    if version:
        a(
            name=name,
            path=path,
            output_format=_format,
            push=push,
            latest=latest,
            compress=compress,
            version=version,
        )
    else:
        a(
            name=name,
            path=path,
            output_format=_format,
            push=push,
            latest=latest,
            compress=compress
        )