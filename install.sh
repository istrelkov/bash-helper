DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

bashrc=$HOME/.bashrc
addon_loader=$DIR/add_to_bashrc
scripts_target_loc=$HOME/bin/bash
scripts_source_loc=$DIR/addons

intersection=`grep -xF -f $bashrc $addon_loader`
addon_loader_content=`cat $addon_loader`

if [ "$intersection" == "$addon_loader_content" ]
   then
      echo "Already installed"
   else
      echo "Installing..."
      echo "Adding scripts to $scripts_target_loc"
      mkdir -p $scripts_target_loc && cp -rfu $scripts_source_loc $scripts_target_loc
      echo "Writing changes to $bashrc"
      cat $addon_loader >> $bashrc
fi
