import logging
from os import environ
from logging import Formatter, FileHandler

script_name = environ.get("PROJECT_NAME")

output = logging.getLogger(script_name)
file_handler = FileHandler(f"{script_name}.log")
handler = logging.StreamHandler()
file_handler.setFormatter(Formatter(
    '%(asctime)s %(levelname)s: %(message)s '
    '[in %(pathname)s:%(lineno)d]'
))
handler.setFormatter(Formatter(
    '%(asctime)s %(levelname)s: %(message)s '
    '[in %(pathname)s:%(lineno)d]'
))
output.addHandler(file_handler)
output.addHandler(handler)
output.setLevel(logging.INFO)

