export JAVA_HOME=`/usr/libexec/java_home -v "11"`
PATH=${JAVA_HOME}/bin:${PATH}

alias tree="tree -NC"
alias be="bundle exec" 

export PATH=$HOME/.nodebrew/current/bin:$PATH
export NODEBREW_ROOT=/usr/local/var/nodebrew

if type trash-put &> /dev/null
then
    alias rm=trash-put
fi
