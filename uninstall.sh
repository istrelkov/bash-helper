DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

bashrc=$HOME/.bashrc
addon=$DIR/add_to_bashrc
current_sec=`date +%s`
temp=$HOME/.bashrc$current_sec.bak
scripts_loc=$HOME/bin/bash

echo "Creating temp file $temp"
grep -xFv -f $addon $bashrc > $temp

echo "Writing chagnes to $bashrc"
cat $temp > $bashrc

echo "Removing scripts in $scripts_loc"
rm -rf $scripts_loc

echo "Removing temp file $temp"
rm -f $temp
