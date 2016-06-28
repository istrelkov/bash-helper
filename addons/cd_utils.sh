#Changes current directory few steps up.
function up()
{
   dir=""
   if [ -z "$1" ]; then
      dir=..
   elif [[ $1 =~ ^[0-9]+$ ]]; then
      x=0
      while [ $x -lt ${1:-1} ]; do
         dir=${dir}../
         x=$(($x+1))
      done
      cd "$dir";
   else
      upto "$1"
   fi
}

#Prints the desired directory name when using up
function upstr()
{
   echo "$(up "$1" && pwd)";
}

#Go to a parent directory
function upto ()
{
   if [ -z "$1" ]; then
      return
   fi
   local upto=$1
   cd "${PWD/\/$upto\/*//$upto}"
}

#Fixes [TAB] autocomplete of upto() function
function _upto()
{
   local cur=${COMP_WORDS[COMP_CWORD]}
   local d=${PWD//\//\ }
   COMPREPLY=( $( compgen -W "$d" -- "$cur" ) )
}
complete -F _upto upto
complete -F _upto up

#Jumps to a specified inner directory
function jd(){
   if [ -z "$1" ]; then
      echo "Usage: jd [directory]";
      return 1
   else
      cd **"/$1"
   fi
}
