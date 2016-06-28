#!/bin/sh

ENV_VARS="$HOME/bin/bash/addons/properties/environment.properties"
ADDITIONAL_PATH="$HOME/bin/bash/addons/properties/additional_path"

envset() {
   while read -r line; do 
      echo "Adding $line environment variable"
      export $line; 
   done < $ENV_VARS
   
   while read -r line; do 
      echo "Adding $ADDITIONAL_PATH to PATH ($PATH)"
      export PATH=$PATH:$line; 
   done < $ADDITIONAL_PATH
   
   echo "PATH is now $PATH"
}
