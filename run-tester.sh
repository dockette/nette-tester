#!/bin/bash

COMPOSER_FILE="$APP_PATH/composer.json"
THREADS=${THREADS:-40}
PHP=${PHP:-"php"}
FOLDER=${FOLDER:-$APP_PATH}

# Try install dependencies over composer
if [ -f $COMPOSER_FILE ] ; then
  composer install -o -d $APP_PATH
fi

# Run common Nette\Tester or given script
if [ -z "$SCRIPT" ] ; then
  # Print info
  if [ -n $INFO ] ; then
    $TESTER_BIN -i -p $PHP
  fi

  # Run Nette\Tester
  if [ -n $WATCH ] ; then
  	$TESTER_BIN -s -j $THREADS -p $PHP -w $FOLDER
  else
  	$TESTER_BIN -s -j $THREADS -p $PHP $FOLDER
  fi
else
  /bin/bash -c "$SCRIPT"
fi
