## Directory navigation
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

## Other useful aliases
alias crunch='a2ping -v --bboxfrom=compute-gs'
# need to add two dashes '--' after *.eps filename to keep as eps

## Functions
mylatex () {
    latex $1.tex
    dvips $1.dvi
    ps2pdf $1.ps
    rm $1.log $1.dvi $1.ps
}

png2eps () {
    convert $1.png $1.pdf
    pdftops -eps $1.pdf
}

## Utility for generating a random password
randpw() {
    date | md5sum | head -c32; echo ""
}

## Utility for cloning a repo from github and setting up the url remote
## $1 = user name; $2 = git repository name
gitclrem () {
	git clone git://github.com/$1/$2
	cd $2
	git remote set-url origin git@github.com:$1/$2.git
}


## Old aliases commented out. Some may be useful later, so keeping here for records
# GO language (by google)
#export GOPATH=${HOME}/gopath
#export PATH=${GOPATH}:${GOPATH}/bin:${PATH}

# Google Drive aliases
#alias gdpull='drive pull -verbose -ignore-checksum=false'
#alias gdpush='drive push -verbose -ignore-checksum=false'

## 
# MySQL
##
# Path to SSL files
#SSL_HOME="/home/username/Documents/MySQL-Admin"
# Alias to access stats DB
#alias con-mysql="mysql --ssl-ca=$SSL_HOME/ca-cert.pem --ssl-cert=$SSL_HOME/client-cert.pem --ssl-key=$SSL_HOME/client-key.pem -h dbhost -u username -p'xxx' -A --local-infile=1"

# command to list tables in a sql database
# $1 = schema; $2 = keyword
#list-tab () {
#    con-mysql -e "select table_name from information_schema.tables where table_schema = '$1'" | grep "$2"
#}

# function that combines 'watch' and 'show processlist'
#mysqltop () {
#    MYSQL_OPTS=$@
#    watch -n 5 --differences "mysql --ssl-ca=$SSL_HOME/ca-cert.pem
#    --ssl-cert=$SSL_HOME/client-cert.pem --ssl-key=$SSL_HOME/client-key.pem -h
#    dbhost -u username -p'xxx' -A --local-infile=1 $MYSQL_OPTS -e 'show processlist'"
#}

# include quick check sql functions
#if [ -f $HOME/bin/sql.functions.sh ]; then
#	. $HOME/bin/sql-functions.sh
#fi

## Utility functions for checking data in SQL databases

## Check emails
#chkemail () {
#	NOW="$(date +'%Y-%m-%d_%H.%M.%S')"
#	MEMBLIST=$(echo $@ | sed "s/ /, /g")
#	sed -e "s/<list>/$MEMBLIST/g" < ~/share/SQL/check-emails.sql >
#	~/share/SQL/.runit.sql
#	# con-mysql < ~/share/SQL/.runit.sql | sed "s/\t/, /g" > email-info-$NOW.csv
#	con-mysql < ~/share/SQL/.runit.sql > email-info-$NOW.csv
#	rm ~/share/SQL/.runit.sql
#}

