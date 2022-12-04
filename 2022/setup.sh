#!/bin/bash

PYTHON_MINOR_VERSION=3.10
PYTHON_MICRO_VERSION=$(pyenv latest -k ${PYTHON_MINOR_VERSION})
pyenv install --skip-existing ${PYTHON_MICRO_VERSION}

day=1
while [ "$day" -le 25 ]
do
   mkdir "day-${day}"
   cd "day-${day}"
   pyenv local ${PYTHON_MICRO_VERSION}
   poetry init -n --name "day-${day}" --description "Advent of Code 2022, day ${day}" --python "^${PYTHON_MICRO_VERSION}" --dependency "jupyterlab:*"
   poetry install 
   echo 'poetry.lock' >> .gitignore
   echo '.ipynb_checkpoints/' >> .gitignore
   cd .. 
   let day=day+1
done
