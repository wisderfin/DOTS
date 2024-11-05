fp(){
  sudo find . -path "*$1*"
}
fprm(){
  sudo find . -path "*$1*" -exec rm -rf {} + > /dev/null
}
