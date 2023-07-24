#!/usr/bin/awk -f

function usage()
{

	print "nv.awk"
	print "usage: " ARGV[0] " -f nv.awk -v sstr=<search string> $cedictfile"
}

BEGIN {
	if ( sstr !~ /^[一-龥]+$/ ) { usage() ; exit;} 
	first = substr(sstr,0,1);
	fd=0;
}

( $0 !~ "^#")  && ( sstr ~  "^"$2 ){
	if (fd==0) { fd = 1}
  	print $0  # print all of it
} 

# give up when we are too far
( $0 !~ "^#")  && ( $2 !~  "^"first ){
	if (fd==1) {exit}
} 

END {
}

 
